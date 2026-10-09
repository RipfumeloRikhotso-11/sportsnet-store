using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SportsNET_WebApplication.ServiceReference1;

namespace SportsNET_WebApplication
{
    public partial class Products : System.Web.UI.Page
    {
        Service1Client client = new Service1Client();
        protected void Page_Load(object sender, EventArgs e)
        {
            string categoryID = Request.QueryString["CategoryID"];
            string keyword = Request.QueryString["search"];
            if (IsPostBack == false)
            {

                if (categoryID != null)
                {
                    var productsByCategory = client.SortByCategory(categoryID);
                    RptProducts.DataSource = productsByCategory;
                    RptProducts.DataBind();
                }
                else if(keyword != null)
                {
                    var productsBySearch = client.Search(keyword);
                    RptProducts.DataSource = productsBySearch;
                    RptProducts.DataBind();
                }
                else
                {
                    getproducts();
                }
            }
        }

        private void getproducts()
        {
            Service1Client client = new Service1Client();
            var product = client.showUnsignedproducts().Take(12);
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



        

