using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SportsNET_WebApplication.ServiceReference1;

namespace SportsNET_WebApplication
{
    public partial class Customer_Master : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Service1Client client = new Service1Client();
            if (!IsPostBack)
            {
               
                var category = client.showcategories();
                rptCategory.DataSource = category;
                rptCategory.DataBind();
                
                
                if (Session["UserID"] !=null)
                {
                    int userId = Convert.ToInt32(Session["UserID"]);
                    lblNumber.Text = client.getCountUser(userId).ToString();
                }
                else if(Session["TempUserID"] != null)
                {
                    string tempID = Session["TempUserID"].ToString();
                    lblNumber.Text = client.getCountTemp(tempID).ToString();
                }
                
            }

        }

        

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string word = txtSearch.Text.Trim();
            
            if (word != null)
            {
                Response.Redirect("Products.aspx?search=" + Server.UrlEncode(word));
            }
        }

        protected void btnCart_Click(object sender, EventArgs e)
        {
            Response.Redirect("Cart.aspx");
        }
    }
}