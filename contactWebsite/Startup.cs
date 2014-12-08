using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(contactWebsite.Startup))]
namespace contactWebsite
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
