CREATE DATABASE QuanLyQuanCafe
GO

USE QuanLyQuanCafe
GO

CREATE TABLE Account
(
	UserName NVARCHAR(100) PRIMARY KEY,	
	DisplayName NVARCHAR(100) NOT NULL,
	PassWord NVARCHAR(1000) NOT NULL DEFAULT 0,
	Type INT NOT NULL  DEFAULT 0 -- 1: admin && 0: staff
)
GO

CREATE TABLE TableFood
(
	id INT IDENTITY PRIMARY KEY,
	name NVARCHAR(100) NOT NULL DEFAULT N'Bàn chưa có tên',
	status NVARCHAR(100) NOT NULL DEFAULT N'Trống'	-- Trống || Có người
)
GO

CREATE TABLE FoodCategory
(
	id INT IDENTITY PRIMARY KEY,
	name NVARCHAR(100) NOT NULL DEFAULT N'Chưa đặt tên',
)
GO

CREATE TABLE Food
(
	id INT IDENTITY PRIMARY KEY,
	name NVARCHAR(100) NOT NULL DEFAULT N'Chưa đặt tên',
	idCategory INT NOT NULL,
	price FLOAT NOT NULL DEFAULT 0
	
	FOREIGN KEY (idCategory) REFERENCES dbo.FoodCategory(id)
)
GO

CREATE TABLE Bill
(
	id INT IDENTITY PRIMARY KEY,
	DateCheckIn DATE NOT NULL DEFAULT GETDATE(),
	DateCheckOut DATE,
	idTable INT NOT NULL,
	discount INT,
	totalPrice FLOAT,
	status INT NOT NULL DEFAULT 0 -- 1: đã thanh toán && 0: chưa thanh toán
	
	FOREIGN KEY (idTable) REFERENCES dbo.TableFood(id)
)
GO

CREATE TABLE BillInfo
(
	id INT IDENTITY PRIMARY KEY,
	idBill INT NOT NULL,
	idFood INT NOT NULL,
	count INT NOT NULL DEFAULT 0
	
	FOREIGN KEY (idBill) REFERENCES dbo.Bill(id),
	FOREIGN KEY (idFood) REFERENCES dbo.Food(id)
)
GO

--Thêm Account
INSERT INTO dbo.Account
        ( UserName ,
          DisplayName ,
          PassWord ,
          Type
        )
VALUES  ( N'QL' , -- UserName - nvarchar(100)
          N'MANAGER' , -- DisplayName - nvarchar(100)
          N'1' , -- PassWord - nvarchar(1000)
          1  -- Type - int
        )
INSERT INTO dbo.Account
        ( UserName ,
          DisplayName ,
          PassWord ,
          Type
        )
VALUES  ( N'NV' , -- UserName - nvarchar(100)
          N'STAFF' , -- DisplayName - nvarchar(100)
          N'1' , -- PassWord - nvarchar(1000)
          0  -- Type - int
        )
GO

-- Thêm bàn
DECLARE @i INT = 1
WHILE @i <= 20
BEGIN
	INSERT dbo.TableFood ( name)VALUES  ( N'Bàn ' + CAST(@i AS nvarchar(100)))
	SET @i = @i + 1
END
GO

--Thêm loại đồ
INSERT dbo.FoodCategory
        ( name )
VALUES  ( N'CaFe Pha Phin'  -- name - nvarchar(100)
         )
INSERT dbo.FoodCategory
        ( name )
VALUES  ( N'CaFe Máy '
		  )
INSERT dbo.FoodCategory
        ( name )
VALUES  ( N'Tea'
		 )
INSERT dbo.FoodCategory
        ( name )
VALUES  ( N'Freeze'
		 )
INSERT dbo.FoodCategory
        ( name )
VALUES  ( N'Bánh Ngọt'
		 )
		 
-- Thêm đồ uống
INSERT dbo.Food
        ( name, idCategory, price )
VALUES  ( N'Phin Sữa Đá/Nóng size S', -- name - nvarchar(100)
          1, -- idCategory - int
          29000)
INSERT dbo.Food
        ( name, idCategory, price )
VALUES  ( N'Phin Sữa Đá/Nóng size M', 1, 35000)
INSERT dbo.Food
        ( name, idCategory, price )
VALUES  ( N'Phin Sữa Đá/Nóng size L', 1, 39000)
INSERT dbo.Food
        ( name, idCategory, price )
VALUES  ( N'Phin Đen Đá/Nóng size S', 1,29000)
INSERT dbo.Food
        ( name, idCategory, price )
