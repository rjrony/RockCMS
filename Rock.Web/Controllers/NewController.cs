using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

using System.Data;
using System.Data.SqlClient;


using Rock.Service;
using Rock.Common;
using Rock.DataContract;

namespace Rock.Web.Controllers
{
    public class test
    {
        public string Title { get; set; }
        public DateTime? CreateDate { get; set; }
    }

    public class NewController : BaseController
    {
        CMSDB dbContext = new CMSDB();

        public ActionResult Index()
        {
            return View("new");
        }

        public ActionResult Edit()
        {
            return View("editNew");
        }

        public BaseJsonResult GetNewsList()
        {
            BaseJsonResult result = new BaseJsonResult();

            PagedParamContract pagedParam = new PagedParamContract(this.PageIndex, this.PageSize);

            PagedListContract<NewContract> pagedData = new PagedListContract<NewContract>();

            pagedData.Data = dbContext.tbInfoNews.OrderByDescending(x => x.dtCreateDate).GetPagedList(pagedParam)
                .Select(x => new NewContract
            {
                ID = x.ID,
                CreateDate = x.dtCreateDate.Value,
                Title = x.strNewsTitle
            }).ToList();
            pagedData.TotalCount = pagedParam.TotalCount;
            pagedData.PageTotalCount = pagedParam.PageTotalCount;

            result.Data = pagedData;
            return result;
        }

        public BaseJsonResult EditNews(int id)
        {
            BaseJsonResult result = new BaseJsonResult();
            var news = dbContext.tbInfoNews.Select(x => new NewContract {  ID=x.ID, Content=x.strNewsContent,Title=x.strNewsTitle})
                .FirstOrDefault(x => x.ID == id);
            result.Data = news;
            return result;
        }

        public BaseJsonResult DeleteNews(int id)
        {
            BaseJsonResult result = new BaseJsonResult();
            dbContext.tbInfoNews.DeleteObject(new tbInfoNews { ID = id });
            //result.Data = news;
            return result;
        }


        public ActionResult liyu()
        {
            return View("test");
        }

    }
}
