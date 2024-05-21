CREATE TABLE tbBook(
	BookCode int Primary Key IDENTITY(1,1) Not Null,
	BookTitle nvarchar(255) Collate SQL_Latin1_General_CP850_Bin Not Null,
	Genres nvarchar(50) Collate SQL_Latin1_General_CP850_Bin Not Null,
	Author nvarchar(50) Collate SQL_Latin1_General_CP850_Bin Not Null,
	PublishYear smallint Not Null,
	BookQty tinyint Not Null,
	LateFee money Not Null,
	Price money Not Null
)
Go

CREATE TABLE tbSupplier(
	SupplierID tinyint Primary Key IDENTITY(1,1) Not Null,
	SupplierName nvarchar(100) Collate SQL_Latin1_General_CP850_Bin Not Null,
	SupplierAddress nvarchar(255) Collate SQL_Latin1_General_CP850_Bin Not Null,
	PhoneNumber1 nvarchar(20) Collate SQL_Latin1_General_CP850_Bin Not Null,
	PhoneNumber2 nvarchar(20) Collate SQL_Latin1_General_CP850_Bin Not Null
)
Go

CREATE TABLE tbStaff(
	StaffID smallint Primary Key IDENTITY(1,1) Not Null,
	FirstName nvarchar(50) Collate SQL_Latin1_General_CP850_Bin Not Null,
	LastName nvarchar(50) Collate SQL_Latin1_General_CP850_Bin Not Null,
	Sex nchar(1) Collate SQL_Latin1_General_CP850_Bin  Not Null,
	BirthDate date Not Null,
	StaffPosition nvarchar(100) Collate SQL_Latin1_General_CP850_Bin Not Null,
	HouseNo nvarchar(15) Collate SQL_Latin1_General_CP850_Bin Null,
	StreetNo nvarchar(25) Collate SQL_Latin1_General_CP850_Bin Null,
	Sangkat nvarchar(50) Collate SQL_Latin1_General_CP850_Bin Not Null,
	Khann nvarchar(50) Collate SQL_Latin1_General_CP850_Bin Not Null,
	Province nvarchar(50) Collate SQL_Latin1_General_CP850_Bin Not Null,
	ContactNumber nvarchar(20) Collate SQL_Latin1_General_CP850_Bin Null,
	PersonalNumber nvarchar(50) Collate SQL_Latin1_General_CP850_Bin Not Null,
	Salary money Not Null,
	HireDate date Not Null,
	Photo varbinary(max) Null,
	StopWork bit Null
)
Go

CREATE TABLE tbMember(
	MemberID int Primary Key IDENTITY(1,1) Not Null,
	FirstName nvarchar(50) Collate SQL_Latin1_General_CP850_Bin Not Null,
	LastName nvarchar(50) Collate SQL_Latin1_General_CP850_Bin Not Null,
	Sex nchar(1) Collate SQL_Latin1_General_CP850_Bin  Not Null,
	BirthDate date Not Null,
	Sangkat nvarchar(50) Collate SQL_Latin1_General_CP850_Bin Not Null,
	Khann nvarchar(50) Collate SQL_Latin1_General_CP850_Bin Not Null,
	Province nvarchar(50) Collate SQL_Latin1_General_CP850_Bin Not Null,
	PhoneNumber nvarchar(50) Collate SQL_Latin1_General_CP850_Bin Not Null
)
Go

CREATE TABLE tbUser(
	UserID int Primary Key IDENTITY(1,1) Not Null,
	UserName varchar(20) Not Null,
	UserPassword varchar(20) Not Null,
	StaffID smallint Not Null,
	StaffName nvarchar(100) Collate SQL_Latin1_General_CP850_Bin Not Null,
	StaffPosition nvarchar(100) Collate SQL_Latin1_General_CP850_Bin Not Null,
	Constraint FKStaffID1 Foreign Key(StaffID) References tbStaff(StaffID) On Delete Cascade On Update Cascade
)
Go

