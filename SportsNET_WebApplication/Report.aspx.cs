using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SportsNET_WebApplication.ServiceReference1;


namespace SportsNET_WebApplication
{
    public partial class Report : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnGenerate_Click(object sender, EventArgs e)
        {
            Session["ReportType"] = ddlReportType.SelectedValue;
            Session["FromDate"] = txtFromWhen.Text;
            Session["ToDate"] = txtToWhen.Text;

            switch (ddlReportType.SelectedValue)
            {
                case "Sales":
                   
                    Response.Redirect("Sales.aspx");
                    
                    break;

                case "Orders":
                    
                    Response.Redirect("Orders_report.aspx");

                    break;

                case "Customers":
                    
                    Response.Redirect("Customers_report.aspx");
                    break;
                
            }
        }
    }
}