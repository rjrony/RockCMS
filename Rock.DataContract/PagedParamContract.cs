using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Rock.DataContract
{
    public class PagedParamContract
    {

        public PagedParamContract(int pageindex)
        {
            this.PageIndex = pageindex;
        }

        public PagedParamContract(int pageindex, int pagesize)
        {
            this.PageIndex = pageindex;
            this.PageSize = pagesize;
        }

        private int pageSize = 20;

        public int PageIndex
        {
            get;
            set;
        }

        public int PageSize
        {
            get { return pageSize; }
            set { pageSize = value; }
        }
        public int TotalCount { get; set; }
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