CREATE TABLE tbCard(
	CardID int Primary Key IDENTITY(1,1) Not Null,
	CreateDate date Not Null,
	Expire date Not Null,
	MemberID int Not Null,
	MemberName nvarchar(100) Collate SQL_Latin1_General_CP850_Bin Not Null,
	StaffID smallint Not Null,
	StaffName nvarchar(100) Collate SQL_Latin1_General_CP850_Bin Not Null,
	StaffPosition nvarchar(100) Collate SQL_Latin1_General_CP850_Bin Not Null,
	Constraint FKMemberID1 Foreign Key(MemberID) References tbMember(MemberID) On Delete Cascade On Update Cascade,
	Constraint FKStaffID2 Foreign Key(StaffID) References tbStaff(StaffID) On Delete Cascade On Update Cascade
)
Go

CREATE TABLE tbImport(
	ImportID int Primary Key IDENTITY(1,1) Not Null,
	ImportDate date Not Null,
	SupplierID tinyint Not Null,
	SupplierName nvarchar(100) Collate SQL_Latin1_General_CP850_Bin Not Null,
	StaffID smallint Not Null,
	StaffName nvarchar(100) Collate SQL_Latin1_General_CP850_Bin Not Null,
	StaffPosition nvarchar(100) Collate SQL_Latin1_General_CP850_Bin Not Null,
	Constraint FKSupplierID Foreign Key(SupplierID) References tbSupplier(SupplierID) On Delete Cascade On Update Cascade,
	Constraint FKStaffID3 Foreign Key(StaffID) References tbStaff(StaffID) On Delete Cascade On Update Cascade
)
Go

CREATE TABLE tbBorrow(
	BorrowID int Primary Key IDENTITY(1,1) Not Null,
	BorrowDate date Not Null,
	DueDate date Not Null,
	MemberID int Not Null,
	MemberName nvarchar(100) Collate SQL_Latin1_General_CP850_Bin Not Null,
	StaffID smallint Not Null,
	StaffName nvarchar(100) Collate SQL_Latin1_General_CP850_Bin Not Null,
	StaffPosition nvarchar(100) Collate SQL_Latin1_General_CP850_Bin Not Null,
	Constraint FKMemberID2 Foreign Key(MemberID) References tbMember(MemberID) On Delete Cascade On Update Cascade,
	Constraint FKStaffID4 Foreign Key(StaffID) References tbStaff(StaffID) On Delete Cascade On Update Cascade
)
Go

CREATE TABLE tbReturn(
	ReturnID int Primary Key IDENTITY(1,1) Not Null,
	ReturnDate date Not Null,
	MemberID int Not Null,
	MemberName nvarchar(100) Collate SQL_Latin1_General_CP850_Bin Not Null,
	StaffID smallint Not Null,
	StaffName nvarchar(100) Collate SQL_Latin1_General_CP850_Bin Not Null,
	StaffPosition nvarchar(100) Collate SQL_Latin1_General_CP850_Bin Not Null,
	Constraint FKMemberID3 Foreign Key(MemberID) References tbMember(MemberID) On Delete Cascade On Update Cascade,
	Constraint FKStaffID5 Foreign Key(StaffID) References tbStaff(StaffID) On Delete Cascade On Update Cascade
)
Go

CREATE TABLE tbRenew(
	RenewID int Primary Key IDENTITY(1,1) Not Null,
	RenewDate date Not Null,
	NewDueDate date Not Null,
	MemberID int Not Null,
	MemberName nvarchar(100) Collate SQL_Latin1_General_CP850_Bin Not Null,
	StaffID smallint Not Null,
	StaffName nvarchar(100) Collate SQL_Latin1_General_CP850_Bin Not Null,
	StaffPosition nvarchar(100) Collate SQL_Latin1_General_CP850_Bin Not Null,
	Constraint FKMemberID4 Foreign Key(MemberID) References tbMember(MemberID) On Delete Cascade On Update Cascade,
	Constraint FKStaffID6 Foreign Key(StaffID) References tbStaff(StaffID) On Delete Cascade On Update Cascade
)
Go

