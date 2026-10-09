using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SportsNET_WebApplication.ServiceReference1;

namespace SportsNET_WebApplication
{
    public partial class Shop : System.Web.UI.Page
    {
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
            var product = client.showUnsignedproducts();
      
            Rpt1.DataSource = product;
            Rpt1.DataBind();
        }

        protected void btnViewDetails_Click(object sender, EventArgs e)
        {
            Response.Redirect("About_Page.aspx");
        }

        protected void btnAddtoCart_Click(object sender, EventArgs e)
        {
            Response.Redirect("Cart.aspx");
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

        protected void chkB_CheckedChanged(object sender, EventArgs e)
        {
            Service1Client client = new Service1Client();
            if(chkB.Checked)
            {
                string Black = chkB.Text.Trim();
                var products = client.sortByColour(Black);
                Rpt1.DataSource = products;
                Rpt1.DataBind();
            }
            else
            {
                getproducts();
            }
            
        }

        protected void AtoZ_Command(object sender, CommandEventArgs e)
        {
            Service1Client client = new Service1Client();
            var sortedAtoZ = client.SortByAtoZ();
            Rpt1.DataSource = sortedAtoZ;
            Rpt1.DataBind();
        }

        protected void ZtoA_Command(object sender, CommandEventArgs e)
        {
            Service1Client client = new Service1Client();
            var sortZtoA = client.SortByZtoA();
            Rpt1.DataSource = sortZtoA;
            Rpt1.DataBind();
        }

        protected void chkR_CheckedChanged(object sender, EventArgs e)
        {
            Service1Client client = new Service1Client();
            if(chkR.Checked)
            {
                string Red = chkR.Text.Trim();
                var products = client.sortByColour(Red);
                Rpt1.DataSource = products;
                Rpt1.DataBind();
            }
            else
            {
                getproducts();
            }
            
        }

        protected void chkW_CheckedChanged(object sender, EventArgs e)
        {
            Service1Client client = new Service1Client();
            if(chkW.Checked)
            {
                string White = chkW.Text.Trim();
                var products = client.sortByColour(White);
                Rpt1.DataSource = products;
                Rpt1.DataBind();
            }
            else
            {
                getproducts();
            }
            
        }

        protected void chkBl_CheckedChanged(object sender, EventArgs e)
        {
            Service1Client client = new Service1Client();
            if(chkBl.Checked)
            {
                string Blue = chkBl.Text.Trim();
                var products = client.sortByColour(Blue);
                Rpt1.DataSource = products;
                Rpt1.DataBind();
            }
            else
            {
                getproducts();
            }
           
        }

        protected void chkG_CheckedChanged(object sender, EventArgs e)
        {
            Service1Client client = new Service1Client();
            if(chkG.Checked)
            {
                string Green = chkG.Text.Trim();
                var products = client.sortByColour(Green);
                Rpt1.DataSource = products;
                Rpt1.DataBind();
            }
            else
            {
                getproducts();
            }
            
        }

        protected void chkY_CheckedChanged(object sender, EventArgs e)
        {
            Service1Client client = new Service1Client();
            if(chkY.Checked)
            {
                string Yellow = chkY.Text.Trim();
                var products = client.sortByColour(Yellow);
                Rpt1.DataSource = products;
                Rpt1.DataBind();
            }
            else
            {
                getproducts();
            }
            
        }

        protected void chkGr_CheckedChanged(object sender, EventArgs e)
        {
            Service1Client client = new Service1Client();
            if(chkGr.Checked)
            {
                string Gray = chkGr.Text.Trim();
                var products = client.sortByColour(Gray);
                Rpt1.DataSource = products;
                Rpt1.DataBind();
            }
            else
            {
                getproducts();
            }
        }

        protected void chAll_CheckedChanged(object sender, EventArgs e)
        {
            getproducts();

        }

        protected void chRange1_CheckedChanged(object sender, EventArgs e)
        {
            Service1Client client = new Service1Client();
            if(chRange1.Checked)
            {
                string range = chRange1.Text.Trim();
                string[] token = range.Split('-');
                decimal minimum = decimal.Parse(token[0].Trim());
                decimal maximum = decimal.Parse(token[1].Trim());
                var products =  client.FilterByPriceRange(minimum, maximum);
                Rpt1.DataSource = products;
                Rpt1.DataBind();
            }
            else
            {
                getproducts();
            }
        }

        protected void chRange2_CheckedChanged(object sender, EventArgs e)
        {
            Service1Client client = new Service1Client();
            if (chRange2.Checked)
            {
                string range = chRange2.Text.Trim();
                string[] token = range.Split('-');
                decimal minimum = decimal.Parse(token[0].Trim());
                decimal maximum = decimal.Parse(token[1].Trim());
                var products = client.FilterByPriceRange(minimum, maximum);
                Rpt1.DataSource = products;
                Rpt1.DataBind();
            }
            else
            {
                getproducts();
            }
        }

        protected void chRange3_CheckedChanged(object sender, EventArgs e)
        {
            Service1Client client = new Service1Client();
            if (chRange3.Checked)
            {
                string range = chRange3.Text.Trim();
                string[] token = range.Split('-');
                decimal minimum = decimal.Parse(token[0].Trim());
                decimal maximum = decimal.Parse(token[1].Trim());
                var products = client.FilterByPriceRange(minimum, maximum);
                Rpt1.DataSource = products;
                Rpt1.DataBind();
            }
            else
            {
                getproducts();
            }
        }
    }
}