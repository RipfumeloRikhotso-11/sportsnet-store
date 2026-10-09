using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;

namespace Sportsnet_Service
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the class name "Service1" in code, svc and config file together.
    // NOTE: In order to launch WCF Test Client for testing this service, please select Service1.svc or Service1.svc.cs at the Solution Explorer
    // and start debugging.

    public class Service1 : IService1
    {
        public void AddToCartLoggedIn(int UserID, int variantID, int quantity)
        {
            //This needs to be mentioned explicitly because a constant changing database causes a object disposal error 
            //because of visual studio lazy loading
            using (var ctx = new DataBaseDataContext(
           System.Configuration.ConfigurationManager.ConnectionStrings["DBSportsNETConnectionString"].ConnectionString))
            {
                ctx.DeferredLoadingEnabled = false;


                var cart = (from c in ctx.CARTs where c.UserID.Equals(UserID) select c).FirstOrDefault();

                if (cart == null)
                {
                    cart = new CART
                    {
                        UserID = UserID,
                        CreatedDate = DateTime.Now,
                    };
                    ctx.CARTs.InsertOnSubmit(cart);
                    ctx.SubmitChanges();
                }
                var cartItem = (from i in ctx.CART_ITEMs
                                where i.VariantID.Equals(variantID) && i.CartID.Equals(cart.CartID)
                                select i).FirstOrDefault();
                if (cartItem == null)
                {
                    cartItem = new CART_ITEM
                    {
                        CartID = cart.CartID,

                        VariantID = variantID,
                        Quantity = quantity,
                        
                    };
                    ctx.CART_ITEMs.InsertOnSubmit(cartItem);
                }

                else
                {
                    cartItem.Quantity += quantity;
                }
                
                ctx.SubmitChanges();

            }
        }

        public void AddToCartTempUser(string tempID, int variantID, int quantity)
        {
            using (var ctx = new DataBaseDataContext(
           System.Configuration.ConfigurationManager.ConnectionStrings["DBSportsNETConnectionString"].ConnectionString))
            {
                ctx.DeferredLoadingEnabled = false;


                var cart = (from c in ctx.CARTs where c.TempUserID.Equals(tempID) select c).FirstOrDefault();

                if (cart == null)
                {
                    cart = new CART
                    {
                        TempUserID = tempID,
                        CreatedDate = DateTime.Now,
                    };
                    ctx.CARTs.InsertOnSubmit(cart);
                    ctx.SubmitChanges();
                }
                var cartItem = (from i in ctx.CART_ITEMs
                                where i.VariantID.Equals(variantID) && i.CartID.Equals(cart.CartID)
                                select i).FirstOrDefault();
                if (cartItem == null)
                {
                    cartItem = new CART_ITEM
                    {
                        CartID = cart.CartID,

                        VariantID = variantID,
                        Quantity = quantity,
                    };
                    ctx.CART_ITEMs.InsertOnSubmit(cartItem);
                }

                else
                {
                    cartItem.Quantity += quantity;
                }
                
                ctx.SubmitChanges();
            }
        }

        public List<PRODUCT_TABLE> Category(string category)
        {

            using (var ctx = new DataBaseDataContext(
            System.Configuration.ConfigurationManager.ConnectionStrings["DBSportsNETConnectionString"].ConnectionString))
            {
                ctx.DeferredLoadingEnabled = false;
                ctx.ObjectTrackingEnabled = false;

                var products = (from p in ctx.PRODUCT_TABLEs where p.CATEGORY.Equals(category) select p).ToList();
                return products;
            }

        }

        public decimal getFromPrice(int productId)
        {
            using (var ctx = new DataBaseDataContext(
            System.Configuration.ConfigurationManager.ConnectionStrings["DBSportsNETConnectionString"].ConnectionString))
            {
                ctx.DeferredLoadingEnabled = false;
                ctx.ObjectTrackingEnabled = false;

                var fromPrice = (from v in ctx.PRODUCT_VARIANTs where v.ProductID == productId select v.Price).Min();
                return fromPrice;
            }
        }


        public void RemoveFromCartUser(int UserID, int variantID)
        {
            using (var ctx = new DataBaseDataContext(
            System.Configuration.ConfigurationManager.ConnectionStrings["DBSportsNETConnectionString"].ConnectionString))
            {

                var cart = (from c in ctx.CARTs where c.UserID.Equals(UserID) || c.TempUserID.Equals(UserID) select c).FirstOrDefault();
                if (cart == null)
                {
                    return;
                }

                var item = (from i in ctx.CART_ITEMs where i.VariantID.Equals(variantID) && i.CartID.Equals(cart.CartID) select i).FirstOrDefault();

                if (item != null)
                {
                   
                    ctx.CART_ITEMs.DeleteOnSubmit(item);
                    ctx.SubmitChanges();

                }

            }
        }

        public void RemoveFromCartTemp(string tempID, int variantID)
        {
            using (var ctx = new DataBaseDataContext(
            System.Configuration.ConfigurationManager.ConnectionStrings["DBSportsNETConnectionString"].ConnectionString))
            {

                var cart = (from c in ctx.CARTs where c.TempUserID.Equals(tempID) select c).FirstOrDefault();
                if (cart == null)
                {
                    return;
                }

                var item = (from i in ctx.CART_ITEMs where i.VariantID.Equals(variantID) && i.CartID.Equals(cart.CartID) select i).FirstOrDefault();

                if (item != null)
                {

                    ctx.CART_ITEMs.DeleteOnSubmit(item);
                    ctx.SubmitChanges();

                }

            }
        }

        public void UpdateCartItemQtyUser(int UserID, int variantID, int quantity)
        {
            using (var ctx = new DataBaseDataContext(
            System.Configuration.ConfigurationManager.ConnectionStrings["DBSportsNETConnectionString"].ConnectionString))
            {


                var cart = (from c in ctx.CARTs where c.UserID.Equals(UserID) select c).FirstOrDefault();
                if (cart == null)
                {
                    return;
                }

                var item = (from i in ctx.CART_ITEMs where i.VariantID.Equals(variantID) && i.CartID.Equals(cart.CartID) select i).FirstOrDefault();

                if (item != null)
                {
                    item.Quantity = quantity;
                    ctx.SubmitChanges();
                }
            }
        }

        public void UpdateCartItemQtyTemp(string tempUser, int variantID, int quantity)
        {
            using (var ctx = new DataBaseDataContext(
            System.Configuration.ConfigurationManager.ConnectionStrings["DBSportsNETConnectionString"].ConnectionString))
            {


                var cart = (from c in ctx.CARTs where c.TempUserID.Equals(tempUser)  select c).FirstOrDefault();
                if (cart == null)
                {
                    return;
                }

                var item = (from i in ctx.CART_ITEMs where i.VariantID.Equals(variantID) && i.CartID.Equals(cart.CartID) select i).FirstOrDefault();

                if (item != null)
                {
                    item.Quantity = quantity;
                    ctx.SubmitChanges();
                }
            }
        }

        public List<CATEGORY> showcategories()
        {
            using (var ctx = new DataBaseDataContext(
            System.Configuration.ConfigurationManager.ConnectionStrings["DBSportsNETConnectionString"].ConnectionString))
            {
                ctx.DeferredLoadingEnabled = false;
                ctx.ObjectTrackingEnabled = false;

                var categories = ctx.CATEGORies.ToList();
                return categories;
            }
        }

        public List<PRODUCT_TABLE> showproducts()
        {
            using (var ctx = new DataBaseDataContext(
            System.Configuration.ConfigurationManager.ConnectionStrings["DBSportsNETConnectionString"].ConnectionString))
            {
                ctx.DeferredLoadingEnabled = false;
                ctx.ObjectTrackingEnabled = false;

                var products = (from p in ctx.PRODUCT_TABLEs select p).ToList();//ctx.PRODUCT_TABLEs.Where(p => p.ImageURL ).ToList();
                return products;
            }
        }

        public List<PRODUCT_TABLE> showUnsignedproducts()
        {
            using (var ctx = new DataBaseDataContext(
            System.Configuration.ConfigurationManager.ConnectionStrings["DBSportsNETConnectionString"].ConnectionString))
            {
                ctx.DeferredLoadingEnabled = false;
                ctx.ObjectTrackingEnabled = false;

                var products = (from p in ctx.PRODUCT_TABLEs join pv in ctx.PRODUCT_VARIANTs on p.ProductID equals pv.ProductID where pv.IsSigned == false select p).Distinct().ToList();//ctx.PRODUCT_TABLEs.Where(p => p.ImageURL ).ToList();
                return products;
            }
        }

        public List<PRODUCT_TABLE> showSignedproducts()
        {
            using (var ctx = new DataBaseDataContext(
            System.Configuration.ConfigurationManager.ConnectionStrings["DBSportsNETConnectionString"].ConnectionString))
            {
                ctx.DeferredLoadingEnabled = false;
                ctx.ObjectTrackingEnabled = false;

                var products = (from p in ctx.PRODUCT_TABLEs join pv in ctx.PRODUCT_VARIANTs on p.ProductID equals pv.ProductID where pv.IsSigned.Equals(1) select p).Distinct().ToList();//ctx.PRODUCT_TABLEs.Where(p => p.ImageURL ).ToList();
                return products;
            }
        }



        public PRODUCT_TABLE showproduct()
        {

            using (var ctx = new DataBaseDataContext(
            System.Configuration.ConfigurationManager.ConnectionStrings["DBSportsNETConnectionString"].ConnectionString))
            {
                ctx.DeferredLoadingEnabled = false;
                ctx.ObjectTrackingEnabled = false;

                var product = ctx.PRODUCT_TABLEs.SingleOrDefault();
                return product;
            }
        }

        public List<PRODUCT_TABLE> SortByAtoZ()
        {
            using (var ctx = new DataBaseDataContext(
            System.Configuration.ConfigurationManager.ConnectionStrings["DBSportsNETConnectionString"].ConnectionString))
            {
                ctx.DeferredLoadingEnabled = false;
                ctx.ObjectTrackingEnabled = false;

                var variant = (from p in ctx.PRODUCT_TABLEs where p.PRODUCT_VARIANTs.Any(v => v.IsSigned.Equals(false))  orderby p.ProductName select p).ToList();

                return variant;
            }
        }

        public List<PRODUCT_TABLE> SortByZtoA()
        {
            using (var ctx = new DataBaseDataContext(
            System.Configuration.ConfigurationManager.ConnectionStrings["DBSportsNETConnectionString"].ConnectionString))
            {
                ctx.DeferredLoadingEnabled = false;
                ctx.ObjectTrackingEnabled = false;

                var variant = (from p in ctx.PRODUCT_TABLEs where p.PRODUCT_VARIANTs.Any(v => v.IsSigned.Equals(false))  orderby p.ProductName descending  select p).ToList();

                return variant;
            }
        }

        public List<PRODUCT_VARIANT> getvariant(int productID)
        {
            using (var ctx = new DataBaseDataContext(
            System.Configuration.ConfigurationManager.ConnectionStrings["DBSportsNETConnectionString"].ConnectionString))
            {
                ctx.DeferredLoadingEnabled = false;
                ctx.ObjectTrackingEnabled = false;

                var size = (from p in ctx.PRODUCT_VARIANTs where p.ProductID.Equals(productID) select p).ToList();

                return size;
            }
        }

        public PRODUCT_TABLE getSpecificproduct(int productID)
        {
            using (var ctx = new DataBaseDataContext(
            System.Configuration.ConfigurationManager.ConnectionStrings["DBSportsNETConnectionString"].ConnectionString))
            {
                ctx.DeferredLoadingEnabled = false;
                ctx.ObjectTrackingEnabled = false;

                var product = (from p in ctx.PRODUCT_TABLEs where p.ProductID.Equals(productID) select p).SingleOrDefault();

                return product;
            }
        }

        public int getUserID()
        {
            using (var ctx = new DataBaseDataContext(
            System.Configuration.ConfigurationManager.ConnectionStrings["DBSportsNETConnectionString"].ConnectionString))
            {
                ctx.DeferredLoadingEnabled = false;
                ctx.ObjectTrackingEnabled = false;

                var id = (from p in ctx.USER_TABLEs select p.UserID).SingleOrDefault();

                return id;
            }
        }




        public bool createLoginSession(int userID)
        {
            using (var ctx = new DataBaseDataContext(
           System.Configuration.ConfigurationManager.ConnectionStrings["DBSportsNETConnectionString"].ConnectionString))
            {
                ctx.DeferredLoadingEnabled = false;

                try
                {
                    LOGIN_SESSION session = new LOGIN_SESSION
                    {
                        UserID = userID,
                        Time_In = DateTime.Now,
                        ActiveStatus = true
                    };

                    ctx.LOGIN_SESSIONs.InsertOnSubmit(session);

                    ctx.SubmitChanges();

                    return true;
                }
                catch (Exception ex)
                {
                    ex.GetBaseException();
                    return false;
                }

            }

        }

        public void DoWork()
        {
        }

        public int loginUser(string email, string password, string roleName)
        {

            using (var ctx = new DataBaseDataContext(
          System.Configuration.ConfigurationManager.ConnectionStrings["DBSportsNETConnectionString"].ConnectionString))
            {
                ctx.DeferredLoadingEnabled = false;



                var checkInput = (from m in ctx.USER_TABLEs
                                  join a in ctx.ROLE_TABLEs on m.RoleID equals a.RoleId
                                  where m.UserEmail == email && m.UserPassword == password && a.RoleName == roleName
                                  select m).SingleOrDefault();

                if (checkInput != null)
                {
                    return checkInput.UserID; //return userID for session tracking
                }
                else
                {
                    return -1; //meaning the email,password,role were not found
                }
            }
        }

        public int createBillingAddress(USER_ADDRESS addressTable, int userID)
        {
            using (var ctx = new DataBaseDataContext(
            System.Configuration.ConfigurationManager.ConnectionStrings["DBSportsNETConnectionString"].ConnectionString))
            {
                ctx.DeferredLoadingEnabled = false;

                var newAddress = new USER_ADDRESS
                {
                    Recipient_Name = addressTable.Recipient_Name,
                    Recipient_Surname = addressTable.Recipient_Surname,
                    E_Mail = addressTable.E_Mail,
                    Mobile_Number = addressTable.Mobile_Number,
                    Street_Address = addressTable.Street_Address,
                    Suburb = addressTable.Suburb,
                    Country = addressTable.Country,
                    City = addressTable.City,
                    State_Province = addressTable.State_Province,
                    ZIP_Postal_Code = addressTable.ZIP_Postal_Code,
                    Address_Category = "Billing",
                    UserID = userID,

                };
                ctx.USER_ADDRESSes.InsertOnSubmit(newAddress);
                try
                {
                    ctx.SubmitChanges();
                    return newAddress.User_Address_ID;

                }
                catch (Exception e)
                {
                    e.GetBaseException();
                    return -1; //Error occured
                }

            }
        }

        public int createShippingAddress(USER_ADDRESS shippingaddress, int userID)
        {
            using (var ctx = new DataBaseDataContext(
            System.Configuration.ConfigurationManager.ConnectionStrings["DBSportsNETConnectionString"].ConnectionString))
            {
                ctx.DeferredLoadingEnabled = false;

                var newAddress = new USER_ADDRESS
                {
                    Recipient_Name = shippingaddress.Recipient_Name,
                    Recipient_Surname = shippingaddress.Recipient_Surname,
                    E_Mail = shippingaddress.E_Mail,
                    Mobile_Number = shippingaddress.Mobile_Number,
                    Street_Address = shippingaddress.Street_Address,
                    Suburb = shippingaddress.Suburb,
                    Country = shippingaddress.Country,
                    City = shippingaddress.City,
                    State_Province = shippingaddress.State_Province,
                    ZIP_Postal_Code = shippingaddress.ZIP_Postal_Code,
                    Address_Category = "Shipping",
                    UserID = userID,

                };
                ctx.USER_ADDRESSes.InsertOnSubmit(newAddress);
                try
                {
                    ctx.SubmitChanges();
                    return newAddress.User_Address_ID;

                }
                catch (Exception e)
                {
                    e.GetBaseException();
                    return -1; //Error occurred
                }

            }
        }


        public int registerUser(USER_TABLE utable)
        {
            using (var ctx = new DataBaseDataContext(
          System.Configuration.ConfigurationManager.ConnectionStrings["DBSportsNETConnectionString"].ConnectionString))
            {
                ctx.DeferredLoadingEnabled = false;


                var checkEmail = (from m in ctx.USER_TABLEs where m.UserEmail == utable.UserEmail select m).SingleOrDefault();

                if (checkEmail == null)
                {
                    var customerRole = (from a in ctx.ROLE_TABLEs where a.RoleName == "Customer" select a.RoleId).FirstOrDefault();

                    var newUser = new USER_TABLE
                    {
                        UserEmail = utable.UserEmail,
                        FirstName = utable.FirstName,
                        LastName = utable.LastName,
                        UserPhoneNumber = utable.UserPhoneNumber,
                        UserPassword = utable.UserPassword,
                        RoleID = customerRole
                    };

                    ctx.USER_TABLEs.InsertOnSubmit(newUser);

                    try
                    {
                        ctx.SubmitChanges();
                        return 0;
                    }
                    catch (Exception ex)
                    {
                        ex.GetBaseException();
                        return 1;
                    }

                }
                return 2;
            }
        }

        public List<InvoiceDTO> getInvoices(int userId)
        {
            using (var ctx = new DataBaseDataContext(System.Configuration.ConfigurationManager.ConnectionStrings["DBSportsNETConnectionString"].ConnectionString))
            {
                ctx.DeferredLoadingEnabled = false;



                var invoices = (from i in ctx.INVOICEs
                                join o in ctx.ORDER_TABLEs on i.OrderID equals o.OrderID
                                join od in ctx.ORDER_DETAILs on o.OrderID equals od.OrderID
                                join p in ctx.PAYMENTs on i.InvoiceID equals p.InvoiceID
                                where o.UserID.Equals(userId)
                                orderby i.InvoiceDate descending
                                select new InvoiceDTO
                                {
                                    InvoiceID = i.InvoiceID,
                                    InvoiceDate = i.InvoiceDate,
                                    BillingAddress = getAddress(i.Invoice_Billing_ID),
                                    ShippingAddress = getAddress(i.Invoice_Shipping_ID),
                                    TotalAmount = i.TotalAmount,
                                    PaymentMethod = p.PaymentMethod,
                                    TransactionReference = p.TransactionReference,
                                    Delivery = i.Delivery_Fee ?? 0m,
                                    Status = i.Invoice_Status,
                                    ShippingFee = 0,
                                    Discount = i.Discount ?? 0m,
                                    Items = (from od in ctx.ORDER_DETAILs
                                             join v in ctx.PRODUCT_VARIANTs on od.VariantID equals v.VariantID
                                             join p in ctx.PRODUCT_TABLEs on v.ProductID equals p.ProductID
                                             where od.OrderID == o.OrderID
                                             select new InvoiceItemsDTO
                                             {
                                                 ProductName = p.ProductName,
                                                 Quantity = od.Quantity,
                                                 Total = od.UnitPrice,
                                                 Price = v.Price,
                                             }).ToList()
                                }).ToList();
                return invoices;
            }
        }

        public List<CartItemsDTO> getcartitemsUser(int userID)
        {

            using (var ctx = new DataBaseDataContext(System.Configuration.ConfigurationManager.ConnectionStrings["DBSportsNETConnectionString"].ConnectionString))
            {
                ctx.DeferredLoadingEnabled = false;
                var cart = ctx.CARTs.FirstOrDefault(c => c.UserID == userID);
                if (cart == null)
                {
                    return new List<CartItemsDTO>();
                }
                else
                {
                    var cartitems = (from c in ctx.CART_ITEMs join v in ctx.PRODUCT_VARIANTs on c.VariantID equals v.VariantID join p in ctx.PRODUCT_TABLEs on v.ProductID equals p.ProductID where c.CartID.Equals(cart.CartID)
                                     select new CartItemsDTO
                                     {
                                         ImageURL = p.ImageURL,
                                         ProductName = p.ProductName,
                                         Price = v.Price,
                                         Quantity = c.Quantity,
                                         ProductSize = v.ProductSize,
                                         Colour = v.Colour,
                                         Total = v.Price * c.Quantity,
                                         VariantID = v.VariantID
                                     }).ToList();
                    return cartitems;
                }
            }

        }

        public List<CartItemsDTO> getcartitemsTemp(string TempuserID)
        {

            using (var ctx = new DataBaseDataContext(System.Configuration.ConfigurationManager.ConnectionStrings["DBSportsNETConnectionString"].ConnectionString))
            {
                ctx.DeferredLoadingEnabled = false;
                var cart = ctx.CARTs.FirstOrDefault(c => c.TempUserID == TempuserID);
                if (cart == null)
                {
                    return new List<CartItemsDTO>();
                }
                else
                {
                    var cartitems = (from c in ctx.CART_ITEMs
                                     join v in ctx.PRODUCT_VARIANTs on c.VariantID equals v.VariantID
                                     join p in ctx.PRODUCT_TABLEs on v.ProductID equals p.ProductID
                                     where c.CartID.Equals(cart.CartID)
                                     select new CartItemsDTO
                                     {
                                         ImageURL = p.ImageURL,
                                         ProductName = p.ProductName,
                                         Price = v.Price,
                                         Quantity = c.Quantity,
                                         ProductSize = v.ProductSize,
                                         Colour = v.Colour,
                                         Total = v.Price * c.Quantity,
                                         VariantID = v.VariantID
                                     }).ToList();
                    return cartitems;
                }
            }

        }


        public List<ReviewDTO> getReviews(int userID, int productID)
        {

            using (var ctx = new DataBaseDataContext(System.Configuration.ConfigurationManager.ConnectionStrings["DBSportsNETConnectionString"].ConnectionString))
            {
                ctx.DeferredLoadingEnabled = false;
                var review = (from u in ctx.USER_TABLEs join r in ctx.REVIEWs on u.UserID equals r.UserID join
                              p in ctx.PRODUCT_TABLEs on r.ProductID equals p.ProductID where r.UserID.Equals(userID) && r.ProductID.Equals(productID)
                              select new ReviewDTO
                              {
                                  FirstName = u.FirstName,
                                  LastName = u.LastName,
                                  Comment = r.Comment,
                                  Rating = r.Rating,
                                  ReviewDate = r.ReviewDate

                              }).ToList();
                return review;

            }

        }

        public void combineCarts(int userID, string tempUserID)
        {
            using (var ctx = new DataBaseDataContext(System.Configuration.ConfigurationManager.ConnectionStrings["DBSportsNETConnectionString"].ConnectionString))
            {
                ctx.DeferredLoadingEnabled = false;

                var UserCart = (from p in ctx.CARTs where p.UserID.Equals(userID) select p).FirstOrDefault();
                var TempUserCart = (from p in ctx.CARTs where p.TempUserID.Equals(tempUserID) select p).FirstOrDefault();

                if (TempUserCart == null)
                {
                    return;
                }
                if (UserCart == null)
                {
                    UserCart = new CART
                    {
                        UserID = userID,
                        CreatedDate = DateTime.Now,

                    };
                    ctx.CARTs.InsertOnSubmit(UserCart);
                    ctx.SubmitChanges();
                }

                var tempCartItems = (from p in ctx.CART_ITEMs where p.CartID.Equals(TempUserCart.CartID) select p).ToList();

                foreach (var items in tempCartItems)
                {
                    var ExistsInUserCart = (from e in ctx.CART_ITEMs where e.VariantID.Equals(items.VariantID) && e.CartID.Equals(UserCart.CartID) select e).FirstOrDefault();
                    if (ExistsInUserCart != null)
                    {
                        ExistsInUserCart.Quantity += items.Quantity;
                    }
                    else
                    {
                        var newItem = new CART_ITEM
                        {
                            CartID = UserCart.CartID,
                            VariantID = items.VariantID,
                            Quantity = items.Quantity,
                        };
                        ctx.CART_ITEMs.InsertOnSubmit(newItem);
                    }

                }
                ctx.SubmitChanges();
            }
        }

        public void clearCartTemp(string TempuserID)
        {
            using (var ctx = new DataBaseDataContext(System.Configuration.ConfigurationManager.ConnectionStrings["DBSportsNETConnectionString"].ConnectionString))
            {
                ctx.DeferredLoadingEnabled = false;
                var cart = (from c in ctx.CARTs where c.TempUserID.Equals(TempuserID) select c).FirstOrDefault();
                if (cart == null)
                {
                    return;
                }
                else
                {
                    var cartItems = (from i in ctx.CART_ITEMs where i.CartID.Equals(cart.CartID) select i).ToList();
                    ctx.CART_ITEMs.DeleteAllOnSubmit(cartItems);
                    ctx.CARTs.DeleteOnSubmit(cart);
                    ctx.SubmitChanges();
                }
            }
        }

        public void clearCartUser(int userID)
        {
            using (var ctx = new DataBaseDataContext(System.Configuration.ConfigurationManager.ConnectionStrings["DBSportsNETConnectionString"].ConnectionString))
            {
                ctx.DeferredLoadingEnabled = false;
                var cart = (from c in ctx.CARTs where c.UserID.Equals(userID) select c).FirstOrDefault();
                if (cart == null)
                {
                    return;
                }
                else
                {
                    var cartItems = (from i in ctx.CART_ITEMs where i.CartID.Equals(cart.CartID) select i).ToList();
                    ctx.CART_ITEMs.DeleteAllOnSubmit(cartItems);
                    ctx.CARTs.DeleteOnSubmit(cart);
                    ctx.SubmitChanges();
                }
            }
        }

        public List<PRODUCT_TABLE> SortByCategory(string categoryID)
        {
            using (var ctx = new DataBaseDataContext(System.Configuration.ConfigurationManager.ConnectionStrings["DBSportsNETConnectionString"].ConnectionString))
            {
                ctx.DeferredLoadingEnabled = false;
                var categoryProducts = (from c in ctx.CATEGORies join p in ctx.PRODUCT_TABLEs on c.CategoryID equals p.CategoryID where c.CategoryID.Equals(categoryID) select p).ToList();
                return categoryProducts;

            }

        }

        public List<PRODUCT_TABLE> Search(string word)
        {
            using (var ctx = new DataBaseDataContext(System.Configuration.ConfigurationManager.ConnectionStrings["DBSportsNETConnectionString"].ConnectionString))
            {
                ctx.DeferredLoadingEnabled = false;
                var searchedProducts = (from c in ctx.CATEGORies join p in ctx.PRODUCT_TABLEs on c.CategoryID equals p.CategoryID where p.ProductName.ToLower().Contains(word.ToLower()) || p.ProductName.ToUpper().Contains(word.ToUpper()) || c.CategoryName.ToLower().Contains(word.ToLower()) || c.CategoryName.ToUpper().Contains(word.ToUpper()) select p).ToList();
                return searchedProducts;

            }
        }

        public int getCountUser(int userID)
        {
            using (var ctx = new DataBaseDataContext(System.Configuration.ConfigurationManager.ConnectionStrings["DBSportsNETConnectionString"].ConnectionString))
            {
                ctx.DeferredLoadingEnabled = false;
                var cartID = (from c in ctx.CARTs where c.UserID.Equals(userID) select c).FirstOrDefault();
                int count;
                if (cartID != null)
                {
                    count = (from p in ctx.CART_ITEMs where p.CartID.Equals(cartID.CartID) select p).Count();
                }
                else
                {
                    count = 0;
                }
                return count;


            }
        }

        public int getCountTemp(string tempID)
        {
            using (var ctx = new DataBaseDataContext(System.Configuration.ConfigurationManager.ConnectionStrings["DBSportsNETConnectionString"].ConnectionString))
            {
                ctx.DeferredLoadingEnabled = false;
                var cartID = (from c in ctx.CARTs where c.TempUserID.Equals(tempID) select c).FirstOrDefault();
                int count;
                if (cartID != null)
                {
                    count = (from p in ctx.CART_ITEMs where p.CartID.Equals(cartID.CartID) select p).Count();
                }
                else
                {
                    count = 0;
                }
                return count;


            }
        }

        public decimal getCartItemTotalTemp(string tempUserID)
        {
            using (var ctx = new DataBaseDataContext(System.Configuration.ConfigurationManager.ConnectionStrings["DBSportsNETConnectionString"].ConnectionString))
            {
                ctx.DeferredLoadingEnabled = false;
                var cartitems = getcartitemsTemp(tempUserID);
                decimal total = cartitems.Sum(t => t.Total);
                return Math.Round(total, 3);
            }
        }

        public decimal getCartItemTotalUser(int userID)
        {
            using (var ctx = new DataBaseDataContext(System.Configuration.ConfigurationManager.ConnectionStrings["DBSportsNETConnectionString"].ConnectionString))
            {
                ctx.DeferredLoadingEnabled = false;
                var cartitems = getcartitemsUser(userID);
                decimal total = cartitems.Sum(t => t.Total);
                return Math.Round(total, 3);
            }
        }
        public int getVariantId(int userID, string productSize, string colour)
        {
            using (var ctx = new DataBaseDataContext(
                System.Configuration.ConfigurationManager.ConnectionStrings["DBSportsNETConnectionString"].ConnectionString))
            {
                ctx.DeferredLoadingEnabled = false;


                var cart = ctx.CARTs.FirstOrDefault(c => c.UserID == userID);
                if (cart == null) return 0;


                var variantId = (from c in ctx.CART_ITEMs
                                 join v in ctx.PRODUCT_VARIANTs on c.VariantID equals v.VariantID
                                 where c.CartID == cart.CartID
                                       && v.ProductSize == productSize
                                       && v.Colour == colour
                                 select v.VariantID).FirstOrDefault();

                return variantId;
            }
        }

        public int createOrder(ORDER_TABLE tblorder, int userID, int billingID, int shippingID)
        {
            using (var ctx = new DataBaseDataContext(
            System.Configuration.ConfigurationManager.ConnectionStrings["DBSportsNETConnectionString"].ConnectionString))
            {
                ctx.DeferredLoadingEnabled = false;
                var order = new ORDER_TABLE
                {
                    UserID = userID,
                    OrderDate = DateTime.Now,
                    Billing_ID = billingID,
                    Shipping_ID = shippingID,
                    OrderStatus = "Pending",
                };
                ctx.ORDER_TABLEs.InsertOnSubmit(order);
                ctx.SubmitChanges();
                
                List<CartItemsDTO> cartItems = getcartitemsUser(userID);
                foreach (var i in cartItems)
                {
                        var orderdetails = new ORDER_DETAIL
                        {
                            OrderID = order.OrderID,
                            VariantID = i.VariantID,
                            Quantity = i.Quantity,
                            UnitPrice = i.Total,
                        };
                        ctx.ORDER_DETAILs.InsertOnSubmit(orderdetails);
                }

                try
                {
                    ctx.SubmitChanges();
                    return order.OrderID;
                } catch (Exception e)
                {
                    e.GetBaseException();
                    return -1;
                }


            }
        }

        public void completePayment(int orderID)
        {
            using (var ctx = new DataBaseDataContext(
            System.Configuration.ConfigurationManager.ConnectionStrings["DBSportsNETConnectionString"].ConnectionString))
            {
                ctx.DeferredLoadingEnabled = false;
                var order = (from o in ctx.ORDER_TABLEs where o.OrderID.Equals(orderID) select o).FirstOrDefault();
                if(order != null)
                {
                    order.OrderStatus = "Complete";
                }

                var invoice = (from p in ctx.INVOICEs where p.OrderID.Equals(orderID) select p).FirstOrDefault();
                var payment = (from p in ctx.PAYMENTs where p.InvoiceID.Equals(invoice.InvoiceID) select p).FirstOrDefault();
                if (payment != null)
                {
                    payment.PaymentStatus = "Complete";
                }
                invoice.Invoice_Status = "Complete";

                var orderdetails = (from od in ctx.ORDER_DETAILs where od.OrderID.Equals(order.OrderID) select od).ToList();
                foreach (var item in orderdetails)
                {
                    var variant = (from v in ctx.PRODUCT_VARIANTs where v.VariantID.Equals(item.VariantID) select v).FirstOrDefault();
                    if (variant != null)
                    {
                        variant.StockQuantity -= item.Quantity;
                    }
                }
                clearCartUser(order.UserID);

               
                try
                {
                    ctx.SubmitChanges();

                } catch (Exception e)
                {
                    e.GetBaseException();
                }
            }


        }

        public int getCountSize(string Size)
        {
            using (var ctx = new DataBaseDataContext(
            System.Configuration.ConfigurationManager.ConnectionStrings["DBSportsNETConnectionString"].ConnectionString))
            {
                ctx.DeferredLoadingEnabled = false;
                var size = (from p in ctx.PRODUCT_VARIANTs where p.ProductSize.Equals(Size) select p).Count();
                return size;
            }

        }

        public bool createPayment(int billingID, int shippingID, int orderID, decimal total, string method, int userId)
        {
            using (var ctx = new DataBaseDataContext(
             System.Configuration.ConfigurationManager.ConnectionStrings["DBSportsNETConnectionString"].ConnectionString))
            {
                ctx.DeferredLoadingEnabled = false;
                try
                {
                    var firstOrders = (from p in ctx.ORDER_TABLEs where p.UserID.Equals(userId) orderby p.OrderDate ascending select p).FirstOrDefault();
                    decimal orderTotal = (from o in ctx.ORDER_DETAILs where o.OrderID.Equals(orderID) select o.UnitPrice).Sum();
                    
                    decimal delivery = 80;
                    decimal discount = 0;
                    if (firstOrders != null && orderID.Equals(firstOrders.OrderID))
                    {
                        discount = orderTotal * 0.1m;
                        orderTotal = orderTotal - discount;
                        if(orderTotal >= 1350)
                        {
                            delivery = 0;
                        }
                    }
                    if(orderTotal >= 1350)
                    {
                        delivery = 0;
                    }

                    var invoice = new INVOICE
                    {
                        OrderID = orderID,
                        InvoiceDate = DateTime.Now,
                        TotalAmount = orderTotal + delivery,
                        Invoice_Billing_ID = billingID,
                        Invoice_Shipping_ID = shippingID,
                        Delivery_Fee = delivery,
                        Discount = discount,
                        Invoice_Status = "Unpaid"
                        };
                        ctx.INVOICEs.InsertOnSubmit(invoice);
                        ctx.SubmitChanges();

                        var Payment = new PAYMENT
                        {
                            PaymentDate = DateTime.Now,
                            Amount = orderTotal + delivery,
                            PaymentMethod = method,
                            PaymentStatus = "Pending",
                            TransactionReference = Guid.NewGuid().ToString(),
                            InvoiceID = invoice.InvoiceID,
                        };
                        ctx.PAYMENTs.InsertOnSubmit(Payment);
                        ctx.SubmitChanges();
                    return true;
                }
                catch (Exception e)
                {
                    e.GetBaseException();
                    return false;
                }
            }
        }

        public List<PRODUCT_TABLE> sortByColour(string colour)
        {
           using (var ctx = new DataBaseDataContext(
            System.Configuration.ConfigurationManager.ConnectionStrings["DBSportsNETConnectionString"].ConnectionString))
            {
                ctx.DeferredLoadingEnabled = false;
                var ByColour = (from p in ctx.PRODUCT_TABLEs join v in ctx.PRODUCT_VARIANTs on p.ProductID equals v.ProductID  where v.Colour.Equals(colour) && v.IsSigned==false select p).Distinct().ToList();
                return ByColour;
            }
        }

        public List<PRODUCT_TABLE> FilterByPriceRange(decimal minPrice, decimal maxPrice)
        {
            using (var ctx = new DataBaseDataContext(
                System.Configuration.ConfigurationManager.ConnectionStrings["DBSportsNETConnectionString"].ConnectionString))
            {
                ctx.DeferredLoadingEnabled = false;

                var products = (from p in ctx.PRODUCT_TABLEs where (from v in ctx.PRODUCT_VARIANTs where v.ProductID == p.ProductID && v.IsSigned == false  select v.Price).Min() >= minPrice && (from v in ctx.PRODUCT_VARIANTs
                                      where v.ProductID == p.ProductID && v.IsSigned == false select v.Price).Min() <= maxPrice orderby (from v in ctx.PRODUCT_VARIANTs
                                      where v.ProductID == p.ProductID && v.IsSigned == false select v.Price).Min() ascending select p).ToList();
                return products;
            }
        }     

        public string getAddress(int addressId)
        {
            using (var ctx = new DataBaseDataContext(
            System.Configuration.ConfigurationManager.ConnectionStrings["DBSportsNETConnectionString"].ConnectionString))
            {
                ctx.DeferredLoadingEnabled = false;
                var address = (from u in ctx.USER_ADDRESSes where u.User_Address_ID.Equals(addressId) select u).SingleOrDefault();
                return address.Street_Address + " "  + address.Suburb + " " + address.City + " " + address.State_Province + " " + address.ZIP_Postal_Code;
            }
        }

        public void deleteTempUser(int TempId)
        {
            using (var ctx = new DataBaseDataContext(
            System.Configuration.ConfigurationManager.ConnectionStrings["DBSportsNETConnectionString"].ConnectionString))
            {
                ctx.DeferredLoadingEnabled = false;
                var userToDelete = (from t in ctx.CARTs where t.TempUserID.Equals(TempId) select t).SingleOrDefault();
                if(userToDelete !=null)
                {
                    ctx.CARTs.DeleteOnSubmit(userToDelete);
                }
            }
        }

        public bool isFirstOrder(int userId)
        {
            using (var ctx = new DataBaseDataContext(
            System.Configuration.ConfigurationManager.ConnectionStrings["DBSportsNETConnectionString"].ConnectionString))
            {
                ctx.DeferredLoadingEnabled = false;
                var firstOrder = (from v in ctx.ORDER_TABLEs where v.UserID.Equals(userId) orderby v.OrderDate ascending select v).FirstOrDefault();
                if(firstOrder !=null)
                {
                    return false;
                }
                return true;
            }
        }

        public decimal getInvoiceTotal(int orderID)
        {
            using (var ctx = new DataBaseDataContext(
            System.Configuration.ConfigurationManager.ConnectionStrings["DBSportsNETConnectionString"].ConnectionString))
            {
                ctx.DeferredLoadingEnabled = false;
                var total = (from i in ctx.INVOICEs where i.OrderID.Equals(orderID) select i).SingleOrDefault();
                return total.TotalAmount;
            }
        }

        public List<ReviewDTO> showReviews(int productID)
        {
            using (var ctx = new DataBaseDataContext(
            System.Configuration.ConfigurationManager.ConnectionStrings["DBSportsNETConnectionString"].ConnectionString))
            {
                ctx.DeferredLoadingEnabled = false;
                var reviews = (from r in ctx.REVIEWs join u in ctx.USER_TABLEs on r.UserID equals u.UserID where r.ProductID.Equals(productID) 
                               select new ReviewDTO
                {
                    Rating = r.Rating,
                    ReviewDate = r.ReviewDate,
                    Comment = r.Comment,
                    FirstName = u.FirstName,
                    LastName = u.LastName,

                }).ToList();
                return reviews;
            }
        }

        public bool addReview(REVIEW tblreview, int userID, int productid)
        {
            using (var ctx = new DataBaseDataContext(
           System.Configuration.ConfigurationManager.ConnectionStrings["DBSportsNETConnectionString"].ConnectionString))
            {
                ctx.DeferredLoadingEnabled = false;
                var addReview = new REVIEW
                {
                    UserID = userID,
                    ProductID = productid,
                    Rating = tblreview.Rating,
                    Comment = tblreview.Comment,
                    ReviewDate = tblreview.ReviewDate,
                };
                ctx.REVIEWs.InsertOnSubmit(addReview);
                try
                {
                    ctx.SubmitChanges();
                    return true;

                }
                catch(Exception e)
                {
                    e.GetBaseException();
                    return false;
                }
            }
        }

        public bool AddProduct(string name, string description, string brand, int categoryId, int supplierId, string imageUrl, string shirtHistory,
                       string colour, bool isSigned, decimal price, int stockQuantityPerSize)
        {
            using (var ctx = new DataBaseDataContext(
            System.Configuration.ConfigurationManager.ConnectionStrings["DBSportsNETConnectionString"].ConnectionString))
            {
                ctx.DeferredLoadingEnabled = false;
                try
                {
                    var checkProduct = (from p in ctx.PRODUCT_TABLEs where p.ProductName.ToLower() == name.ToLower() select p).FirstOrDefault();

                    if (checkProduct != null)
                    {
                        return false;
                    }

                    PRODUCT_TABLE newProduct = new PRODUCT_TABLE
                    {
                        ProductName = name,
                        ProductDescription = description,
                        Brand = brand,
                        CategoryID = categoryId,
                        SupplierID = supplierId,
                        ImageURL = imageUrl,
                        ShirtHistory = shirtHistory
                    };

                    ctx.PRODUCT_TABLEs.InsertOnSubmit(newProduct);
                    ctx.SubmitChanges();

                    string[] sizes = { "SMALL", "MEDIUM", "LARGE", "XLARGE", "XXLARGE" };

                    foreach (string size in sizes)
                    {
                        PRODUCT_VARIANT Variant = new PRODUCT_VARIANT
                        {
                            ProductID = newProduct.ProductID,
                            ProductSize = size,
                            Colour = colour,
                            IsSigned = isSigned,
                            Price = price,
                            StockQuantity = stockQuantityPerSize
                        };

                        ctx.PRODUCT_VARIANTs.InsertOnSubmit(Variant);
                    }
                    ctx.SubmitChanges();
                    return true;
                }
                catch (Exception)
                {
                    return false;
                }







            }
        }

        public bool UpdateProduct(int productId, string name, string description, string brand, int categoryId, int supplierId, string imageUrl, string shirtHistory)
        {
            using (var ctx = new DataBaseDataContext(
            System.Configuration.ConfigurationManager.ConnectionStrings["DBSportsNETConnectionString"].ConnectionString))
            {
                try
                {
                    var checkProduct = (from p in ctx.PRODUCT_TABLEs where p.ProductID == productId select p).SingleOrDefault();

                    if (checkProduct != null)
                    {
                        checkProduct.ProductName = name;
                        checkProduct.ProductDescription = description;
                        checkProduct.Brand = brand;
                        checkProduct.CategoryID = categoryId;
                        checkProduct.SupplierID = supplierId;
                        checkProduct.ImageURL = imageUrl;
                        checkProduct.ShirtHistory = shirtHistory;
                        ctx.SubmitChanges();
                        return true;
                    }
                    return false;
                }
                catch (Exception)
                {
                    return false;
                }
            }
        }

        public bool DeleteProduct(int productId)
        {
            using (var ctx = new DataBaseDataContext(
            System.Configuration.ConfigurationManager.ConnectionStrings["DBSportsNETConnectionString"].ConnectionString))
            {
                try
                {
                    var checkProduct = (from p in ctx.PRODUCT_TABLEs where p.ProductID == productId select p).SingleOrDefault();

                    if (checkProduct != null)
                    {

                        var variants = (from v in ctx.PRODUCT_VARIANTs where v.ProductID == productId select v).ToList();
                        if (variants.Count > 0)
                        {
                            ctx.PRODUCT_VARIANTs.DeleteAllOnSubmit(variants);
                        }
                        ctx.PRODUCT_TABLEs.DeleteOnSubmit(checkProduct);
                        ctx.SubmitChanges();
                        return true;
                    }
                    return false;
                }
                catch (Exception)
                {
                    return false;
                }
            }
        }

        public List<SUPPLIER> getSuppliers()
        {
            using (var ctx = new DataBaseDataContext(
            System.Configuration.ConfigurationManager.ConnectionStrings["DBSportsNETConnectionString"].ConnectionString))
            {
                try
                {
                    ctx.DeferredLoadingEnabled = false;
                    ctx.ObjectTrackingEnabled = false;
                    return ctx.SUPPLIERs.ToList();
                }
                catch (Exception)
                {
                    return new List<SUPPLIER>();
                }
            }
        }

        public bool updateProductVariant(int productID, decimal price, string colour, bool isSigned)
        {
            using (var ctx = new DataBaseDataContext(
           System.Configuration.ConfigurationManager.ConnectionStrings["DBSportsNETConnectionString"].ConnectionString))
            {
                try
                {
                    var variants = (from v in ctx.PRODUCT_VARIANTs where v.ProductID == productID select v).ToList();

                    if (variants.Count > 0)
                    {
                        foreach (var variant in variants)
                        {
                            variant.Price = price;
                            variant.Colour = colour;
                            variant.IsSigned = isSigned;
                        }
                        ctx.SubmitChanges();
                        return true;
                    }
                    return false;
                }
                catch (Exception)
                {
                    return false;
                }

            }
        }

        public bool updateStockQuantity(int variantID, int newQuantity)
        {
            using (var ctx = new DataBaseDataContext(
           System.Configuration.ConfigurationManager.ConnectionStrings["DBSportsNETConnectionString"].ConnectionString))
            {
                try
                {
                    var checkVariant = (from v in ctx.PRODUCT_VARIANTs where v.VariantID == variantID select v).SingleOrDefault();

                    if (checkVariant != null)
                    {
                        checkVariant.StockQuantity = newQuantity;
                        ctx.SubmitChanges();
                        return true;
                    }
                    return false;
                }
                catch (Exception)
                {
                    return false;
                }
            }
        }

        public List<SalesDTO> getSales(string fromDate, string toDate)
        {
            DateTime start = DateTime.Parse(fromDate).Date;
            DateTime end = DateTime.Parse(toDate).Date.AddDays(1);

            using (var ctx = new DataBaseDataContext(
            System.Configuration.ConfigurationManager.ConnectionStrings["DBSportsNETConnectionString"].ConnectionString))
            {
                var sales = (from p in ctx.PAYMENTs
                             join i in ctx.INVOICEs
                                 on p.InvoiceID equals i.InvoiceID
                             join o in ctx.ORDER_TABLEs
                                 on i.OrderID equals o.OrderID
                             join od in ctx.ORDER_DETAILs
                                 on o.OrderID equals od.OrderID
                             join v in ctx.PRODUCT_VARIANTs
                                 on od.VariantID equals v.VariantID
                             join pro in ctx.PRODUCT_TABLEs
                                 on v.ProductID equals pro.ProductID
                             where p.PaymentDate >= start
                                && p.PaymentDate < end
                             select new SalesDTO
                             {
                                 ProductName = pro.ProductName,
                                 Quantity = od.Quantity,
                                 UnitPrice = v.Price,
                                 Sales = od.Quantity * v.Price,
                                 OrderDate = o.OrderDate
                             }).ToList();

                foreach (var sale in sales)
                {
                    sale.Sales = Math.Round(sale.Sales, 2);
                }

                return sales;
            }
        }

        public List<OrderDTO> getOrders(string fromDate, string toDate)
        {
            DateTime start = DateTime.Parse(fromDate).Date;
            DateTime end = DateTime.Parse(toDate).Date.AddDays(1);

            using (var ctx = new DataBaseDataContext(
                System.Configuration.ConfigurationManager
                .ConnectionStrings["DBSportsNETConnectionString"]
                .ConnectionString))
            {
                var orders = (from o in ctx.ORDER_TABLEs
                              join u in ctx.USER_TABLEs
                              on o.UserID equals u.UserID
                              where o.OrderDate >= start && o.OrderDate < end
                              select new OrderDTO
                              {
                                  OrderID = o.OrderID,
                                  Username = u.FirstName + " " + u.LastName,
                                  OrderDate = o.OrderDate,
                                  OrderStatus = o.OrderStatus
                              }).ToList();

                return orders;
            }
        }
        public List<CustomersDTO> getCustomersReport(string fromDate, string toDate)
        {
            DateTime start = DateTime.Parse(fromDate).Date;
            DateTime end = DateTime.Parse(toDate).Date.AddDays(1);

            using (var ctx = new DataBaseDataContext(
                System.Configuration.ConfigurationManager
                .ConnectionStrings["DBSportsNETConnectionString"]
                .ConnectionString))
            {
                var customers = (from u in ctx.USER_TABLEs
                                 join s in ctx.LOGIN_SESSIONs
                                 on u.UserID equals s.UserID
                                 join r in ctx.ROLE_TABLEs
                                 on u.RoleID equals r.RoleId
                                 where r.RoleName == "Customer"
                                 && s.Time_In >= start
                                 && s.Time_In < end
                                 select new CustomersDTO
                                 {
                                     LoggedIn = s.Time_In,
                                     Logged_Out = s.Time_Out,
                                     UserName = u.FirstName + " " + u.LastName,
                                     Email = u.UserEmail
                                 }).ToList();

                int total = customers.Count;

                foreach (var customer in customers)
                {
                    customer.Total = total;
                }

                return customers;
            }
        }
        public List<OrderDTO> FilterOrders(string status)
        {
            using (var ctx = new DataBaseDataContext(
                System.Configuration.ConfigurationManager
                .ConnectionStrings["DBSportsNETConnectionString"].ConnectionString))
            {
                var orders = from o in ctx.ORDER_TABLEs
                             join u in ctx.USER_TABLEs
                             on o.UserID equals u.UserID
                             where o.OrderStatus == status
                             select new OrderDTO
                             {
                                 OrderID = o.OrderID,
                                 Username = u.FirstName + " " + u.LastName,
                                 OrderDate = o.OrderDate,
                                 OrderStatus = o.OrderStatus
                             };

                return orders.ToList();
            }
        }
        public List<OrderDTO> getAllOrders()
        {
            using (var ctx = new DataBaseDataContext(
                System.Configuration.ConfigurationManager
                .ConnectionStrings["DBSportsNETConnectionString"].ConnectionString))
            {
                var orders = (from o in ctx.ORDER_TABLEs
                              join u in ctx.USER_TABLEs
                              on o.UserID equals u.UserID
                              select new OrderDTO
                              {
                                  OrderID = o.OrderID,
                                  Username = u.FirstName + " " + u.LastName,
                                  OrderDate = o.OrderDate,
                                  OrderStatus = o.OrderStatus
                              }).ToList();

                return orders;
            }
        }
        public bool UpdateOrderStatus(int orderID, string status)
        {
            using (var ctx = new DataBaseDataContext(
                System.Configuration.ConfigurationManager
                .ConnectionStrings["DBSportsNETConnectionString"].ConnectionString))
            {
                var toUpdate = (from u in ctx.ORDER_TABLEs where u.OrderID == orderID select u).SingleOrDefault();

                if (toUpdate != null)
                {
                    try
                    {
                        toUpdate.OrderStatus = status;
                        ctx.SubmitChanges();
                        return true;
                    }
                    catch
                    {
                        return false;
                    }
                }
                else
                {
                    return false;
                }
            }
        }
    }
}


