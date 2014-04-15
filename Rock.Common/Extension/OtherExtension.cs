using System;
using System.Text.RegularExpressions;
using System.Text;
using System.Linq;
using System.Data;

namespace Rock.Common
{
    public static class OtherExtension
    {

        #region 判断给定集合是否包含当前对象
        /// <summary>
        /// 判断给定集合是否包含当前对象
        /// </summary>
        /// <typeparam name="T">对象类型</typeparam>
        /// <param name="t">对象引用</param>
        /// <param name="c">集合</param>
        /// <returns>存在返回True 反之false</returns>
        public static bool In<T>(this T t, params T[] c)
        {
            return c.Any(i => i.Equals(t));
        }

        /// <summary>
        /// 判断给定集合是否包含当前对象
        /// </summary>
        /// <param name="t">对象引用</param>
        /// <param name="c">集合</param>
        /// <returns>存在返回True 反之false</returns>
        public static bool In(this object o, params object[] c)
        {
            foreach (object i in c)
                if (i.Equals(o)) return true;
            return false;
        }
        #endregion


        #region 检查DataSet是否为空
        public static bool Check(this DataSet ds)
        {
            if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {
                return true;
            }
            return false;
        }
        #endregion


    }
}
