using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SportsNET_WebApplication.ServiceReference1;
namespace SportsNET_WebApplication
{
    public partial class Inventory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserRole"] == null || Session["UserRole"].ToString() != "Administrator")
            {
                Response.Redirect("loginPage.aspx");
                return;
            }
            if (IsPostBack == false)
            {
                getproducts();
            }
        }

        private void getproducts()
        {

            Service1Client client = new Service1Client();
            var product = client.showproducts();

            Rpt1.DataSource = product;
            Rpt1.DataBind();


        }

        protected void Rpt1_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            Service1Client client = new Service1Client();
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                var product = (PRODUCT_TABLE)e.Item.DataItem;
                Label lblFromPrice = (Label)e.Item.FindControl("lblPrice");

                decimal fromPrice = client.getFromPrice(product.ProductID);

                lblFromPrice.Text = "From " + fromPrice.ToString("C");
            }
        }
    }
}