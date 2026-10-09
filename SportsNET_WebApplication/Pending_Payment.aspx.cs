using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SportsNET_WebApplication.ServiceReference1;

namespace SportsNET_WebApplication
{
    public partial class Pending_Payment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Service1Client client = new Service1Client();
            int orderID = 0;

            if (Session["OrderID"] != null)
            {
                orderID = Convert.ToInt32(Session["OrderID"]);
            }
            lblPending.Text = lblPending.Text + orderID.ToString();

            lblTotal.Text = lblTotal.Text + client.getInvoiceTotal(orderID);
           
        }

    }
}