VALUES  ( N'Phin Đen Đá/Nóng size M', 1, 35000)
INSERT dbo.Food
        ( name, idCategory, price )
VALUES  ( N'Phin Đen Đá/Nóng size L', 1, 39000)
INSERT dbo.Food
        ( name, idCategory, price )
VALUES  ( N'Latte Đá/Nóng size S', 2,55000)
INSERT dbo.Food
        ( name, idCategory, price )
VALUES  ( N'Latte Đá/Nóng size M', 2, 65000)
INSERT dbo.Food
        ( name, idCategory, price )
VALUES  ( N'Latte Đá/Nóng size L', 2, 69000)
INSERT dbo.Food
        ( name, idCategory, price )
VALUES  ( N'Cappuccino Đá/Nóng size S', 2,55000)
INSERT dbo.Food
        ( name, idCategory, price )
VALUES  ( N'Cappuccino Đá/Nóng size M', 2, 65000)
INSERT dbo.Food
        ( name, idCategory, price )
VALUES  ( N'Cappuccino Đá/Nóng size L', 2, 69000)
INSERT dbo.Food
        ( name, idCategory, price )
VALUES  ( N'Espresso Đá/Nóng size S', 2,35000)
INSERT dbo.Food
        ( name, idCategory, price )
VALUES  ( N'Espresso Đá/Nóng size M', 2, 39000)
INSERT dbo.Food
        ( name, idCategory, price )
VALUES  ( N'Espresso Đá/Nóng size L', 2, 45000)
INSERT dbo.Food
        ( name, idCategory, price )
VALUES  ( N'Trà Đào Đá/Nóng size S', 3,39000)
INSERT dbo.Food
        ( name, idCategory, price )
VALUES  ( N'Trà Đào Đá/Nóng size M', 3, 49000)
INSERT dbo.Food
        ( name, idCategory, price )
VALUES  ( N'Trà Đào Đá/Nóng size L', 3, 55000)
INSERT dbo.Food
        ( name, idCategory, price )
VALUES  ( N'Trà Sen Đá/Nóng size S', 3,39000)
INSERT dbo.Food
        ( name, idCategory, price )
VALUES  ( N'Trà Sen Đá/Nóng size M', 3, 49000)
INSERT dbo.Food
        ( name, idCategory, price )
VALUES  ( N'Trà Sen Đá/Nóng size L', 3, 55000)
INSERT dbo.Food
        ( name, idCategory, price )
VALUES  ( N'Trà Vải Đá/Nóng size S', 3,39000)
INSERT dbo.Food
        ( name, idCategory, price )
VALUES  ( N'Trà Vải Đá/Nóng size M', 3, 49000)
INSERT dbo.Food
        ( name, idCategory, price )
VALUES  ( N'Trà Vải Đá/Nóng size L', 3, 55000)
INSERT dbo.Food
        ( name, idCategory, price )
VALUES  ( N'Freeze Trà Xanh size S', 4,49000)
INSERT dbo.Food
        ( name, idCategory, price )
VALUES  ( N'Freeze Trà Xanh size M', 4, 59000)
INSERT dbo.Food
        ( name, idCategory, price )
VALUES  ( N'Freeze Trà Xanh size L', 4, 65000)
INSERT dbo.Food
        ( name, idCategory, price )
VALUES  ( N'Freeze SoCoLa size S', 4,49000)
INSERT dbo.Food
        ( name, idCategory, price )
VALUES  ( N'Freeze SoCoLa size M', 4, 59000)
INSERT dbo.Food
        ( name, idCategory, price )
VALUES  ( N'Freeze SoCoLa size L', 4, 65000)
INSERT dbo.Food
        ( name, idCategory, price )
VALUES  ( N'Cookies & Cream size S', 4,49000)
INSERT dbo.Food
        ( name, idCategory, price )
VALUES  ( N'Cookies & Cream size M', 4, 59000)
INSERT dbo.Food
        ( name, idCategory, price )
VALUES  ( N'Cookies & Cream size L', 4, 65000)
INSERT dbo.Food
        ( name, idCategory, price )
VALUES  ( N'Bánh Tiramisu', 5,19000)
INSERT dbo.Food
        ( name, idCategory, price )
VALUES  ( N'Bánh Chuối', 5, 19000)
INSERT dbo.Food
        ( name, idCategory, price )
VALUES  ( N'Bánh Caramel', 5, 29000)
INSERT dbo.Food
        ( name, idCategory, price )
