using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SportsNET_WebApplication.ServiceReference1;

namespace SportsNET_WebApplication
{
    public partial class Signed : System.Web.UI.Page
    {
        Service1Client client = new Service1Client();
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (IsPostBack == false)
            {
                
                    getproducts();
                
            }
        }

        private void getproducts()
        {
            Service1Client client = new Service1Client();
            var product = client.showSignedproducts();
            RptProducts.DataSource = product;
            RptProducts.DataBind();


        }
        protected void RptProducts_ItemDataBound(object sender, RepeaterItemEventArgs e)
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