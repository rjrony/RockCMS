using System;
using System.Data;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;


namespace Rock.Common
{

    /// <summary>
    ///DbHelperSQL 的摘要说明
    /// </summary>
    public class DbHelperSQL
    {
        string MyCon = string.Empty;

        public DbHelperSQL()
        {
            //
            //TODO: 在此处添加构造函数逻辑
            //
        }

        public DbHelperSQL(string connectionStr)
        {
            MyCon = connectionStr;
        }


        #region InitConnection
        /// <summary>
        /// 打开数据源的连接
        /// </summary>
        /// <returns>数据源名字</returns>
        private SqlConnection InitConnection()
        {
            SqlConnection con = new SqlConnection(MyCon);
            return con;
        }
        #endregion

        #region InitDataAdapter
        /// <summary>
        /// 初始化SqlDataAdapter
        /// </summary>
        /// <param name="sql">予执行的sql语句</param>
        /// <returns>DataSet</returns>
        public DataSet InitDataAdapter(string sql)
        {
            return InitDataAdapter(sql, CommandType.Text);
        }
        /// <summary>
        /// 初始化SqlDataAdapter
        /// </summary>
        /// <param name="sql">予执行SQL语句或存储过程名字</param>
        /// <param name="type">指定如何解释字符串</param> 
        /// <returns>DataSet</returns>
        public DataSet InitDataAdapter(string sql, CommandType type)
        {
            return InitDataAdapter(sql, type, null);
        }
        /// <summary>
        /// 初始化SqlDataAdapter
        /// </summary>
        /// <param name="sql">予执行SQL语句或存储过程名字</param>
        /// <param name="type">指定如何解释字符串</param>    
        /// <param name="paremeter">可选参数</param>
        /// <returns>DataSet</returns>
        public DataSet InitDataAdapter(string sql, CommandType type, List<SqlParameter> parem)
        {
            DataSet ds = new DataSet();
            using (SqlConnection con = InitConnection())
            {
                SqlCommand command = new SqlCommand(sql, con);
                command.CommandType = type;
                if (parem != null && parem != null && parem.Count > 0)
                {
                    command.Parameters.AddRange(parem.ToArray());
                }
                con.Open();
                SqlDataAdapter oda = new SqlDataAdapter(command);
                oda.Fill(ds);
                command.Dispose();
                con.Dispose();
                oda.Dispose();
                return ds;
            }
        }
        #endregion

        #region InitExecuteNonQuery
        /// <summary>
        /// 初始化ExecuteNonQuery() 执行sql语句返回受影响的行数
        /// </summary>
        /// <param name="sql">予执行的sql语句</param>
        /// <returns>int 返回受影响的行数</returns>
        public int InitExecuteNonQuery(string sql)
        {
            return InitExecuteNonQuery(sql, CommandType.Text);
        }
        /// <summary>
        /// 初始化ExecuteNonQuery() 执行sql语句返回受影响的行数
        /// </summary>
        /// <param name="sql">予执行SQL语句或存储过程名字</param>
        /// <param name="type">指定如何解释字符串</param>
        /// <returns>int 返回受影响的行数</returns>
        public int InitExecuteNonQuery(string sql, CommandType type)
        {
            return InitExecuteNonQuery(sql, type, null);
        }
        /// <summary>
        /// 初始化ExecuteNonQuery() 执行sql语句返回受影响的行数
        /// </summary>
        /// <param name="sql">予执行SQL语句或存储过程名字</param>
        /// <param name="type">指定如何解释字符串</param>
        /// <param name="paremeter">可选参数</param>
        /// <returns>int 返回受影响的行数</returns>
        public int InitExecuteNonQuery(string sql, CommandType type, List<SqlParameter> parem)
        {
            int line = 0;
            using (SqlConnection con = InitConnection())
            {
                SqlCommand command = new SqlCommand(sql, con);
                command.CommandType = type;
                if (parem != null && parem.Count > 0)
                {
                    command.Parameters.AddRange(parem.ToArray());
                }
                con.Open();
                line = command.ExecuteNonQuery();
                con.Dispose();
                command.Dispose();
                return line;
            }
        }
        /// <summary>
        /// 初始化ExecuteNonQuery() 执行sql语句返回受影响的行数
        /// </summary>
        /// <param name="sql">予执行SQL语句或存储过程名字</param>
        /// <param name="type">指定如何解释字符串</param>
        /// <param name="paremeter">可选参数</param>
        /// <param name="OutParaName">输出参数名称</param>
        /// <param name="OutParaValue">Out 输出参数值</param>
        /// <returns>int 返回受影响的行数</returns>
        public int InitExecuteNonQuery(string sql, CommandType type, List<SqlParameter> parem, string OutParaName, out Object OutParaValue)
        {
            int line = 0;
            using (SqlConnection con = InitConnection())
            {
                SqlCommand command = new SqlCommand(sql, con);
                command.CommandType = type;
                if (parem != null && parem.Count > 0)
                {
                    command.Parameters.AddRange(parem.ToArray());
                }
                con.Open();
                line = command.ExecuteNonQuery();
                OutParaValue = command.Parameters[OutParaName].Value;
                con.Dispose();
                command.Dispose();
                return line;
            }
        }
        #endregion

