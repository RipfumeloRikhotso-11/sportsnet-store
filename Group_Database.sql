
CREATE DATABASE DBSportsNET;
USE DBSportsNET;

DROP TABLE IF EXISTS PAYMENT;
DROP TABLE IF EXISTS ORDER_DETAILS;
DROP TABLE IF EXISTS INVOICE;
DROP TABLE IF EXISTS CART_ITEM;
DROP TABLE IF EXISTS LOGIN_SESSION;
DROP TABLE IF EXISTS CART;
DROP TABLE IF EXISTS REVIEW;
DROP TABLE IF EXISTS ORDER_TABLE;
DROP TABLE IF EXISTS PRODUCT_VARIANT;
DROP TABLE IF EXISTS PRODUCT_TABLE;
DROP TABLE IF EXISTS USER_TABLE;
DROP TABLE IF EXISTS SUPPLIER;
DROP TABLE IF EXISTS CATEGORY;
DROP TABLE IF EXISTS ROLE_TABLE;

CREATE TABLE ROLE_TABLE(
	RoleId INT IDENTITY(1,1) UNIQUE NOT NULL,
	RoleName VARCHAR(30) NOT NULL,
	PRIMARY KEY(RoleID)
	);

CREATE TABLE CATEGORY(
	CategoryID INT IDENTITY(1,1) UNIQUE NOT NULL,
	CategoryName VARCHAR(30) NOT NULL,
	PRIMARY KEY(CategoryID)
	);

CREATE TABLE SUPPLIER(
	SupplierID INT IDENTITY(1,1)UNIQUE NOT NULL ,
	SupplierName VARCHAR(30) ,
	ContactPerson VARCHAR(50) ,
	PhoneNumber VARCHAR(15) ,
	SupplierEmail VARCHAR(100) ,
	SupplierAddress VARCHAR(50),
	PRIMARY KEY(SupplierID)
	);

CREATE TABLE USER_TABLE(
	UserID INT IDENTITY(1,1) UNIQUE NOT NULL,
	Username VARCHAR(30) UNIQUE NOT NULL,
	UserPassword VARCHAR(50) NOT NULL,
	FirstName VARCHAR(30) NOT NULL,
	LastName VARCHAR(30) NOT NULL,
	UserEmail VARCHAR(100) NOT NULL,
	UserPhoneNumber VARCHAR(15) NOT NULL,
	RoleID INT NOT NULL,
	PRIMARY KEY(UserID),
	FOREIGN KEY (RoleID) REFERENCES ROLE_TABLE(RoleID)
	);

CREATE TABLE PRODUCT_TABLE(
	ProductID INT IDENTITY(1,1),
	ProductName VARCHAR(300) NOT NULL,
	ProductDescription VARCHAR(5000) NOT NULL,
	Brand VARCHAR(20) NOT NULL,
	CategoryID INT NOT NULL,
	SupplierID INT NOT NULL,
	ImageURL VARCHAR(5000) NOT NULL,
	PRIMARY KEY(ProductID),
	FOREIGN KEY(CategoryID) REFERENCES CATEGORY(CategoryID),
	FOREIGN KEY(SupplierID) REFERENCES Supplier(SupplierID)
	);

CREATE TABLE PRODUCT_VARIANT(
	VariantID INT IDENTITY(1,1) UNIQUE NOT NULL,
	ProductID INT NOT NULL,
	ProductSize VARCHAR(10) NOT NULL,
	Colour VARCHAR(30) NOT NULL,
	IsSigned BIT NOT NULL,
	Price DECIMAL(10,2) NOT NULL,
	StockQuantity INT NOT NULL,
	PRIMARY KEY(VariantID),
	FOREIGN KEY(ProductID) REFERENCES PRODUCT_TABLE(ProductID)
	);

CREATE TABLE ORDER_TABLE(
	OrderID INT IDENTITY(1,1) UNIQUE NOT NULL,
	UserID INT NOT NULL,
	OrderDate DATETIME NOT NULL,
	OrderStatus VARCHAR(20) NOT NULL,
	PRIMARY KEY(OrderID),
	FOREIGN KEY(UserID) REFERENCES USER_TABLE(UserID)
	);

CREATE TABLE ORDER_DETAILS(
	OrderDetailID INT IDENTITY(1,1) UNIQUE NOT NULL,
	OrderID INT NOT NULL,
	VariantID INT NOT NULL,
	Quantity INT NOT NULL,
	UnitPrice DECIMAL(10,2) NOT NULL,
	PRIMARY KEY(OrderDetailID),
	FOREIGN KEY(OrderID) REFERENCES ORDER_TABLE(OrderID),
	FOREIGN KEY(VariantID) REFERENCES PRODUCT_VARIANT(VariantID)
	);

CREATE TABLE INVOICE(
	InvoiceID INT IDENTITY(1,1) UNIQUE NOT NULL,
	OrderID INT UNIQUE NOT NULL,
	InvoiceDate DATETIME NOT NULL,
	TotalAmount DECIMAL(10,2) NOT NULL,
	PRIMARY KEY(InvoiceID),
	FOREIGN KEY(OrderID) REFERENCES ORDER_TABLE(OrderID)
	);

CREATE TABLE LOGIN_SESSION(
	SessionID INT IDENTITY(1,1) UNIQUE NOT NULL,
	UserID INT NOT NULL,
	Time_In DATETIME NOT NULL,
	Time_Out DATETIME,
	ActiveStatus BIT NOT NULL,
	PRIMARY KEY(SessionID),
	FOREIGN KEY(UserID) REFERENCES USER_TABLE(UserID)
	);

CREATE TABLE CART(
	CartID INT IDENTITY(1,1) UNIQUE NOT NULL,
	UserID INT UNIQUE NOT NULL,
	CreatedDate DATETIME NOT NULL,
	PRIMARY KEY(CartID),
	FOREIGN KEY(UserID) REFERENCES USER_TABLE(UserID)
	);

CREATE TABLE CART_ITEM(
	CartItemID INT IDENTITY(1,1) UNIQUE NOT NULL,
	CartID INT NOT NULL,
	VariantID INT NOT NULL,
	Quantity INT NOT NULL,
	PRIMARY KEY(CartItemID),
	FOREIGN KEY(CartID) REFERENCES CART(CartID),
	FOREIGN KEY(VariantID) REFERENCES PRODUCT_VARIANT(VariantID)
	);

