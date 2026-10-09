using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Drawing;
using System.Web.UI.WebControls;
using SportsNET_WebApplication.ServiceReference1;
namespace SportsNET_WebApplication
{
    public partial class EditProduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //string adminpassW = "admin@Sportsnet1";
            //string hashedPassW = SecrecyHash.hashFunction(adminpassW);
            //lblMessage.Text = "PassW " + hashedPassW;
            //lblMessage.Visible = true;
            if (Session["UserRole"] == null || Session["UserRole"].ToString() != "Administrator")
            {
                Response.Redirect("loginPage.aspx");
                return;
            }
            if (!IsPostBack)
            {
                populateDropDownList();
                if (Request.QueryString["ProductID"] != null)
                {
                    int productId = Convert.ToInt32((Request.QueryString["ProductID"]));
                    loadProductDetails(productId);
                }
                else
                {
                    Response.Redirect("Inventory.aspx");
                }
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

        private void loadProductDetails(int productID)
        {
            try
            {
                using (Service1Client client = new Service1Client())
                {
                    var product = client.getSpecificproduct(productID);

                    if (product != null)
                    {
                        txtProductName.Text = product.ProductName;
                        txtDescription.Text = product.ProductDescription;
                        txtBrand.Text = product.Brand;

                        if (ddlCategory.Items.FindByValue(product.CategoryID.ToString()) != null)
                        {
                            ddlCategory.SelectedValue = product.CategoryID.ToString();
                        }

                        if (ddlSupplier.Items.FindByValue(product.SupplierID.ToString()) != null)
                        {
                            ddlSupplier.SelectedValue = product.SupplierID.ToString();
                        }

                        txtImageUrl.Text = product.ImageURL;
                        txtHistory.Text = product.ShirtHistory;

                        var variants = client.getvariant(productID);

                        if (variants != null)
                        {
                            ddlSize.DataSource = variants;
                            ddlSize.DataTextField = "ProductSize";
                            ddlSize.DataValueField = "VariantID";
                            ddlSize.DataBind();
                            ddlSize.Items.Insert(0, new ListItem("Select Size", "0"));

                            var firstVariant = variants[0];
                            txtPrice.Text = firstVariant.Price.ToString("0,00");
                            txtColour.Text = firstVariant.Colour;
                            chkIsSigned.Checked = firstVariant.IsSigned;
                            txtQuantity.Text = firstVariant.StockQuantity.ToString();

                        }

                    }
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error loading product details " + ex.Message;
                lblMessage.ForeColor = Color.Red;
                lblMessage.Visible = true;
            }

        }

        protected void ddlSize_SelectedIndexChanged(object sender, EventArgs e)
        {
            int selectedVariantId = Convert.ToInt32(ddlSize.SelectedValue);

            if (selectedVariantId > 0)
            {
                int productId = Convert.ToInt32(Request.QueryString["ProductID"]);

                using (Service1Client client = new Service1Client())
                {
                    var variants = client.getvariant(productId);
                    var selectedVariant = variants.FirstOrDefault(v => v.VariantID == selectedVariantId);

                    if (selectedVariant != null)
                    {
                        txtQuantity.Text = selectedVariant.StockQuantity.ToString();
                    }
                }
            }
        }

        protected void btnEditProduct_Click(object sender, EventArgs e)
        {
            try
            {
                if (Request.QueryString["ProductID"] != null)
                {
                    int productId = Convert.ToInt32(Request.QueryString["ProductID"]);
                    int selectedVariantId = Convert.ToInt32(ddlSize.SelectedValue);

                    string name = txtProductName.Text.Trim();
                    string description = txtDescription.Text.Trim();
                    string brand = txtBrand.Text.Trim();
                    int categoryId = Convert.ToInt32(ddlCategory.SelectedValue);
                    int supplierId = Convert.ToInt32(ddlSupplier.SelectedValue);
                    string imageUrl = txtImageUrl.Text.Trim();
                    string history = txtHistory.Text.Trim();

                    decimal price = Convert.ToDecimal(txtPrice.Text);
                    string colour = txtColour.Text.Trim();
                    bool isSigned = chkIsSigned.Checked;
                    int quantity = Convert.ToInt32(txtQuantity.Text.Trim());

                    using (Service1Client client = new Service1Client())
                    {
                        client.UpdateProduct(productId, name, description, brand, categoryId, supplierId, imageUrl, history);

                        client.updateProductVariant(productId, price, colour, isSigned);

                        if (selectedVariantId > 0)
                        {
                            client.updateStockQuantity(selectedVariantId, quantity);
                        }

                        lblMessage.Text = "Product updated successfully";
                        lblMessage.ForeColor = Color.Green;
                        lblMessage.Visible = true;
                    }

                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error updating product " + ex.Message;
                lblMessage.ForeColor = Color.Red;
                lblMessage.Visible = true;
            }
        }

        protected void btnDeleteProduct_Click(object sender, EventArgs e)
        {
            try
            {
                if (Request.QueryString["ProductID"] != null)
                {
                    int productId = Convert.ToInt32(Request.QueryString["ProductID"]);
                    using (Service1Client client = new Service1Client())
                    {
                        bool isDeleted = client.DeleteProduct(productId);

                        if (isDeleted)
                        {
                            lblMessage.Text = "Product deleted successfully";
                            lblMessage.ForeColor = Color.Green;
                            lblMessage.Visible = true;
                        }
                        else
                        {
                            lblMessage.Text = "Unable to delete product";
                            lblMessage.ForeColor = Color.Red;
                            lblMessage.Visible = true;
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error deleting product " + ex.Message;
                lblMessage.ForeColor = Color.Red;
                lblMessage.Visible = true;
            }
        }
    }
}