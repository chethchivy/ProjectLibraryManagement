using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProjectLibraryManagementSystem.Model
{
    public class Supplier
    {
        public byte supplierID { get; set; }
        public string? supplierName { get; set; }
        public string? supplierAddr { get; set; }
        public string? supPhone1 { get; set; }
        public string? supPhone2 { get; set; }
    }
}