CREATE TABLE PAYMENT(
	PaymentID INT IDENTITY(1,1) UNIQUE NOT NULL,
	InvoiceID INT NOT NULL,
	PaymentDate DATETIME NOT NULL,
	Amount DECIMAL(10,2) NOT NULL,
	PaymentMethod VARCHAR(30) NOT NULL,
	PaymentStatus VARCHAR(10) NOT NULL,
	TransactionReference VARCHAR(50) UNIQUE NOT NULL,
	PRIMARY KEY(PaymentID),
	FOREIGN KEY(InvoiceID) REFERENCES INVOICE(InvoiceID)
	);

CREATE TABLE REVIEW(
	ReviewID INT IDENTITY(1,1) UNIQUE NOT NULL,
	UserID INT NOT NULL,
	ProductID INT NOT NULL,
	Rating INT CHECK (Rating BETWEEN 1 AND 5) NOT NULL,
	Comment VARCHAR(500) NOT NULL,
	ReviewDate DATETIME NOT NULL,
	PRIMARY KEY(ReviewID),
	FOREIGN KEY(UserID) REFERENCES USER_TABLE(UserID),
	FOREIGN KEY(ProductID) REFERENCES PRODUCT_TABLE(ProductID)
	);
	
INSERT INTO CATEGORY (CategoryName)
VALUES
('International Jerseys'),
('World Cup'),
('South African Jerseys');
select* from CATEGORY;


INSERT INTO SUPPLIER(SupplierName)
VALUES
('International Company'),
('kitsSa'),
('Adidas'),
('Adidas5'),
('Puma'),
('Bash'),
('TotalSports')

