namespace ProjectLibraryManagementSystem.Model
{
    public class Person
    {
        public string? FirstName { get; set; } 
        public string? LastName { get; set; }
        public char Sex { get; set; }
        public DateTime BirthDate { get; set; }
        public string? Sangkat { get; set; }
        public string? Khann { get; set; }
        public string? Province { get; set; }
    }
}
