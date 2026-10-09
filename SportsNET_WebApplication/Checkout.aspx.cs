using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SportsNET_WebApplication.ServiceReference1;

namespace SportsNET_WebApplication
{
    public partial class Checkout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                showcart();
            }
        }

        protected bool checkoutUser()
        {
            Service1Client client = new Service1Client();
            bool useDifferentShippingAddress = chShip.Checked;
            int billingID;
            int shippingID;
            int userID = Convert.ToInt32(Session["UserID"]);
            var address = new USER_ADDRESS
            {
                Recipient_Name = txtFirstName.Text,
                Recipient_Surname = txtLastName.Text,
                E_Mail = txtEmail.Text,
                Mobile_Number = txtNumber.Text,
                Street_Address = txtStreet.Text,
                Suburb = txtSuburb.Text,
                Country = dpdCountry.SelectedValue,
                City = txtCity.Text,
                State_Province = txtProvince.Text,
                ZIP_Postal_Code = txtZIP.Text,
            };

            

            billingID = client.createBillingAddress(address, userID);
            Session["BillingID"] = billingID;

            if (useDifferentShippingAddress)
            {
                var shipping = new USER_ADDRESS
                {
                    Recipient_Name = txtFN_Shipping.Text,
                    Recipient_Surname = txtLN_Shipping.Text,
                    E_Mail = txtEmail_Shipping.Text,
                    Mobile_Number = txtNumber_Shipping.Text,
                    Street_Address = txtAddress1_Shipping.Text,
                    Suburb = txtAddress2_Shipping.Text,
                    Country = dpdCountry_Shipping.SelectedValue,
                    City = txtCity_Shipping.Text,
                    State_Province = txtProvince_Shipping.Text,
                    ZIP_Postal_Code = txtZIP_Shipping.Text,
                };

               shippingID = client.createShippingAddress(shipping, userID);
               
            }
            else
            {
                shippingID = client.createShippingAddress(address, userID);
            }
            Session["ShippingID"] = shippingID;

            var order = new ORDER_TABLE
            {
                Billing_ID = billingID,
                Shipping_ID = shippingID,
            };
            
            int orderCreated =  client.createOrder(order, userID, billingID, shippingID);
            Session["OrderID"] = orderCreated;
            
            if (orderCreated < 0)
            {
                return false;
            }
            return true; 


        }

        protected void showcart()
        {
            Service1Client client = new Service1Client();

            int userID;
            if (Session["UserID"] != null)
            {
                userID = Convert.ToInt32(Session["UserID"]);
                var cartItemsLoggedIn = client.getcartitemsUser(userID);
                rptCartItems.DataSource = cartItemsLoggedIn;
                rptCartItems.DataBind();
                decimal v = client.getCartItemTotalUser(userID);
                bool firstOrder = client.isFirstOrder(Convert.ToInt32(Session["UserID"]));
                if (firstOrder)
                {
                    txtSubtotal.Text = "R" + v.ToString();
                    decimal deliveryfee;
                    v = v -(v*0.1m);
                    txtDiscount.Text = "R" + (v * 0.1m).ToString();
                    if (v >= 1350 || v == 0)
                    {
                        deliveryfee = 0;
                    }
                    else
                    {
                        deliveryfee = 80;
                    }

                    txtDelivery.Text = "R" + deliveryfee.ToString();
                    txtTotal.Text = "R" + (v + deliveryfee).ToString();
                }
                else
                {
                    
                    txtDiscount.Text = "R0";
                    txtSubtotal.Text = "R" + v.ToString();
                    decimal deliveryfee;
                    if (v >= 1350 || v == 0)
                    {
                        deliveryfee = 0;
                    }
                    else
                    {
                        deliveryfee = 80;
                    }
                    txtDelivery.Text = "R" + deliveryfee.ToString();
                    txtTotal.Text = "R" + (v + deliveryfee).ToString();
                }
                
            }
        }

        protected void btnOrder_Click(object sender, EventArgs e)
        {
            bool result = checkoutUser();
            if(result)
            {
                Response.Redirect("Payment.aspx");
            }
        }
    }
}