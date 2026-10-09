using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SportsNET_WebApplication.ServiceReference1;

namespace SportsNET_WebApplication
{
    public partial class loginPage : System.Web.UI.Page
    {
        Service1Client client = new Service1Client();
        protected void loginbtn_Click(object sender, EventArgs e)
        {
            string email = myemail.Text.Trim();
            string Rawpassword = mypassword.Text.Trim();
            string hashedPassword = SecrecyHash.hashFunction(Rawpassword);
            string selectedRole = ddlUserType.SelectedValue;

            int userId = client.loginUser(email, hashedPassword, selectedRole);

            if (userId != -1)
            {
                client.createLoginSession(userId);

                //store user state
                Session["UserID"] = userId;
                Session["UserEmail"] = email;
                Session["UserRole"] = selectedRole;

                if (Session["TempUserID"] != null)
                {
                    string tempUserID = Session["TempUserID"].ToString();
                    client.combineCarts(userId, tempUserID);
                    client.clearCartTemp(tempUserID);
                    Session.Remove("TempUserID");
                }

                if (selectedRole == "Administrator")
                {
                    Response.Redirect("Inventory.aspx");
                }
                else
                {
                    if (Session["RedirectUserBack"] != null)
                    {
                        string target = Session["RedirectUserBack"].ToString();
                        Session.Remove("RedirectUserBack");
                        Response.Redirect(target);
                    }
                    else
                    {
                        Response.Redirect("Shop.aspx");
                    }
                }

            }
            else
            {
                loginMessage.Text = "Invalid email or password.";
                loginMessage.Visible = true;
                mypassword.Text = string.Empty;
            }


        }
    }
}