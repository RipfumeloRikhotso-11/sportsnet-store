using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SportsNET_WebApplication.ServiceReference1;
using System.Web.Script.Serialization;

namespace SportsNET_WebApplication
{
    public partial class Customers_report : System.Web.UI.Page
    {
        protected string numLoggedJson;
        protected string loggedJson;
        public string fromDate { get; set; }
        public string toDate { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Service1Client client = new Service1Client();
                string reportType = Session["ReportType"].ToString();
                fromDate = Session["FromDate"].ToString();
                toDate = Session["ToDate"].ToString();
                var customers = client.getCustomersReport(fromDate, toDate);
                rptCustomers.DataSource = customers;
                rptCustomers.DataBind();

                lblUsers.Text = customers.Count() + "  customers";
                JavaScriptSerializer serializer = new JavaScriptSerializer();

                var loginsPerDate = customers
                   .GroupBy(c => c.LoggedIn.Date)
                   .Select(g => new
                   {
                       Date = g.Key,
                       NumberOfLogins = g.Count()
                   })
                   .OrderBy(x => x.Date)
                   .ToList();

                loggedJson = serializer.Serialize(
                    loginsPerDate.Select(c => c.Date.ToString("yyyy-MM-dd")).ToList());

                numLoggedJson = serializer.Serialize(
                    loginsPerDate.Select(c => c.NumberOfLogins).ToList());
            }
        }
    }
}