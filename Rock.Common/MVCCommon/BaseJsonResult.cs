using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.Mvc;
using System.Web.Script.Serialization;

using Newtonsoft.Json;
using Newtonsoft.Json.Converters;

namespace Rock.Common
{
    public class BaseJsonResult : ContentResult
    {
        JavaScriptSerializer serializer = new JavaScriptSerializer { MaxJsonLength = Int32.MaxValue, RecursionLimit = 100 };
        IsoDateTimeConverter dateConverter = new IsoDateTimeConverter();

        public object Data
        {
            set
            {
                this.Content = JsonConvert.SerializeObject(value,dateConverter);
            }
        }


        public BaseJsonResult()
            : this(null)
        {
        }


        public BaseJsonResult(object data)
        {
            this.dateConverter.DateTimeFormat = "yyyy-MM-dd";
            this.ContentType = "application/json";
            if (data != null)
            {
                this.Data = data;
            }
        }

    }
}
