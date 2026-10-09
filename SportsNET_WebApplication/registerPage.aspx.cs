using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SportsNET_WebApplication.ServiceReference1;

namespace SportsNET_WebApplication
{
   
    public partial class registerPage : System.Web.UI.Page
    {
        Service1Client client = new Service1Client();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void mybutton_Click(object sender, EventArgs e)
        {
            string RawPassword = mypassword.Text.Trim();
            String hashed = SecrecyHash.hashFunction(RawPassword);
            var addUser = new USER_TABLE
            {
                FirstName = myname.Text.Trim(),
                LastName = mysurname.Text.Trim(),
                UserEmail = myemail.Text.Trim(),
                UserPhoneNumber = myphonenum.Text.Trim(),
                UserPassword = hashed,

            };

            int result = client.registerUser(addUser);

            lblMessage.Visible = true;

            switch (result)
            {
                case 0:
                    Response.Redirect("loginPage.aspx");
                    break;
                case 1:
                    lblMessage.Text = "Something went wrong on our end. Please try again later.";
                    break;
                case 2:
                    lblMessage.Text = "Email already exists";
                    mypassword.Text = string.Empty;
                    myemail.Text = string.Empty;
                    break;
            }

            


        }
    }
}
