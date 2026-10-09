using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SportsNET_WebApplication
{
    public partial class HelpAndSupport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnGetHelp_Click(object sender, EventArgs e)
        {
            switch (ddlHelpTopic.SelectedValue)
            {
                case "order":
                    lblHelp.Text = "For orders, check your cart and checkout details before confirming your purchase.";
                    break;

                case "exchange":
                    lblHelp.Text = "Please visit the Exchange Policy page for exchange requirements.";
                    break;

                case "size":
                    lblHelp.Text = "Please visit the Size Guidelines page and check the measurements for your product.";
                    break;

                case "delivery":
                    lblHelp.Text = "Please visit the Delivery and Conditions page for delivery information.";
                    break;

                case "contact":
                    lblHelp.Text = "Please visit the Contact page to send us your enquiry.";
                    break;

                default:
                    lblHelp.Text = "Please select a help topic.";
                    break;
            }
        }
    }
}