select* from SUPPLIER

	INSERT INTO PRODUCT_TABLE(ProductName, ProductDescription, Brand, CategoryID, SupplierID, ImageURL)
	VALUES
	('Manchester United 25/26 Home Jersey', 'Created for comfort, this timeless Man Utd home jersey has a sprinkling of Old Trafford style.', 'Adidas', 1, 1, 'https://assets.adidas.com/images/w_940,f_auto,q_auto/341ec36583354390854e7ad4fd2a02dd_9366/JI7428_01_laydown.jpg'),
	('Manchester United 26/27 Away Jersey', 'Jersey with Climacool technology for wicking and dispersing sweat.', 'Adidas', 1, 1, 'https://assets.adidas.com/images/w_940,f_auto,q_auto/d7f246e50fec4a1e9711e3f28a1a8c83_9366/KA6861_01_laydown.jpg'),
	('Manchester United 25/26 Away Jersey', 'An away supporter jersey that remixes classic adidas x Man Utd DNA.', 'Adidas', 1, 1, 'https://assets.adidas.com/images/w_940,f_auto,q_auto/e1a2021d272842b0b7e9cdc61055e9ed_9366/JI7423_01_laydown.jpg'),
	('Manchester City 26/27 Away Jersey Men', 'Built to help fans stay comfortable through long away days, this Manchester City jersey features moisture-wicking dryCELL technology and a soft build. On the chest, team details produce a football finish to make true supporters proud.', 'Puma', 1, 2, 'https://images.puma.com/image/upload/f_auto,q_auto,w_600,b_rgb:FAFAFA/global/784339/03/fnd/ZAF/fmt/png'),
	('Manchester City 26/27 Home Jersey Men', 'Feel the energy of the home crowd when you pull on this Manchester City jersey. Created for comfort, it teams a smooth build and moisture-wicking dryCELL technology for on and off-pitch adventures. Home colours and club details help you represent in style.', 'Puma', 1, 2, 'https://images.puma.com/image/upload/f_auto,q_auto,w_600,b_rgb:FAFAFA/global/784326/01/fnd/ZAF/fmt/png'),
	('Liverpool FC 26/27 Home Jersey', 'Jersey with Climacool technology for faster sweat release and cooling comfort.', 'Adidas', 1, 3, 'https://assets.adidas.com/images/w_940,f_auto,q_auto/13c65547ddff43e58e48984abbe4d455_9366/KA6852_01_laydown.jpg'),
	('Liverpool FC 25/26 Home Jersey', 'A supporter jersey that borrows from Liverpool FC long history with adidas.', 'Adidas', 1, 3, 'https://assets.adidas.com/images/w_940,f_auto,q_auto/f54aaf314c3045d29ab6ad15ff1f4e20_9366/JV6423_01_laydown.jpg'),
	('Liverpool FC 25/26 Away Jersey', 'An Anfield-inspired jersey for backing Liverpool FC on the road.', 'Adidas', 1, 3, 'https://assets.adidas.com/images/w_940,f_auto,q_auto/2d296b7db27a4d5a80401ee6f8a00dd3_9366/JV6487_01_laydown.jpg'),
	('Arsenal FC 26/27 Home Jersey', 'Jersey with sweat-wicking Climacool technology for cool, dry comfort.', 'Adidas', 1, 4, 'https://assets.adidas.com/images/w_940,f_auto,q_auto/1dd8c4b45da84663b65eaa7d2c27cb08_9366/JZ3168_01_laydown.jpg'),
	('Arsenal 25/26 Home Jersey', 'A classic Gunners home jersey with intricate details inspired by club history.', 'Adidas', 1, 5, 'https://assets.adidas.com/images/w_940,f_auto,q_auto/d9987c5f70b14d6e8844a20f46f45555_9366/JI9517_01_laydown.jpg'),
	('Arsenal FC 26/27 Away Jersey', 'Jersey with Climacool technology for cool, dry comfort on the pitch.', 'Adidas', 1, 4, 'https://assets.adidas.com/images/w_940,f_auto,q_auto/819116789e5d4f66b879232a2bd1c889_9366/JZ3160_01_laydown.jpg'),
	('Cristiano Ronaldo Portugal World Cup 2022 Edition Signed Shirt', 'Step into the realm of football legends with our Cristiano Ronaldo Portugal World Cup 2022 Edition Signed Shirt. This is not just a shirt; it is a piece of art, a fragment of history, and a symbol of Ronaldos iconic status in Portugals football legacy.', 'Puma', 2, 5, 'https://thefootballautograph.com/cdn/shop/products/Ronaldo__2_1024x1024.jpg?v=1674762989'),
	('Lionel Messi Argentina World Cup 2022 Edition Signed Shirt', 'Step into the realm of football legends with our Messi Argentina World Cup 2022 Edition Signed Shirt. This is not just a shirt; it is a piece of art, a fragment of history, and a symbol of Messis iconic triumph in the 2022 World Cup.', 'Adidas',  2, 5, 'https://thefootballautograph.com/cdn/shop/products/Messi__2_1024x1024.jpg?v=1674762747'),
	('Kylian Mbappé Signed France Shirt – World Cup 2026 Edition', 'Own an exceptional piece of football history with this authentic France national team shirt personally signed by Kylian Mbappé. Celebrating the talent, speed, and achievements of one of football’s most electrifying players, this exclusive collectible is a must-have for fans, collectors, and investors alike.', 'Nike', 2, 5, 'https://thefootballautograph.com/cdn/shop/files/image00058_1024x1024.jpg?v=1780922057'),
	('South Africa 26 Away Jersey', 'A South Africa jersey made with smooth tricot fabric for comfortable play and support.', 'Adidas', 2, 6, 'https://assets.adidas.com/images/w_940,f_auto,q_auto/604aed58922049efa38354b96a811041_9366/KY2217_01_laydown.jpg'),
	('Argentina 26 Home Jersey', 'Celebrate your teams champion legacy in a slim-fit jersey with 3 stars.', 'Adidas', 2, 6, 'https://assets.adidas.com/images/w_940,f_auto,q_auto/20f23eb7f4df4dd4958601c064ffa0d8_9366/JM8396_01_laydown.jpg'),
	('Authentic Portugal FPF 2026 Jersey - Home', 'The main shirt of Portugals official uniform for the 2026 FIFA World Cup, made with ultraweave fabric used in players uniforms for its lightness and breathability.', 'Puma', 2, 6, 'https://1216451790.rsc.cdn77.org/temp/1766144997_70ce1247585c5200eda0bfd65538ade7.jpg'),
	('Fifa World Cup 2026 France Home', 'This stylish black and blue soccer jersey is perfect for fans looking to celebrate their team in comfort and style. Elevate your game day experience and stand out in the crowd with this must-have football cosplay outfit.', 'Nike', 2, 6, 'https://www.cosplaycostume.com/media/catalog/product/cache/31/image/585x/040ec09b1e35df139433887a97daa66f/i/m/image_hlw-wc2026-fra-blkblue-fanhome-1.jpg'),
	('Spain 26 Away Jersey', 'Support your team in a heritage-inspired, slim-fit jersey with a crew neck and Climacool.', 'Adidas', 2, 6, 'https://assets.adidas.com/images/w_940,f_auto,q_auto/bd5df1921ea949959726a54386f5445b_9366/JN4397_01_laydown.jpg'),
	('Fifa World Cup 2026 South Korea Home Fan Jersey Football', 'This vibrant red soccer jersey is perfect for fans looking to celebrate their team during the tournament. Made for comfort and performance, its the ultimate choice for any passionate South Korean football enthusiast.', 'Nike', 2, 6, 'https://www.cosplaycostume.com/media/catalog/product/cache/31/image/585x/040ec09b1e35df139433887a97daa66f/i/m/image_hlw-wc2026-kor-red-fanhome-1.jpg'),
	('Fifa World Cup 2026 Morocco Home Player Jersey Football', 'This vibrant red jersey showcases your support for Morocco while providing ultimate comfort and style for any football event. Perfect for cosplay or cheering from the stands, this jersey is a must-have for every dedicated supporter.', 'Puma', 2, 6, 'https://www.cosplaycostume.com/media/catalog/product/cache/31/image/585x/040ec09b1e35df139433887a97daa66f/i/m/image_hlw-wc2026-mor-red-playerhome-1.jpg'),
	('Fifa World Cup 2026 Austria Home Fan Jersey Football', 'This vibrant red and black jersey combines comfort and authenticity, making it perfect for game day or cosplay events. Elevate your fan experience and showcase your team pride with this must-have Austria soccer jersey!', 'Puma', 2, 6, 'https://www.cosplaycostume.com/media/catalog/product/cache/31/image/585x/040ec09b1e35df139433887a97daa66f/i/m/image_hlw-wc2026-at-redblk-fanhome-1.jpg'),
	('Fifa World Cup 2026 Belgium Home Player Jersey Football', 'This vibrant red and yellow jersey showcases your support for the Belgian national team while providing ultimate comfort and style. Perfect for cosplay or cheering from the stands, this football costume is a must-have for every fan looking to celebrate their teams journey to victory!', 'Adidas', 2, 6, 'https://www.cosplaycostume.com/media/catalog/product/cache/31/image/585x/040ec09b1e35df139433887a97daa66f/i/m/image_hlw-wc2026-be-redyllw-playerhome-1.jpg'),
	('Orlando Pirates 25/26 Home Jersey', 'AEROREADY tech keeps you dry — from match day to everyday.', 'Adidas', 3, 7, 'https://assets.adidas.com/images/w_940,f_auto,q_auto/b5e836b11be14ea59476eb768f337fc2_9366/JI7289_01_laydown.jpg'),
	('Orlando Pirates 25/26 Away Jersey', 'AEROREADY tech keeps you dry — from match day to everyday.', 'Adidas', 3, 7, 'https://assets.adidas.com/images/w_940,f_auto,q_auto/bdd6ebf46c4c44c5a3eeebb0f08abcce_9366/JI7285_01_laydown.jpg'),
	('Orlando Pirates 26/27 Home Jersey', 'Jersey with Climacool technology for cool, dry and distraction-free performance.', 'Adidas', 3, 7, 'https://assets.adidas.com/images/w_940,f_auto,q_auto/af6a3a79c6544925a07f17c83fdd299e_9366/KB1980_25_model.jpg'),
	('Orlando Pirates 26/27 Away Jersey', 'Jersey with Climacool technology for cool and comfortable wear.', 'Adidas', 3, 7, 'https://assets.adidas.com/images/w_1880,f_auto,q_auto/60ab31b415d04e93a5348d9acd46b735_9366/KC7457_21_model.jpg'),
	('Kappa Mens Kaizer Chiefs Away 26/27 Black/Yellow Stadium Jersey', 'Built for the gold and black faithful, the Kaizer Chiefs Men’s KOMBAT™ 2027 Game Shirt brings together performance comfort, bold club identity and modern football style.', 'Kappa', 3, 7, 'https://thefoschini.vtexassets.com/arquivos/ids/227088959-1200-1600?v=639204201127870000&width=1200&height=1600&aspect=true'),
	('Kappa Mens Kaizer Chiefs Home 26/27 Yellow/Black Stadium Jersey Kappa', 'Made from recycled textured fabric, this regular fit shirt offers a breathable feel with a premium football finish, making it ideal for match days, stadium moments and everyday wear.', 'Kappa', 3, 7, 'https://thefoschini.vtexassets.com/arquivos/ids/227089709-1200-1600?v=639204409011170000&width=1200&height=1600&aspect=true'),
	('Kappa Mens Kaizer Chiefs Away 25/26 Grey Stadium Jersey', 'Show your support in style with this grey jersey. Perfect for match days or casual wear. Stand out with this polyester jersey that is machine washable', 'Kappa', 3, 7, 'https://thefoschini.vtexassets.com/arquivos/ids/219558142-1200-1600?v=638905084885170000&width=1200&height=1600&aspect=true'),
	('Puma Mens Mamelodi Sundowns Home 26/27 Yellow Stadium Jersey', 'Bring the spirit of Mamelodi Sundowns to every match day with the MSFC Mens Home Replica Jersey.', 'Puma', 3, 7, 'https://thefoschini.vtexassets.com/arquivos/ids/227187094-1200-1600?v=639211015307170000&width=1200&height=1600&aspect=true')
	
	
	select * from PRODUCT_TABLE