        #region InitExecuteScalar
        /// <summary>
        /// 执行查询并返回查询结果第一行第一列的值，忽略其他行的值
        /// </summary>
        /// <param name="sql">予执行的sql语句</param>
        /// <returns>string 第一行第一列的值</returns>
        public object InitExecuteScalar(string sql)
        {
            return InitExecuteScalar(sql, CommandType.Text);
        }
        /// <summary>
        /// 执行查询并返回查询结果第一行第一列的值，忽略其他行的值
        /// </summary>
        /// <param name="sql">予执行SQL语句或存储过程名字</param>
        /// <param name="type">指定如何解释字符串</param>
        /// <returns>string 第一行第一列的值</returns>
        public object InitExecuteScalar(string sql, CommandType type)
        {
            return InitExecuteScalar(sql, type, null);
        }
        /// <summary>
        /// 执行查询并返回查询结果第一行第一列的值，忽略其他行的值
        /// </summary>
        /// <param name="sql">予执行SQL语句或存储过程名字</param>
        /// <param name="type">指定如何解释字符串</param>
        /// <param name="paremeter">可选参数</param>
        /// <returns>string 第一行第一列的值</returns>
        public object InitExecuteScalar(string sql, CommandType type, List<SqlParameter> parem)
        {
            using (SqlConnection con = InitConnection())
            {
                SqlCommand command = new SqlCommand(sql, con);
                command.CommandType = type;

                if (parem != null && parem.Count > 0)
                {
                    command.Parameters.AddRange(parem.ToArray());
                }
                con.Open();
                object obj = command.ExecuteScalar();
                con.Dispose();
                command.Dispose();
                return obj;
            }
        }
        #endregion

        #region InitDataReader
        /// <summary>
        /// 初始化ExecuteReader()
        /// </summary>
        /// <param name="sql">予执行的sql语句</param>
        /// <returns>SqlDataReader</returns>
        public SqlDataReader InitDataReader(string sql)
        {
            return InitDataReader(sql, CommandType.Text);
        }
        /// <summary>
        /// 初始化ExecuteReader()
        /// </summary>
        /// <param name="sql">予执行SQL语句或存储过程名字</param>
        /// <param name="type">指定如何解释字符串</param>
        /// <returns>SqlDataReader</returns>
        public SqlDataReader InitDataReader(string sql, CommandType type)
        {
            return InitDataReader(sql, type, null);
        }
        /// <summary>
        /// 初始化ExecuteReader()
        /// </summary>
        /// <param name="sql">予执行SQL语句或存储过程名字</param>
        /// <param name="type">指定如何解释字符串</param>
        /// <param name="pareameter">可选参数</param>
        /// <returns>SqlDataReader</returns>
        public SqlDataReader InitDataReader(string sql, CommandType type, List<SqlParameter> parem)
        {
            using (SqlConnection con = InitConnection())
            {
                SqlCommand command = new SqlCommand(sql, con);
                command.CommandType = type;
                if (parem != null && parem.Count > 0)
                {
                    command.Parameters.AddRange(parem.ToArray());
                }
                con.Open();
                SqlDataReader reader = command.ExecuteReader();
                command.Dispose();
                reader.Dispose();
                return reader;
            }
        }
        #endregion
    }
}