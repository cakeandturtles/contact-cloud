using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;
using contactWebsite.Entities;
using System.Text.RegularExpressions;
using Microsoft.WindowsAzure.ServiceRuntime;
using Microsoft.WindowsAzure.Storage;

namespace contactWebsite
{
    public class Global : HttpApplication
    {
        public static UserEntity user;
        public static CloudStorageAccount storageAccount;

        static Regex ProfileRegex = new Regex(@"/public/(?<username>[a-zA-Z]+)",
            RegexOptions.IgnoreCase | RegexOptions.Compiled);

        void Application_BeginRequest(object sender, EventArgs e)
        {
            Match match = ProfileRegex.Match(Context.Request.FilePath);
            if ((match != null) && match.Success)
            {
                Response.Redirect(String.Format("~/userProfile.aspx?username={0}", match.Groups["username"]));
            }
        }

        void Application_Start(object sender, EventArgs e)
        {
            // Code that runs on application startup
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);

            user = null;

            //Retrieve the storage account from the connection string
            var connectionString = RoleEnvironment.GetConfigurationSettingValue("MyConnectionString");
            storageAccount = CloudStorageAccount.Parse(connectionString);
        }
    }
}