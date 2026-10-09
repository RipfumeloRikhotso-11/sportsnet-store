using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;

namespace Sportsnet_Service
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the interface name "IService1" in both code and config file together.
   [DataContract]
    public class CartItemsDTO
    {
        [DataMember]public string ImageURL { get; set; }
        [DataMember] public string ProductName { get; set; }
        [DataMember] public decimal Price { get; set; }
        [DataMember] public int Quantity { get; set; }
        [DataMember] public string ProductSize { get; set; }
        [DataMember] public string Colour { get; set; }
        [DataMember] public decimal Total { get; set; }
        [DataMember] public int VariantID { get; set; }
        [DataMember] public decimal DeliveryFee { get; set; }
    }

    public class InvoiceDTO
    {
        [DataMember] public int InvoiceID { get; set; }
        [DataMember] public DateTime InvoiceDate { get; set; }
        [DataMember] public string BillingAddress { get; set; }
        [DataMember] public string ShippingAddress { get; set; }
        [DataMember] public decimal TotalAmount { get; set; }
        [DataMember] public string PaymentMethod { get; set; }
        [DataMember] public string TransactionReference { get; set; }
        [DataMember] public decimal Discount { get; set; }
        [DataMember] public decimal Delivery { get; set; }
        [DataMember] public decimal ShippingFee { get; set; }
        [DataMember] public string Status { get; set; }
        [DataMember] public List<InvoiceItemsDTO> Items { get; set; }
        
    }

    public class InvoiceItemsDTO
    {
        [DataMember] public string ProductName { get; set; }
        [DataMember] public int Quantity { get; set; }
        [DataMember] public decimal Price { get; set; }
        [DataMember] public decimal Total { get; set; }
        public decimal UnitPrice { get; internal set; }
    }



    public class ReviewDTO
    {
        [DataMember] public string FirstName { get; set; }
        [DataMember] public string LastName { get; set; }
        [DataMember] public string Comment { get; set; }
        [DataMember] public int Rating { get; set; }
        [DataMember] public DateTime ReviewDate { get; set; }
    }

    public class SalesDTO
    {
        [DataMember] public string ProductName { get; set; }
        [DataMember] public int Quantity { get; set; }
        [DataMember] public decimal UnitPrice { get; set; }
        [DataMember] public decimal Sales { get; set; }
        [DataMember] public DateTime OrderDate { get; set; }
    }

    public class OrderDTO
    {
        [DataMember]
        public int OrderID { get; set; }

        [DataMember]
        public string Username { get; set; }

        [DataMember]
        public DateTime OrderDate { get; set; }

        [DataMember]
        public string OrderStatus { get; set; }

    }
    public class CustomersDTO
    {
        [DataMember]
        public int Total { get; set; }
        [DataMember]
        public DateTime LoggedIn { get; set; }
        [DataMember]
        public DateTime? Logged_Out { get; set; }
        [DataMember]
        public string UserName { get; set; }
        [DataMember]
        public String Email { get; set; }
    }

    [ServiceContract]
    public interface IService1
    {
        [OperationContract]
        public List<PRODUCT_TABLE> showproducts();

        [OperationContract]
        public bool addReview(REVIEW tblreview, int userID, int productid);

        [OperationContract]
        public decimal getInvoiceTotal(int orderID);

        [OperationContract]
        public List<ReviewDTO> showReviews(int productID);

        [OperationContract]
        public bool isFirstOrder(int userId);


        [OperationContract]
        public List<InvoiceDTO> getInvoices(int userId);

        [OperationContract]
        public int getCountSize(string Size);

        [OperationContract]
        public List<ReviewDTO> getReviews(int userID, int productID);

        [OperationContract]
        public List<PRODUCT_TABLE> showUnsignedproducts();

        [OperationContract]
        public List<PRODUCT_TABLE> showSignedproducts();

        [OperationContract]
        public int createBillingAddress(USER_ADDRESS addressTable, int userID);

        [OperationContract]
        public bool createPayment(int billingID, int shippingID, int orderID, decimal total, string method, int userId);

        [OperationContract]
        public void completePayment(int orderID);

        [OperationContract]
        public int createShippingAddress(USER_ADDRESS shippingaddress, int userID);

        [OperationContract]
        public int createOrder(ORDER_TABLE tblorder, int userID, int billingID, int shippingID);

        [OperationContract]
        public decimal getCartItemTotalTemp(string tempUserID);
        [OperationContract]
        public decimal getCartItemTotalUser(int userID);

        [OperationContract]
        public void combineCarts(int userID, string tempUserID);

        [OperationContract]
        public void clearCartTemp(string TempuserID);

        [OperationContract]
        public void clearCartUser(int userID);

        [OperationContract]
        public void UpdateCartItemQtyUser(int UserID, int variantID, int quantity);

        [OperationContract]
        public void UpdateCartItemQtyTemp(string tempUser, int variantID, int quantity);

        [OperationContract]
        public int getVariantId(int userID, string productSize, string colour);

        [OperationContract]
        public int getUserID();

        [OperationContract]
        public int getCountTemp(string tempID);

        [OperationContract]
        public int getCountUser(int userID);

        [OperationContract]
        public List<CATEGORY> showcategories();

        [OperationContract]
        public List<PRODUCT_TABLE> sortByColour(string colour);

        [OperationContract]
        public List<PRODUCT_TABLE> FilterByPriceRange(decimal minPrice, decimal maxPrice);

        [OperationContract]
        public List<PRODUCT_TABLE> Category(string category);

        [OperationContract]
        public List<PRODUCT_TABLE> SortByAtoZ();

       /* [OperationContract]
        public PRODUCT_VARIANT PriceByChosenProduct(int productID, string color, string size);*/

        [OperationContract]
        public List<PRODUCT_TABLE> SortByZtoA();

        [OperationContract]
        public List<PRODUCT_TABLE> SortByCategory(string categoryID);


        [OperationContract]
        public string getAddress(int addressId);

        [OperationContract]
        public List<PRODUCT_TABLE> Search(string word);

        [OperationContract]
        public void AddToCartLoggedIn(int UserID, int variantID, int quantity);

        [OperationContract]
        public void AddToCartTempUser(string tempID, int variantID, int quantity);

        [OperationContract]
        public void RemoveFromCartUser(int UserID, int variantID);

        [OperationContract]
        public void RemoveFromCartTemp(string tempID, int variantID);

        [OperationContract]
        public decimal getFromPrice(int productId);

        [OperationContract]
        public PRODUCT_TABLE showproduct();

        [OperationContract]
        public PRODUCT_TABLE getSpecificproduct(int productID);

        [OperationContract]
        public List<PRODUCT_VARIANT> getvariant(int productID);

        [OperationContract]
        public List<CartItemsDTO> getcartitemsUser(int userID);

        [OperationContract]
        public List<CartItemsDTO> getcartitemsTemp(string TempuserID);

        [OperationContract]
        public int registerUser(USER_TABLE utable);

        [OperationContract]
        public int loginUser(string email, string password, string roleName);

        [OperationContract]
        public bool createLoginSession(int userID);

        [OperationContract]
        public bool AddProduct(string name, string description, string brand, int categoryId, int supplierId, string imageUrl, string shirtHistory,
                               string colour, bool isSigned, decimal price, int stockQuantityPerSize);

        [OperationContract]

        public bool UpdateProduct(int productId, string name, string description, string brand, int categoryId, int supplierId, string imageUrl, string shirtHistory);

        [OperationContract]
        public bool DeleteProduct(int productId);

        [OperationContract]

        public List<SUPPLIER> getSuppliers();

        [OperationContract]
        public bool updateProductVariant(int productID, decimal price, string colour, bool isSigned);

        [OperationContract]
        public bool updateStockQuantity(int variantID, int newQuantity);
        [OperationContract]
        public List<SalesDTO> getSales(string fromDate, string toDate);

        [OperationContract]
        public List<OrderDTO> getOrders(string fromDate, string toDate);

        [OperationContract]
        public List<CustomersDTO> getCustomersReport(string fromDate, string toDate);
        [OperationContract]
        public bool UpdateOrderStatus(int orderID, string status);

        [OperationContract]
        public List<OrderDTO> FilterOrders(string status);
        [OperationContract]
        public List<OrderDTO> getAllOrders();

        


    }


}
