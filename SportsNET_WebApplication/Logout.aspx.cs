using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SportsNET_WebApplication
{
    public partial class Logout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["UserID"] = null;
            Session["UserEmail"] = null;
            Session["UserRole"] = null;

            Session.Clear();
            Session.Abandon();

            Response.Redirect("loginPage.aspx");
        }
    }
}