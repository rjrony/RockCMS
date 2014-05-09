using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Mvc;

namespace Rock.Common
{
    public class BaseController : Controller
    {

        public int PageIndex
        {
            get { return this.GetFormValue<int>("page", 1); }
        }

        public int PageSize
        {
            get { return this.GetFormValue<int>("pagesize"); }
        }


        public T GetFormValue<T>(string key, T defaultValue = default(T))
        {
            if (string.IsNullOrEmpty(Request.Form[key]))
            {
                return defaultValue;
            }

            try
            {
                return (T)Convert.ChangeType(Request.Form[key], typeof(T));
            }
            catch
            {
                return defaultValue;
            }
        }

    }
}
