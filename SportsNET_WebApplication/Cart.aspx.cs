using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SportsNET_WebApplication.ServiceReference1;

namespace SportsNET_WebApplication
{
    public partial class Cart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!IsPostBack)
            {
                showcart();
            }
        }
       
        protected void Checkout_Click(object sender, EventArgs e)
        {
            Service1Client client = new Service1Client();
            if (Session["UserID"] != null)
            {
                Response.Redirect("Checkout.aspx");
            }
            else
            {
                Session["RedirectUserBack"] = "Checkout.aspx";
                Response.Redirect("registerPage.aspx");
            }
           
        }

        protected void showcart()
        {
            Service1Client client = new Service1Client();

            int userID;

            string tempUser;
            if (Session["UserID"] != null)
            {
                userID = Convert.ToInt32(Session["UserID"]);
                var cartItemsLoggedIn = client.getcartitemsUser(userID);
                rptCartItems.DataSource = cartItemsLoggedIn;
                rptCartItems.DataBind();
                decimal v = client.getCartItemTotalUser(userID);
                bool firstOrder = client.isFirstOrder(Convert.ToInt32(Session["UserID"]));
                Subtotal.Text = "R" + v.ToString();
                if (firstOrder)
                {
                    v = v-(v * 0.1m);
                    txtDiscount.Text = "R" + (v *0.1m).ToString();
                    decimal deliveryfee;
                    if (v >= 1350 || v == 0)
                    {
                        deliveryfee = 0;
                    }
                    else
                    {
                        deliveryfee = 80;
                    }
                    Delivery.Text = "R" + deliveryfee;
                    Total.Text = "R" + (v + deliveryfee).ToString();
                }
                else
                {
                    txtDiscount.Text = "R0";
                    decimal deliveryfee;
                    if (v >= 1350 || v == 0)
                    {
                        deliveryfee = 0;
                    }
                    else
                    {
                        deliveryfee = 80;
                    }
                    Delivery.Text = "R" + deliveryfee;
                    Total.Text = "R" + (v + deliveryfee).ToString();
                }
                
                
            }
            else
            {
                tempUser = Session["TempUserID"].ToString();
                var cartItemsTemp = client.getcartitemsTemp(tempUser);
                rptCartItems.DataSource = cartItemsTemp;
                rptCartItems.DataBind();
                decimal v = client.getCartItemTotalTemp(tempUser);

                decimal deliveryfee;
                if (v >= 1350 || v == 0)
                {
                    deliveryfee = 0;
                }
                else
                {
                    deliveryfee = 80;
                }
                Subtotal.Text = "R" + v.ToString();
                Delivery.Text = "R" + deliveryfee;
                Total.Text = "R" + (v + deliveryfee).ToString();
            }
            
        }

        protected void rptCartItems_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            int variantID = Convert.ToInt32(e.CommandArgument);
            TextBox txtQuantity = (TextBox)e.Item.FindControl("txtQuantity");
            int quantity = Convert.ToInt32(txtQuantity.Text);
            Service1Client client = new Service1Client();
            
            int userID;
            string tempUserID;
            if (Session["UserID"] != null)
            {
                userID = Convert.ToInt32(Session["UserID"]);
                if (e.CommandName.Equals("Decrease"))
                {
                    if (quantity > 0)
                    {
                        quantity--;
                    }
                    else
                    {
                        quantity = 0;
                    }
                    client.UpdateCartItemQtyUser(userID, variantID, quantity);
                }
                else if (e.CommandName.Equals("Increase"))
                {
                    quantity++;

                    client.UpdateCartItemQtyUser(userID, variantID, quantity);
                }
                else if (e.CommandName.Equals("Remove"))
                {
                    client.RemoveFromCartUser(userID, variantID);
                }
            }
            else
            {
                tempUserID = Session["TempUserID"].ToString();
                if (e.CommandName.Equals("Decrease"))
                {
                    if (quantity > 0)
                    {
                        quantity--;
                    }
                    else
                    {
                        quantity = 0;
                    }
                    client.UpdateCartItemQtyTemp(tempUserID, variantID, quantity);
                }
                else if (e.CommandName.Equals("Increase"))
                {
                    quantity++;

                    client.UpdateCartItemQtyTemp(tempUserID, variantID, quantity);
                }
                else if (e.CommandName.Equals("Remove"))
                {
                    client.RemoveFromCartTemp(tempUserID, variantID);
                }
            }

            showcart();

        }
    }
}



