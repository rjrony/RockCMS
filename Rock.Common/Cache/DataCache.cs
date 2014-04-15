using System;
using System.Web;
using System.Text.RegularExpressions;
using System.Web.Caching;
using System.Collections;
namespace Rock.Common
{
    /// <summary>
    /// ������صĲ�����
    /// </summary>
    public class DataCache
    {
        /// <summary>
        /// ��ȡ��ǰӦ�ó���ָ��CacheKey��Cacheֵ
        /// </summary>
        /// <param name="CacheKey"></param>
        /// <returns></returns>
        public static object GetCache(string CacheKey)
        {
            System.Web.Caching.Cache objCache = HttpRuntime.Cache;
            return objCache[CacheKey];
        }

        /// <summary>
        /// ���õ�ǰӦ�ó���ָ��CacheKey��Cacheֵ
        /// </summary>
        /// <param name="CacheKey"></param>
        /// <param name="objObject"></param>
        public static void SetCache(string CacheKey, object objObject)
        {
            System.Web.Caching.Cache objCache = HttpRuntime.Cache;
            objCache.Insert(CacheKey, objObject);
        }

        /// <summary>
        /// ���õ�ǰӦ�ó���ָ��CacheKey��Cacheֵ
        /// </summary>
        /// <param name="CacheKey"></param>
        /// <param name="objObject"></param>
        public static void SetCache(string CacheKey, object objObject, DateTime absoluteExpiration, TimeSpan slidingExpiration)
        {
            System.Web.Caching.Cache objCache = HttpRuntime.Cache;
            objCache.Insert(CacheKey, objObject, null, absoluteExpiration, slidingExpiration);
        }

        private static readonly System.Web.Caching.Cache objCache = HttpRuntime.Cache;

        /// <summary>/// ���ôӲ������Ի��������ķ�ʽ��������/// </summary>
        /// <param name="CacheKey">������ֵ</param>
        /// <param name="objObject">�������</param>
        /// <param name="cacheDepen">��������</param>
        public static void InsertCache(string CacheKey, object objObject, System.Web.Caching.CacheDependency dep)
        {
            if (objObject != null)
            {
                objCache.Insert(CacheKey,
                    objObject,
                    dep,
                    System.Web.Caching.Cache.NoAbsoluteExpiration,//�Ӳ�����  
                    System.Web.Caching.Cache.NoSlidingExpiration,//���ÿɵ�����   
                    System.Web.Caching.CacheItemPriority.Default,
                    null);
            }
        }
        /// <summary>/// �����ӻ�������// </summary>
        /// <param name="CacheKey">������ֵ</param>
        /// <param name="objObject">�������</param>
        /// <param name="cacheDepen">��������</param>
        /// <param name="Minutes">����ʱ��(��)</param>
        public static void InsertCacheAddSeconds(string CacheKey, object objObject, System.Web.Caching.CacheDependency dep, int Minutes)
        {
            if (objObject != null)
            {
                objCache.Insert(CacheKey, objObject, dep, DateTime.Now.AddSeconds(Minutes), TimeSpan.Zero, System.Web.Caching.CacheItemPriority.Normal, null);
            }
        }
        /// <summary>/// �����ӻ�������// </summary>
        /// <param name="CacheKey">������ֵ</param>
        /// <param name="objObject">�������</param>
        /// <param name="cacheDepen">��������</param>
        /// <param name="Minutes">����ʱ��(����)</param>
        public static void InsertCacheMinutes(string CacheKey, object objObject, System.Web.Caching.CacheDependency dep, int Minutes)
        {
            if (objObject != null)
            {
                objCache.Insert(CacheKey, objObject, dep, DateTime.Now.AddMinutes(Minutes), TimeSpan.Zero, System.Web.Caching.CacheItemPriority.Normal, null);
            }
        }

        /// <summary>/// ��Сʱ��������// </summary>
        /// <param name="CacheKey">������ֵ</param>
        /// <param name="objObject">�������</param>
        /// <param name="cacheDepen">��������</param>
        /// <param name="Hours">����Сʱ)</param>
        public static void InsertCacheHours(string CacheKey, object objObject, System.Web.Caching.CacheDependency dep, int Hours)
        {
            if (objObject != null)
            {
                objCache.Insert(CacheKey, objObject, dep, DateTime.Now.AddHours(Hours), TimeSpan.Zero, System.Web.Caching.CacheItemPriority.Normal, null);
            }
        }
        /// <summary>/// ���컺������// </summary>
        /// <param name="CacheKey">������ֵ</param>
        /// <param name="objObject">�������</param>
        /// <param name="cacheDepen">��������</param>
        /// <param name="Days">��������</param>
        public static void InsertCacheDays(string CacheKey, object objObject, System.Web.Caching.CacheDependency dep, int Days)
        {
            if (objObject != null)
            {
                objCache.Insert(CacheKey, objObject, dep, DateTime.Now.AddDays(Days), TimeSpan.Zero, System.Web.Caching.CacheItemPriority.Normal, null);
            }
        }

        /// <summary>
        /// �趨�������ڻ���
        /// (���������һ��ʹ�ú󾭹���ָ����ʱ������������)   /// 
        /// </summary>
        /// <param name="CacheKey">�������</param>
        /// <param name="objObject">�������</param>
        /// <param name="dep">����������</param>
        /// <param name="dep">��������ʱ�䣬��λΪ����</param>
        public static void InsertCacheExpired(string CacheKey, object objObject, System.Web.Caching.CacheDependency dep, int Minutes)
        {
            objCache.Insert(CacheKey, objObject, dep, Cache.NoAbsoluteExpiration, TimeSpan.FromMinutes(Minutes));
        }

        /// <summary>
        /// �趨�������ڻ���(����ʱ��Ϊ15����)
        /// (���������һ��ʹ�ú󾭹���ָ����ʱ������������)
        /// </summary>
        /// <param name="CacheKey">�������</param>
        /// <param name="objObject">�������</param>
        /// <param name="dep">����������</param>
        public static void InsertCacheExpired(string CacheKey, object objObject, System.Web.Caching.CacheDependency dep)
        {
            objCache.Insert(CacheKey, objObject, dep, Cache.NoAbsoluteExpiration, TimeSpan.FromMinutes(DataCacheKey.CacheExpiredTime));
        }


        /// <summary>
        /// ������л���
        /// </summary>
        public static void Clear()
        {
            IDictionaryEnumerator enumerator = objCache.GetEnumerator();

            while (enumerator.MoveNext())
            {
                objCache.Remove(enumerator.Key.ToString());

            }
        }
        /// <summary>
        /// ��ȡָ���Ļ���
        /// </summary>
        /// <param name="key"></param>
        /// <returns></returns>
        public static object Get(string key)
        {

            return objCache[key];

        }

        /// <summary>
        /// �Ƴ�
        /// </summary>
        /// <param name="key"></param>
        public static void Remove(string key)
        {

            objCache.Remove(key);

        }

        /// <summary>
        /// ��ָ��ģʽ�Ƴ�
        /// </summary>
        /// <param name="pattern"></param>
        public static void RemoveByPattern(string pattern)
        {

            IDictionaryEnumerator enumerator = objCache.GetEnumerator();

            Regex regex1 = new Regex(pattern, RegexOptions.Singleline | RegexOptions.Compiled | RegexOptions.IgnoreCase);

            while (enumerator.MoveNext())
            {

                if (regex1.IsMatch(enumerator.Key.ToString()))
                {

                    objCache.Remove(enumerator.Key.ToString());

                }

            }

        }

    }
}
