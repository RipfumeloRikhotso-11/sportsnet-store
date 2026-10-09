using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SportsNET_WebApplication
{
    public partial class FAQ : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        private void HideAnswers()
        {
            pnlFAQ1.Visible = false;
            pnlFAQ2.Visible = false;
            pnlFAQ3.Visible = false;
            pnlFAQ4.Visible = false;
            pnlFAQ5.Visible = false;
        }

        protected void btnFAQ1_Click(object sender, EventArgs e)
        {
            HideAnswers();
            pnlFAQ1.Visible = true;
        }

        protected void btnFAQ2_Click(object sender, EventArgs e)
        {
            HideAnswers();
            pnlFAQ2.Visible = true;
        }

        protected void btnFAQ3_Click(object sender, EventArgs e)
        {
            HideAnswers();
            pnlFAQ3.Visible = true;
        }

        protected void btnFAQ4_Click(object sender, EventArgs e)
        {
            HideAnswers();
            pnlFAQ4.Visible = true;
        }

        protected void btnFAQ5_Click(object sender, EventArgs e)
        {
            HideAnswers();
            pnlFAQ5.Visible = true;
        }
    
}
}