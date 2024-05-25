using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProjectLibraryManagementSystem.Model
{
    public class Book
    {
        public int bookCode { get; set; }
        public string? bookTitle { get; set; }
        public string? genres { get; set; }
        public string? author { get; set; }
        public int publishYear { get; set; }
        public byte bookQty { get; set; }
        public decimal lateFee { get; set; }
        public decimal price { get; set; }
    }
}