INSERT INTO PRODUCT_VARIANT(ProductID,ProductSize,Colour,IsSigned,Price,StockQuantity)
VALUES
-- =========================================================
-- Manchester United 25/26 Home Jersey
-- =========================================================
(1, 'SMALL',   'Red', 0, 349.99, 8),
(1, 'MEDIUM',  'Red', 0, 349.99, 18),
(1, 'LARGE',   'Red', 0, 349.99, 24),
(1, 'XLARGE',  'Red', 0, 349.99, 13),
(1, 'XXLARGE', 'Red', 0, 349.99, 5),

-- =========================================================
-- Manchester United 26/27 Away Jersey
-- =========================================================
(2, 'SMALL',   'Red', 0, 379.99, 7),
(2, 'MEDIUM',  'Red', 0, 379.99, 22),
(2, 'LARGE',   'Red', 0, 379.99, 19),
(2, 'XLARGE',  'Red', 0, 379.99, 11),
(2, 'XXLARGE', 'Red', 0, 379.99, 4),

-- =========================================================
-- Manchester United 25/26 Away Jersey
-- =========================================================
(3, 'SMALL',   'White', 0, 369.99, 9),
(3, 'MEDIUM',  'White', 0, 369.99, 20),
(3, 'LARGE',   'White', 0, 369.99, 17),
(3, 'XLARGE',  'White', 0, 369.99, 12),
(3, 'XXLARGE', 'White', 0, 369.99, 6),

-- =========================================================
-- Manchester City 26/27 Away Jersey
-- =========================================================
(4, 'SMALL',   'Black', 0, 429.99, 6),
(4, 'MEDIUM',  'Black', 0, 429.99, 16),
(4, 'LARGE',   'Black', 0, 429.99, 21),
(4, 'XLARGE',  'Black', 0, 429.99, 10),
(4, 'XXLARGE', 'Black', 0, 429.99, 4),

-- =========================================================
-- Manchester City 26/27 Home Jersey
-- =========================================================
(5, 'SMALL',   'Sky Blue', 0, 449.99, 10),
(5, 'MEDIUM',  'Sky Blue', 0, 449.99, 23),
(5, 'LARGE',   'Sky Blue', 0, 449.99, 27),
(5, 'XLARGE',  'Sky Blue', 0, 449.99, 15),
(5, 'XXLARGE', 'Sky Blue', 0, 449.99, 7),

-- =========================================================
-- Liverpool FC 26/27 Home Jersey
-- =========================================================
(6, 'SMALL',   'Red', 0, 459.99, 8),
(6, 'MEDIUM',  'Red', 0, 459.99, 21),
(6, 'LARGE',   'Red', 0, 459.99, 25),
(6, 'XLARGE',  'Red', 0, 459.99, 14),
(6, 'XXLARGE', 'Red', 0, 459.99, 5),

-- =========================================================
-- Liverpool FC 25/26 Home Jersey
-- =========================================================
(7, 'SMALL',   'Red', 0, 399.99, 7),
(7, 'MEDIUM',  'Red', 0, 399.99, 19),
(7, 'LARGE',   'Red', 0, 399.99, 23),
(7, 'XLARGE',  'Red', 0, 399.99, 12),
(7, 'XXLARGE', 'Red', 0, 399.99, 4),

-- =========================================================
-- Liverpool FC 25/26 Away Jersey
-- =========================================================
(8, 'SMALL',   'White', 0, 389.99, 9),
(8, 'MEDIUM',  'White', 0, 389.99, 17),
(8, 'LARGE',   'White', 0, 389.99, 20),
(8, 'XLARGE',  'White', 0, 389.99, 11),
(8, 'XXLARGE', 'White', 0, 389.99, 5),

-- =========================================================
-- Arsenal FC 26/27 Home Jersey
-- =========================================================
(9, 'SMALL',   'Red', 0, 449.99, 8),
(9, 'MEDIUM',  'Red', 0, 449.99, 22),
(9, 'LARGE',   'Red', 0, 449.99, 26),
(9, 'XLARGE',  'Red', 0, 449.99, 14),
(9, 'XXLARGE', 'Red', 0, 449.99, 6),

-- =========================================================
-- Arsenal 25/26 Home Jersey
-- =========================================================
(10, 'SMALL',   'Red', 0, 419.99, 7),
(10, 'MEDIUM',  'Red', 0, 419.99, 18),
(10, 'LARGE',   'Red', 0, 419.99, 21),
(10, 'XLARGE',  'Red', 0, 419.99, 13),
(10, 'XXLARGE', 'Red', 0, 419.99, 5),

