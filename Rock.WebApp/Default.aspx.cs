using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Rock.WebApp
{
    public partial class Default : System.Web.UI.Page
    {
        public enum test1
        { 
            ems,
            ami,
            ddd
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Write((int)test1.ems);
        }
    }
}