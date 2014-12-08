using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace contactWebsite
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Global.user == null){
                Response.Redirect("Splash.aspx");
                base.OnLoad(e);
            }
        }
    }
}