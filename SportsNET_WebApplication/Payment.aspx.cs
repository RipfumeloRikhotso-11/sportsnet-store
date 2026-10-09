using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SportsNET_WebApplication.ServiceReference1;

namespace SportsNET_WebApplication
{
    public partial class Payment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                showcart();
            }
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
                txtSubtotal.Text = "R" + v.ToString();
                bool firstOrder = client.isFirstOrder(userID);
                if (firstOrder)
                {
                    v =  v-(v* 0.1m);
                    txtDiscount.Text = "R" + (v * 0.1m).ToString();
                }
                else
                {
                    txtDiscount.Text = "R0";
                }
                decimal deliveryfee;
                if (v >= 1350 || v == 0)
                {
                    deliveryfee = 0;
                }
                else
                {
                    deliveryfee = 80;
                }
                txtDelivery.Text = "R" + deliveryfee;
                txtTotal.Text = "R" + (v+deliveryfee).ToString();
            }
        }

        protected bool createPayment()
        {
            Service1Client client = new Service1Client();
            int userID = Convert.ToInt32(Session["UserID"]);
            int billID = 0;
            int shippID= 0;
            int orderID = 0;
            if (Session["BillingID"] != null)
            {
                billID = Convert.ToInt32(Session["BillingID"]);
            }
            if (Session["ShippingID"] != null)
            {
                shippID = Convert.ToInt32(Session["ShippingID"]);
            }
            if (Session["OrderID"] != null)
            {
                orderID = Convert.ToInt32(Session["OrderID"]);
            }

            string paymentMethodRadio = Request.Form["payment"];

            if (billID <= 0 || shippID <= 0 || orderID <= 0)
            {
                throw new Exception("Checkout session values are invalid.");
            }

            decimal cartTotal = client.getCartItemTotalUser(userID);
            bool payment =  client.createPayment(billID, shippID, orderID, cartTotal, paymentMethodRadio, userID);
            return payment;
        }

        protected void btnPay_Click(object sender, EventArgs e)
        {
            bool pay = createPayment();
            Service1Client client = new Service1Client();
            int orderID = Convert.ToInt32(Session["OrderID"]);
            if (pay)
            {
                client.completePayment(orderID);
                Response.Redirect("Pending_Payment.aspx");

            }
        }
    }
}