VALUES  ( N'Bánh Phô Mai Cafe', 5,29000)
INSERT dbo.Food
        ( name, idCategory, price )
VALUES  ( N'Bánh Phô Mai Trà Xanh', 5, 29000)

-- Thêm hóa đơn
INSERT	dbo.Bill
        ( DateCheckIn ,
          DateCheckOut ,
          idTable ,
          status,
          discount,
          totalPrice
        )
VALUES  ( GETDATE() , -- DateCheckIn - date
          NULL , -- DateCheckOut - date
          1 , -- idTable - int
          0 , -- status - int
          20,
          NULL
        )
INSERT	dbo.Bill VALUES  ( '04/04/2020','04/04/2020',2,20,200000,1)
INSERT	dbo.Bill VALUES  ( '03/05/2020','03/05/2020',3,10,400000,1)
INSERT	dbo.Bill VALUES  ('04/09/2020','04/09/2020',4,5,350000,1)   
INSERT	dbo.Bill VALUES  ( '02/03/2020','02/03/2020',5,30,500000,1)
INSERT	dbo.Bill VALUES  ( '04/07/2020','04/07/2020',7,10,690000,1)
INSERT	dbo.Bill VALUES  ('03/09/2020','03/09/2020',1,5,500000,1)      
INSERT	dbo.Bill VALUES  ( '01/04/2020','01/04/2020',11,30,510000,1)
INSERT	dbo.Bill VALUES  ( '02/05/2020','02/05/2020',3,10,640000,1)
INSERT	dbo.Bill VALUES  ('02/04/2020','02/04/2020',13,5,550000,1)   
INSERT	dbo.Bill VALUES  ( '02/22/2020','02/22/2020',19,30,500000,1)
INSERT	dbo.Bill VALUES  ( '02/22/2020','02/22/2020',14,10,900000,1)
INSERT	dbo.Bill VALUES  ('01/09/2020','01/09/2020',17,5,500000,1)
INSERT	dbo.Bill VALUES  ('01/01/2020','01/01/2020',11,30,510000,1)  
GO
--SELECT * FROM dbo.Bill


----Thủ tục thống kê tài khoản theo username
CREATE PROC USP_GetAccountByUserName
@userName nvarchar(100)
AS 
BEGIN
	SELECT * FROM dbo.Account WHERE UserName = @userName
END
GO
--EXEC dbo.USP_GetAccountByUserName @userName = N'QL' -- nvarchar(100)


----Thủ tục đăng nhập
CREATE PROC USP_Login
@userName nvarchar(100), @passWord nvarchar(100)
AS
BEGIN
	SELECT * FROM dbo.Account WHERE UserName = @userName AND PassWord = @passWord
END
GO
--EXEC dbo.USP_Login @userName = N'NV', @passWord = N'1' 


----Thống kê tất cả các bàn
CREATE PROC USP_GetTableList
AS 
SELECT * FROM dbo.TableFood
GO
--EXEC dbo.USP_GetTableList


----Thủ tục tạo thêm hóa đơn
CREATE PROC USP_InsertBill
@idTable INT
AS
BEGIN
	INSERT dbo.Bill
	        ( DateCheckIn ,
	          DateCheckOut ,
	          idTable ,
	          status,
	          discount,
	          totalPrice
	        )
	VALUES  ( GETDATE() , -- DateCheckIn - date
	          NULL , -- DateCheckOut - date
	          @idTable , -- idTable - int
	          0, -- status - int
	          0,  -- discount - int
	          0
	        )
END
GO
--EXEC dbo.USP_InsertBill @idTable = 5 
--SELECT * FROM dbo.Bill

----Thủ tục tạo thêm thông tin của hóa đơn
CREATE PROC USP_InsertBillInfo
@idBill INT,
@idFood INT,
@count INT 
AS
BEGIN
	DECLARE @isExitBillInfo INT
	DECLARE @FoodCount INT = 1
	SELECT @isExitBillInfo = id ,@FoodCount = b.count 
	FROM dbo.BillInfo AS b 
	WHERE idBill = @idBill AND idFood = @idFood
	
	IF (@isExitBillInfo > 0)
	BEGIN
		DECLARE @newCount INT = @FoodCount + @count
		IF (@newCount > 0 )
			UPDATE dbo.BillInfo SET count = @FoodCount + @count WHERE idFood = @idFood
		ELSE
			DELETE dbo.BillInfo WHERE idBill = @idBill AND idFood = @idFood
	END
	ELSE
	BEGIN
	INSERT	dbo.BillInfo
        ( idBill, idFood, count )
	VALUES  ( @idBill, -- idBill - int
          @idFood, -- idFood - int
          @count  -- count - int
          )
