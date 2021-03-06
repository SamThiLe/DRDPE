USE [master]
GO
/****** Object:  Database [PastryEmporium]    Script Date: 2018-11-04 9:27:30 PM ******/
DROP DATABASE IF EXISTS [PastryEmporium]
GO
CREATE DATABASE [PastryEmporium]
GO
USE [PastryEmporium]
GO
/****** Object:  Table [dbo].[Addresses]    Script Date: 2018-11-04 9:27:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Addresses](
	[addressId] [int] IDENTITY(1,1) NOT NULL,
	[street] [nvarchar](50) NOT NULL,
	[city] [nvarchar](50) NOT NULL,
	[stateProv] [nvarchar](50) NOT NULL,
	[country] [nvarchar](20) NOT NULL,
	[postalCode] [nvarchar](15) NOT NULL,
	[addressType] [nvarchar](10) NOT NULL,
	[customerId] [int] NOT NULL,
	[effectiveDate] [date] NOT NULL,
	[AdditionalNo] [nvarchar](50) NULL,
 CONSTRAINT [PK_addresses] PRIMARY KEY CLUSTERED 
(
	[addressId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[adminLogin]    Script Date: 2018-11-04 9:27:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[adminLogin](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[email] [nvarchar](50) NOT NULL,
	[password] [nvarchar](15) NOT NULL,
 CONSTRAINT [PK_adminLogin] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 2018-11-04 9:27:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[cartId] [int] IDENTITY(1,1) NOT NULL,
	[dateCreated] [datetime] NOT NULL,
	[orderDate] [date] NULL,
	[orderStatus] [int] NOT NULL,
	[customerId] [int] NULL,
 CONSTRAINT [PK_Cart] PRIMARY KEY CLUSTERED 
(
	[cartId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CartItems]    Script Date: 2018-11-04 9:27:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CartItems](
	[cartItemId] [int] IDENTITY(1,1) NOT NULL,
	[cartId] [int] NOT NULL,
	[productId] [int] NOT NULL,
	[qty] [int] NOT NULL,
	[historicalPrice] [decimal](18, 2) NOT NULL,
	[promotionCode] [nvarchar](10) NULL,
	[itemStatus] [nchar](2) NOT NULL,
 CONSTRAINT [PK_CartItems] PRIMARY KEY CLUSTERED 
(
	[cartItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 2018-11-04 9:27:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[categoryId] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[description] [nvarchar](max) NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[categoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 2018-11-04 9:27:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[customerId] [int] IDENTITY(1,1) NOT NULL,
	[email] [nvarchar](50) NOT NULL,
	[username] [nvarchar](15) NOT NULL,
	[password] [nvarchar](15) NOT NULL,
	[firstName] [nvarchar](50) NOT NULL,
	[lastName] [nvarchar](50) NOT NULL,
	[phone] [nvarchar](14) NOT NULL,
	[middleInitial] [char](1) NULL,
	[verificationToken] [nvarchar](50) NOT NULL,
	[verified] [bit] NOT NULL,
	[archived] [bit] NOT NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[customerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderHistory]    Script Date: 2018-11-04 9:27:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderHistory](
	[orderHistoryId] [int] IDENTITY(1,1) NOT NULL,
	[cartId] [int] NOT NULL,
	[shippingAddress] [int] NOT NULL,
	[payType] [nvarchar](2) NOT NULL,
	[authNumber] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_OrderHistory] PRIMARY KEY CLUSTERED 
(
	[orderHistoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 2018-11-04 9:27:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[productId] [int] IDENTITY(1000,1) NOT NULL,
	[productName] [nvarchar](50) NOT NULL,
	[briefDescription] [nvarchar](max) NOT NULL,
	[fullDescription] [nvarchar](max) NOT NULL,
	[statusCode] [char](1) NOT NULL,
	[price] [money] NOT NULL,
	[featured] [bit] NOT NULL,
	[categoryId] [int] NOT NULL,
	[imageId] [int] NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[productId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SiteImages]    Script Date: 2018-11-04 9:27:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SiteImages](
	[imageId] [int] IDENTITY(1,1) NOT NULL,
	[imageName] [nvarchar](50) NOT NULL,
	[imageUrl] [nvarchar](200) NOT NULL,
	[uploadDate] [datetime] NOT NULL,
	[altText] [nvarchar](50) NOT NULL,
	[approved] [bit] NOT NULL,
	[active] [bit] NOT NULL,
	[uploadedBy] [int] NOT NULL,
 CONSTRAINT [PK_SiteImages] PRIMARY KEY CLUSTERED 
(
	[imageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Addresses] ON 
GO
INSERT [dbo].[Addresses] ([addressId], [street], [city], [stateProv], [country], [postalCode], [addressType], [customerId], [effectiveDate], [AdditionalNo]) VALUES (1, N'123 Fake Street', N'FakeCity', N'FakeProv', N'Canada', N'E1C7W9', N'Billing', 1, CAST(N'2018-11-04' AS Date), NULL)
GO
INSERT [dbo].[Addresses] ([addressId], [street], [city], [stateProv], [country], [postalCode], [addressType], [customerId], [effectiveDate], [AdditionalNo]) VALUES (2, N'123 Fake Street', N'FakeCity', N'FakeProv', N'Canada', N'E1C7W9', N'Billing', 2, CAST(N'2018-11-04' AS Date), NULL)
GO
INSERT [dbo].[Addresses] ([addressId], [street], [city], [stateProv], [country], [postalCode], [addressType], [customerId], [effectiveDate], [AdditionalNo]) VALUES (3, N'123 Fake Street', N'FakeCity', N'FakeProv', N'Canada', N'E1C7W9', N'Billing', 3, CAST(N'2018-11-04' AS Date), NULL)
GO
INSERT [dbo].[Addresses] ([addressId], [street], [city], [stateProv], [country], [postalCode], [addressType], [customerId], [effectiveDate], [AdditionalNo]) VALUES (4, N'123 Fake Street', N'FakeCity', N'FakeProv', N'Canada', N'E1C7W9', N'Billing', 4, CAST(N'2018-11-04' AS Date), NULL)
GO
SET IDENTITY_INSERT [dbo].[Addresses] OFF
GO
SET IDENTITY_INSERT [dbo].[adminLogin] ON 
GO
INSERT [dbo].[adminLogin] ([id], [email], [password]) VALUES (1, N'wolfe.winters@gmail.com', N'admin')
GO
INSERT [dbo].[adminLogin] ([id], [email], [password]) VALUES (2, N'poirier_justin@hotmail.com', N'admin')
GO
INSERT [dbo].[adminLogin] ([id], [email], [password]) VALUES (3, N'samuelthile@gmail.com', N'admin')
GO
SET IDENTITY_INSERT [dbo].[adminLogin] OFF
GO
SET IDENTITY_INSERT [dbo].[Cart] ON 
GO
INSERT [dbo].[Cart] ([cartId], [dateCreated], [orderDate], [orderStatus], [customerId]) VALUES (1, CAST(N'2018-11-04T21:26:50.093' AS DateTime), CAST(N'2018-11-04' AS Date), 1, NULL)
GO
SET IDENTITY_INSERT [dbo].[Cart] OFF
GO
SET IDENTITY_INSERT [dbo].[CartItems] ON 
GO
INSERT [dbo].[CartItems] ([cartItemId], [cartId], [productId], [qty], [historicalPrice], [promotionCode], [itemStatus]) VALUES (1, 1, 1001, 1, CAST(3.50 AS Decimal(18, 2)), NULL, N'AV')
GO
SET IDENTITY_INSERT [dbo].[CartItems] OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 
GO
INSERT [dbo].[Categories] ([categoryId], [name], [description]) VALUES (1, N'Loaf', N'loaves of bread')
GO
INSERT [dbo].[Categories] ([categoryId], [name], [description]) VALUES (2, N'Square', N'dessert squares')
GO
INSERT [dbo].[Categories] ([categoryId], [name], [description]) VALUES (3, N'Cake', N'a list of delicious cakes')
GO
INSERT [dbo].[Categories] ([categoryId], [name], [description]) VALUES (4, N'Buns', N'A list of warm buns')
GO
INSERT [dbo].[Categories] ([categoryId], [name], [description]) VALUES (5, N'Danish', N'A list of sweet pastries')
GO
INSERT [dbo].[Categories] ([categoryId], [name], [description]) VALUES (6, N'Muffin', N'A list of fresh muffins')
GO
INSERT [dbo].[Categories] ([categoryId], [name], [description]) VALUES (7, N'Croissant', N'A list of flakey croissants')
GO
INSERT [dbo].[Categories] ([categoryId], [name], [description]) VALUES (8, N'Donut', N'A list of delightful donuts')
GO
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Customers] ON 
GO
INSERT [dbo].[Customers] ([customerId], [email], [username], [password], [firstName], [lastName], [phone], [middleInitial], [verificationToken], [verified], [archived]) VALUES (1, N'test@test.com', N'admin', N'admin', N'test', N'test', N'(902) 456-7894', N't', N'testverificationtoken', 1, 0)
GO
INSERT [dbo].[Customers] ([customerId], [email], [username], [password], [firstName], [lastName], [phone], [middleInitial], [verificationToken], [verified], [archived]) VALUES (2, N'doop@test.com', N'admin2', N'admin', N'Bob', N'Billy', N'(902) 456-1231', N'R', N'testverificationtoken', 1, 0)
GO
INSERT [dbo].[Customers] ([customerId], [email], [username], [password], [firstName], [lastName], [phone], [middleInitial], [verificationToken], [verified], [archived]) VALUES (3, N'test@test.com', N'sala1', N'admin', N'John', N'Salazar', N'(902) 425-4564', N'Q', N'testverificationtoken', 1, 0)
GO
INSERT [dbo].[Customers] ([customerId], [email], [username], [password], [firstName], [lastName], [phone], [middleInitial], [verificationToken], [verified], [archived]) VALUES (4, N'test@test.com', N'raine', N'admin', N'Miranda', N'Raine', N'(902) 456-7159', N'M', N'testverificationtoken', 1, 0)
GO
SET IDENTITY_INSERT [dbo].[Customers] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 
GO
INSERT [dbo].[Products] ([productId], [productName], [briefDescription], [fullDescription], [statusCode], [price], [featured], [categoryId], [imageId]) VALUES (1001, N'White Bread', N'A loaf of white bread', N'A delicious home made loaf of white bread using the finest ingredients', N'1', 3.5000, 1, 1, 2)
GO
INSERT [dbo].[Products] ([productId], [productName], [briefDescription], [fullDescription], [statusCode], [price], [featured], [categoryId], [imageId]) VALUES (1002, N'Brown Bread', N'A loaf of Brown bread', N'A delicious home made loaf of brown bread using the finest ingredients', N'1', 4.5000, 1, 1, 3)
GO
INSERT [dbo].[Products] ([productId], [productName], [briefDescription], [fullDescription], [statusCode], [price], [featured], [categoryId], [imageId]) VALUES (1003, N'Rye Bread', N'A loaf of Rye bread', N'A delicious home made loaf of rye bread using the finest ingredients', N'1', 5.5000, 0, 1, 4)
GO
INSERT [dbo].[Products] ([productId], [productName], [briefDescription], [fullDescription], [statusCode], [price], [featured], [categoryId], [imageId]) VALUES (1004, N'Sourdough Bread', N'A loaf of Sourdough bread', N'A delicious home made loaf of sourdough bread using the finest, hand-picked ingredients', N'1', 3.5000, 0, 1, 5)
GO
INSERT [dbo].[Products] ([productId], [productName], [briefDescription], [fullDescription], [statusCode], [price], [featured], [categoryId], [imageId]) VALUES (1005, N'Whole Wheat Bread', N'A loaf of whole wheat bread', N'A delicious home made loaf of whole wheat bread using the finest, hand-picked ingredients', N'1', 4.5000, 0, 1, 6)
GO
INSERT [dbo].[Products] ([productId], [productName], [briefDescription], [fullDescription], [statusCode], [price], [featured], [categoryId], [imageId]) VALUES (1006, N'Multigrain Bread', N'A loaf of multigrain bread', N'A delicious home made loaf of multigrain bread using the finest, hand-picked ingredients', N'1', 5.5000, 0, 1, 7)
GO
INSERT [dbo].[Products] ([productId], [productName], [briefDescription], [fullDescription], [statusCode], [price], [featured], [categoryId], [imageId]) VALUES (1007, N'Maple Bread', N'A loaf of maple bread', N'A delicious home made loaf of maple bread using the finest, hand-picked ingredients', N'1', 6.5000, 0, 1, 8)
GO
INSERT [dbo].[Products] ([productId], [productName], [briefDescription], [fullDescription], [statusCode], [price], [featured], [categoryId], [imageId]) VALUES (1008, N'Nanaimo Square', N'A pack of nanaimo squares', N'A delicious home made pack of nanaimo squares using the finest, hand-picked ingredients', N'1', 3.5000, 1, 2, 9)
GO
INSERT [dbo].[Products] ([productId], [productName], [briefDescription], [fullDescription], [statusCode], [price], [featured], [categoryId], [imageId]) VALUES (1009, N'Marshmallow Square', N'A pack of marshmallow squares', N'A delicious home made pack of marshmallow squares using the finest, hand-picked ingredients', N'1', 4.5000, 1, 2, 10)
GO
INSERT [dbo].[Products] ([productId], [productName], [briefDescription], [fullDescription], [statusCode], [price], [featured], [categoryId], [imageId]) VALUES (1010, N'Date Square', N'A pack of date squares', N'A delicious home made pack of date squares using the finest, hand-picked ingredients', N'1', 5.5000, 0, 2, 11)
GO
INSERT [dbo].[Products] ([productId], [productName], [briefDescription], [fullDescription], [statusCode], [price], [featured], [categoryId], [imageId]) VALUES (1011, N'Blueberry Square', N'A pack of blueberry squares', N'A delicious home made pack of blueberry squares using the finest, hand-picked ingredients', N'1', 5.5000, 0, 2, 12)
GO
INSERT [dbo].[Products] ([productId], [productName], [briefDescription], [fullDescription], [statusCode], [price], [featured], [categoryId], [imageId]) VALUES (1012, N'Lemon Square', N'A pack of lemon squares', N'A delicious home made pack of lemon squares using the finest, hand-picked ingredients', N'1', 3.5000, 0, 2, 13)
GO
INSERT [dbo].[Products] ([productId], [productName], [briefDescription], [fullDescription], [statusCode], [price], [featured], [categoryId], [imageId]) VALUES (1013, N'Pecan Square', N'A pack of pecan squares', N'A delicious home made pack of pecan squares using the finest, hand-picked ingredients', N'1', 4.5000, 0, 2, 14)
GO
INSERT [dbo].[Products] ([productId], [productName], [briefDescription], [fullDescription], [statusCode], [price], [featured], [categoryId], [imageId]) VALUES (1014, N'Peanut Butter Square', N'A pack of peanut butter squares', N'A delicious home made pack of peanut butter squares using the finest, hand-picked ingredients', N'1', 5.5000, 0, 2, 15)
GO
INSERT [dbo].[Products] ([productId], [productName], [briefDescription], [fullDescription], [statusCode], [price], [featured], [categoryId], [imageId]) VALUES (1015, N'Triple Chocolate Cake', N'A triple chocolate cake', N'A delicious home made triple chocolate cake using the finest, hand-picked ingredients', N'1', 3.5000, 1, 3, 16)
GO
INSERT [dbo].[Products] ([productId], [productName], [briefDescription], [fullDescription], [statusCode], [price], [featured], [categoryId], [imageId]) VALUES (1016, N'Devils Food Cake', N'A devils food cake', N'A delicious home made devils food cake using the finest, hand-picked ingredients', N'1', 4.5000, 1, 3, 17)
GO
INSERT [dbo].[Products] ([productId], [productName], [briefDescription], [fullDescription], [statusCode], [price], [featured], [categoryId], [imageId]) VALUES (1017, N'Angel Food Cake', N'A angel food cake', N'A delicious home made angel food cake using the finest, hand-picked ingredients', N'1', 5.5000, 0, 3, 18)
GO
INSERT [dbo].[Products] ([productId], [productName], [briefDescription], [fullDescription], [statusCode], [price], [featured], [categoryId], [imageId]) VALUES (1018, N'Cheesecake', N'A cheesecake', N'A delicious home made cheesecake using the finest, hand-picked ingredients', N'1', 4.5000, 0, 3, 19)
GO
INSERT [dbo].[Products] ([productId], [productName], [briefDescription], [fullDescription], [statusCode], [price], [featured], [categoryId], [imageId]) VALUES (1019, N'Lemon Meringue Cake', N'A lemon meringue cake', N'A delicious home made lemon meringue using the finest, hand-picked ingredients', N'1', 5.5000, 0, 3, 20)
GO
INSERT [dbo].[Products] ([productId], [productName], [briefDescription], [fullDescription], [statusCode], [price], [featured], [categoryId], [imageId]) VALUES (1020, N'Black Forest Cake', N'A black forest cake', N'A delicious home made black forest using the finest, hand-picked ingredients', N'1', 6.5000, 0, 3, 21)
GO
INSERT [dbo].[Products] ([productId], [productName], [briefDescription], [fullDescription], [statusCode], [price], [featured], [categoryId], [imageId]) VALUES (1021, N'Chocolate Mousse Cake', N'A chocolate mousse cake', N'A delicious home made chocolate mousse cake using the finest, hand-picked ingredients', N'1', 5.5000, 0, 3, 22)
GO
INSERT [dbo].[Products] ([productId], [productName], [briefDescription], [fullDescription], [statusCode], [price], [featured], [categoryId], [imageId]) VALUES (1022, N'Pound Cake', N'A pound cake', N'A delicious home made chocolate mousse cake using the finest, hand-picked ingredients', N'1', 4.5000, 0, 3, 23)
GO
INSERT [dbo].[Products] ([productId], [productName], [briefDescription], [fullDescription], [statusCode], [price], [featured], [categoryId], [imageId]) VALUES (1023, N'White Bun', N'A white bun', N'A delicious home made package of white buns using the finest, hand-picked ingredients', N'1', 3.5000, 1, 4, 24)
GO
INSERT [dbo].[Products] ([productId], [productName], [briefDescription], [fullDescription], [statusCode], [price], [featured], [categoryId], [imageId]) VALUES (1024, N'Brown Bun', N'A brown bun', N'A delicious home made package of brown buns using the finest, hand-picked ingredients', N'1', 4.5000, 1, 4, 25)
GO
INSERT [dbo].[Products] ([productId], [productName], [briefDescription], [fullDescription], [statusCode], [price], [featured], [categoryId], [imageId]) VALUES (1025, N'Rye Bun', N'A rye bun', N'A delicious home made package of rye buns using the finest, hand-picked ingredients', N'1', 5.5000, 0, 4, 26)
GO
INSERT [dbo].[Products] ([productId], [productName], [briefDescription], [fullDescription], [statusCode], [price], [featured], [categoryId], [imageId]) VALUES (1026, N'Sourdough Bun', N'A sourdough bun', N'A delicious home made package of sourdough buns using the finest, hand-picked ingredients', N'1', 3.5000, 0, 4, 27)
GO
INSERT [dbo].[Products] ([productId], [productName], [briefDescription], [fullDescription], [statusCode], [price], [featured], [categoryId], [imageId]) VALUES (1027, N'Whole Wheat Bun', N'A whole wheat bun', N'A delicious home made package of whole wheat buns using the finest, hand-picked ingredients', N'1', 4.5000, 0, 4, 28)
GO
INSERT [dbo].[Products] ([productId], [productName], [briefDescription], [fullDescription], [statusCode], [price], [featured], [categoryId], [imageId]) VALUES (1028, N'Multigrain Bun', N'A multigrain bun', N'A delicious home made package of multigrain buns using the finest, hand-picked ingredients', N'1', 5.5000, 0, 4, 29)
GO
INSERT [dbo].[Products] ([productId], [productName], [briefDescription], [fullDescription], [statusCode], [price], [featured], [categoryId], [imageId]) VALUES (1029, N'Blueberry Danish', N'A blueberry danish', N'A delicious home made box of blueberry danish using the finest, hand-picked ingredients', N'1', 3.5000, 1, 5, 30)
GO
INSERT [dbo].[Products] ([productId], [productName], [briefDescription], [fullDescription], [statusCode], [price], [featured], [categoryId], [imageId]) VALUES (1030, N'Raspberry Danish', N'A raspberry danish', N'A delicious home made box of raspberry danish using the finest, hand-picked ingredients', N'1', 4.5000, 1, 5, 31)
GO
INSERT [dbo].[Products] ([productId], [productName], [briefDescription], [fullDescription], [statusCode], [price], [featured], [categoryId], [imageId]) VALUES (1031, N'Strawberry Danish', N'A strawberry danish', N'A delicious home made box of strawberry danish using the finest, hand-picked ingredients', N'1', 5.5000, 0, 5, 32)
GO
INSERT [dbo].[Products] ([productId], [productName], [briefDescription], [fullDescription], [statusCode], [price], [featured], [categoryId], [imageId]) VALUES (1032, N'Caramel Danish', N'A caramel danish', N'A delicious home made box of caramel danish using the finest, hand-picked ingredients', N'1', 3.5000, 0, 5, 33)
GO
INSERT [dbo].[Products] ([productId], [productName], [briefDescription], [fullDescription], [statusCode], [price], [featured], [categoryId], [imageId]) VALUES (1033, N'Chocolate Danish', N'A chocolate danish', N'A delicious home made box of chocolate danish using the finest, hand-picked ingredients', N'1', 4.5000, 0, 5, 34)
GO
INSERT [dbo].[Products] ([productId], [productName], [briefDescription], [fullDescription], [statusCode], [price], [featured], [categoryId], [imageId]) VALUES (1034, N'Butter Danish', N'A butter danish', N'A delicious home made box of butter danish using the finest, hand-picked ingredients', N'1', 5.5000, 0, 5, 35)
GO
INSERT [dbo].[Products] ([productId], [productName], [briefDescription], [fullDescription], [statusCode], [price], [featured], [categoryId], [imageId]) VALUES (1035, N'Cream Cheese Danish', N'A cream cheese danish', N'A delicious home made box of cream cheese danish using the finest, hand-picked ingredients', N'1', 4.5000, 0, 5, 36)
GO
INSERT [dbo].[Products] ([productId], [productName], [briefDescription], [fullDescription], [statusCode], [price], [featured], [categoryId], [imageId]) VALUES (1036, N'Blueberry Muffin', N'A blueberry muffin', N'A delicious home made box of blueberry muffin using the finest, hand-picked ingredients', N'1', 3.5000, 1, 6, 37)
GO
INSERT [dbo].[Products] ([productId], [productName], [briefDescription], [fullDescription], [statusCode], [price], [featured], [categoryId], [imageId]) VALUES (1037, N'Raspberry Muffin', N'A raspberry muffin', N'A delicious home made box of raspberry muffin using the finest, hand-picked ingredients', N'1', 4.5000, 1, 6, 38)
GO
INSERT [dbo].[Products] ([productId], [productName], [briefDescription], [fullDescription], [statusCode], [price], [featured], [categoryId], [imageId]) VALUES (1038, N'Strawberry Muffin', N'A strawberry muffin', N'A delicious home made box of strawberry muffin using the finest, hand-picked ingredients', N'1', 5.5000, 0, 6, 39)
GO
INSERT [dbo].[Products] ([productId], [productName], [briefDescription], [fullDescription], [statusCode], [price], [featured], [categoryId], [imageId]) VALUES (1039, N'Caramel Muffin', N'A caramel muffin', N'A delicious home made box of caramel muffin using the finest, hand-picked ingredients', N'1', 3.5000, 0, 6, 40)
GO
INSERT [dbo].[Products] ([productId], [productName], [briefDescription], [fullDescription], [statusCode], [price], [featured], [categoryId], [imageId]) VALUES (1040, N'Chocolate Muffin', N'A chocolate muffin', N'A delicious home made box of chocolate muffin using the finest, hand-picked ingredients', N'1', 4.5000, 0, 6, 41)
GO
INSERT [dbo].[Products] ([productId], [productName], [briefDescription], [fullDescription], [statusCode], [price], [featured], [categoryId], [imageId]) VALUES (1041, N'Butter Pecan Muffin', N'A butter pecan muffin', N'A delicious home made box of butter pecan muffin using the finest, hand-picked ingredients', N'1', 5.5000, 0, 6, 42)
GO
INSERT [dbo].[Products] ([productId], [productName], [briefDescription], [fullDescription], [statusCode], [price], [featured], [categoryId], [imageId]) VALUES (1042, N'Cheese Croissants', N'A butter cheese croissant', N'A delicious home made box of butter cheese croissant using the finest, hand-picked ingredients', N'1', 3.5000, 1, 7, 43)
GO
INSERT [dbo].[Products] ([productId], [productName], [briefDescription], [fullDescription], [statusCode], [price], [featured], [categoryId], [imageId]) VALUES (1043, N'Butter Croissants', N'A butter croissant', N'A delicious home made box of butter croissant using the finest, hand-picked ingredients', N'1', 4.5000, 1, 7, 44)
GO
INSERT [dbo].[Products] ([productId], [productName], [briefDescription], [fullDescription], [statusCode], [price], [featured], [categoryId], [imageId]) VALUES (1044, N'Chocolate Croissants', N'A chocolate croissant', N'A delicious home made box of chocolate croissant using the finest, hand-picked ingredients', N'1', 5.5000, 0, 7, 45)
GO
INSERT [dbo].[Products] ([productId], [productName], [briefDescription], [fullDescription], [statusCode], [price], [featured], [categoryId], [imageId]) VALUES (1045, N'Almond Croissants', N'A almond croissant', N'A delicious home made box of almond croissant using the finest, hand-picked ingredients', N'1', 3.5000, 0, 7, 46)
GO
INSERT [dbo].[Products] ([productId], [productName], [briefDescription], [fullDescription], [statusCode], [price], [featured], [categoryId], [imageId]) VALUES (1046, N'Ham and Cheese Croissants', N'A ham and cheese croissant', N'A delicious home made box of ham and cheese croissant using the finest, hand-picked ingredients', N'1', 4.5000, 0, 7, 47)
GO
INSERT [dbo].[Products] ([productId], [productName], [briefDescription], [fullDescription], [statusCode], [price], [featured], [categoryId], [imageId]) VALUES (1047, N'Bacon Croissants', N'A bacon croissant', N'A delicious home made box of bacon croissant using the finest, hand-picked ingredients', N'1', 5.5000, 0, 7, 48)
GO
INSERT [dbo].[Products] ([productId], [productName], [briefDescription], [fullDescription], [statusCode], [price], [featured], [categoryId], [imageId]) VALUES (1048, N'Blueberry Filled Donuts', N'A blueberry filled donut', N'A delicious home made box of blueberry filled donut using the finest, hand-picked ingredients', N'1', 3.5000, 1, 8, 49)
GO
INSERT [dbo].[Products] ([productId], [productName], [briefDescription], [fullDescription], [statusCode], [price], [featured], [categoryId], [imageId]) VALUES (1049, N'Raspberry Filled Donuts', N'A raspberry filled donut', N'A delicious home made box of raspberry filled donut using the finest, hand-picked ingredients', N'1', 4.5000, 1, 8, 50)
GO
INSERT [dbo].[Products] ([productId], [productName], [briefDescription], [fullDescription], [statusCode], [price], [featured], [categoryId], [imageId]) VALUES (1050, N'Strawberry Filled Donuts', N'A strawberry filled donut', N'A delicious home made box of strawberry filled donut using the finest, hand-picked ingredients', N'1', 3.5000, 0, 8, 51)
GO
INSERT [dbo].[Products] ([productId], [productName], [briefDescription], [fullDescription], [statusCode], [price], [featured], [categoryId], [imageId]) VALUES (1051, N'Caramel Donuts', N'A caramel donut', N'A delicious home made box of caramel donut using the finest, hand-picked ingredients', N'1', 4.5000, 0, 8, 52)
GO
INSERT [dbo].[Products] ([productId], [productName], [briefDescription], [fullDescription], [statusCode], [price], [featured], [categoryId], [imageId]) VALUES (1052, N'Chocolate Glazed Donuts', N'A chocolate glazed donut', N'A delicious home made box of chocolate glazed donut using the finest, hand-picked ingredients', N'1', 5.5000, 0, 8, 53)
GO
INSERT [dbo].[Products] ([productId], [productName], [briefDescription], [fullDescription], [statusCode], [price], [featured], [categoryId], [imageId]) VALUES (1053, N'Sugar Donuts', N'A sugar donut', N'A delicious home made box of sugar donut using the finest, hand-picked ingredients', N'1', 3.5000, 0, 8, 54)
GO
INSERT [dbo].[Products] ([productId], [productName], [briefDescription], [fullDescription], [statusCode], [price], [featured], [categoryId], [imageId]) VALUES (1054, N'Boston Cream Donuts', N'A boston cream donut', N'A delicious home made box of boston cream donut using the finest, hand-picked ingredients', N'1', 4.5000, 0, 8, 55)
GO
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[SiteImages] ON 
GO
INSERT [dbo].[SiteImages] ([imageId], [imageName], [imageUrl], [uploadDate], [altText], [approved], [active], [uploadedBy]) VALUES (1, N'Place Holder', N'~/images/placeholder.jpg', CAST(N'2018-11-04T21:26:49.970' AS DateTime), N'Placeholder image', 1, 1, 1)
GO
INSERT [dbo].[SiteImages] ([imageId], [imageName], [imageUrl], [uploadDate], [altText], [approved], [active], [uploadedBy]) VALUES (2, N'White Bread', N'~/images/whitebread.jpg', CAST(N'2018-11-04T21:26:49.973' AS DateTime), N'A loaf of white bread', 1, 1, 1)
GO
INSERT [dbo].[SiteImages] ([imageId], [imageName], [imageUrl], [uploadDate], [altText], [approved], [active], [uploadedBy]) VALUES (3, N'Brown Bread', N'~/images/brownbread.jpg', CAST(N'2018-11-04T21:26:49.973' AS DateTime), N'A loaf of Brown bread', 1, 1, 1)
GO
INSERT [dbo].[SiteImages] ([imageId], [imageName], [imageUrl], [uploadDate], [altText], [approved], [active], [uploadedBy]) VALUES (4, N'Rye Bread', N'~/images/ryebread.jpg', CAST(N'2018-11-04T21:26:49.973' AS DateTime), N'A loaf of Rye bread', 1, 1, 1)
GO
INSERT [dbo].[SiteImages] ([imageId], [imageName], [imageUrl], [uploadDate], [altText], [approved], [active], [uploadedBy]) VALUES (5, N'Sour Bread', N'~/images/sourbread.jpg', CAST(N'2018-11-04T21:26:49.973' AS DateTime), N'A loaf of Sourdough bread', 1, 1, 1)
GO
INSERT [dbo].[SiteImages] ([imageId], [imageName], [imageUrl], [uploadDate], [altText], [approved], [active], [uploadedBy]) VALUES (6, N'Whole Wheat Bread', N'~/images/wholewheatbread.jpg', CAST(N'2018-11-04T21:26:49.973' AS DateTime), N'A loaf of whole wheat bread', 1, 1, 1)
GO
INSERT [dbo].[SiteImages] ([imageId], [imageName], [imageUrl], [uploadDate], [altText], [approved], [active], [uploadedBy]) VALUES (7, N'Multigrain Bread', N'~/images/multigrainbread.jpg', CAST(N'2018-11-04T21:26:49.973' AS DateTime), N'A loaf of multigrain bread', 1, 1, 1)
GO
INSERT [dbo].[SiteImages] ([imageId], [imageName], [imageUrl], [uploadDate], [altText], [approved], [active], [uploadedBy]) VALUES (8, N'Maple Bread', N'~/images/maplebread.jpg', CAST(N'2018-11-04T21:26:49.973' AS DateTime), N'A loaf of maple bread', 1, 1, 1)
GO
INSERT [dbo].[SiteImages] ([imageId], [imageName], [imageUrl], [uploadDate], [altText], [approved], [active], [uploadedBy]) VALUES (9, N'Nanimo Square', N'~/images/nanaimosquare.jpg', CAST(N'2018-11-04T21:26:49.973' AS DateTime), N'A pack of nanaimo squares', 1, 1, 1)
GO
INSERT [dbo].[SiteImages] ([imageId], [imageName], [imageUrl], [uploadDate], [altText], [approved], [active], [uploadedBy]) VALUES (10, N'Marshmallow Square', N'~/images/marshmallowsquare.jpg', CAST(N'2018-11-04T21:26:49.973' AS DateTime), N'A pack of marshmallow squares', 1, 1, 1)
GO
INSERT [dbo].[SiteImages] ([imageId], [imageName], [imageUrl], [uploadDate], [altText], [approved], [active], [uploadedBy]) VALUES (11, N'Date Square', N'~/images/datesquare.jpg', CAST(N'2018-11-04T21:26:49.973' AS DateTime), N'A pack of date squares', 1, 1, 1)
GO
INSERT [dbo].[SiteImages] ([imageId], [imageName], [imageUrl], [uploadDate], [altText], [approved], [active], [uploadedBy]) VALUES (12, N'Blueberry Square', N'~/images/blueberrysquare.jpg', CAST(N'2018-11-04T21:26:49.973' AS DateTime), N'A pack of blueberry squares', 1, 1, 1)
GO
INSERT [dbo].[SiteImages] ([imageId], [imageName], [imageUrl], [uploadDate], [altText], [approved], [active], [uploadedBy]) VALUES (13, N'Lemon Square', N'~/images/lemonsquare.jpg', CAST(N'2018-11-04T21:26:49.973' AS DateTime), N'A pack of lemon squares', 1, 1, 1)
GO
INSERT [dbo].[SiteImages] ([imageId], [imageName], [imageUrl], [uploadDate], [altText], [approved], [active], [uploadedBy]) VALUES (14, N'Pecan Square', N'~/images/pecansquare.jpg', CAST(N'2018-11-04T21:26:49.973' AS DateTime), N'A pack of pecan squares', 1, 1, 1)
GO
INSERT [dbo].[SiteImages] ([imageId], [imageName], [imageUrl], [uploadDate], [altText], [approved], [active], [uploadedBy]) VALUES (15, N'Peanutbutter Square', N'~/images/peanutbuttersquare.jpg', CAST(N'2018-11-04T21:26:49.977' AS DateTime), N'A pack of peanut butter squares', 1, 1, 1)
GO
INSERT [dbo].[SiteImages] ([imageId], [imageName], [imageUrl], [uploadDate], [altText], [approved], [active], [uploadedBy]) VALUES (16, N'Triple Chocolate Cake', N'~/images/triplechocolatecake.jpg', CAST(N'2018-11-04T21:26:49.977' AS DateTime), N'A triple chocolate cake', 1, 1, 1)
GO
INSERT [dbo].[SiteImages] ([imageId], [imageName], [imageUrl], [uploadDate], [altText], [approved], [active], [uploadedBy]) VALUES (17, N'Devils Foodcake', N'~/images/devilsfoodcake.jpg', CAST(N'2018-11-04T21:26:49.977' AS DateTime), N'A devils food cake', 1, 1, 1)
GO
INSERT [dbo].[SiteImages] ([imageId], [imageName], [imageUrl], [uploadDate], [altText], [approved], [active], [uploadedBy]) VALUES (18, N'Angel Foodcake', N'~/images/angelfoodcake.jpg', CAST(N'2018-11-04T21:26:49.977' AS DateTime), N'A angel food cake', 1, 1, 1)
GO
INSERT [dbo].[SiteImages] ([imageId], [imageName], [imageUrl], [uploadDate], [altText], [approved], [active], [uploadedBy]) VALUES (19, N'Cheesecake', N'~/images/cheesecake.jpg', CAST(N'2018-11-04T21:26:49.977' AS DateTime), N'A cheesecake', 1, 1, 1)
GO
INSERT [dbo].[SiteImages] ([imageId], [imageName], [imageUrl], [uploadDate], [altText], [approved], [active], [uploadedBy]) VALUES (20, N'Lemon Meringue Cake', N'~/images/lemonmeringuecake.jpg', CAST(N'2018-11-04T21:26:49.977' AS DateTime), N'A lemon meringue cake', 1, 1, 1)
GO
INSERT [dbo].[SiteImages] ([imageId], [imageName], [imageUrl], [uploadDate], [altText], [approved], [active], [uploadedBy]) VALUES (21, N'Black Forest Cake', N'~/images/blackforestcake.jpg', CAST(N'2018-11-04T21:26:49.977' AS DateTime), N'A black forest cake', 1, 1, 1)
GO
INSERT [dbo].[SiteImages] ([imageId], [imageName], [imageUrl], [uploadDate], [altText], [approved], [active], [uploadedBy]) VALUES (22, N'Chocolate Mousse Cake', N'~/images/chocolatemoussecake.jpg', CAST(N'2018-11-04T21:26:49.977' AS DateTime), N'A chocolate mousse cake', 1, 1, 1)
GO
INSERT [dbo].[SiteImages] ([imageId], [imageName], [imageUrl], [uploadDate], [altText], [approved], [active], [uploadedBy]) VALUES (23, N'Pound Cake', N'~/images/poundcake.jpg', CAST(N'2018-11-04T21:26:49.977' AS DateTime), N'A pound cake', 1, 1, 1)
GO
INSERT [dbo].[SiteImages] ([imageId], [imageName], [imageUrl], [uploadDate], [altText], [approved], [active], [uploadedBy]) VALUES (24, N'White Bun', N'~/images/whitebun.jpg', CAST(N'2018-11-04T21:26:49.977' AS DateTime), N'A white bun', 1, 1, 1)
GO
INSERT [dbo].[SiteImages] ([imageId], [imageName], [imageUrl], [uploadDate], [altText], [approved], [active], [uploadedBy]) VALUES (25, N'Brown Bun', N'~/images/brownbun.jpg', CAST(N'2018-11-04T21:26:49.977' AS DateTime), N'A brown bun', 1, 1, 1)
GO
INSERT [dbo].[SiteImages] ([imageId], [imageName], [imageUrl], [uploadDate], [altText], [approved], [active], [uploadedBy]) VALUES (26, N'Rye Bun', N'~/images/ryebun.jpg', CAST(N'2018-11-04T21:26:49.977' AS DateTime), N'A rye bun', 1, 1, 1)
GO
INSERT [dbo].[SiteImages] ([imageId], [imageName], [imageUrl], [uploadDate], [altText], [approved], [active], [uploadedBy]) VALUES (27, N'Sourdough Bun', N'~/images/sourdoughbun.jpg', CAST(N'2018-11-04T21:26:49.980' AS DateTime), N'A sourdough bun', 1, 1, 1)
GO
INSERT [dbo].[SiteImages] ([imageId], [imageName], [imageUrl], [uploadDate], [altText], [approved], [active], [uploadedBy]) VALUES (28, N'Wholewheat Bun', N'~/images/wholewheatbun.jpg', CAST(N'2018-11-04T21:26:49.980' AS DateTime), N'A whole wheat bun', 1, 1, 1)
GO
INSERT [dbo].[SiteImages] ([imageId], [imageName], [imageUrl], [uploadDate], [altText], [approved], [active], [uploadedBy]) VALUES (29, N'Multigrain Bun', N'~/images/multigrainbun.jpg', CAST(N'2018-11-04T21:26:49.980' AS DateTime), N'A multigrain bun', 1, 1, 1)
GO
INSERT [dbo].[SiteImages] ([imageId], [imageName], [imageUrl], [uploadDate], [altText], [approved], [active], [uploadedBy]) VALUES (30, N'Blueberry Danish', N'~/images/blueberrydanish.jpg', CAST(N'2018-11-04T21:26:49.980' AS DateTime), N'A blueberry danish', 1, 1, 1)
GO
INSERT [dbo].[SiteImages] ([imageId], [imageName], [imageUrl], [uploadDate], [altText], [approved], [active], [uploadedBy]) VALUES (31, N'Raspberry Danish', N'~/images/raspberrydanish.jpg', CAST(N'2018-11-04T21:26:49.980' AS DateTime), N'A raspberry danish', 1, 1, 1)
GO
INSERT [dbo].[SiteImages] ([imageId], [imageName], [imageUrl], [uploadDate], [altText], [approved], [active], [uploadedBy]) VALUES (32, N'Strawberry Danish', N'~/images/strawberrydanish.jpg', CAST(N'2018-11-04T21:26:49.980' AS DateTime), N'A strawberry danish', 1, 1, 1)
GO
INSERT [dbo].[SiteImages] ([imageId], [imageName], [imageUrl], [uploadDate], [altText], [approved], [active], [uploadedBy]) VALUES (33, N'Caramel Danish', N'~/images/carameldanish.jpg', CAST(N'2018-11-04T21:26:49.980' AS DateTime), N'A caramel danish', 1, 1, 1)
GO
INSERT [dbo].[SiteImages] ([imageId], [imageName], [imageUrl], [uploadDate], [altText], [approved], [active], [uploadedBy]) VALUES (34, N'Chocolate Danish', N'~/images/chocolatedanish.jpg', CAST(N'2018-11-04T21:26:49.980' AS DateTime), N'A chocolate danish', 1, 1, 1)
GO
INSERT [dbo].[SiteImages] ([imageId], [imageName], [imageUrl], [uploadDate], [altText], [approved], [active], [uploadedBy]) VALUES (35, N'Butter Danish', N'~/images/butterdanish.jpg', CAST(N'2018-11-04T21:26:49.980' AS DateTime), N'A butter danish', 1, 1, 1)
GO
INSERT [dbo].[SiteImages] ([imageId], [imageName], [imageUrl], [uploadDate], [altText], [approved], [active], [uploadedBy]) VALUES (36, N'Creamcheese Danish', N'~/images/creamcheesedanish.jpg', CAST(N'2018-11-04T21:26:49.980' AS DateTime), N'A cream cheese danish', 1, 1, 1)
GO
INSERT [dbo].[SiteImages] ([imageId], [imageName], [imageUrl], [uploadDate], [altText], [approved], [active], [uploadedBy]) VALUES (37, N'Blueberry Muffin', N'~/images/blueberrymuffin.jpg', CAST(N'2018-11-04T21:26:49.980' AS DateTime), N'A blueberry muffin', 1, 1, 1)
GO
INSERT [dbo].[SiteImages] ([imageId], [imageName], [imageUrl], [uploadDate], [altText], [approved], [active], [uploadedBy]) VALUES (38, N'Raspberry Muffin', N'~/images/raspberrymuffin.jpg', CAST(N'2018-11-04T21:26:49.980' AS DateTime), N'A raspberry muffin', 1, 1, 1)
GO
INSERT [dbo].[SiteImages] ([imageId], [imageName], [imageUrl], [uploadDate], [altText], [approved], [active], [uploadedBy]) VALUES (39, N'Strawberry Muffin', N'~/images/strawberrymuffin.jpg', CAST(N'2018-11-04T21:26:49.980' AS DateTime), N'A strawberry muffin', 1, 1, 1)
GO
INSERT [dbo].[SiteImages] ([imageId], [imageName], [imageUrl], [uploadDate], [altText], [approved], [active], [uploadedBy]) VALUES (40, N'Caramel Muffin', N'~/images/caramelmuffin.jpg', CAST(N'2018-11-04T21:26:49.980' AS DateTime), N'A caramel muffin', 1, 1, 1)
GO
INSERT [dbo].[SiteImages] ([imageId], [imageName], [imageUrl], [uploadDate], [altText], [approved], [active], [uploadedBy]) VALUES (41, N'Chocolate Muffin', N'~/images/chocolatemuffin.jpg', CAST(N'2018-11-04T21:26:49.980' AS DateTime), N'A chocolate muffin', 1, 1, 1)
GO
INSERT [dbo].[SiteImages] ([imageId], [imageName], [imageUrl], [uploadDate], [altText], [approved], [active], [uploadedBy]) VALUES (42, N'Pecan Muffin', N'~/images/butterpecanmuffin.jpg', CAST(N'2018-11-04T21:26:49.980' AS DateTime), N'A butter pecan muffin', 1, 1, 1)
GO
INSERT [dbo].[SiteImages] ([imageId], [imageName], [imageUrl], [uploadDate], [altText], [approved], [active], [uploadedBy]) VALUES (43, N'Cheese Croissant', N'~/images/cheesecroissant.jpg', CAST(N'2018-11-04T21:26:49.980' AS DateTime), N'A butter cheese croissant', 1, 1, 1)
GO
INSERT [dbo].[SiteImages] ([imageId], [imageName], [imageUrl], [uploadDate], [altText], [approved], [active], [uploadedBy]) VALUES (44, N'Butter Croissant', N'~/images/buttercroissant.jpg', CAST(N'2018-11-04T21:26:49.980' AS DateTime), N'A butter croissant', 1, 1, 1)
GO
INSERT [dbo].[SiteImages] ([imageId], [imageName], [imageUrl], [uploadDate], [altText], [approved], [active], [uploadedBy]) VALUES (45, N'Chocolate Croissant', N'~/images/chocolatecroissant.jpg', CAST(N'2018-11-04T21:26:49.980' AS DateTime), N'A chocolate croissant', 1, 1, 1)
GO
INSERT [dbo].[SiteImages] ([imageId], [imageName], [imageUrl], [uploadDate], [altText], [approved], [active], [uploadedBy]) VALUES (46, N'Almond Croissant', N'~/images/almondcroissant.jpg', CAST(N'2018-11-04T21:26:49.980' AS DateTime), N'A almond croissant', 1, 1, 1)
GO
INSERT [dbo].[SiteImages] ([imageId], [imageName], [imageUrl], [uploadDate], [altText], [approved], [active], [uploadedBy]) VALUES (47, N'Ham and Cheese Croissant', N'~/images/hamandcheesecroissant.jpg', CAST(N'2018-11-04T21:26:49.980' AS DateTime), N'A ham and cheese croissant', 1, 1, 1)
GO
INSERT [dbo].[SiteImages] ([imageId], [imageName], [imageUrl], [uploadDate], [altText], [approved], [active], [uploadedBy]) VALUES (48, N'Bacon Croissant', N'~/images/baconcroissant.jpg', CAST(N'2018-11-04T21:26:49.980' AS DateTime), N'A bacon croissant', 1, 1, 1)
GO
INSERT [dbo].[SiteImages] ([imageId], [imageName], [imageUrl], [uploadDate], [altText], [approved], [active], [uploadedBy]) VALUES (49, N'Blueberry Filled Donut', N'~/images/blueberryfilleddonut.jpg', CAST(N'2018-11-04T21:26:49.980' AS DateTime), N'A blueberry filled donut', 1, 1, 1)
GO
INSERT [dbo].[SiteImages] ([imageId], [imageName], [imageUrl], [uploadDate], [altText], [approved], [active], [uploadedBy]) VALUES (50, N'Raspberry Filled Donut', N'~/images/raspberryfilleddonut.jpg', CAST(N'2018-11-04T21:26:49.980' AS DateTime), N'A raspberry filled donut', 1, 1, 1)
GO
INSERT [dbo].[SiteImages] ([imageId], [imageName], [imageUrl], [uploadDate], [altText], [approved], [active], [uploadedBy]) VALUES (51, N'Strawberry Filled Donut', N'~/images/strawberryfilleddonut.jpg', CAST(N'2018-11-04T21:26:49.980' AS DateTime), N'A strawberry filled donut', 1, 1, 1)
GO
INSERT [dbo].[SiteImages] ([imageId], [imageName], [imageUrl], [uploadDate], [altText], [approved], [active], [uploadedBy]) VALUES (52, N'Caramel Donut', N'~/images/carameldonut.jpg', CAST(N'2018-11-04T21:26:49.980' AS DateTime), N'A caramel donut', 1, 1, 1)
GO
INSERT [dbo].[SiteImages] ([imageId], [imageName], [imageUrl], [uploadDate], [altText], [approved], [active], [uploadedBy]) VALUES (53, N'Chocolate Glazed Donut', N'~/images/chocolateglazeddonut.jpg', CAST(N'2018-11-04T21:26:49.983' AS DateTime), N'A chocolate glazed donut', 1, 1, 1)
GO
INSERT [dbo].[SiteImages] ([imageId], [imageName], [imageUrl], [uploadDate], [altText], [approved], [active], [uploadedBy]) VALUES (54, N'Sugar Donut', N'~/images/sugardonut.jpg', CAST(N'2018-11-04T21:26:49.983' AS DateTime), N'A sugar donut', 1, 1, 1)
GO
INSERT [dbo].[SiteImages] ([imageId], [imageName], [imageUrl], [uploadDate], [altText], [approved], [active], [uploadedBy]) VALUES (55, N'Boston Cream Donut', N'~/images/bostoncreamdonut.jpg', CAST(N'2018-11-04T21:26:49.983' AS DateTime), N'A boston cream donut', 1, 1, 1)
GO
INSERT [dbo].[SiteImages] ([imageId], [imageName], [imageUrl], [uploadDate], [altText], [approved], [active], [uploadedBy]) VALUES (56, N'White Bread 2', N'~/images/whitebread2.jpg', CAST(N'2018-11-04T21:26:49.983' AS DateTime), N'A loaf of white bread', 1, 1, 1)
GO
INSERT [dbo].[SiteImages] ([imageId], [imageName], [imageUrl], [uploadDate], [altText], [approved], [active], [uploadedBy]) VALUES (57, N'White Bread 3', N'~/images/whitebread3.jpg', CAST(N'2018-11-04T21:26:49.983' AS DateTime), N'A loaf of white bread', 1, 1, 1)
GO
INSERT [dbo].[SiteImages] ([imageId], [imageName], [imageUrl], [uploadDate], [altText], [approved], [active], [uploadedBy]) VALUES (58, N'White Bread 4', N'~/images/whitebread4.jpg', CAST(N'2018-11-04T21:26:49.983' AS DateTime), N'A loaf of white bread', 1, 1, 1)
GO
SET IDENTITY_INSERT [dbo].[SiteImages] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Constraint_UsernameIsUnique]    Script Date: 2018-11-04 9:27:30 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [Constraint_UsernameIsUnique] ON [dbo].[Customers]
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CartItems] ADD  CONSTRAINT [DF_CartItems_itemStatus]  DEFAULT (N'AV') FOR [itemStatus]
GO
ALTER TABLE [dbo].[Customers] ADD  CONSTRAINT [DF_Customers_verified]  DEFAULT ((0)) FOR [verified]
GO
ALTER TABLE [dbo].[Customers] ADD  CONSTRAINT [DF_Customers_archived]  DEFAULT ((0)) FOR [archived]
GO
ALTER TABLE [dbo].[SiteImages] ADD  CONSTRAINT [DF_SiteImages_approved]  DEFAULT ((0)) FOR [approved]
GO
ALTER TABLE [dbo].[Addresses]  WITH CHECK ADD  CONSTRAINT [FK_addresses_Customers] FOREIGN KEY([customerId])
REFERENCES [dbo].[Customers] ([customerId])
GO
ALTER TABLE [dbo].[Addresses] CHECK CONSTRAINT [FK_addresses_Customers]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Customers] FOREIGN KEY([customerId])
REFERENCES [dbo].[Customers] ([customerId])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_Customers]
GO
ALTER TABLE [dbo].[CartItems]  WITH CHECK ADD  CONSTRAINT [FK_CartItems_Cart] FOREIGN KEY([cartId])
REFERENCES [dbo].[Cart] ([cartId])
GO
ALTER TABLE [dbo].[CartItems] CHECK CONSTRAINT [FK_CartItems_Cart]
GO
ALTER TABLE [dbo].[CartItems]  WITH CHECK ADD  CONSTRAINT [FK_CartItems_Products] FOREIGN KEY([productId])
REFERENCES [dbo].[Products] ([productId])
GO
ALTER TABLE [dbo].[CartItems] CHECK CONSTRAINT [FK_CartItems_Products]
GO
ALTER TABLE [dbo].[OrderHistory]  WITH CHECK ADD  CONSTRAINT [FK_OrderHistory_addresses] FOREIGN KEY([shippingAddress])
REFERENCES [dbo].[Addresses] ([addressId])
GO
ALTER TABLE [dbo].[OrderHistory] CHECK CONSTRAINT [FK_OrderHistory_addresses]
GO
ALTER TABLE [dbo].[OrderHistory]  WITH CHECK ADD  CONSTRAINT [FK_OrderHistory_Cart] FOREIGN KEY([cartId])
REFERENCES [dbo].[Cart] ([cartId])
GO
ALTER TABLE [dbo].[OrderHistory] CHECK CONSTRAINT [FK_OrderHistory_Cart]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories] FOREIGN KEY([categoryId])
REFERENCES [dbo].[Categories] ([categoryId])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_SiteImages] FOREIGN KEY([imageId])
REFERENCES [dbo].[SiteImages] ([imageId])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_SiteImages]
GO
/****** Object:  StoredProcedure [dbo].[approveImage]    Script Date: 2018-11-04 9:27:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[approveImage]
	@imageId	INT,
	@adminId	INT,
	@newURL		NVARCHAR(50)
AS
BEGIN
	--returns 0 on success, returns -6 on fail...for whatever reason
	BEGIN TRY
		IF(@adminId != (SELECT uploadedBy FROM SiteImages WHERE imageId = @imageId))
			BEGIN
				UPDATE
					SiteImages
				SET
					approved = 1,
					imageUrl = @newURL
				WHERE
					imageId = @imageId;
			END
		ELSE
			THROW 50001,'Image cannot be approved by the admin who uploaded it', 1
	END TRY
	BEGIN CATCH
		PRINT 'An Error Has Occured.';
		PRINT 'Message: '+ CONVERT(VARCHAR(50),ERROR_MESSAGE());
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[archiveCustomer]    Script Date: 2018-11-04 9:27:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[archiveCustomer]
    @customerId     int
AS
BEGIN
    UPDATE
        Customers
    SET
        archived = 1
    WHERE
        customerId = @customerId;
END
GO
/****** Object:  StoredProcedure [dbo].[checkBillingReturnBilling]    Script Date: 2018-11-04 9:27:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[checkBillingReturnBilling]
    @addressId        INT
AS
BEGIN
    DECLARE @customerId INT
    SET @customerId = (SELECT customerId FROM Addresses WHERE addressId = @addressId);

    IF 
        ((SELECT addressId FROM Addresses WHERE customerId = @customerId AND addressType = 'Billing') != @addressId)

    SELECT
        *
    FROM
        Addresses
    WHERE
        customerId = @customerId AND
        addressType = 'Billing'
END
GO
/****** Object:  StoredProcedure [dbo].[CheckForBilling]    Script Date: 2018-11-04 9:27:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CheckForBilling]
	@CustomerId		INT
AS
BEGIN
    SELECT
		COUNT(*)
	FROM
		Addresses
	WHERE
		customerId = @CustomerId AND addressType = 'Billing';
END
GO
/****** Object:  StoredProcedure [dbo].[checkImageInUse]    Script Date: 2018-11-04 9:27:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[checkImageInUse]
    @imageId   int
AS
BEGIN
    --returns 1 if image is not unique
    --returns 0 if image is unique
    SELECT
        COUNT(*)
    FROM
        Products
    WHERE
        imageId = @imageId;
END
GO
/****** Object:  StoredProcedure [dbo].[checkUniqueUsername]    Script Date: 2018-11-04 9:27:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[checkUniqueUsername]
    @username   NVARCHAR(15)
AS
BEGIN
    --returns 1 if username is not unique
    --returns 0 if username is unique
    SELECT
        COUNT(*)
    FROM
        Customers
    WHERE
        username = @username;
END
GO
/****** Object:  StoredProcedure [dbo].[createCart]    Script Date: 2018-11-04 9:27:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[createCart] 
AS
BEGIN
	Insert INTO Cart (DateCreated, OrderStatus) Values(GETDATE(), 0)
    SELECT CAST(scope_identity() AS int)
END
GO
/****** Object:  StoredProcedure [dbo].[createCartItem]    Script Date: 2018-11-04 9:27:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[createCartItem] 
	-- Add the parameters for the stored procedure here
	@cartId int, 
	@prodId int,
	@price money
AS
BEGIN
Insert INTO CartItems (CartId,ProductId , Qty , HistoricalPrice) 
Values(@cartId,@prodId, 1, @price)
END
GO
/****** Object:  StoredProcedure [dbo].[deleteAddress]    Script Date: 2018-11-04 9:27:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[deleteAddress]
	@addressId	INT
AS
BEGIN
    DELETE FROM
		Addresses
	WHERE
		addressId = @addressId;
END
GO
/****** Object:  StoredProcedure [dbo].[deleteCart]    Script Date: 2018-11-04 9:27:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[deleteCart]
	@cartId		INT
AS
BEGIN
	DELETE FROM
		Cart
	WHERE
		cartId = @cartId;
END
GO
/****** Object:  StoredProcedure [dbo].[deleteCartItem]    Script Date: 2018-11-04 9:27:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[deleteCartItem] 
    @prodID int, 
    @cartID int
AS
BEGIN
    DELETE FROM CartItems
    Where productId=@prodID AND cartId =@cartID
END
GO
/****** Object:  StoredProcedure [dbo].[deleteCategory]    Script Date: 2018-11-04 9:27:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[deleteCategory]
    @categoryId  INT
AS
BEGIN
    DELETE FROM
        Categories
    WHERE
        categoryId = @categoryId;
END
GO
/****** Object:  StoredProcedure [dbo].[deleteImage]    Script Date: 2018-11-04 9:27:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[deleteImage]
	@imageId	INT
AS
BEGIN
    DELETE FROM
		SiteImages
	WHERE
		imageId = @imageId;
END
GO
/****** Object:  StoredProcedure [dbo].[deleteProduct]    Script Date: 2018-11-04 9:27:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[deleteProduct]
    @productId  INT
AS
BEGIN
    DELETE FROM
        Products
    WHERE
        productId = @productId;
END
GO
/****** Object:  StoredProcedure [dbo].[getAllImages]    Script Date: 2018-11-04 9:27:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getAllImages]
AS
BEGIN
    SELECT
		imageName, imageId, imageUrl, uploadDate, altText, approved, uploadedBy, email, active
	FROM
		SiteImages INNER JOIN adminLogin ON SiteImages.uploadedBy = adminLogin.id;
END
GO
/****** Object:  StoredProcedure [dbo].[getApprovedImages]    Script Date: 2018-11-04 9:27:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getApprovedImages]
AS
BEGIN
    SELECT
		*
	FROM
		SiteImages
	WHERE
		approved = 1;
END
GO
/****** Object:  StoredProcedure [dbo].[getApprovedNotUsed]    Script Date: 2018-11-04 9:27:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getApprovedNotUsed]
    @ProdId        INT
AS
BEGIN
    SELECT
        *
    FROM
        SiteImages LEFT JOIN Products ON SiteImages.imageId = products.imageId
    WHERE
        (Products.imageId IS NULL AND SiteImages.approved = 1 AND SiteImages.active = 1) OR (productId = @ProdId AND SiteImages.active = 1) OR (SiteImages.ImageID = 1)
END
GO
/****** Object:  StoredProcedure [dbo].[getCartItems]    Script Date: 2018-11-04 9:27:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getCartItems]
    @cartID int
AS
BEGIN
    SELECT Products.ProductId, Products.productName , CartItems.Qty, CartItems.HistoricalPrice, Products.price, CartItems.Qty * Products.price as ItemSubtotal
    FROM Cart 
    INNER JOIN CartItems ON Cart.CartId = CartItems.CartId 
    INNER JOIN Products ON Products.productId = CartItems.ProductId
	WHERE CartItems.CartId = @cartID
END
GO
/****** Object:  StoredProcedure [dbo].[getCategories]    Script Date: 2018-11-04 9:27:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getCategories]
AS
BEGIN
    SELECT
        *
    FROM
        Categories
    ORDER BY
        [name] ASC
END
GO
/****** Object:  StoredProcedure [dbo].[getFeatured]    Script Date: 2018-11-04 9:27:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getFeatured]
AS
BEGIN
	DECLARE @tempURL VARCHAR(200)
	SET @tempURL = '~/images/placeholder.jpg'
    SELECT
        SiteImages.imageId,
		imageName,
		imageURL,
		uploadDate,
		altText,
		approved,
		active,
		uploadedBy,
		productId,
		productName,
		briefDescription,
		fullDescription,
		statusCode,
		price,
		featured,
		categoryId
    FROM
        Products INNER JOIN
		SiteImages ON products.imageId = SiteImages.imageId
    WHERE
        featured = 1 AND
		active = 1
	UNION
	SELECT
        SiteImages.imageId,
		imageName,
		@tempURL AS imageURL,
		uploadDate,
		altText,
		approved,
		active,
		uploadedBy,
		productId,
		productName,
		briefDescription,
		fullDescription,
		statusCode,
		price,
		featured,
		categoryId
    FROM
        Products INNER JOIN
		SiteImages ON products.imageId = SiteImages.imageId
    WHERE
        featured = 1 AND
		active = 0
END
GO
/****** Object:  StoredProcedure [dbo].[getFullCustomerInfo]    Script Date: 2018-11-04 9:27:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getFullCustomerInfo]
    @customerId     INT
AS
BEGIN
    SELECT
        Customers.customerId, username, firstName, middleInitial, lastName, [password], phone, email, street, city, stateProv, postalCode, country, archived
    FROM
        Customers INNER JOIN
        Addresses ON Customers.customerId = Addresses.customerId
    WHERE
        Addresses.addressType = 'Billing' AND
		Customers.customerId = @customerId;
END
GO
/****** Object:  StoredProcedure [dbo].[getOrderDetails]    Script Date: 2018-11-04 9:27:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getOrderDetails]
    @authNumber        NVARCHAR(50)
AS
BEGIN
    SELECT
		*, CartItems.qty * CartItems.historicalPrice as ItemSubtotal
	FROM
		OrderHistory 
			INNER JOIN Cart ON OrderHistory.cartId = Cart.cartId 
			INNER JOIN CartItems ON Cart.cartId = CartItems.cartId
			INNER JOIN Addresses ON OrderHistory.shippingAddress = Addresses.addressId
			INNER JOIN Products ON CartItems.productId = Products.productId
    WHERE
		authNumber = @authNumber
END
GO
/****** Object:  StoredProcedure [dbo].[getOrderTotal]    Script Date: 2018-11-04 9:27:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getOrderTotal]
    @authNumber        NVARCHAR(50)
AS
BEGIN
    SELECT
		SUM(CartItems.qty * CartItems.historicalPrice) AS GrandTotal
	FROM
		OrderHistory 
			INNER JOIN Cart ON OrderHistory.cartId = Cart.cartId 
			INNER JOIN CartItems ON Cart.cartId = CartItems.cartId
    WHERE
		authNumber = @authNumber
END
GO
/****** Object:  StoredProcedure [dbo].[getProductPrice]    Script Date: 2018-11-04 9:27:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getProductPrice] 
	-- Add the parameters for the stored procedure here
	@prodId int

AS
BEGIN

Select price FROM Products WHERE productId = @prodId
SELECT CAST(scope_identity() AS decimal)
END
GO
/****** Object:  StoredProcedure [dbo].[getProducts]    Script Date: 2018-11-04 9:27:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getProducts]
    @category INT
AS
BEGIN
	DECLARE @tempURL VARCHAR(200)
	SET @tempURL = '~/images/placeholder.jpg'
    SELECT
        SiteImages.imageId,
		imageName,
		imageURL,
		uploadDate,
		altText,
		approved,
		active,
		uploadedBy,
		productId,
		productName,
		briefDescription,
		fullDescription,
		statusCode,
		price,
		featured,
		categoryId
    FROM
        Products  INNER JOIN
		SiteImages ON products.imageId = SiteImages.imageId
    WHERE
        categoryId = @category AND
		active = 1
	UNION
	SELECT
		SiteImages.imageId,
		imageName,
		@tempURL AS imageURL,
		uploadDate,
		altText,
		approved,
		active,
		uploadedBy,
		productId,
		productName,
		briefDescription,
		fullDescription,
		statusCode,
		price,
		featured,
		categoryId    FROM
        Products  INNER JOIN
		SiteImages ON products.imageId = SiteImages.imageId
    WHERE
        categoryId = @category AND
		active = 0
END
GO
/****** Object:  StoredProcedure [dbo].[getSingleCategory]    Script Date: 2018-11-04 9:27:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getSingleCategory]
    @categoryId  INT
AS
BEGIN
    SELECT
        *
    FROM
        Categories
    WHERE
        categoryId = @categoryId;
END
GO
/****** Object:  StoredProcedure [dbo].[getSingleImage]    Script Date: 2018-11-04 9:27:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getSingleImage]
	@imageID	INT
AS
BEGIN
    SELECT
		imageUrl
	FROM
		SiteImages
	WHERE
		imageId = @imageID;
END
GO
/****** Object:  StoredProcedure [dbo].[getSingleProduct]    Script Date: 2018-11-04 9:27:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getSingleProduct]
    @productId  INT
AS
BEGIN
	DECLARE @tempURL VARCHAR(200)
	SET @tempURL = '~/images/placeholder.jpg'
    SELECT
        SiteImages.imageId,
		imageName,
		imageURL,
		uploadDate,
		altText,
		approved,
		active,
		uploadedBy,
		productId,
		productName,
		briefDescription,
		fullDescription,
		statusCode,
		price,
		featured,
		Categories.categoryId,
		[name],
		[description]
    FROM
        Products INNER JOIN
		Categories ON Products.categoryId = Categories.categoryId  INNER JOIN
		SiteImages ON products.imageId = SiteImages.imageId
    WHERE
        productId = @productId AND
		active = 1
	UNION
	    SELECT
        SiteImages.imageId,
		imageName,
		@tempURL AS imageURL,
		uploadDate,
		altText,
		approved,
		active,
		uploadedBy,
		productId,
		productName,
		briefDescription,
		fullDescription,
		statusCode,
		price,
		featured,
		Categories.categoryId,
		[name],
		[description]
    FROM
        Products INNER JOIN
		Categories ON Products.categoryId = Categories.categoryId  INNER JOIN
		SiteImages ON products.imageId = SiteImages.imageId
    WHERE
        productId = @productId AND
		active = 0;
END
GO
/****** Object:  StoredProcedure [dbo].[insertAddress]    Script Date: 2018-11-04 9:27:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[insertAddress]
    @street             NVARCHAR(50),
    @city               NVARCHAR(50),
    @stateProv          NVARCHAR(15),
    @country            NVARCHAR(20),
    @postalCode         NVARCHAR(10),
    @customerId         INT,
	@addressOutput		INT				OUTPUT,
    @additionalNo       NVARCHAR(50)     = null
AS
BEGIN
    INSERT INTO
		Addresses
	VALUES
		(
			@street,
			@city,
			@stateProv,
			@country,
			@postalCode,
			'Shipping',
			@customerId,
			GETDATE(),
			@additionalNo
		);
		SET @addressOutput = @@IDENTITY;
		RETURN @addressOutput
END
GO
/****** Object:  StoredProcedure [dbo].[insertCategory]    Script Date: 2018-11-04 9:27:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[insertCategory]
    @name           NVARCHAR(50),
    @description    NVARCHAR(max)
AS
BEGIN
    INSERT INTO
        Categories
    VALUES
        (
            @name,
            @description
        );
END
GO
/****** Object:  StoredProcedure [dbo].[insertCustomer]    Script Date: 2018-11-04 9:27:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[insertCustomer]
    @email              NVARCHAR(50),
    @username           NVARCHAR(15),
    @password           NVARCHAR(15),
    @firstName          NVARCHAR(50),
    @lastName           NVARCHAR(50),
    @phone              NVARCHAR(14),
    @middleInitial      CHAR(1)         = null,
    @verificationToken  NVARCHAR(50),
    @street             NVARCHAR(50),
    @city               NVARCHAR(50),
    @stateProv          NVARCHAR(15),
    @country            NVARCHAR(20),
    @postalCode         NVARCHAR(10)
AS
BEGIN
    SET NOCOUNT ON;
	DECLARE @custID INT;
    BEGIN TRY
        BEGIN TRAN
            INSERT INTO
                Customers
            VALUES
                (
                    @email,
                    @username,
                    @password,
                    @firstName,
                    @lastName,
                    @phone,
                    @middleInitial,
                    @verificationToken,
                    0,
                    0
                );
            SET @custID = @@IDENTITY;
            INSERT INTO
                addresses
            VALUES
                (
                    @street,
                    @city,
                    @stateProv,
                    @country,
                    @postalCode,
                    'Billing',
                    @custID,
                    GETDATE(),
                    null
                );
        COMMIT TRAN
    END TRY
    BEGIN CATCH
        ROLLBACK TRAN
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[insertImage]    Script Date: 2018-11-04 9:27:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[insertImage]
	@imageName	NVARCHAR(50),
	@imageUrl	NVARCHAR(200),
	@altText	NVARCHAR(50),
	@uploadedBy	INT
AS
BEGIN
    INSERT INTO
		SiteImages
	VALUES
		(
			@imageName,
			@imageUrl,
			GETDATE(),
			@altText,
			0,
			1,
			@uploadedBy
		);
END
GO
/****** Object:  StoredProcedure [dbo].[InsertOrder]    Script Date: 2018-11-04 9:27:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertOrder]
    @cartId             INT,
    @shippingAddress    INT,
    @payType            NVARCHAR(2),
    @authNumber         NVARCHAR(50),
    @customerId         INT
AS
BEGIN
    --DB for Debit / CR for Credit
    INSERT INTO
        OrderHistory
    VALUES
        (
        @cartId,
        @shippingAddress,
        @payType,
        @authNumber
        );

    UPDATE 
        Cart
    SET
        customerId = @customerId,
        orderDate = GETDATE()
    WHERE
        cartId = @cartId;
END
GO
/****** Object:  StoredProcedure [dbo].[insertProduct]    Script Date: 2018-11-04 9:27:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[insertProduct]
    @productName        NVARCHAR(50),
    @briefDescription   NVARCHAR(max),
    @fullDescription    NVARCHAR(max),
    @statusCode         CHAR(1),
    @price              MONEY,
    @featured           BIT,
    @categoryId         INT,
	@imageId			INT
AS
BEGIN
    INSERT INTO
        Products
    VALUES
        (
            @productName,
            @briefDescription,
            @fullDescription,
            @statusCode,
            @price,
            @featured,
            @categoryId,
            @imageId
        );
END
GO
/****** Object:  StoredProcedure [dbo].[KeywordSearchProductsAll]    Script Date: 2018-11-04 9:27:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[KeywordSearchProductsAll]
    @Word1 VARCHAR(50) = NULL,
    @Word2 VARCHAR(50) = NULL,
    @Word3 VARCHAR(50) = NULL,
    @Word4 VARCHAR(50) = NULL,
    @Word5 VARCHAR(50) = NULL
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    -- 1 is true, 0 is false.   OR  Any Words is 0, All words is 1
    SET NOCOUNT ON;
	DECLARE @tempURL VARCHAR(200)
	SET @tempURL = '~/images/placeholder.jpg'
    DECLARE @WordCount int =0;
    IF @Word1 IS NOT NULL
		SET @WordCount = @WordCount + 1
    IF @Word2 IS NOT NULL
		SET @WordCount = @WordCount + 1
    IF @Word3 IS NOT NULL
		SET @WordCount = @WordCount + 1
    IF @Word4 IS NOT NULL
		SET @WordCount = @WordCount + 1
    IF @Word5 IS NOT NULL
		SET @WordCount = @WordCount + 1
    IF @WordCount=1
		BEGIN
			SELECT
				SiteImages.imageId,
				imageName,
				imageURL,
				uploadDate,
				altText,
				approved,
				active,
				uploadedBy,
				productId,
				productName,
				briefDescription,
				fullDescription,
				statusCode,
				price,
				featured,
				categoryId
			FROM
				Products INNER JOIN
				SiteImages ON products.imageId = SiteImages.imageId
			WHERE ((productName like '%' + @Word1 + '%' OR briefDescription like '%' + @Word1 + '%' OR fullDescription like '%' + @Word1 + '%' ) AND active = 1)
			UNION
				SELECT
				SiteImages.imageId,
				imageName,
				@tempURL AS imageURL,
				uploadDate,
				altText,
				approved,
				active,
				uploadedBy,
				productId,
				productName,
				briefDescription,
				fullDescription,
				statusCode,
				price,
				featured,
				categoryId
			FROM
				Products INNER JOIN
				SiteImages ON products.imageId = SiteImages.imageId
			WHERE ((productName like '%' + @Word1 + '%' OR briefDescription like '%' + @Word1 + '%' OR fullDescription like '%' + @Word1 + '%' ) AND active = 0)
				Return
		END
	ELSE 
	IF @WordCount=2
		BEGIN
			SELECT
				SiteImages.imageId,
				imageName,
				imageURL,
				uploadDate,
				altText,
				approved,
				active,
				uploadedBy,
				productId,
				productName,
				briefDescription,
				fullDescription,
				statusCode,
				price,
				featured,
				categoryId
			FROM
				Products INNER JOIN
				SiteImages ON products.imageId = SiteImages.imageId
			WHERE ((productName like '%' + @Word1 + '%' OR briefDescription like '%' + @Word1 + '%' OR fullDescription like '%' + @Word1 + '%' ) AND active = 1)
				AND((productName like '%' + @Word2 + '%' OR briefDescription like '%' + @Word2 + '%' OR fullDescription like '%' + @Word2 + '%') AND active = 1)
			UNION
				SELECT
				SiteImages.imageId,
				imageName,
				@tempURL AS imageURL,
				uploadDate,
				altText,
				approved,
				active,
				uploadedBy,
				productId,
				productName,
				briefDescription,
				fullDescription,
				statusCode,
				price,
				featured,
				categoryId
			FROM
				Products INNER JOIN
				SiteImages ON products.imageId = SiteImages.imageId
			WHERE ((productName like '%' + @Word1 + '%' OR briefDescription like '%' + @Word1 + '%' OR fullDescription like '%' + @Word1 + '%' ) AND active = 0)
				AND((productName like '%' + @Word2 + '%' OR briefDescription like '%' + @Word2 + '%' OR fullDescription like '%' + @Word2 + '%') AND active = 0)
				Return
		END
	ELSE 
		IF @WordCount=3
		BEGIN
			SELECT
				SiteImages.imageId,
				imageName,
				imageURL,
				uploadDate,
				altText,
				approved,
				active,
				uploadedBy,
				productId,
				productName,
				briefDescription,
				fullDescription,
				statusCode,
				price,
				featured,
				categoryId
			FROM
				Products INNER JOIN
				SiteImages ON products.imageId = SiteImages.imageId
			WHERE ((productName like '%' + @Word1 + '%' OR briefDescription like '%' + @Word1 + '%' OR fullDescription like '%' + @Word1 + '%' ) AND active = 1)
				AND((productName like '%' + @Word2 + '%' OR briefDescription like '%' + @Word2 + '%' OR fullDescription like '%' + @Word2 + '%') AND active = 1)
				AND((productName like '%' + @Word3 + '%' OR briefDescription like '%' + @Word3 + '%' OR fullDescription like '%' + @Word3 + '%') AND active = 1)
			UNION
				SELECT
				SiteImages.imageId,
				imageName,
				@tempURL AS imageURL,
				uploadDate,
				altText,
				approved,
				active,
				uploadedBy,
				productId,
				productName,
				briefDescription,
				fullDescription,
				statusCode,
				price,
				featured,
				categoryId
			FROM
				Products INNER JOIN
				SiteImages ON products.imageId = SiteImages.imageId
			WHERE ((productName like '%' + @Word1 + '%' OR briefDescription like '%' + @Word1 + '%' OR fullDescription like '%' + @Word1 + '%' ) AND active = 0)
				AND((productName like '%' + @Word2 + '%' OR briefDescription like '%' + @Word2 + '%' OR fullDescription like '%' + @Word2 + '%') AND active = 0)
				AND((productName like '%' + @Word3 + '%' OR briefDescription like '%' + @Word3 + '%' OR fullDescription like '%' + @Word3 + '%') AND active = 0)
				Return
		END
	ELSE 
		IF @WordCount=4
		BEGIN
			SELECT
				SiteImages.imageId,
				imageName,
				imageURL,
				uploadDate,
				altText,
				approved,
				active,
				uploadedBy,
				productId,
				productName,
				briefDescription,
				fullDescription,
				statusCode,
				price,
				featured,
				categoryId
			FROM
				Products INNER JOIN
				SiteImages ON products.imageId = SiteImages.imageId
			WHERE ((productName like '%' + @Word1 + '%' OR briefDescription like '%' + @Word1 + '%' OR fullDescription like '%' + @Word1 + '%' ) AND active = 1)
				AND((productName like '%' + @Word2 + '%' OR briefDescription like '%' + @Word2 + '%' OR fullDescription like '%' + @Word2 + '%') AND active = 1)
				AND((productName like '%' + @Word3 + '%' OR briefDescription like '%' + @Word3 + '%' OR fullDescription like '%' + @Word3 + '%') AND active = 1)
				AND((productName like '%' + @Word4 + '%' OR briefDescription like '%' + @Word4 + '%' OR fullDescription like '%' + @Word4 + '%') AND active = 1)
			UNION
				SELECT
				SiteImages.imageId,
				imageName,
				@tempURL AS imageURL,
				uploadDate,
				altText,
				approved,
				active,
				uploadedBy,
				productId,
				productName,
				briefDescription,
				fullDescription,
				statusCode,
				price,
				featured,
				categoryId
			FROM
				Products INNER JOIN
				SiteImages ON products.imageId = SiteImages.imageId
			WHERE ((productName like '%' + @Word1 + '%' OR briefDescription like '%' + @Word1 + '%' OR fullDescription like '%' + @Word1 + '%' ) AND active = 0)
				AND((productName like '%' + @Word2 + '%' OR briefDescription like '%' + @Word2 + '%' OR fullDescription like '%' + @Word2 + '%') AND active = 0)
				AND((productName like '%' + @Word3 + '%' OR briefDescription like '%' + @Word3 + '%' OR fullDescription like '%' + @Word3 + '%') AND active = 0)
				AND((productName like '%' + @Word4 + '%' OR briefDescription like '%' + @Word4 + '%' OR fullDescription like '%' + @Word4 + '%') AND active = 0)
				Return
		END
	ELSE 
	IF @WordCount=5
    SELECT
        SiteImages.imageId,
		imageName,
		imageURL,
		uploadDate,
		altText,
		approved,
		active,
		uploadedBy,
		productId,
		productName,
		briefDescription,
		fullDescription,
		statusCode,
		price,
		featured,
		categoryId
    FROM
        Products INNER JOIN
		SiteImages ON products.imageId = SiteImages.imageId
    WHERE ((productName like '%' + @Word1 + '%' OR briefDescription like '%' + @Word1 + '%' OR fullDescription like '%' + @Word1 + '%' ) AND active = 1)
        AND((productName like '%' + @Word2 + '%' OR briefDescription like '%' + @Word2 + '%' OR fullDescription like '%' + @Word2 + '%') AND active = 1)
        AND((productName like '%' + @Word3 + '%' OR briefDescription like '%' + @Word3 + '%' OR fullDescription like '%' + @Word3 + '%') AND active = 1)
        AND((productName like '%' + @Word4 + '%' OR briefDescription like '%' + @Word4 + '%' OR fullDescription like '%' + @Word4 + '%') AND active = 1)
        AND((productName like '%' + @Word5 + '%' OR briefDescription like '%' + @Word5 + '%' OR fullDescription like '%' + @Word5 + '%') AND active = 1)
	UNION
	    SELECT
        SiteImages.imageId,
		imageName,
		@tempURL AS imageURL,
		uploadDate,
		altText,
		approved,
		active,
		uploadedBy,
		productId,
		productName,
		briefDescription,
		fullDescription,
		statusCode,
		price,
		featured,
		categoryId
    FROM
        Products INNER JOIN
		SiteImages ON products.imageId = SiteImages.imageId
    WHERE ((productName like '%' + @Word1 + '%' OR briefDescription like '%' + @Word1 + '%' OR fullDescription like '%' + @Word1 + '%' ) AND active = 0)
        AND((productName like '%' + @Word2 + '%' OR briefDescription like '%' + @Word2 + '%' OR fullDescription like '%' + @Word2 + '%') AND active = 0)
        AND((productName like '%' + @Word3 + '%' OR briefDescription like '%' + @Word3 + '%' OR fullDescription like '%' + @Word3 + '%') AND active = 0)
        AND((productName like '%' + @Word4 + '%' OR briefDescription like '%' + @Word4 + '%' OR fullDescription like '%' + @Word4 + '%') AND active = 0)
        AND((productName like '%' + @Word5 + '%' OR briefDescription like '%' + @Word5 + '%' OR fullDescription like '%' + @Word5 + '%') AND active = 0)
    Return
END
GO
/****** Object:  StoredProcedure [dbo].[KeywordSearchProductsAny]    Script Date: 2018-11-04 9:27:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[KeywordSearchProductsAny]
    @Word1 VARCHAR(50) = NULL,
    @Word2 VARCHAR(50) = NULL,
    @Word3 VARCHAR(50) = NULL,
    @Word4 VARCHAR(50) = NULL,
    @Word5 VARCHAR(50) = NULL
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    -- 1 is true, 0 is false.   OR  Any Words is 0, All words is 1
    SET NOCOUNT ON;
	DECLARE @tempURL VARCHAR(200)
	SET @tempURL = '~/images/placeholder.jpg'
    SELECT
        SiteImages.imageId,
		imageName,
		imageURL,
		uploadDate,
		altText,
		approved,
		active,
		uploadedBy,
		productId,
		productName,
		briefDescription,
		fullDescription,
		statusCode,
		price,
		featured,
		categoryId
    FROM
        Products INNER JOIN
		SiteImages ON products.imageId = SiteImages.imageId
    WHERE ((productName like '%' + @Word1 + '%' OR briefDescription like '%' + @Word1 + '%' OR fullDescription like '%' + @Word1 + '%') AND active = 1)
        OR((productName like '%' + @Word2 + '%' OR briefDescription like '%' + @Word2 + '%' OR fullDescription like '%' + @Word2 + '%') AND active = 1)
        OR((productName like '%' + @Word3 + '%' OR briefDescription like '%' + @Word3 + '%' OR fullDescription like '%' + @Word3 + '%') AND active = 1)
        OR((productName like '%' + @Word4 + '%' OR briefDescription like '%' + @Word4 + '%' OR fullDescription like '%' + @Word4 + '%') AND active = 1)
        OR((productName like '%' + @Word5 + '%' OR briefDescription like '%' + @Word5 + '%' OR fullDescription like '%' + @Word5 + '%') AND active = 1)
	UNION
    SELECT
        SiteImages.imageId,
		imageName,
		@tempURL AS imageURL,
		uploadDate,
		altText,
		approved,
		active,
		uploadedBy,
		productId,
		productName,
		briefDescription,
		fullDescription,
		statusCode,
		price,
		featured,
		categoryId
    FROM
        Products INNER JOIN
		SiteImages ON products.imageId = SiteImages.imageId
    WHERE ((productName like '%' + @Word1 + '%' OR briefDescription like '%' + @Word1 + '%' OR fullDescription like '%' + @Word1 + '%') AND active = 0)
        OR((productName like '%' + @Word2 + '%' OR briefDescription like '%' + @Word2 + '%' OR fullDescription like '%' + @Word2 + '%') AND active = 0)
        OR((productName like '%' + @Word3 + '%' OR briefDescription like '%' + @Word3 + '%' OR fullDescription like '%' + @Word3 + '%') AND active = 0)
        OR((productName like '%' + @Word4 + '%' OR briefDescription like '%' + @Word4 + '%' OR fullDescription like '%' + @Word4 + '%') AND active = 0)
        OR((productName like '%' + @Word5 + '%' OR briefDescription like '%' + @Word5 + '%' OR fullDescription like '%' + @Word5 + '%') AND active = 0)
END
GO
/****** Object:  StoredProcedure [dbo].[loginAdmin]    Script Date: 2018-11-04 9:27:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[loginAdmin]
    @email		NVARCHAR(50),
    @password   NVARCHAR(15)
AS
BEGIN
        --Returns admin ID on success - Returns 0 on fail
        SELECT
            id
        FROM
            adminLogin
        WHERE
            email = @email AND
            [password] = @password
END
GO
/****** Object:  StoredProcedure [dbo].[loginCustomer]    Script Date: 2018-11-04 9:27:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[loginCustomer]
    @username   NVARCHAR(15),
    @password   NVARCHAR(15)
AS
BEGIN
	IF EXISTS	(	SELECT customerId
					FROM Customers
					WHERE username = @username AND [password] = @password AND verified = 1
				)
		BEGIN
			SELECT
				customerId
			FROM
				Customers
			WHERE
				username = @username AND
				[password] = @password AND
				verified = 1
		END
	IF EXISTS	(	SELECT customerId
					FROM Customers
					WHERE username = @username AND [password] = @password AND verified = 0
				)
		BEGIN
			RAISERROR('Account has not been verified',16,1)
		END
	ELSE
		RAISERROR('Login unsuccessful. No existing user with those matching credentials.', 16, 1)
END
GO
/****** Object:  StoredProcedure [dbo].[searchCustomer]    Script Date: 2018-11-04 9:27:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[searchCustomer]
    @choice			INT,
	@searchText		VARCHAR(50)
AS
BEGIN
    --Search by CustomerID
    IF (@choice = 0)
    BEGIN
        SELECT
            customerId,
            email,
            username,
            firstName,
            lastName,
            phone,
            middleInitial,
            verified,
            [archived]
        FROM
            Customers
        WHERE
            customerId LIKE '%' + @searchText + '%';
    END
    --Search by email address
    ELSE IF (@choice = 1)
    BEGIN
        SELECT
            customerId,
            email,
            username,
            firstName,
            lastName,
            phone,
            middleInitial,
            verified,
            [archived]
        FROM
            Customers
        WHERE
            email LIKE '%' + @searchText + '%';
    END
    --Search by Phone
    ELSE IF (@choice = 2)
    BEGIN
        SELECT
            customerId,
            email,
            username,
            firstName,
            lastName,
            phone,
            middleInitial,
            verified,
            [archived]
        FROM
            Customers
        WHERE
            phone LIKE '%' + @searchText + '%';
    END
END
GO
/****** Object:  StoredProcedure [dbo].[searchImages]    Script Date: 2018-11-04 9:27:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[searchImages]
    @searchText        VARCHAR(50)
AS
BEGIN
    --Search by text
    BEGIN
        SELECT
        imageId, imageName, imageUrl, uploadDate, altText, approved, uploadedBy, email, active
        FROM
        SiteImages INNER JOIN adminLogin ON SiteImages.uploadedBy = adminLogin.id
        WHERE
            imageUrl LIKE '%' + @searchText + '%' OR imageName LIKE '%' + @searchText + '%';
    END
END
GO
/****** Object:  StoredProcedure [dbo].[updateAddress]    Script Date: 2018-11-04 9:27:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[updateAddress]
    @street             NVARCHAR(50),
    @city               NVARCHAR(50),
    @stateProv          NVARCHAR(15),
    @country            NVARCHAR(20),
    @postalCode         NVARCHAR(10),
    @customerId         INT,
    @addressOutput      INT             OUTPUT,
    @additionalNo       NVARCHAR(50)     = null
AS
BEGIN
    UPDATE
        Addresses
    SET
        street = @street,
        city = @city,
        stateProv = @stateProv,
        country = @country,
        postalCode = @postalCode,
        AdditionalNo = @additionalNo,
        @addressOutput = addressId
    WHERE
        customerId = @customerId AND
        addressType = 'Billing';
    RETURN @addressOutput;
END
GO
/****** Object:  StoredProcedure [dbo].[updateCartItemQty]    Script Date: 2018-11-04 9:27:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[updateCartItemQty] 
    @qty int = 1,
    @prodID int, 
    @cartID int
AS
BEGIN
    IF EXISTS (SELECT ProductId FROM CartItems WHERE ProductId = @prodID and CartId = @cartID)
        UPDATE CartItems SET Qty = (@qty) WHERE ProductId = @prodID and CartId = @cartID
    IF @prodID NOT IN (SELECT ProductId FROM CartItems WHERE ProductId = @prodID and CartId = @cartID)
        BEGIN
            DECLARE @price decimal;
            SET @price = (SELECT price FROM Products WHERE productId = @prodID)
            INSERT INTO CartItems VALUES (@cartID, @prodID, @qty, @price, null, 'AV');
        END
    RETURN
END
GO
/****** Object:  StoredProcedure [dbo].[updateCategory]    Script Date: 2018-11-04 9:27:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[updateCategory]
    @categoryId     INT,
    @name           NVARCHAR(50),
    @description    NVARCHAR(max)
AS
BEGIN
    UPDATE
        Categories
    SET
        [name] = @name,
        [description] = @description
    WHERE
        categoryId = @categoryId;
END
GO
/****** Object:  StoredProcedure [dbo].[updateCustomer]    Script Date: 2018-11-04 9:27:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[updateCustomer]
	@customerId			INT,
    @email              NVARCHAR(50),
    @lastName           NVARCHAR(50),
    @phone              NVARCHAR(14)
AS
BEGIN
    UPDATE
        Customers
    SET
        email = @email,
        lastName = @lastName,
        phone = @phone
	WHERE
		customerId = @customerId;
END
GO
/****** Object:  StoredProcedure [dbo].[updateCustomerAdmin]    Script Date: 2018-11-04 9:27:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[updateCustomerAdmin]
	@customerId			INT,
    @email              NVARCHAR(50),
    @firstName          NVARCHAR(50),
    @lastName           NVARCHAR(50),
    @phone              NVARCHAR(14),
    @middleInitial      CHAR(1)         = null,
    @archived           BIT
AS
BEGIN
    UPDATE
        Customers
    SET
        email = @email,
        firstName = @firstName,
        lastName = @lastName,
        phone = @phone,
        middleInitial = @middleInitial,
        archived = @archived
	WHERE
		customerId = @customerId;
END
GO
/****** Object:  StoredProcedure [dbo].[updateImage]    Script Date: 2018-11-04 9:27:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[updateImage]
	@imageId	INT,
	@imageName	NVARCHAR(50),
	@altText	NVARCHAR(50),
	@active		BIT
AS
BEGIN
    UPDATE
		SiteImages
	SET
		imageName = @imageName,
		altText = @altText,
		active = @active
	WHERE
		imageId = @imageId;
END
GO
/****** Object:  StoredProcedure [dbo].[updateProduct]    Script Date: 2018-11-04 9:27:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[updateProduct]
    @productId          INT,
    @productName        NVARCHAR(50),
    @briefDescription   NVARCHAR(max),
    @fullDescription    NVARCHAR(max),
    @statusCode         CHAR(1),
    @price              MONEY,
    @featured           BIT,
    @categoryId         INT,
	@imageId			INT
AS
BEGIN
    UPDATE
        Products
    SET
        productName = @productName,
        briefDescription = @briefDescription,
        fullDescription = @fullDescription,
        statusCode = @statusCode,
        price = @price,
        featured = @featured,
        categoryId = @categoryId,
		imageId = @imageId
    WHERE
        productId = @productId;
END
GO
/****** Object:  StoredProcedure [dbo].[verifyToken]    Script Date: 2018-11-04 9:27:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[verifyToken]
    @verificationToken      NVARCHAR(50),
    @result                 INT OUTPUT
AS
BEGIN
    --returns 1 if token verified
    --returns 0 if token not verified
    DECLARE @tokenCount AS INT;
    SET @tokenCount =   (
                        SELECT
                            COUNT(*)
                        FROM
                            Customers
                        WHERE
                            verificationToken = @verificationToken
                        )
    IF (@tokenCount = 1)
        BEGIN
            UPDATE
                Customers
            SET
                verified = 1
            WHERE
                verificationToken = @verificationToken
            SET @result = 1
        END
    ELSE
        BEGIN
            SET @result = 0
        END
    RETURN @result
END
GO
USE [master]
GO
ALTER DATABASE [PastryEmporium] SET  READ_WRITE 
GO