-- =========================================================
-- Arsenal FC 26/27 Away Jersey
-- =========================================================
(11, 'SMALL',   'Yellow', 0, 439.99, 6),
(11, 'MEDIUM',  'Yellow', 0, 439.99, 17),
(11, 'LARGE',   'Yellow', 0, 439.99, 20),
(11, 'XLARGE',  'Yellow', 0, 439.99, 12),
(11, 'XXLARGE', 'Yellow', 0, 439.99, 4),

-- =========================================================
-- Cristiano Ronaldo Signed Portugal Shirt
-- =========================================================
(12, 'MEDIUM',  'Red', 1, 899.99, 4),
(12, 'LARGE',   'Red', 1, 899.99, 6),
(12, 'XLARGE',  'Red', 1, 899.99, 3),

-- =========================================================
-- Lionel Messi Signed Argentina Shirt
-- =========================================================
(13, 'MEDIUM',  'Sky Blue/White', 1, 849.99, 5),
(13, 'LARGE',   'Sky Blue/White', 1, 849.99, 4),
(13, 'XLARGE',  'Sky Blue/White', 1, 849.99, 2),

-- =========================================================
--  Kylian Mbappé Signed France Shirt
-- =========================================================
(14, 'MEDIUM',  'Blue', 1, 799.99, 4),
(14, 'LARGE',   'Blue', 1, 799.99, 5),
(14, 'XLARGE',  'Blue', 1, 799.99, 2),

-- =========================================================
-- South Africa 26 Away Jersey
-- =========================================================
(15, 'SMALL',   'Green', 0, 399.99, 9),
(15, 'MEDIUM',  'Green', 0, 399.99, 20),
(15, 'LARGE',   'Green', 0, 399.99, 24),
(15, 'XLARGE',  'Green', 0, 399.99, 13),
(15, 'XXLARGE', 'Green', 0, 399.99, 5),

-- =========================================================
-- Argentina 26 Home Jersey
-- =========================================================
(16, 'SMALL',   'Sky Blue/White', 0, 429.99, 8),
(16, 'MEDIUM',  'Sky Blue/White', 0, 429.99, 21),
(16, 'LARGE',   'Sky Blue/White', 0, 429.99, 26),
(16, 'XLARGE',  'Sky Blue/White', 0, 429.99, 15),
(16, 'XXLARGE', 'Sky Blue/White', 0, 429.99, 6),

-- =========================================================
-- Portugal FPF 2026 Home Jersey
-- =========================================================
(17, 'SMALL',   'Red', 0, 419.99, 7),
(17, 'MEDIUM',  'Red', 0, 419.99, 18),
(17, 'LARGE',   'Red', 0, 419.99, 23),
(17, 'XLARGE',  'Red', 0, 419.99, 12),
(17, 'XXLARGE', 'Red', 0, 419.99, 4),

-- =========================================================
-- France 2026 Home Jersey
-- =========================================================
(18, 'SMALL',   'Blue', 0, 409.99, 8),
(18, 'MEDIUM',  'Blue', 0, 409.99, 19),
(18, 'LARGE',   'Blue', 0, 409.99, 22),
(18, 'XLARGE',  'Blue', 0, 409.99, 13),
(18, 'XXLARGE', 'Blue', 0, 409.99, 5),

-- =========================================================
-- Spain 26 Away Jersey
-- =========================================================
(19, 'SMALL',   'Red', 0, 399.99, 7),
(19, 'MEDIUM',  'Red', 0, 399.99, 18),
(19, 'LARGE',   'Red', 0, 399.99, 21),
(19, 'XLARGE',  'Red', 0, 399.99, 11),
(19, 'XXLARGE', 'Red', 0, 399.99, 4),

-- =========================================================
-- South Korea 2026 Home Jersey
-- =========================================================
(20, 'SMALL',   'Red', 0, 379.99, 9),
(20, 'MEDIUM',  'Red', 0, 379.99, 20),
(20, 'LARGE',   'Red', 0, 379.99, 24),
(20, 'XLARGE',  'Red', 0, 379.99, 14),
(20, 'XXLARGE', 'Red', 0, 379.99, 5),

-- =========================================================
-- Morocco 2026 Home Jersey
-- =========================================================
(21, 'SMALL',   'Red', 0, 389.99, 8),
(21, 'MEDIUM',  'Red', 0, 389.99, 19),
(21, 'LARGE',   'Red', 0, 389.99, 22),
(21, 'XLARGE',  'Red', 0, 389.99, 12),
(21, 'XXLARGE', 'Red', 0, 389.99, 5),

-- =========================================================
-- Austria 2026 Home Jersey
-- =========================================================
(22, 'SMALL',   'Red/Black', 0, 369.99, 6),
(22, 'MEDIUM',  'Red/Black', 0, 369.99, 17),
(22, 'LARGE',   'Red/Black', 0, 369.99, 20),
(22, 'XLARGE',  'Red/Black', 0, 369.99, 11),
(22, 'XXLARGE', 'Red/Black', 0, 369.99, 4),

-- =========================================================
-- Belgium 2026 Home Jersey
-- =========================================================
(23, 'SMALL',   'Red/Yellow', 0, 399.99, 8),
(23, 'MEDIUM',  'Red/Yellow', 0, 399.99, 18),
(23, 'LARGE',   'Red/Yellow', 0, 399.99, 23),
(23, 'XLARGE',  'Red/Yellow', 0, 399.99, 13),
(23, 'XXLARGE', 'Red/Yellow', 0, 399.99, 5),

-- =========================================================
-- Orlando Pirates 25/26 Home Jersey
-- =========================================================
(24, 'SMALL',   'Black', 0, 349.99, 10),
(24, 'MEDIUM',  'Black', 0, 349.99, 22),
(24, 'LARGE',   'Black', 0, 349.99, 28),
(24, 'XLARGE',  'Black', 0, 349.99, 16),
(24, 'XXLARGE', 'Black', 0, 349.99, 7),

-- =========================================================
-- Orlando Pirates 25/26 Away Jersey
-- =========================================================
(25, 'SMALL',   'White', 0, 359.99, 8),
(25, 'MEDIUM',  'White', 0, 359.99, 19),
(25, 'LARGE',   'White', 0, 359.99, 24),
(25, 'XLARGE',  'White', 0, 359.99, 13),
(25, 'XXLARGE', 'White', 0, 359.99, 5),

