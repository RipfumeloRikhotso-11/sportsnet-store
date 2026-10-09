using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SportsNET_WebApplication
{
    public partial class ContactAndDelivery : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid)
                return;

            lblResult.CssClass = "success";
            lblResult.Text = " Thank you, " + Server.HtmlEncode(txtName.Text.Trim()) +
                             ". Your message has been submitted successfully.";

            txtName.Text = "";
            txtEmail.Text = "";
            txtSubject.Text = "";
            txtMessage.Text = "";
        }

        protected void btnDelivery_Click(object sender, EventArgs e)
        {
            switch (ddlDelivery.SelectedValue)
            {
                case "standard":
                    lblDelivery.Text = "Standard delivery: delivery time depends on your location and product availability.";
                    break;

                case "express":
                    lblDelivery.Text = "Express delivery: a faster delivery option may be available depending on your location.";
                    break;

                case "collection":
                    lblDelivery.Text = "Collection: collection availability depends on the selected order and collection location.";
                    break;

                default:
                    lblDelivery.Text = "Please select a delivery option.";
                    break;
            }
        }

        protected void btnAccept_Click(object sender, EventArgs e)
        {
            if (chkConditions.Checked)
            {
                lblConditions.Text = " You have accepted the delivery conditions.";
            }
            else
            {
                lblConditions.Text = " Please tick the checkbox to confirm that you have read the conditions.";
            }
        }
    }
}