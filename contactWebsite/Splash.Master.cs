using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace contactWebsite
{
    public partial class SplashMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Do nothing! We're on the splash page!
            if (Global.user == null) { }
            else
            {
                Response.Redirect("Default.aspx");
                base.OnLoad(e);
            }
        }
    }
}