-- =========================================================
-- Orlando Pirates 26/27 Home Jersey
-- =========================================================
(26, 'SMALL',   'Black', 0, 429.99, 7),
(26, 'MEDIUM',  'Black', 0, 429.99, 21),
(26, 'LARGE',   'Black', 0, 429.99, 26),
(26, 'XLARGE',  'Black', 0, 429.99, 14),
(26, 'XXLARGE', 'Black', 0, 429.99, 6),

-- =========================================================
-- Orlando Pirates 26/27 Away Jersey
-- =========================================================
(27, 'SMALL',   'White', 0, 419.99, 9),
(27, 'MEDIUM',  'White', 0, 419.99, 20),
(27, 'LARGE',   'White', 0, 419.99, 22),
(27, 'XLARGE',  'White', 0, 419.99, 12),
(27, 'XXLARGE', 'White', 0, 419.99, 4),

-- =========================================================
-- Kaizer Chiefs 26/27 Away Jersey
-- =========================================================
(28, 'SMALL',   'Black/Yellow', 0, 399.99, 7),
(28, 'MEDIUM',  'Black/Yellow', 0, 399.99, 18),
(28, 'LARGE',   'Black/Yellow', 0, 399.99, 23),
(28, 'XLARGE',  'Black/Yellow', 0, 399.99, 13),
(28, 'XXLARGE', 'Black/Yellow', 0, 399.99, 5),

-- =========================================================
-- Kaizer Chiefs 26/27 Home Jersey
-- =========================================================
(29, 'SMALL',   'Yellow/Black', 0, 409.99, 8),
(29, 'MEDIUM',  'Yellow/Black', 0, 409.99, 21),
(29, 'LARGE',   'Yellow/Black', 0, 409.99, 25),
(29, 'XLARGE',  'Yellow/Black', 0, 409.99, 14),
(29, 'XXLARGE', 'Yellow/Black', 0, 409.99, 6),

-- =========================================================
-- Kaizer Chiefs 25/26 Away Jersey
-- =========================================================
(30, 'SMALL',   'Grey', 0, 379.99, 7),
(30, 'MEDIUM',  'Grey', 0, 379.99, 17),
(30, 'LARGE',   'Grey', 0, 379.99, 21),
(30, 'XLARGE',  'Grey', 0, 379.99, 12),
(30, 'XXLARGE', 'Grey', 0, 379.99, 4),

-- =========================================================
-- Mamelodi Sundowns 26/27 Home Jersey
-- =========================================================
(31, 'SMALL',   'Yellow', 0, 399.99, 9),
(31, 'MEDIUM',  'Yellow', 0, 399.99, 20),
(31, 'LARGE',   'Yellow', 0, 399.99, 24),
(31, 'XLARGE',  'Yellow', 0, 399.99, 13),
(31, 'XXLARGE', 'Yellow', 0, 399.99, 5);

select * from PRODUCT_VARIANT;

UPDATE PRODUCT_TABLE
SET ImageURL = 'https://th.bing.com/th/id/OIP.16KhBNamBay6jgsJ3tAHpQHaJL?w=152&h=189&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3'
WHERE ProductID = 18;

UPDATE PRODUCT_TABLE
SET ImageURL = 'https://th.bing.com/th/id/OIP.zcOA_r73uXJi40V2ezvpwAHaHa?w=179&h=180&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3'
WHERE ProductID = 20;

UPDATE PRODUCT_TABLE
SET ImageURL = 'https://th.bing.com/th/id/OIP.f_dfbwQUEjvmNnmnk5E-KQHaHa?w=198&h=198&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3'
WHERE ProductID = 21;


UPDATE PRODUCT_TABLE
SET ImageURL = 'https://th.bing.com/th/id/OIP.m5We1qFBzHsj356wjh2PowHaHa?w=217&h=216&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3'
WHERE ProductID = 22;

UPDATE PRODUCT_TABLE
SET ImageURL = 'https://th.bing.com/th/id/OIP.vY_jb7nlmYe5xsPIoidnAAAAAA?w=127&h=180&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3'
WHERE ProductID = 23;


ALTER TABLE USER_TABLE
DROP CONSTRAINT UQ__USER_TAB__536C85E4097E281D

ALTER TABLE USER_TABLE
DROP COLUMN Username

INSERT ROLE_TABLE(RoleName)
VALUES('Customer'),
('Administrator')

/*latest change*/
ALTER TABLE PRODUCT_TABLE
ADD ShirtHistory VARCHAR(5000);

-- ==========================================
-- SHIRT HISTORY FOR SPORTSNET PRODUCTS
-- ==========================================

UPDATE PRODUCT_TABLE
SET ShirtHistory =
'Manchester United began in 1878 as Newton Heath LYR Football Club before becoming Manchester United in 1902. The club moved to Old Trafford in 1910 and has since developed one of the most recognisable identities in English football. The famous red home shirt has remained an important part of that identity throughout the club''s history.'
WHERE ProductID = 1;


UPDATE PRODUCT_TABLE
SET ShirtHistory =
'Manchester United''s away shirts have provided an opportunity for different colours and designs while remaining connected to the club''s identity. The club''s history includes major eras under managers such as Sir Matt Busby and Sir Alex Ferguson. Away shirts have therefore become an important part of the visual history of the club.'
WHERE ProductID = 2;


UPDATE PRODUCT_TABLE
SET ShirtHistory =
'Manchester United''s away kits have changed considerably across different generations of the club. While the home shirt is traditionally associated with red, away designs have allowed the club to introduce different colours and styles. This shirt continues that tradition of giving supporters an alternative way to represent the club.'
WHERE ProductID = 3;


UPDATE PRODUCT_TABLE
SET ShirtHistory =
'Manchester City was formed in the late nineteenth century and has developed from a local football club into one of England''s major clubs. The club is strongly associated with its sky-blue home colours. Manchester City''s modern history has included major domestic and European success, making its shirts an important part of its changing football identity.'
WHERE ProductID = 4;


UPDATE PRODUCT_TABLE
SET ShirtHistory =
'Manchester City''s traditional home identity is closely connected with sky blue. Over the decades, the club has used different designs while retaining this distinctive colour. The home shirt represents the club''s long connection with Manchester and its supporters.'
WHERE ProductID = 5;


