using System.IO;

namespace SportsNET_WebApplication
{
    internal class PdfWriter
    {
        private MemoryStream stream;

        public PdfWriter(MemoryStream stream)
        {
            this.stream = stream;
        }
    }
}