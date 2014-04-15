using System;
using System.Collections;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Data;
using System.Data.Entity;
using System.Data.Objects;
using System.Data.Objects.DataClasses;
using System.Data.SqlClient;
using System.Linq;
using System.Linq.Expressions;
using System.Reflection;
using System.Text;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Rock.Common
{

    public static class LinqExtension
    {
        /// <summary>
        /// 遍历集合，执行指定委托操作
        /// </summary>
        /// <typeparam name="T">泛型形参</typeparam>
        /// <param name="source">集合实参</param>
        /// <param name="action">委托实参</param>
        public static void ForEach<T>(this IEnumerable<T> source, Action<T> action)
        {
            foreach (T item in source)
            {
                action(item);
            }
        }

        #region 为IQueryable<T>类型实现Like操作

        public static IQueryable<T> Like<T>(this IQueryable<T> query, Expression<Func<T, string>> lambda, string value)
        {
            var para = lambda.Parameters.Single();
            var body = (Expression)Expression.Call(lambda.Body,
                typeof(string).GetMethod("Contains", new Type[] { typeof(string) }),
                new Expression[] { Expression.Constant(value, typeof(string)) });

            return query.Where(Expression.Lambda<Func<T, bool>>(body, para));
        }
        #endregion

        #region 为IQueryable<T>类型实现In操作

        public static IQueryable<T> In<T, Property>(this IQueryable<T> query, Expression<Func<T, Property>> lambda, IEnumerable<Property> values)
        {
            var para = lambda.Parameters.Single();
            if (!values.Any())
                return query.Where(error => false);

            var exps = values.Select(exp => (Expression)Expression.Equal(lambda.Body, Expression.Constant(exp, typeof(Property))));
            var finalEXP = exps.Aggregate((begin, end) => Expression.OrElse(begin, end));

            return query.Where(Expression.Lambda<Func<T, bool>>(finalEXP, para));
        }

        #endregion

        #region 为IQueryable<T>类型实现Between操作
        public static IQueryable<T> Between<T, Proporty>(this IQueryable<T> query, Expression<Func<T, Proporty>> exp, Proporty objA, Proporty objB)
        {
            var para = exp.Parameters.Single();
            var leftExp = exp.Body;
            //GreaterThanOrEqual不支持Nullable类型,需转换成基础类型
            Type underlyingtype = Nullable.GetUnderlyingType(exp.Body.Type);
            if (underlyingtype != null)
            {
                leftExp = Expression.Convert(exp.Body, underlyingtype);
            }
            leftExp = exp.Body;
            var finalExp = (Expression)Expression.AndAlso(Expression.GreaterThanOrEqual(leftExp, Expression.Constant(objA)),
                Expression.LessThanOrEqual(leftExp, Expression.Constant(objB)));
            return query.Where(Expression.Lambda<Func<T, bool>>(finalExp, para));
        }
        #endregion

        #region 为ObjectContext类型实现按给定实体删除对应数据
        [Obsolete("该方法功能还未完善")]
        public static int Delete(this ObjectContext context, EntityObject obj)
        {
            int result = 0;
            List<string> NoAppend = new List<string> { "EntityState", "EntityKey" };
            Type type = obj.GetType();
            StringBuilder sql = new StringBuilder();
            List<SqlParameter> paras = new List<SqlParameter>();
            sql.AppendFormat("delete from  {0} where", type.Name);
            foreach (var item in type.GetProperties())
            {
                if (!NoAppend.Contains(item.Name))
                {
                    object value = item.GetValue(obj, null);
                    switch (item.PropertyType.Name)
                    {
                        case "String":
                            if (value == null)
                                continue;
                            break;
                        case "Int32":
                            if ((int)value == int.MinValue)
                                continue;
                            break;
                        case "Guid":
                            if ((Guid)value == Guid.Empty)
                                continue;
                            break;
                        case "DateTime":
                            if ((DateTime)value == DateTime.MinValue)
                                continue;
                            break;
                        default:
                            break;
                    }
                    paras.Add(new SqlParameter("@" + item.Name + "", value));
                    sql.AppendFormat(" {0}=@{0} and ", item.Name);
                    result++;
                }
            }

            if (result == 0)
                throw new Exception("请检查传入的实体是否具有有效的属性值");
            else
                sql.Length = sql.Length - 4;
            return context.ExecuteStoreCommand(sql.ToString(), paras.ToArray());
        }
        #endregion
    }

    #region ExpressionVisitor类重写

    public class MyExpressionVisitor : ExpressionVisitor
    {
        public ParameterExpression newParameterExpression;

        public MyExpressionVisitor()
        {

        }

        public MyExpressionVisitor(ParameterExpression p)
        {
            newParameterExpression = p;
        }

        public Expression VisitExp(Expression exp)
        {
            return Visit(exp);
        }

        protected override Expression VisitParameter(ParameterExpression p)
        {
            if (newParameterExpression == null)
            {
                newParameterExpression = p;
                return base.VisitParameter(p);
            }
            return newParameterExpression;
        }
    }

    #endregion
}
