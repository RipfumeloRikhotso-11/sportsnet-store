using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SportsNET_WebApplication
{
    public partial class ExchangePolicy : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnExchange_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid)
                return;

            if (!chkCondition.Checked)
            {
                lblExchangeResult.CssClass = "error";
                lblExchangeResult.Text = " Please confirm that the item is unused and in its original condition.";
                return;
            }

            lblExchangeResult.CssClass = "success";
            lblExchangeResult.Text = " Exchange request submitted successfully for order " +
                                     Server.HtmlEncode(txtOrderNumber.Text.Trim()) + ".";
        }
    }
}