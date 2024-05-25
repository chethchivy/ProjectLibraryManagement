using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProjectLibraryManagementSystem.Model
{
    public class Staff:Person
    {
        public short StaffID { get; set; }
        public string? StaffPosition { get; set; }
        public string? HouseNo { get; set; }
        public string? StreetNo { get; set;}
        public string? ContactNumber { get; set; }
        public string? PersonalNumber { get; set; }
        public decimal Salary { get; set; }
        public DateTime HiredDate { get; set; }
        public Image? Photo { get; set; }
        public bool StopWork { get; set; }

    }
}