UPDATE PRODUCT_TABLE
SET ShirtHistory =
'Liverpool Football Club was officially established on 3 June 1892 following a split from Everton. Anfield became the club''s home and remains central to Liverpool''s identity. The famous red shirt has become one of the most recognisable symbols of the club and its long footballing history.'
WHERE ProductID = 6;


UPDATE PRODUCT_TABLE
SET ShirtHistory =
'Liverpool''s home shirts have traditionally been dominated by the club''s famous red colour. Across generations, the design has changed while maintaining a strong connection to Anfield and the supporters. Liverpool''s long history of domestic and European success has made the red shirt an important symbol of the club.'
WHERE ProductID = 7;


UPDATE PRODUCT_TABLE
SET ShirtHistory =
'Liverpool away shirts have traditionally provided a contrast to the famous red home kit. Different eras have introduced a variety of colours and designs while maintaining the club''s identity. Away shirts have become part of the visual history of Liverpool and its many generations of supporters.'
WHERE ProductID = 8;


UPDATE PRODUCT_TABLE
SET ShirtHistory =
'Arsenal was founded in 1886 and has a long history in English football. The club''s traditional red-and-white colours have become strongly associated with its identity. Arsenal''s shirts have changed through different eras while retaining links to the club''s historic colours and traditions.'
WHERE ProductID = 9;


UPDATE PRODUCT_TABLE
SET ShirtHistory =
'Arsenal''s home shirt is closely connected to the club''s traditional red body and white sleeves. This colour combination has become one of the most recognisable identities in English football. Over the years, different manufacturers and designers have introduced new interpretations while maintaining the familiar Arsenal look.'
WHERE ProductID = 10;


UPDATE PRODUCT_TABLE
SET ShirtHistory =
'Arsenal away shirts have provided some of the club''s most varied designs over the years. Different colours and patterns have been used to distinguish the away kit from the traditional red-and-white home shirt. These designs form part of the changing visual history of the Gunners.'
WHERE ProductID = 11;


UPDATE PRODUCT_TABLE
SET ShirtHistory =
'Portugal''s national team has developed a strong football identity built around its red national colours. Cristiano Ronaldo became one of the defining players of Portuguese football and represented Portugal at multiple World Cups. The 2022 World Cup shirt is particularly significant to collectors because it represents an era in which Ronaldo was one of the country''s most recognisable football figures.'
WHERE ProductID = 12;


UPDATE PRODUCT_TABLE
SET ShirtHistory =
'Argentina''s national team has a remarkable World Cup history, winning the tournament in 1978, 1986 and 2022. Lionel Messi played a central role in the 2022 triumph, captaining Argentina to victory in Qatar. The 2022 shirt therefore represents one of the most memorable moments in modern Argentine football history.'
WHERE ProductID = 13;


UPDATE PRODUCT_TABLE
SET ShirtHistory =
'France has won the FIFA World Cup in 1998, 2018 and reached the 2022 final. Kylian Mbappe became one of the defining players of the modern French national team and scored a hat-trick in the 2022 World Cup final. A France shirt associated with Mbappe therefore represents an important period in the history of French football.'
WHERE ProductID = 14;


UPDATE PRODUCT_TABLE
SET ShirtHistory =
'South Africa''s national football team is known as Bafana Bafana. The team became especially significant on the world stage after South Africa hosted the 2010 FIFA World Cup, becoming the first African country to host the tournament. South African national-team shirts represent an important part of the country''s football identity.'
WHERE ProductID = 15;


UPDATE PRODUCT_TABLE
SET ShirtHistory =
'Argentina''s famous sky-blue-and-white colours have been part of the national team''s identity for generations. The national team won the World Cup in 1978 and 1986 before Lionel Messi helped Argentina win its third World Cup in 2022. The three stars now associated with the national team represent those World Cup victories.'
WHERE ProductID = 16;


UPDATE PRODUCT_TABLE
SET ShirtHistory =
'Portugal''s national football identity is strongly associated with its red national colours and the Portuguese Football Federation. The country has produced many famous players and has competed regularly at major international tournaments. Portugal''s modern shirts represent a national football tradition that continues to develop across different generations.'
WHERE ProductID = 17;


UPDATE PRODUCT_TABLE
SET ShirtHistory =
'France has a long tradition in international football and won its first FIFA World Cup on home soil in 1998. The national team later won the tournament again in 2018. French shirts have become associated with generations of players who have represented the country on the international stage.'
WHERE ProductID = 18;


UPDATE PRODUCT_TABLE
SET ShirtHistory =
'Spain has developed a distinctive national football identity and is commonly known as La Roja because of its red colours. The Spanish national team has enjoyed major success in international football, including winning the 2010 FIFA World Cup. Spain''s shirts therefore represent a significant part of the country''s football culture.'
WHERE ProductID = 19;


UPDATE PRODUCT_TABLE
SET ShirtHistory =
'South Korea has a long history of participation in international football and has become one of Asia''s most recognisable national teams. The team''s traditional red colour has become closely associated with Korean football supporters. World Cup shirts have played an important role in representing the country on the international stage.'
WHERE ProductID = 20;


UPDATE PRODUCT_TABLE
SET ShirtHistory =
'Morocco has a proud football tradition and became the first African nation to reach a FIFA World Cup semi-final in 2022. The Moroccan national team is commonly known as the Atlas Lions. Red has become strongly associated with the national team, making its shirts an important symbol of Moroccan football identity.'
WHERE ProductID = 21;


UPDATE PRODUCT_TABLE
SET ShirtHistory =
'Austria has a long history in international football and has represented the country at numerous major tournaments. The national team is traditionally associated with red and white colours. Austria''s football shirts reflect the country''s national identity and its place in European football.'
WHERE ProductID = 22;


UPDATE PRODUCT_TABLE
SET ShirtHistory =
'Belgium''s national team, commonly known as the Red Devils, has developed a strong identity around its red colours. The team has produced several generations of highly recognised international players. Belgium''s World Cup shirts represent the country''s continuing presence in international football.'
WHERE ProductID = 23;


