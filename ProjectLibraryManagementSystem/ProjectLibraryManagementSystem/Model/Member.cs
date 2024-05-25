using Microsoft.Data.SqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProjectLibraryManagementSystem.Model
{
    public class Member:Person
    {
        public int MemberID { get; set; }
        public string? PhoneNumber { get; set; }
    }
}
