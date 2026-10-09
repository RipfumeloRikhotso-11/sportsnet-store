using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SportsNET_WebApplication
{
    public partial class SizeGuidelines : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnSizeGuide_Click(object sender, EventArgs e)
        {
            if (ddlSizeType.SelectedValue == "")
            {
                pnlSizeGuide.Visible = false;
                lblSizeMessage.Text = "Please select a product type.";
                return;
            }

            pnlSizeGuide.Visible = true;
            lblSizeMessage.Text = "Here is the general size guide for " +
                                  ddlSizeType.SelectedItem.Text + ".";
        }
    }
}