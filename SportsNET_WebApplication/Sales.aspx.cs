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
    public partial class Sales : System.Web.UI.Page
    {
        protected string ProductNamesJson;
        protected string QuantitiesJson;
        protected string datesJson;
        protected string salesJson;
        public string fromDate { get; set; }
        public string toDate { get; set; }
        public string revenue { get; set; }
        private List<SalesDTO> sales;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Service1Client client = new Service1Client();
                string reportType = Session["ReportType"].ToString();
                fromDate = Session["FromDate"].ToString();
                toDate = Session["ToDate"].ToString();
                var sales = client.getSales(fromDate, toDate);
                rptSales.DataSource = sales;
                rptSales.DataBind();
                
                decimal totalRevenue = sales.Sum(s => s.Sales);
                lblRevenue.Text = "R" + totalRevenue.ToString("F2");
                revenue = totalRevenue.ToString("F2");

                JavaScriptSerializer serializer = new JavaScriptSerializer();

                ProductNamesJson = serializer.Serialize(
                    sales.Select(s => s.ProductName).ToList());

                QuantitiesJson = serializer.Serialize(
                    sales.Select(s => s.Quantity).ToList());

                datesJson = serializer.Serialize(
                sales.Select(d => d.OrderDate.ToString("yyyy/MM/dd")).ToList());

                salesJson = serializer.Serialize(
                    sales.Select(d => d.Sales).ToList());
            }
        }
        private void GeneratePDF(List<SalesDTO> sales)
        {
            // PDF logic
            using (MemoryStream stream = new MemoryStream())
            {
                iText.Kernel.Pdf.PdfWriter writer = new iText.Kernel.Pdf.PdfWriter(stream);
                iText.Kernel.Pdf.PdfDocument pdf = new iText.Kernel.Pdf.PdfDocument(writer);
                Document document = new Document(pdf);

                PdfFont boldFont = PdfFontFactory.CreateFont(StandardFonts.HELVETICA_BOLD);

                Paragraph title = new Paragraph("SPORTSNET SALES REPORT")
                    .SetTextAlignment(iText.Layout.Properties.TextAlignment.CENTER)
                    .SetFontSize(20)
                    .SetFont(boldFont)
                    .SetFontColor(ColorConstants.GREEN);

                document.Add(title);

                document.Add(new Paragraph("____________________________________________")
                    .SetTextAlignment(iText.Layout.Properties.TextAlignment.CENTER)
                    .SetFontColor(ColorConstants.GREEN));

                Paragraph reportPeriod = new Paragraph("Report Period")
                    .SetFontSize(12)
                    .SetFont(boldFont);

                document.Add(reportPeriod);

                document.Add(new Paragraph(
                    fromDate + "          ->           " + toDate));

                Paragraph totalRevenue = new Paragraph("Total Revenue")
                    .SetFontSize(12)
                    .SetFont(boldFont);

                document.Add(totalRevenue);

                document.Add(new Paragraph("R" + revenue)
                    .SetFontSize(16)
                    .SetFont(boldFont)
                    .SetFontColor(ColorConstants.GREEN));

                iText.Layout.Element.Table table =
                    new iText.Layout.Element.Table(new float[] { 2, 1, 1, 1, 2 });

                // Table headers
                table.AddHeaderCell(
                    new Cell()
                        .Add(new Paragraph("Product")
                        .SetFont(boldFont)
                        .SetFontColor(ColorConstants.WHITE))
                        .SetBackgroundColor(ColorConstants.GREEN));

                table.AddHeaderCell(
                    new Cell()
                        .Add(new Paragraph("Quantity")
                        .SetFont(boldFont)
                        .SetFontColor(ColorConstants.WHITE))
                        .SetBackgroundColor(ColorConstants.GREEN));

                table.AddHeaderCell(
                    new Cell()
                        .Add(new Paragraph("Unit Price")
                        .SetFont(boldFont)
                        .SetFontColor(ColorConstants.WHITE))
                        .SetBackgroundColor(ColorConstants.GREEN));

                table.AddHeaderCell(
                    new Cell()
                        .Add(new Paragraph("Sales")
                        .SetFont(boldFont)
                        .SetFontColor(ColorConstants.WHITE))
                        .SetBackgroundColor(ColorConstants.GREEN));

                table.AddHeaderCell(
                    new Cell()
                        .Add(new Paragraph("Order Date")
                        .SetFont(boldFont)
                        .SetFontColor(ColorConstants.WHITE))
                        .SetBackgroundColor(ColorConstants.GREEN));

                foreach (var sale in sales)
                {
                    table.AddCell(sale.ProductName);
                    table.AddCell(sale.Quantity.ToString());
                    table.AddCell("R" + sale.UnitPrice.ToString("F2"));
                    table.AddCell("R" + sale.Sales.ToString("F2"));
                    table.AddCell(sale.OrderDate.ToString("yyyy/MM/dd"));
                }

                document.Add(table);

                document.Close();

                Response.Clear();
                Response.ContentType = "application/pdf";
                Response.AddHeader(
                    "Content-Disposition",
                    "attachment; filename=SportsNET_Sales_Report.pdf"
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

            sales = client.getSales(fromDate, toDate).ToList();

            decimal totalRevenue = sales.Sum(s => s.Sales);
            revenue = totalRevenue.ToString("F2");

            GeneratePDF(sales);
        }
    }
}