UPDATE PRODUCT_TABLE
SET ShirtHistory =
'Orlando Pirates were established in 1937 and have become one of South Africa''s best-known football clubs. The club is based in Johannesburg and is traditionally associated with black colours. Its history includes numerous domestic competitions and a strong supporter culture.'
WHERE ProductID = 24;


UPDATE PRODUCT_TABLE
SET ShirtHistory =
'Orlando Pirates have traditionally used black as a major part of their football identity. Across different generations, the club''s home shirts have changed in design while maintaining the familiar black identity. The shirts are closely connected with the club''s long history and its supporters.'
WHERE ProductID = 25;


UPDATE PRODUCT_TABLE
SET ShirtHistory =
'Orlando Pirates'' modern shirts continue the club''s tradition of using black as a central colour. The club has a long history in South African football and has developed a strong identity both domestically and internationally. Each generation of shirts reflects the changing design of the club while preserving its recognisable identity.'
WHERE ProductID = 26;


UPDATE PRODUCT_TABLE
SET ShirtHistory =
'Orlando Pirates away shirts have allowed the club to experiment with different designs while remaining connected to its traditional identity. The club''s history stretches back to 1937 and includes generations of players and supporters. Away shirts form part of the visual history of this famous South African club.'
WHERE ProductID = 27;


UPDATE PRODUCT_TABLE
SET ShirtHistory =
'Kaizer Chiefs were officially established on 7 January 1970 in Soweto by Kaizer Motaung. The club quickly became an important force in South African football, winning its first league title in 1974. The club''s gold and black colours have become strongly associated with the Kaizer Chiefs identity.'
WHERE ProductID = 28;


UPDATE PRODUCT_TABLE
SET ShirtHistory =
'Kaizer Chiefs'' traditional gold and black colours are an important part of the club''s identity. Since its establishment in 1970, the club has developed a large supporter base and a significant history in South African football. Different generations of home and away shirts have reflected changing football fashion while retaining the familiar club colours.'
WHERE ProductID = 29;


UPDATE PRODUCT_TABLE
SET ShirtHistory =
'Kaizer Chiefs away shirts have featured different designs throughout the club''s history while continuing to represent the Amakhosi identity. The club was founded by Kaizer Motaung in Soweto in 1970 and quickly established itself in South African football. The shirts remain closely connected with the club''s gold-and-black tradition.'
WHERE ProductID = 30;


UPDATE PRODUCT_TABLE
SET ShirtHistory =
'Mamelodi Sundowns were established in the early 1960s by a group of young footballers from around Marabastad in Pretoria. The club later became one of South Africa''s most successful football teams and has developed a strong identity around its yellow and blue colours. Sundowns'' shirts represent the club''s long journey from its early beginnings to the modern era.'
WHERE ProductID = 31;

select * from PRODUCT_TABLE;


/*FOR WHEN YOU ALREADY HAVE THE DATABASE JUST UPDATE OTHERWISE SEE Group_Database(1)*/
/*Reviews where not run too due to possible conlict**/
UPDATE PRODUCT_VARIANT
SET Price = 1349.99
WHERE ProductID = 1

UPDATE PRODUCT_VARIANT
SET Price = 1379.99
WHERE ProductID = 2

UPDATE PRODUCT_VARIANT
SET Price =  1369.99
WHERE ProductID = 3

UPDATE PRODUCT_VARIANT
SET Price = 1429.99
WHERE ProductID = 4

UPDATE PRODUCT_VARIANT
SET Price = 1449.99
WHERE ProductID = 5

UPDATE PRODUCT_VARIANT
SET Price = 1459.99
WHERE ProductID = 6

UPDATE PRODUCT_VARIANT
SET Price = 1399.99
WHERE ProductID = 7

UPDATE PRODUCT_VARIANT
SET Price = 1389.99
WHERE ProductID = 8

UPDATE PRODUCT_VARIANT
SET Price =  1449.99
WHERE ProductID = 9

UPDATE PRODUCT_VARIANT
SET Price =  1419.99
WHERE ProductID = 10

UPDATE PRODUCT_VARIANT
SET Price =  1439.99
WHERE ProductID = 11

UPDATE PRODUCT_VARIANT
SET Price =  2899.99
WHERE ProductID = 12


UPDATE PRODUCT_VARIANT
SET Price =  2849.99
WHERE ProductID = 13


UPDATE PRODUCT_VARIANT
SET Price = 2799.99
WHERE ProductID = 14

UPDATE PRODUCT_VARIANT
SET Price = 1399.99
WHERE ProductID = 15

UPDATE PRODUCT_VARIANT
SET Price = 1429.99
WHERE ProductID = 16

UPDATE PRODUCT_VARIANT
SET Price = 1419.99
WHERE ProductID = 17

UPDATE PRODUCT_VARIANT
SET Price = 1409.99
WHERE ProductID = 18

UPDATE PRODUCT_VARIANT
SET Price = 1399.99
WHERE ProductID = 19

UPDATE PRODUCT_VARIANT
SET Price = 1379.99
WHERE ProductID = 20


UPDATE PRODUCT_VARIANT
SET Price = 1389.99
WHERE ProductID = 21

UPDATE PRODUCT_VARIANT
SET Price = 1369.99
WHERE ProductID = 22

UPDATE PRODUCT_VARIANT
SET Price = 1399.99
WHERE ProductID = 23

UPDATE PRODUCT_VARIANT
SET Price = 1349.99
WHERE ProductID = 24

UPDATE PRODUCT_VARIANT
SET Price = 1359.99
WHERE ProductID = 25

UPDATE PRODUCT_VARIANT
SET Price = 1429.99
WHERE ProductID = 26

UPDATE PRODUCT_VARIANT
SET Price = 1419.99
WHERE ProductID = 27

UPDATE PRODUCT_VARIANT
SET Price = 1399.99
WHERE ProductID = 28

UPDATE PRODUCT_VARIANT
SET Price = 1409.99
WHERE ProductID = 29

UPDATE PRODUCT_VARIANT
SET Price = 1379.99
WHERE ProductID = 30

UPDATE PRODUCT_VARIANT
SET Price = 1399.99
WHERE ProductID = 31

INSERT INTO USER_TABLE(UserPassword, FirstName, LastName, UserEmail, UserPhoneNumber, RoleID)
VALUES('1F31B0339047A238A9BA02ABC256176C','Jane','Henry','jane@sportsnet.com','0813732002',2);


