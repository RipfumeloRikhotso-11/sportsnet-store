using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using SportsNET_WebApplication.ServiceReference1;
namespace SportsNET_WebApplication
{
    public partial class AddProduct : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserRole"] == null || Session["UserRole"].ToString() != "Administrator")
            {
                Response.Redirect("loginPage.aspx");
                return;
            }
            if (!IsPostBack)
            {
                populateDropDownList();
            }

        }

        private void populateDropDownList()
        {
            try
            {
                Service1Client client = new Service1Client();
                ddlCategory.DataSource = client.showcategories();
                ddlCategory.DataTextField = "CategoryName";
                ddlCategory.DataValueField = "CategoryID";
                ddlCategory.DataBind();
                ddlCategory.Items.Insert(0, new ListItem("Select Category", "0"));

                ddlSupplier.DataSource = client.getSuppliers();
                ddlSupplier.DataTextField = "SupplierName";
                ddlSupplier.DataValueField = "SupplierID";
                ddlSupplier.DataBind();
                ddlSupplier.Items.Insert(0, new ListItem("Select Supplier", "0"));
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error loading options " + ex.Message;
                lblMessage.ForeColor = Color.Red;
                lblMessage.Visible = true;
            }

        }

        protected void btnAddProduct_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtProductName.Text) || ddlCategory.SelectedValue == "0" || ddlSupplier.SelectedValue == "0")
            {
                lblMessage.Text = "Please complete all required fields and choose a valid category or supplier";
                lblMessage.ForeColor = Color.Red;
                lblMessage.Visible = true;
                return;
            }
            try
            {
                Service1Client client = new Service1Client();
                bool IsSuccess = client.AddProduct(txtProductName.Text.Trim(), txtDescription.Text.Trim(), txtBrand.Text.Trim(), Convert.ToInt32(ddlCategory.SelectedValue), Convert.ToInt32(ddlSupplier.SelectedValue), txtImageUrl.Text.Trim(), txtHistory.Text.Trim(),
                                                   txtColour.Text.Trim(), chkIsSigned.Checked, Convert.ToDecimal(txtPrice.Text.Trim()), Convert.ToInt32(txtQuantity.Text.Trim()));
                if (IsSuccess)
                {
                    lblMessage.Text = "Product added successfully.";
                    lblMessage.ForeColor = Color.Green;
                    lblMessage.Visible = true;

                    ClearForm();
                }
                else
                {
                    lblMessage.Text = "A product with this name already exists";
                    lblMessage.ForeColor = Color.Red;
                    lblMessage.Visible = true;
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error loading list items " + ex.Message;
                lblMessage.Visible = true;
            }


        }
        private void ClearForm()
        {
            txtProductName.Text = string.Empty;
            txtDescription.Text = string.Empty;
            txtBrand.Text = string.Empty;
            txtImageUrl.Text = string.Empty;
            txtHistory.Text = string.Empty;
            ddlCategory.SelectedIndex = 0;
            ddlSupplier.SelectedIndex = 0;
            txtColour.Text = string.Empty;
            chkIsSigned.Checked = false;
            txtPrice.Text = string.Empty;
            txtQuantity.Text = string.Empty;
        }
    }
}