using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SportsNET_WebApplication.ServiceReference1;

namespace SportsNET_WebApplication
{
    public partial class Invoice_Page : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                Service1Client client = new Service1Client();
                int userID = Convert.ToInt32(Session["UserID"]);
                var invoices = client.getInvoices(userID);
                rptInvoices.DataSource = invoices;
                rptInvoices.DataBind();

                

            }
        }

        
    }
}