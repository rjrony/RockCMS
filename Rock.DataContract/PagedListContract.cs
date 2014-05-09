using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Runtime.Serialization;

using Newtonsoft.Json;


namespace Rock.DataContract
{
    public class PagedListContract<T>
    {
        private int pageSize = 20;

        [JsonProperty("Rows")]
        public IEnumerable<T> Data { get; set; }

        public int PageSize
        {
            get { return pageSize; }
            set { pageSize = value; }
        }

        [JsonProperty("Total")]
        public int TotalCount { get; set; }

        [JsonProperty("PageTotalCount")]
        public int PageTotalCount
        {
            get
            {
                return this.CalculatePageTotalCount();
            }
            set { ; }
        }


        private int CalculatePageTotalCount()
        {
            return this.TotalCount % pageSize == 0 ? TotalCount / pageSize : TotalCount / pageSize + 1;
        }
    }
}
