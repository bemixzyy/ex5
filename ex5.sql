-- tạo cơ sở dữ liệu BookLibrary
CREATE DATABASE BookLibrary
GO

-- sử dụng cơ sở dữ liệu BookLibrary
USE BookLibrary
GO

-- tạo bảng book
CREATE TABLE Book (
    BookCode INT PRIMARY KEY,
    BookTitle VARCHAR(100) NOT NULL,
    Author VARCHAR(50) NOT NULL,
    Edition INT DEFAULT 'lần xuất bản',
    BookPrice MONEY DEFAULT 'giá bán',
    Copies INT DEFAULT 'số cuốn có trong thư viện'
)
GO

CREATE TABLE Member (
    MemberCode INT PRIMARY KEY IDENTITY,
    Name VARCHAR(50) NOT NULL,
    Address VARCHAR(100) NULL,
    PhoneNumber INT DEFAULT 'số điện thoại',
)
GO

ALTER TABLE IssueDatails (
    BookCode INT DEFAULT 'mã cuốn sách có trong bảng Book',
    MemberCode INT DEFAULT 'mã người mượn có trong bảng Member',
    IssueDate DATETIME DEFAULT 'ngày mượn sách',
    ReturnDate DATETIME DEFAULT 'ngày trả sách'
)
GO

ALTER TABLE IssueDatails
DROP CONSTRAINT FK_Member_IssueDatails
GO

ALTER TABLE IssueDatails
DROP CONSTRAINT FK_Book_IssueDatails
GO

ALTER TABLE Member DROP CONSTRAINT FK_MemberCode
GO

ALTER TABLE Book DROP CONSTRAINT FK_BookCode
GO

ALTER TABLE Member ADD CONSTRAINT FK_MemberCode PRIMARY KEY
GO

ALTER TABLE Book ADD CONSTRAINT FK_BookCode PRIMARY KEY
GO

ALTER TABLE IssueDatails ALTER COLUMN BookCode
GO

ALTER TABLE IssueDatails ALTER COLUMN MemberCode
GO

INSERT INTO Member (MemberCode, Name, Address, PhoneNumber)
VALUES (1, N'Nguyễn Văn A', N'Thanh Xuân - Hà Nội', 123456789),
       (2, N'Nguyễn Thị B', 'Đống Đa - Hà Nội', 987654321)
GO

-- Chèn dữ liệu vào bảng Book
INSERT INTO Book (BookCode, BookTitle, Author, Edition, BookPrice, Copies)
VALUES (1, N'Yêu những điều không hoàn hảo', 'Hae Min', 1, 139000, 5),
       (2, N'Không diệt không sinh đừng sợ hãi', N'Thích Nhất Hạnh', 2, 100000, 3)
GO

-- Chèn dữ liệu vào bảng IssueDetails
INSERT INTO IssueDetails (BookCode, MemberCode, IssueDate, ReturnDate)
VALUES (1, 1, '2022-01-01', '2022-01-15'),
       (2, 2, '2022-02-01', '2022-02-15')
GO