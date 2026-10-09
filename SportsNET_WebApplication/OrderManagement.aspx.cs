using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SportsNET_WebApplication.ServiceReference1;

namespace SportsNET_WebApplication
{
    public partial class OrderManagement : System.Web.UI.Page
    {
        Service1Client client = new Service1Client();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var orders = client.getAllOrders();
                rptOrders.DataSource = orders;
                rptOrders.DataBind();
            }
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            RepeaterItem item = (RepeaterItem)btn.NamingContainer;

            DropDownList ddlStatus = (DropDownList)item.FindControl("ddlStatus");
            Label lblStatus = (Label)item.FindControl("lblStatus");

            int orderID = Convert.ToInt32(btn.CommandArgument);
            string newStatus = ddlStatus.SelectedValue;

            Service1Client service = new Service1Client();
            service.UpdateOrderStatus(orderID, newStatus);

            lblStatus.Text = newStatus;
        }
        

        protected void btnAll_Click(object sender, EventArgs e)
        {
            LoadOrders();
        }

        protected void btnPending_Click(object sender, EventArgs e)
        {
            Service1Client service = new Service1Client();

            rptOrders.DataSource = service.FilterOrders("Pending");
            rptOrders.DataBind();
        }

        protected void btnProcessing_Click(object sender, EventArgs e)
        {
            Service1Client service = new Service1Client();

            rptOrders.DataSource = service.FilterOrders("Processing");
            rptOrders.DataBind();
        }

        protected void btnShipping_Click(object sender, EventArgs e)
        {
            Service1Client service = new Service1Client();

            rptOrders.DataSource = service.FilterOrders("Shipping");
            rptOrders.DataBind();
        }

        protected void btnDelivered_Click(object sender, EventArgs e)
        {
            Service1Client service = new Service1Client();

            rptOrders.DataSource = service.FilterOrders("Delivered");
            rptOrders.DataBind();
        }
        private void LoadOrders() 
        {
            Service1Client service = new Service1Client();

            rptOrders.DataSource = service.getAllOrders();
            rptOrders.DataBind();
        }

    }
}