END
END
GO
--EXEC dbo.USP_InsertBillInfo @idBill = 1, @idFood = 3, @count = 2 
--SELECT * FROM dbo.BillInfo


----Thủ tục hiển thị doanh thu
CREATE PROC USP_GetListBillByDate
@checkIn date, @checkOut date
AS 
BEGIN
	SELECT t.name AS [Tên bàn], b.totalPrice AS [Tổng tiền], DateCheckIn AS [Ngày vào], DateCheckOut AS [Ngày ra], discount AS [Giảm giá]
	FROM dbo.Bill AS b,dbo.TableFood AS t
	WHERE DateCheckIn >= @checkIn AND DateCheckOut <= @checkOut AND b.status = 1
	AND t.id = b.idTable
END
GO
--EXEC dbo.USP_GetListBillByDate @checkIn = '2019-10-1', @checkOut = '2019-10-20' 


----Thủ tục sửa thông tin tài khoản
CREATE PROC USP_UpdateAccount
@userName NVARCHAR(100), @displayName NVARCHAR(100), @password NVARCHAR(100), @newPassword NVARCHAR(100)
AS
BEGIN
	DECLARE @isRightPass INT = 0
	
	SELECT @isRightPass = COUNT(*) FROM dbo.Account WHERE USERName = @userName AND PassWord = @password
	
	IF (@isRightPass = 1)
	BEGIN
		IF (@newPassword = NULL OR @newPassword = '')
		BEGIN
			UPDATE dbo.Account SET DisplayName = @displayName WHERE UserName = @userName
		END		
		ELSE
			UPDATE dbo.Account SET DisplayName = @displayName, PassWord = @newPassword WHERE UserName = @userName
	end
END
GO
--EXEC dbo.USP_UpdateAccount @userName = N'NV', @displayName = N'NTN', @password = N'1', @newPassword = N'2' 
--SELECT * FROM dbo.Account


----Thủ tục cho bàn ko có người thành bàn có người khi insert và update vào billinfo
CREATE TRIGGER UTG_UpdateBillInfo
ON dbo.BillInfo FOR INSERT, UPDATE
AS
BEGIN
	--Lấy ra idbill
	DECLARE @idBill INT
	SELECT @idBill = idBill FROM Inserted
	--Từ id bill lấy ra idtable
	DECLARE @idTable INT
	SELECT @idTable = idTable FROM dbo.Bill WHERE id = @idBill AND status = 0
	
	UPDATE dbo.TableFood SET status = N'Có người' WHERE id = @idTable
	PRINT'Update thành công'
END
GO

----Thủ tục cho bàn có người thành bàn ko có người khi update vào billinfo
CREATE TRIGGER UTG_UpdateBill
ON dbo.Bill FOR UPDATE
AS
BEGIN
	
	DECLARE @idBill INT
	SELECT @idBill = id FROM Inserted	
	
	DECLARE @idTable INT
	SELECT @idTable = idTable FROM dbo.Bill WHERE id = @idBill
	
	DECLARE @count int = 0
	SELECT @count = COUNT(*) FROM dbo.Bill WHERE idTable = @idTable AND status = 0
	
	IF (@count = 0)
		UPDATE dbo.TableFood SET status = N'Trống' WHERE id = @idTable
		PRINT'Update thành công'
END
GO

----Thủ tục xóa billinfo khi xóa đồ uống có trong bill đag tạo
CREATE TRIGGER UTG_DeleteBillInfo
ON dbo.BillInfo FOR DELETE
AS 
BEGIN
	DECLARE @idBillInfo INT
	DECLARE @idBill INT
	SELECT @idBillInfo = id, @idBill = Deleted.idBill FROM Deleted
	
	DECLARE @idTable INT
	SELECT @idTable = idTable FROM dbo.Bill WHERE id = @idBill
	
	DECLARE @count INT = 0
	
	SELECT @count = COUNT(*) FROM dbo.BillInfo AS bi, dbo.Bill AS b WHERE b.id = bi.idBill AND b.id = @idBill AND b.status = 0
	
	IF (@count = 0)
		UPDATE dbo.TableFood SET status = N'Trống' WHERE id = @idTable
		PRINT'Update thành công'
END
GO











