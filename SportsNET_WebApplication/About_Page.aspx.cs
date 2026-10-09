using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SportsNET_WebApplication.ServiceReference1;

namespace SportsNET_WebApplication
{
    public partial class About_Page : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
             
            if (!IsPostBack)
            {
                getproducts();
                get5products();
                getvariants();
                
                


            }
        }

        private void get5products()
        {
            Service1Client client = new Service1Client();
            var product = client.showproducts().Take(5);

            rptShow5.DataSource = product;

            rptShow5.DataBind();

        }

        private void getproducts()
        {
            Service1Client client = new Service1Client();
            var product = client.showproducts();
            int productId = Convert.ToInt32(Request.QueryString["ProductID"]);
            rptShow5.DataSource = product;
            rptShow5.DataBind();
            var reviews = client.showReviews(productId);
            rptReview.DataSource = reviews;
            rptReview.DataBind();

        }
       
        private void getvariants()
        {
            Service1Client client = new Service1Client();
            int productId = Convert.ToInt32(Request.QueryString["ProductID"]);
            var variants = client.getvariant(productId);
            var color = variants.Select(v => v.Colour).Distinct();
            


            lblPrice.Text = lblPrice.Text + client.getFromPrice(productId).ToString();
            var product = client.getSpecificproduct(productId);
            if (product != null)
            {
                txtName.Text = product.ProductName;
                imgProduct.ImageUrl = product.ImageURL;
                txtDescription.Text = product.ProductDescription;
                lblDescription.Text = product.ProductDescription;
                txtHistory.Text = product.ShirtHistory;
            }

            rbSize.DataTextField = "ProductSize"; // Eval("ProductSize") 
            rbSize.DataValueField = "ProductSize";   // Eval("VariantID")
            rbSize.DataSource = client.getvariant(productId);
            rbSize.DataBind();

            
            rbColour.DataSource = color;
            rbColour.DataBind();

        }


        public bool addReview()
        {
            int user = 0;
            Service1Client client = new Service1Client();
            int productId = Convert.ToInt32(Request.QueryString["ProductID"]);
            if (Session["UserID"] != null)
            {
                user = Convert.ToInt32(Session["UserID"]);
            }
            else
            {
                Response.Redirect("registerPage.aspx");
            }
            var Review = new REVIEW
            {
                Comment = comment.Text,
                Rating = Convert.ToInt32(drdStars.SelectedValue),
                ReviewDate = DateTime.Now,
            };
           return client.addReview(Review, user, productId);
        }

        

        protected void rptShow5_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            Service1Client client = new Service1Client();
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                var product = (PRODUCT_TABLE)e.Item.DataItem;
                Label lblFromPrice = (Label)e.Item.FindControl("lblPrice");

                decimal fromPrice = client.getFromPrice(product.ProductID);

                lblFromPrice.Text = "From " + fromPrice.ToString("C");
            }
        }



        protected void BtnMinus_Click(object sender, EventArgs e)
        {
            int quantity = Convert.ToInt32(txtQty.Text.Trim());
            if (quantity > 0)
            {
                quantity--;
                txtQty.Text = quantity.ToString();

            }
            else
            {
                txtQty.Text = "0";

            }
        }

        protected void BtnPlus_Click(object sender, EventArgs e)
        {
            txtQty.Text = (Convert.ToInt32(txtQty.Text.Trim()) + 1).ToString();
        }

        protected void BtnCart_Click(object sender, EventArgs e)
        {
            Service1Client client = new Service1Client();
            int productId = Convert.ToInt32(Request.QueryString["ProductID"]);
            var variants = client.getvariant(productId);
            int realvariantID;
           
            int quantity = Convert.ToInt32(txtQty.Text);
               
            string selectedsize = rbSize.SelectedValue;
            string selectedcolour = rbColour.SelectedValue;
            var selected = variants.FirstOrDefault(v => v.ProductSize.Equals(selectedsize) && v.Colour.Equals(selectedcolour));

            if (selected != null)
            {
                realvariantID = selected.VariantID;
                if (Session["UserID"] != null)
                {
                   int userID = Convert.ToInt32(Session["UserID"]);
                    client.AddToCartLoggedIn(userID, realvariantID, quantity);
                }
                else
                {
                    string tempID = Session["TempUserID"].ToString();
                    client.AddToCartTempUser(tempID, realvariantID, quantity);
                }
                Response.Redirect("Cart.aspx");
            }

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            bool reviewAdded = addReview();
            if(reviewAdded)
            {
                lblreviewAdded.Text = "Review Added";
            }
            else
            {
                lblreviewAdded.Text = "Something went wrong";
            }
        }
    }

       
    }

    
