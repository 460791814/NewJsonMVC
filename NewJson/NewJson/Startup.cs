using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(NewJson.Startup))]
namespace NewJson
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
