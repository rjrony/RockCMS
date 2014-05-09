using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

using Rock.DataContract;
using Rock.Service;

namespace Rock.Web.Controllers
{
    public class IndexController : Controller
    {


        public ActionResult Index()
        {
            var menuList = MenuService.GetAllMenu();

            return View("index", menuList);
        }

    }
}
