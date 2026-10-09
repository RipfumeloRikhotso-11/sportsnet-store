using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;

namespace SportsNET_WebApplication
{
    public class Global : HttpApplication
    {
        protected void Session_Start(object sender, EventArgs e)
        {
            if (Session["UserID"] == null && Session["TempUserID"] == null)
            {
                if (Request.Cookies["TempUserID"] == null)
                {
                    string tempId = Guid.NewGuid().ToString();
                    Response.Cookies["TempUserID"].Value = tempId;
                    Response.Cookies["TempUserID"].Expires = DateTime.Now.AddDays(7);
                    Session["TempUserID"] = tempId;
                }
                else
                {
                    Session["TempUserID"] = Request.Cookies["TempUserID"].Value;
                }
            }
        }
        void Application_Start(object sender, EventArgs e)
        {
            // Code that runs on application startup
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
        }
    }
}