CREATE TABLE tbPayment(
	PaymentNo int Primary Key IDENTITY(1,1) Not Null,
	PaymentDate date Not Null,
	PaidAmount money Not Null,
	ReturnID int Not Null,
	MemberID int Not Null,
	StaffID smallint Not Null,
	StaffName nvarchar(100) Collate SQL_Latin1_General_CP850_Bin Not Null,
	StaffPosition nvarchar(100) Collate SQL_Latin1_General_CP850_Bin Not Null,
	Constraint FKReturnID1 Foreign Key(ReturnID) References tbReturn(ReturnID) On Delete Cascade On Update Cascade,
	Constraint FKMemberID5 Foreign Key(MemberID) References tbMember(MemberID),
	Constraint FKStaffID7 Foreign Key(StaffID) References tbStaff(StaffID)
)
Go 

CREATE TABLE tbInvoice(
	InvoiceNo int Primary Key IDENTITY(1,1) Not Null,
	InvoiceDate date Not Null,
	TotalAmount money Not Null,
	PaidAmount money Not Null,
	ReturnID int Not Null,
	MemberID int Not Null,
	StaffID smallint Not Null,
	StaffName nvarchar(100) Collate SQL_Latin1_General_CP850_Bin Not Null,
	StaffPosition nvarchar(100) Collate SQL_Latin1_General_CP850_Bin Not Null,
	Constraint FKReturnID2 Foreign Key(ReturnID) References tbReturn(ReturnID) On Delete Cascade On Update Cascade,
	Constraint FKMemberID6 Foreign Key(MemberID) References tbMember(MemberID),
	Constraint FKStaffID8 Foreign Key(StaffID) References tbStaff(StaffID)
)
Go

CREATE TABLE tbBorrowExpire(
	BorrowExpireID int Primary Key IDENTITY(1,1) Not Null,
	ExpiredDate date Not Null,
	BorrowID int Not Null,
	MemberID int Not Null,
	BookTitle nvarchar(255) Collate SQL_Latin1_General_CP850_Bin Not Null,
	Constraint FKBorrowID1 Foreign Key(BorrowID) References tbBorrow(BorrowID) On Delete Cascade On Update Cascade,
	Constraint FKMemberID7 Foreign Key(MemberID) References tbMember(MemberID),
)
Go

CREATE TABLE tbImportDetail(
	ImportID int Not Null,
	BookCode int Not Null,
	ImportQty tinyint Not Null,
	UnitPrice money Not Null,
	Amount money Not Null,
	Constraint FKImportID Foreign Key(ImportID) References tbImport(ImportID) On Delete Cascade On Update Cascade,
	Constraint FKBookCode1 Foreign Key(BookCode) References tbBook(BookCode) On Delete Cascade On Update Cascade,
	Constraint PKImportIDBookCode Primary Key(ImportID, BookCode)
)
Go

CREATE TABLE tbBorrowDetail(
	BorrowID int Not Null,
	BookCode int Not Null,
	BookTitle nvarchar(255) Not Null,
	BorrowDate date Not Null,
	DueDate date Not Null,
	Constraint FKBorrowID2 Foreign Key(BorrowID) References tbBorrow(BorrowID) On Delete Cascade On Update Cascade,
	Constraint FKBookCode2 Foreign Key(BookCode) References tbBook(BookCode) On Delete Cascade On Update Cascade,
	Constraint PKBorrowIDBookCode Primary Key(BorrowID, BookCode)
)
Go

CREATE TABLE tbReturnDetail(
	ReturnID int Not Null,
	BookCode int Not Null,
	BorrowDate date Not Null,
	DueDate date Not Null,
	ReturnDate date Not Null,
	Ripped bit Null,
	FineAmount money Null,
	Constraint FKReturnID3 Foreign Key(ReturnID) References tbReturn(ReturnID) On Delete Cascade On Update Cascade,
	Constraint FKBookCode3 Foreign Key(BookCode) References tbBook(BookCode) On Delete Cascade On Update Cascade,
	Constraint PKReturnIDBookCode Primary Key(ReturnID, BookCode)
)
Go