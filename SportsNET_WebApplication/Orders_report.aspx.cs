using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SportsNET_WebApplication.ServiceReference1;
using System.Web.Script.Serialization;
using iText.Kernel.Pdf;
using iText.Layout;
using iText.Layout.Element;
using System.IO;
using iText.Kernel.Font;
using iText.IO.Font.Constants;
using iText.Kernel.Colors;

namespace SportsNET_WebApplication
{

    public partial class Orders_report : System.Web.UI.Page
    {
        protected string datesJson;
        protected string numJson;
        protected string statusJson;
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

                var orders = client.getOrders(fromDate, toDate);

                JavaScriptSerializer serializer = new JavaScriptSerializer();

                // Number of orders received per day
                var ordersPerDate = orders
                    .GroupBy(o => o.OrderDate.Date)
                    .Select(g => new
                    {
                        Date = g.Key,
                        NumberOfOrders = g.Count()
                    })
                    .OrderBy(x => x.Date)
                    .ToList();

                datesJson = serializer.Serialize(
                    ordersPerDate
                    .Select(o => o.Date.ToString("yyyy-MM-dd"))
                    .ToList());

                numJson = serializer.Serialize(
                    ordersPerDate
                    .Select(o => o.NumberOfOrders)
                    .ToList());

                statusJson = serializer.Serialize(orders.Select(u => u.OrderStatus));

                rptOrders.DataSource = orders;
                rptOrders.DataBind();
            }
        }

        private void GeneratePDF(List<OrderDTO> orders)
        {
            // PDF logic
            using (MemoryStream stream = new MemoryStream())
            {
                iText.Kernel.Pdf.PdfWriter writer = new iText.Kernel.Pdf.PdfWriter(stream);
                iText.Kernel.Pdf.PdfDocument pdf = new iText.Kernel.Pdf.PdfDocument(writer);
                Document document = new Document(pdf);

                PdfFont boldFont = PdfFontFactory.CreateFont(StandardFonts.HELVETICA_BOLD);

                DeviceRgb sportsGreen = new DeviceRgb(46, 125, 50);
                DeviceRgb lightGreen = new DeviceRgb(232, 245, 233);
                DeviceRgb white = new DeviceRgb(255, 255, 255);

                Paragraph title = new Paragraph("SPORTSNET ORDERS REPORT")
                 .SetTextAlignment(iText.Layout.Properties.TextAlignment.CENTER)
                 .SetFontSize(20)
                 .SetFont(boldFont)
                 .SetFontColor(sportsGreen);

                document.Add(title);

                document.Add(new Paragraph("____________________________________________")
                    .SetTextAlignment(iText.Layout.Properties.TextAlignment.CENTER));

                Paragraph reportPeriod = new Paragraph("Report Period")
                .SetFontSize(12)
                .SetFont(boldFont);

                document.Add(reportPeriod);

                document.Add(new Paragraph(fromDate + "          ->           " + toDate));

                Paragraph totalOrders = new Paragraph("Total Orders")
                .SetFontSize(12)
                .SetFont(boldFont);

                document.Add(totalOrders);

                document.Add(new Paragraph(""+ orders.Count())
                    .SetFontSize(16)
                    .SetFont(boldFont));

                iText.Layout.Element.Table table =
                new iText.Layout.Element.Table(new float[] { 2, 2, 2, 2 });

                table.AddHeaderCell(
                new Cell().Add(new Paragraph("Order ID")
                .SetFont(boldFont)
                .SetFontColor(white))
                .SetBackgroundColor(sportsGreen));

                table.AddHeaderCell(
                    new Cell().Add(new Paragraph("Customer")
                    .SetFont(boldFont)
                    .SetFontColor(white))
                    .SetBackgroundColor(sportsGreen));

                table.AddHeaderCell(
                    new Cell().Add(new Paragraph("Order Date")
                    .SetFont(boldFont)
                    .SetFontColor(white))
                    .SetBackgroundColor(sportsGreen));

                table.AddHeaderCell(
                    new Cell().Add(new Paragraph("Status")
                    .SetFont(boldFont)
                    .SetFontColor(white))
                    .SetBackgroundColor(sportsGreen));

                foreach (var s in orders)
                {
                    table.AddCell(s.OrderID.ToString());
                    table.AddCell(s.Username.ToString());
                    table.AddCell(s.OrderDate.ToString("yyyy/MM/dd"));
                    table.AddCell(s.OrderStatus.ToString());
                }

                document.Add(table);

                document.Close();

                Response.Clear();
                Response.ContentType = "application/pdf";
                Response.AddHeader(
                    "Content-Disposition",
                    "attachment; filename=SportsNET_Orders_Report.pdf"
                );

                Response.BinaryWrite(stream.ToArray());
                Response.End();
            }
        }

        protected void btnDownload_Click(object sender, EventArgs e)
        {
            Service1Client client = new Service1Client();

            fromDate = Session["FromDate"].ToString();
            toDate = Session["ToDate"].ToString();

            var orders = client.getOrders(fromDate, toDate).ToList();

            GeneratePDF(orders);
        }
    }
}