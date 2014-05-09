using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Rock.DataContract
{
    public class MenuContract
    {

        public string Title { get; set; }

        public string Link { get; set; }

        public bool IsSubMenu { get; set; }

        public List<MenuContract> SubMenus { get; set; }

    }
}