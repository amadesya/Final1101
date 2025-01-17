USE [ParfumShop]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 20.12.2024 6:10:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[PickupPointId] [int] NOT NULL,
	[OrderStatus] [nvarchar](25) NOT NULL,
	[OrderDeliveryDate] [datetime] NULL,
	[OrderDate] [datetime] NOT NULL,
	[OrderPickupCode] [smallint] NOT NULL,
 CONSTRAINT [PK__Order__C3905BAFB83F9484] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderProduct]    Script Date: 20.12.2024 6:10:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderProduct](
	[OrderId] [int] NOT NULL,
	[ProductArticleNumber] [nvarchar](50) NOT NULL,
	[ProductAmount] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK__OrderPro__817A2662FAB86C7C] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC,
	[ProductArticleNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PickupPoint]    Script Date: 20.12.2024 6:10:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PickupPoint](
	[PickupPointId] [int] IDENTITY(1,1) NOT NULL,
	[PostalCode] [int] NOT NULL,
	[City] [nvarchar](50) NOT NULL,
	[Street] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_PickupPoint] PRIMARY KEY CLUSTERED 
(
	[PickupPointId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 20.12.2024 6:10:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductArticleNumber] [nvarchar](50) NOT NULL,
	[ProductCategoryId] [int] NOT NULL,
	[ProductStatusId] [int] NOT NULL,
	[ProductName] [nvarchar](max) NOT NULL,
	[ProductDescription] [nvarchar](max) NOT NULL,
	[ProductPhoto] [image] NULL,
	[ProductManufacturer] [nvarchar](max) NOT NULL,
	[ProductCost] [decimal](19, 4) NOT NULL,
	[ProductDiscountAmount] [tinyint] NULL,
	[ProductQuantityInStock] [int] NOT NULL,
 CONSTRAINT [PK__Product__2EA7DCD51CCE2519] PRIMARY KEY CLUSTERED 
(
	[ProductArticleNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductCategory]    Script Date: 20.12.2024 6:10:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCategory](
	[ProductCategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ProductCategory] PRIMARY KEY CLUSTERED 
(
	[ProductCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductStatus]    Script Date: 20.12.2024 6:10:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductStatus](
	[ProductStatusId] [int] IDENTITY(1,1) NOT NULL,
	[ProductAvailability] [nchar](50) NOT NULL,
 CONSTRAINT [PK_ProductStatus] PRIMARY KEY CLUSTERED 
(
	[ProductStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 20.12.2024 6:10:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 20.12.2024 6:10:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [int] NOT NULL,
	[UserSurname] [nvarchar](50) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[UserPatronymic] [nvarchar](50) NOT NULL,
	[UserLogin] [nvarchar](50) NOT NULL,
	[UserPassword] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([OrderId], [UserId], [PickupPointId], [OrderStatus], [OrderDeliveryDate], [OrderDate], [OrderPickupCode]) VALUES (1, 2, 37, N'Завершён', CAST(N'2022-05-12T00:00:00.000' AS DateTime), CAST(N'2022-05-04T00:00:00.000' AS DateTime), 201)
INSERT [dbo].[Order] ([OrderId], [UserId], [PickupPointId], [OrderStatus], [OrderDeliveryDate], [OrderDate], [OrderPickupCode]) VALUES (6, 3, 38, N'Новый', CAST(N'2024-12-25T00:00:00.000' AS DateTime), CAST(N'2024-12-20T00:00:00.000' AS DateTime), 202)
INSERT [dbo].[Order] ([OrderId], [UserId], [PickupPointId], [OrderStatus], [OrderDeliveryDate], [OrderDate], [OrderPickupCode]) VALUES (7, 7, 44, N'Новый ', CAST(N'2022-05-10T00:00:00.000' AS DateTime), CAST(N'2022-05-04T00:00:00.000' AS DateTime), 201)
INSERT [dbo].[Order] ([OrderId], [UserId], [PickupPointId], [OrderStatus], [OrderDeliveryDate], [OrderDate], [OrderPickupCode]) VALUES (8, 9, 45, N'Новый ', CAST(N'2022-05-11T00:00:00.000' AS DateTime), CAST(N'2022-05-05T00:00:00.000' AS DateTime), 202)
INSERT [dbo].[Order] ([OrderId], [UserId], [PickupPointId], [OrderStatus], [OrderDeliveryDate], [OrderDate], [OrderPickupCode]) VALUES (9, 11, 46, N'Новый ', CAST(N'2022-05-12T00:00:00.000' AS DateTime), CAST(N'2022-05-06T00:00:00.000' AS DateTime), 203)
INSERT [dbo].[Order] ([OrderId], [UserId], [PickupPointId], [OrderStatus], [OrderDeliveryDate], [OrderDate], [OrderPickupCode]) VALUES (10, 13, 47, N'Новый ', CAST(N'2022-05-13T00:00:00.000' AS DateTime), CAST(N'2022-05-07T00:00:00.000' AS DateTime), 204)
INSERT [dbo].[Order] ([OrderId], [UserId], [PickupPointId], [OrderStatus], [OrderDeliveryDate], [OrderDate], [OrderPickupCode]) VALUES (11, 15, 48, N'Новый ', CAST(N'2022-05-14T00:00:00.000' AS DateTime), CAST(N'2022-05-08T00:00:00.000' AS DateTime), 205)
INSERT [dbo].[Order] ([OrderId], [UserId], [PickupPointId], [OrderStatus], [OrderDeliveryDate], [OrderDate], [OrderPickupCode]) VALUES (12, 17, 49, N'Новый ', CAST(N'2022-05-15T00:00:00.000' AS DateTime), CAST(N'2022-05-09T00:00:00.000' AS DateTime), 206)
INSERT [dbo].[Order] ([OrderId], [UserId], [PickupPointId], [OrderStatus], [OrderDeliveryDate], [OrderDate], [OrderPickupCode]) VALUES (13, 19, 40, N'Новый ', CAST(N'2022-05-16T00:00:00.000' AS DateTime), CAST(N'2022-05-10T00:00:00.000' AS DateTime), 207)
INSERT [dbo].[Order] ([OrderId], [UserId], [PickupPointId], [OrderStatus], [OrderDeliveryDate], [OrderDate], [OrderPickupCode]) VALUES (14, 21, 41, N'Новый ', CAST(N'2022-05-17T00:00:00.000' AS DateTime), CAST(N'2022-05-11T00:00:00.000' AS DateTime), 208)
INSERT [dbo].[Order] ([OrderId], [UserId], [PickupPointId], [OrderStatus], [OrderDeliveryDate], [OrderDate], [OrderPickupCode]) VALUES (15, 23, 42, N'Новый ', CAST(N'2022-05-18T00:00:00.000' AS DateTime), CAST(N'2022-05-12T00:00:00.000' AS DateTime), 209)
INSERT [dbo].[Order] ([OrderId], [UserId], [PickupPointId], [OrderStatus], [OrderDeliveryDate], [OrderDate], [OrderPickupCode]) VALUES (16, 25, 43, N'Завершен', CAST(N'2022-05-19T00:00:00.000' AS DateTime), CAST(N'2022-05-13T00:00:00.000' AS DateTime), 210)
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
INSERT [dbo].[OrderProduct] ([OrderId], [ProductArticleNumber], [ProductAmount]) VALUES (1, N'F893T5', N'1')
INSERT [dbo].[OrderProduct] ([OrderId], [ProductArticleNumber], [ProductAmount]) VALUES (6, N'F893T5', N'2')
INSERT [dbo].[OrderProduct] ([OrderId], [ProductArticleNumber], [ProductAmount]) VALUES (6, N'А112Т4', N'2')
INSERT [dbo].[OrderProduct] ([OrderId], [ProductArticleNumber], [ProductAmount]) VALUES (7, N'E530Y6', N'1')
INSERT [dbo].[OrderProduct] ([OrderId], [ProductArticleNumber], [ProductAmount]) VALUES (7, N'F346G5', N'2')
INSERT [dbo].[OrderProduct] ([OrderId], [ProductArticleNumber], [ProductAmount]) VALUES (8, N'D344Y7', N'2')
INSERT [dbo].[OrderProduct] ([OrderId], [ProductArticleNumber], [ProductAmount]) VALUES (8, N'J432E4', N'1')
INSERT [dbo].[OrderProduct] ([OrderId], [ProductArticleNumber], [ProductAmount]) VALUES (9, N'D378D3', N'2')
INSERT [dbo].[OrderProduct] ([OrderId], [ProductArticleNumber], [ProductAmount]) VALUES (9, N'E245R5', N'1')
INSERT [dbo].[OrderProduct] ([OrderId], [ProductArticleNumber], [ProductAmount]) VALUES (10, N'H732R5', N'3')
INSERT [dbo].[OrderProduct] ([OrderId], [ProductArticleNumber], [ProductAmount]) VALUES (10, N'R464G6', N'2')
INSERT [dbo].[OrderProduct] ([OrderId], [ProductArticleNumber], [ProductAmount]) VALUES (11, N'E573G6', N'3')
INSERT [dbo].[OrderProduct] ([OrderId], [ProductArticleNumber], [ProductAmount]) VALUES (11, N'K535G6', N'3')
INSERT [dbo].[OrderProduct] ([OrderId], [ProductArticleNumber], [ProductAmount]) VALUES (12, N'F344S4', N'6')
INSERT [dbo].[OrderProduct] ([OrderId], [ProductArticleNumber], [ProductAmount]) VALUES (12, N'G532R5', N'5')
INSERT [dbo].[OrderProduct] ([OrderId], [ProductArticleNumber], [ProductAmount]) VALUES (13, N'D526R4', N'5')
INSERT [dbo].[OrderProduct] ([OrderId], [ProductArticleNumber], [ProductAmount]) VALUES (13, N'S753T5', N'4')
INSERT [dbo].[OrderProduct] ([OrderId], [ProductArticleNumber], [ProductAmount]) VALUES (14, N'A436H7', N'3')
INSERT [dbo].[OrderProduct] ([OrderId], [ProductArticleNumber], [ProductAmount]) VALUES (14, N'V472S3', N'3')
INSERT [dbo].[OrderProduct] ([OrderId], [ProductArticleNumber], [ProductAmount]) VALUES (15, N'E479G6', N'1')
INSERT [dbo].[OrderProduct] ([OrderId], [ProductArticleNumber], [ProductAmount]) VALUES (15, N'O875F6', N'4')
GO
SET IDENTITY_INSERT [dbo].[PickupPoint] ON 

INSERT [dbo].[PickupPoint] ([PickupPointId], [PostalCode], [City], [Street]) VALUES (37, 344288, N' г. Ангарск', N'ул. Чехова 1')
INSERT [dbo].[PickupPoint] ([PickupPointId], [PostalCode], [City], [Street]) VALUES (38, 614164, N' г.Ангарск', N'ул. Степная 30')
INSERT [dbo].[PickupPoint] ([PickupPointId], [PostalCode], [City], [Street]) VALUES (39, 394242, N' г. Ангарск', N'ул. Коммунистическая 43')
INSERT [dbo].[PickupPoint] ([PickupPointId], [PostalCode], [City], [Street]) VALUES (40, 660540, N' г. Ангарск', N'ул. Солнечная 25')
INSERT [dbo].[PickupPoint] ([PickupPointId], [PostalCode], [City], [Street]) VALUES (41, 125837, N' г. Ангарск', N'ул. Шоссейная 40')
INSERT [dbo].[PickupPoint] ([PickupPointId], [PostalCode], [City], [Street]) VALUES (42, 125703, N' г. Ангарск', N'ул. Партизанская 49')
INSERT [dbo].[PickupPoint] ([PickupPointId], [PostalCode], [City], [Street]) VALUES (43, 625283, N' г. Ангарск', N'ул. Победы 46')
INSERT [dbo].[PickupPoint] ([PickupPointId], [PostalCode], [City], [Street]) VALUES (44, 614611, N' г. Ангарск', N'ул. Молодежная 50')
INSERT [dbo].[PickupPoint] ([PickupPointId], [PostalCode], [City], [Street]) VALUES (45, 454311, N' г. Ангарск', N'ул. Новая 19')
INSERT [dbo].[PickupPoint] ([PickupPointId], [PostalCode], [City], [Street]) VALUES (46, 660007, N' г. Ангарск', N'ул. Октябрьская 19')
INSERT [dbo].[PickupPoint] ([PickupPointId], [PostalCode], [City], [Street]) VALUES (47, 603036, N' г. Ангарск', N'ул. Садовая 4')
INSERT [dbo].[PickupPoint] ([PickupPointId], [PostalCode], [City], [Street]) VALUES (48, 450983, N' г. Ангарск', N'ул. Комсомольская 26')
INSERT [dbo].[PickupPoint] ([PickupPointId], [PostalCode], [City], [Street]) VALUES (49, 394782, N' г. Ангарск', N'ул. Чехова 3')
INSERT [dbo].[PickupPoint] ([PickupPointId], [PostalCode], [City], [Street]) VALUES (50, 603002, N' г. Ангарск', N'ул. Дзержинского 28')
INSERT [dbo].[PickupPoint] ([PickupPointId], [PostalCode], [City], [Street]) VALUES (51, 450558, N' г. Ангарск', N'ул. Набережная 30')
INSERT [dbo].[PickupPoint] ([PickupPointId], [PostalCode], [City], [Street]) VALUES (52, 394060, N' г. Ангарск', N'ул. Фрунзе 43')
INSERT [dbo].[PickupPoint] ([PickupPointId], [PostalCode], [City], [Street]) VALUES (53, 410661, N' г. Ангарск', N'ул. Школьная 50')
INSERT [dbo].[PickupPoint] ([PickupPointId], [PostalCode], [City], [Street]) VALUES (54, 625590, N' г. Ангарск', N'ул. Коммунистическая 20')
INSERT [dbo].[PickupPoint] ([PickupPointId], [PostalCode], [City], [Street]) VALUES (55, 625683, N' г. Ангарск', N'ул. Марта 8')
INSERT [dbo].[PickupPoint] ([PickupPointId], [PostalCode], [City], [Street]) VALUES (56, 400562, N' г. Ангарск', N'ул. Зеленая 32')
INSERT [dbo].[PickupPoint] ([PickupPointId], [PostalCode], [City], [Street]) VALUES (57, 614510, N' г. Ангарск', N'ул. Маяковского 47')
INSERT [dbo].[PickupPoint] ([PickupPointId], [PostalCode], [City], [Street]) VALUES (58, 410542, N' г. Ангарск', N'ул. Светлая 46')
INSERT [dbo].[PickupPoint] ([PickupPointId], [PostalCode], [City], [Street]) VALUES (59, 620839, N' г. Ангарск', N'ул. Цветочная 8')
INSERT [dbo].[PickupPoint] ([PickupPointId], [PostalCode], [City], [Street]) VALUES (60, 443890, N' г. Ангарск', N'ул. Коммунистическая 1')
INSERT [dbo].[PickupPoint] ([PickupPointId], [PostalCode], [City], [Street]) VALUES (61, 603379, N' г. Ангарск', N'ул. Спортивная 46')
INSERT [dbo].[PickupPoint] ([PickupPointId], [PostalCode], [City], [Street]) VALUES (62, 603721, N' г. Ангарск', N'ул. Гоголя 41')
INSERT [dbo].[PickupPoint] ([PickupPointId], [PostalCode], [City], [Street]) VALUES (63, 410172, N' г. Ангарск', N'ул. Северная 13')
INSERT [dbo].[PickupPoint] ([PickupPointId], [PostalCode], [City], [Street]) VALUES (64, 420151, N' г. Ангарск', N'ул. Вишневая 32')
INSERT [dbo].[PickupPoint] ([PickupPointId], [PostalCode], [City], [Street]) VALUES (65, 125061, N' г. Ангарск', N'ул. Подгорная 8')
INSERT [dbo].[PickupPoint] ([PickupPointId], [PostalCode], [City], [Street]) VALUES (66, 630370, N' г. Ангарск', N'ул. Шоссейная 24')
INSERT [dbo].[PickupPoint] ([PickupPointId], [PostalCode], [City], [Street]) VALUES (67, 614753, N' г. Ангарск', N'ул. Полевая 35')
INSERT [dbo].[PickupPoint] ([PickupPointId], [PostalCode], [City], [Street]) VALUES (68, 426030, N' г. Ангарск', N'ул. Маяковского 44')
INSERT [dbo].[PickupPoint] ([PickupPointId], [PostalCode], [City], [Street]) VALUES (69, 450375, N' г. Ангарск', N'ул. Клубная 2')
INSERT [dbo].[PickupPoint] ([PickupPointId], [PostalCode], [City], [Street]) VALUES (70, 625560, N' г. Ангарск', N' ул. Некрасова 12')
INSERT [dbo].[PickupPoint] ([PickupPointId], [PostalCode], [City], [Street]) VALUES (71, 630201, N' г. Ангарск', N' ул. Комсомольская 17')
INSERT [dbo].[PickupPoint] ([PickupPointId], [PostalCode], [City], [Street]) VALUES (72, 190949, N' г. Ангарск', N' ул. Мичурина 26')
SET IDENTITY_INSERT [dbo].[PickupPoint] OFF
GO
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductCategoryId], [ProductStatusId], [ProductName], [ProductDescription], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (N'A436H7', 6, 3, N'Teint Idole Ultra Wear', N'Увлажняющий бальзам с нежным оттенком.', NULL, N'Lancome', CAST(3464.0000 AS Decimal(19, 4)), 10, 55)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductCategoryId], [ProductStatusId], [ProductName], [ProductDescription], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (N'D344Y7', 1, 1, N'Rouge Allure Velvet', N'Увлажняющий бальзам с нежным оттенком.', NULL, N'Yves Saint Laurent', CAST(3476.0000 AS Decimal(19, 4)), 23, 16)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductCategoryId], [ProductStatusId], [ProductName], [ProductDescription], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (N'D378D3', 5, 2, N'KissKiss Balm', N'Легкий и бодрящий аромат.', NULL, N'Chanel', CAST(4221.0000 AS Decimal(19, 4)), 4, 11)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductCategoryId], [ProductStatusId], [ProductName], [ProductDescription], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (N'D526R4', 8, 3, N'KissKiss Balm', N'Нежный цветочный аромат с нотами туберозы.', NULL, N'L''Oreal', CAST(1380.0000 AS Decimal(19, 4)), 13, 6)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductCategoryId], [ProductStatusId], [ProductName], [ProductDescription], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (N'E245R5', 6, 3, N'Gucci Bloom', N'Шелковистые тени с высоким пигментом.', NULL, N'Chanel', CAST(866.0000 AS Decimal(19, 4)), 25, 27)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductCategoryId], [ProductStatusId], [ProductName], [ProductDescription], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (N'E479G6', 8, 3, N'KissKiss Balm', N'Шелковистые тени с высоким пигментом.', NULL, N'Givenchy', CAST(2134.0000 AS Decimal(19, 4)), 63, 2)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductCategoryId], [ProductStatusId], [ProductName], [ProductDescription], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (N'E530Y6', 5, 3, N'Miss Dior', N'Долговечный тональный крем с естественным покрытием.', NULL, N'Dior', CAST(4748.0000 AS Decimal(19, 4)), 58, 45)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductCategoryId], [ProductStatusId], [ProductName], [ProductDescription], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (N'E573G6', 5, 2, N'Miss Dior', N'Легкий и бодрящий аромат.', NULL, N'Chanel', CAST(4234.0000 AS Decimal(19, 4)), 79, 19)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductCategoryId], [ProductStatusId], [ProductName], [ProductDescription], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (N'F344S4', 4, 3, N'Ombre Premiere', N'Шелковистые тени с высоким пигментом.', NULL, N'Lancome', CAST(3813.0000 AS Decimal(19, 4)), 1, 87)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductCategoryId], [ProductStatusId], [ProductName], [ProductDescription], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (N'F346G5', 1, 3, N'Bleu de Chanel', N'Долговечный тональный крем с естественным покрытием.', NULL, N'Gucci', CAST(2179.0000 AS Decimal(19, 4)), 10, 82)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductCategoryId], [ProductStatusId], [ProductName], [ProductDescription], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (N'F893T5', 3, 1, N'GIORGIO ARMANI', N'Acqua di Gio Giorgio Armani - это истинно мужской аромат, сочетающий в себе свежесть и элегантность.', NULL, N'GIORGIO ARMANI', CAST(12243.0000 AS Decimal(19, 4)), 0, 2)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductCategoryId], [ProductStatusId], [ProductName], [ProductDescription], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (N'G532R5', 1, 3, N'Acqua di Gioia', N'Увлажняющий бальзам с нежным оттенком.', NULL, N'Yves Saint Laurent', CAST(4813.0000 AS Decimal(19, 4)), 4, 51)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductCategoryId], [ProductStatusId], [ProductName], [ProductDescription], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (N'H732R5', 3, 2, N'Teint Idole Ultra Wear', N'Цветочный аромат с нотами розы и жасмина.', NULL, N'Dior', CAST(4650.0000 AS Decimal(19, 4)), 18, 75)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductCategoryId], [ProductStatusId], [ProductName], [ProductDescription], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (N'J432E4', 9, 2, N'Acqua di Gioia', N'Легкий и бодрящий аромат.', NULL, N'Chanel', CAST(4693.0000 AS Decimal(19, 4)), 59, 55)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductCategoryId], [ProductStatusId], [ProductName], [ProductDescription], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (N'K535G6', 6, 3, N'Gucci Bloom', N'Долговечный тональный крем с естественным покрытием.', NULL, N'L''Oreal', CAST(2131.0000 AS Decimal(19, 4)), 8, 36)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductCategoryId], [ProductStatusId], [ProductName], [ProductDescription], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (N'O875F6', 5, 2, N'Rouge Allure Velvet', N'Легкий и бодрящий аромат.', NULL, N'Yves Saint Laurent', CAST(3846.0000 AS Decimal(19, 4)), 75, 69)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductCategoryId], [ProductStatusId], [ProductName], [ProductDescription], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (N'P0019', 6, 2, N'Rouge Allure Velvet', N'Легкий и бодрящий аромат.', NULL, N'Yves Saint Laurent', CAST(4040.0000 AS Decimal(19, 4)), 40, 38)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductCategoryId], [ProductStatusId], [ProductName], [ProductDescription], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (N'P0020', 1, 3, N'Bleu de Chanel', N'Шелковистые тени с высоким пигментом.', NULL, N'Lancome', CAST(3543.0000 AS Decimal(19, 4)), 42, 66)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductCategoryId], [ProductStatusId], [ProductName], [ProductDescription], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (N'P0021', 4, 1, N'Gucci Bloom', N'Матовая помада с насыщенным цветом.', NULL, N'Gucci', CAST(3598.0000 AS Decimal(19, 4)), 74, 37)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductCategoryId], [ProductStatusId], [ProductName], [ProductDescription], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (N'P0022', 9, 3, N'KissKiss Balm', N'Нежный цветочный аромат с нотами туберозы.', NULL, N'Chanel', CAST(3085.0000 AS Decimal(19, 4)), 45, 7)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductCategoryId], [ProductStatusId], [ProductName], [ProductDescription], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (N'P0023', 1, 1, N'Ombre Premiere', N'Долговечный тональный крем с естественным покрытием.', NULL, N'Chanel', CAST(2208.0000 AS Decimal(19, 4)), 81, 17)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductCategoryId], [ProductStatusId], [ProductName], [ProductDescription], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (N'P0024', 3, 3, N'Acqua di Gioia', N'Цветочный аромат с нотами розы и жасмина.', NULL, N'Maybelline', CAST(3515.0000 AS Decimal(19, 4)), 61, 92)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductCategoryId], [ProductStatusId], [ProductName], [ProductDescription], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (N'P0025', 9, 3, N'Ombre Premiere', N'Нежный цветочный аромат с нотами туберозы.', NULL, N'Yves Saint Laurent', CAST(4066.0000 AS Decimal(19, 4)), 68, 77)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductCategoryId], [ProductStatusId], [ProductName], [ProductDescription], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (N'P0026', 3, 3, N'Rouge Allure Velvet', N'Свежий древесный аромат.', NULL, N'Gucci', CAST(4108.0000 AS Decimal(19, 4)), 37, 29)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductCategoryId], [ProductStatusId], [ProductName], [ProductDescription], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (N'P0027', 6, 3, N'Rouge Allure Velvet', N'Легкий и бодрящий аромат.', NULL, N'L''Oreal', CAST(3108.0000 AS Decimal(19, 4)), 84, 89)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductCategoryId], [ProductStatusId], [ProductName], [ProductDescription], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (N'P0028', 9, 3, N'Miss Dior', N'Свежий древесный аромат.', NULL, N'Givenchy', CAST(4323.0000 AS Decimal(19, 4)), 65, 80)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductCategoryId], [ProductStatusId], [ProductName], [ProductDescription], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (N'P0029', 8, 2, N'Teint Idole Ultra Wear', N'Нежный цветочный аромат с нотами туберозы.', NULL, N'L''Oreal', CAST(2317.0000 AS Decimal(19, 4)), 70, 35)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductCategoryId], [ProductStatusId], [ProductName], [ProductDescription], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (N'P0030', 3, 3, N'Teint Idole Ultra Wear', N'Свежий древесный аромат.', NULL, N'Gucci', CAST(2592.0000 AS Decimal(19, 4)), 34, 13)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductCategoryId], [ProductStatusId], [ProductName], [ProductDescription], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (N'P0031', 5, 3, N'Acqua di Gioia', N'Матовая помада с насыщенным цветом.', NULL, N'Lancome', CAST(749.0000 AS Decimal(19, 4)), 63, 24)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductCategoryId], [ProductStatusId], [ProductName], [ProductDescription], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (N'P0032', 8, 2, N'Ombre Premiere', N'Увлажняющий бальзам с нежным оттенком.', NULL, N'Givenchy', CAST(4818.0000 AS Decimal(19, 4)), 20, 87)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductCategoryId], [ProductStatusId], [ProductName], [ProductDescription], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (N'P0033', 9, 2, N'Teint Idole Ultra Wear', N'Цветочный аромат с нотами розы и жасмина.', NULL, N'L''Oreal', CAST(4581.0000 AS Decimal(19, 4)), 75, 29)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductCategoryId], [ProductStatusId], [ProductName], [ProductDescription], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (N'P0034', 7, 1, N'Rouge Allure Velvet', N'Цветочный аромат с нотами розы и жасмина.', NULL, N'Dior', CAST(4962.0000 AS Decimal(19, 4)), 37, 98)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductCategoryId], [ProductStatusId], [ProductName], [ProductDescription], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (N'P0035', 9, 1, N'Rouge Allure Velvet', N'Увлажняющий бальзам с нежным оттенком.', NULL, N'Gucci', CAST(2079.0000 AS Decimal(19, 4)), 8, 71)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductCategoryId], [ProductStatusId], [ProductName], [ProductDescription], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (N'P0036', 7, 1, N'Miss Dior', N'Матовая помада с насыщенным цветом.', NULL, N'Dior', CAST(557.0000 AS Decimal(19, 4)), 58, 78)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductCategoryId], [ProductStatusId], [ProductName], [ProductDescription], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (N'P0037', 6, 3, N'Teint Idole Ultra Wear', N'Увлажняющий бальзам с нежным оттенком.', NULL, N'Gucci', CAST(3716.0000 AS Decimal(19, 4)), 17, 98)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductCategoryId], [ProductStatusId], [ProductName], [ProductDescription], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (N'P0038', 3, 1, N'Gucci Bloom', N'Цветочный аромат с нотами розы и жасмина.', NULL, N'Gucci', CAST(3742.0000 AS Decimal(19, 4)), 82, 15)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductCategoryId], [ProductStatusId], [ProductName], [ProductDescription], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (N'P0039', 6, 1, N'Bleu de Chanel', N'Цветочный аромат с нотами розы и жасмина.', NULL, N'Lancome', CAST(4805.0000 AS Decimal(19, 4)), 24, 43)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductCategoryId], [ProductStatusId], [ProductName], [ProductDescription], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (N'P0040', 6, 2, N'Ombre Premiere', N'Долговечный тональный крем с естественным покрытием.', NULL, N'Chanel', CAST(4370.0000 AS Decimal(19, 4)), 9, 5)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductCategoryId], [ProductStatusId], [ProductName], [ProductDescription], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (N'P0041', 9, 1, N'Rouge Allure Velvet', N'Долговечный тональный крем с естественным покрытием.', NULL, N'Dior', CAST(2926.0000 AS Decimal(19, 4)), 53, 32)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductCategoryId], [ProductStatusId], [ProductName], [ProductDescription], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (N'P0042', 4, 2, N'Ombre Premiere', N'Долговечный тональный крем с естественным покрытием.', NULL, N'Chanel', CAST(1813.0000 AS Decimal(19, 4)), 12, 59)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductCategoryId], [ProductStatusId], [ProductName], [ProductDescription], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (N'P0043', 6, 2, N'Bleu de Chanel', N'Шелковистые тени с высоким пигментом.', NULL, N'Maybelline', CAST(3311.0000 AS Decimal(19, 4)), 0, 21)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductCategoryId], [ProductStatusId], [ProductName], [ProductDescription], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (N'P0044', 1, 2, N'Rouge Allure Velvet', N'Матовая помада с насыщенным цветом.', NULL, N'Givenchy', CAST(3307.0000 AS Decimal(19, 4)), 11, 36)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductCategoryId], [ProductStatusId], [ProductName], [ProductDescription], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (N'P0045', 5, 3, N'Rouge Allure Velvet', N'Матовая помада с насыщенным цветом.', NULL, N'Chanel', CAST(4656.0000 AS Decimal(19, 4)), 81, 93)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductCategoryId], [ProductStatusId], [ProductName], [ProductDescription], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (N'P0046', 5, 3, N'KissKiss Balm', N'Увлажняющий бальзам с нежным оттенком.', NULL, N'Yves Saint Laurent', CAST(2149.0000 AS Decimal(19, 4)), 51, 81)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductCategoryId], [ProductStatusId], [ProductName], [ProductDescription], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (N'P0047', 4, 3, N'Teint Idole Ultra Wear', N'Нежный цветочный аромат с нотами туберозы.', NULL, N'L''Oreal', CAST(3152.0000 AS Decimal(19, 4)), 69, 75)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductCategoryId], [ProductStatusId], [ProductName], [ProductDescription], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (N'P0048', 7, 1, N'Teint Idole Ultra Wear', N'Нежный цветочный аромат с нотами туберозы.', NULL, N'L''Oreal', CAST(745.0000 AS Decimal(19, 4)), 3, 25)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductCategoryId], [ProductStatusId], [ProductName], [ProductDescription], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (N'P0049', 1, 1, N'Rouge Allure Velvet', N'Увлажняющий бальзам с нежным оттенком.', NULL, N'Gucci', CAST(1373.0000 AS Decimal(19, 4)), 48, 67)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductCategoryId], [ProductStatusId], [ProductName], [ProductDescription], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (N'P0050', 9, 2, N'Teint Idole Ultra Wear', N'Шелковистые тени с высоким пигментом.', NULL, N'Yves Saint Laurent', CAST(3574.0000 AS Decimal(19, 4)), 64, 67)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductCategoryId], [ProductStatusId], [ProductName], [ProductDescription], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (N'R464G6', 8, 3, N'Bleu de Chanel', N'Матовая помада с насыщенным цветом.', NULL, N'Maybelline', CAST(2797.0000 AS Decimal(19, 4)), 10, 36)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductCategoryId], [ProductStatusId], [ProductName], [ProductDescription], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (N'S753T5', 9, 1, N'Acqua di Gioia', N'Нежный цветочный аромат с нотами туберозы.', NULL, N'Givenchy', CAST(4258.0000 AS Decimal(19, 4)), 15, 45)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductCategoryId], [ProductStatusId], [ProductName], [ProductDescription], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (N'V472S3', 3, 2, N'Rouge Allure Velvet', N'Нежный цветочный аромат с нотами туберозы.', NULL, N'Gucci', CAST(1666.0000 AS Decimal(19, 4)), 42, 56)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductCategoryId], [ProductStatusId], [ProductName], [ProductDescription], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (N'А112Т4', 3, 1, N'EISENBERG J''ose Homme', N'Мужественный и чувственный аромат J''ose Homme от Eisenberg это целый вихрь ярких, иногда контрастных, но удивительно оттеняющих друг друга аккордов. ', NULL, N'Eisenberg Paris', CAST(8159.0000 AS Decimal(19, 4)), 0, 64)
GO
SET IDENTITY_INSERT [dbo].[ProductCategory] ON 

INSERT [dbo].[ProductCategory] ([ProductCategoryId], [CategoryName]) VALUES (1, N'Одеколон')
INSERT [dbo].[ProductCategory] ([ProductCategoryId], [CategoryName]) VALUES (2, N'Твёрдые духи')
INSERT [dbo].[ProductCategory] ([ProductCategoryId], [CategoryName]) VALUES (3, N'Туалетная вода')
INSERT [dbo].[ProductCategory] ([ProductCategoryId], [CategoryName]) VALUES (4, N'Помада')
INSERT [dbo].[ProductCategory] ([ProductCategoryId], [CategoryName]) VALUES (5, N'Тональный крем')
INSERT [dbo].[ProductCategory] ([ProductCategoryId], [CategoryName]) VALUES (6, N'Бальзам для губ')
INSERT [dbo].[ProductCategory] ([ProductCategoryId], [CategoryName]) VALUES (7, N'Тени для век')
INSERT [dbo].[ProductCategory] ([ProductCategoryId], [CategoryName]) VALUES (8, N'Парфюмерная вода')
INSERT [dbo].[ProductCategory] ([ProductCategoryId], [CategoryName]) VALUES (9, N'Освежающая вода')
SET IDENTITY_INSERT [dbo].[ProductCategory] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductStatus] ON 

INSERT [dbo].[ProductStatus] ([ProductStatusId], [ProductAvailability]) VALUES (1, N'Есть в наличии                                    ')
INSERT [dbo].[ProductStatus] ([ProductStatusId], [ProductAvailability]) VALUES (2, N'Нет в наличии                                     ')
INSERT [dbo].[ProductStatus] ([ProductStatusId], [ProductAvailability]) VALUES (3, N'Снят с продажи                                    ')
SET IDENTITY_INSERT [dbo].[ProductStatus] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([RoleId], [RoleName]) VALUES (1, N'Клиент')
INSERT [dbo].[Role] ([RoleId], [RoleName]) VALUES (2, N'Менеджер')
INSERT [dbo].[Role] ([RoleId], [RoleName]) VALUES (3, N'Администратор')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserId], [RoleId], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (2, 2, N'Константинова ', N'Вероника', N'Агафоновна', N'v.konstantinova', N'qhgYnW')
INSERT [dbo].[User] ([UserId], [RoleId], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (3, 1, N'Меркушев ', N'Мартын', N'Федотович', N'm.merkushev', N'LxR6YI')
INSERT [dbo].[User] ([UserId], [RoleId], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (4, 2, N'Казаков ', N'Федот', N'Кондратович', N'f.kazakov', N'Cp8ddU')
INSERT [dbo].[User] ([UserId], [RoleId], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (5, 3, N'Карпов ', N'Улеб', N'Леонидович', N'u.karpov', N'7YpE0p')
INSERT [dbo].[User] ([UserId], [RoleId], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (6, 1, N'Королёв ', N'Матвей', N'Вадимович', N'm.korolev', N'nMr|ss')
INSERT [dbo].[User] ([UserId], [RoleId], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (7, 1, N'Юдин ', N'Герман', N'Кондратович', N'g.yudin', N'9UfqWQ')
INSERT [dbo].[User] ([UserId], [RoleId], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (8, 3, N'Беляева ', N'Анна', N'Вячеславовна', N'a.belyaeva', N'xIAWNI')
INSERT [dbo].[User] ([UserId], [RoleId], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (9, 2, N'Беляев ', N'Валентин', N'Артёмович', N'v.belyaev', N'0gC3bk')
INSERT [dbo].[User] ([UserId], [RoleId], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (10, 2, N'Семёнов ', N'Герман', N'Дмитрьевич', N'g.semenov', N'ni0ue0')
INSERT [dbo].[User] ([UserId], [RoleId], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (11, 1, N'Шестаков ', N'Илья', N'Антонинович', N'i.shestakov', N'f2ZaN6')
INSERT [dbo].[User] ([UserId], [RoleId], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (12, 1, N'Власов ', N'Вадим', N'Васильевич', N'v.vlasov', N'{{ksPn')
INSERT [dbo].[User] ([UserId], [RoleId], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (13, 3, N'Савельев ', N'Арсений', N'Авксентьевич', N'a.savelev', N'{ADBdc')
INSERT [dbo].[User] ([UserId], [RoleId], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (14, 3, N'Ефимов ', N'Руслан', N'Якунович', N'r.efimov', N'5&R+zs')
INSERT [dbo].[User] ([UserId], [RoleId], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (15, 1, N'Бурова ', N'Марфа', N'Федотовна', N'm.burova', N'y9l*b}')
INSERT [dbo].[User] ([UserId], [RoleId], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (16, 1, N'Селезнёв ', N'Александр', N'Никитевич', N'a.seleznev', N'|h+r}I')
INSERT [dbo].[User] ([UserId], [RoleId], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (17, 1, N'Кулакова ', N'Виктория', N'Георгьевна', N'v.kulakova', N'Fgd32{v')
INSERT [dbo].[User] ([UserId], [RoleId], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (18, 1, N'Дорофеева ', N'Кира', N'Демьяновна', N'k.dorofeeva', N'dC8bDI')
INSERT [dbo].[User] ([UserId], [RoleId], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (19, 1, N'Сафонова ', N'Нинель', N'Якововна', N'n.safonova', N'8cI7vq')
INSERT [dbo].[User] ([UserId], [RoleId], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (20, 1, N'Ситникова ', N'София', N'Лукьевна', N's.sitnikova', N'e4pVIv')
INSERT [dbo].[User] ([UserId], [RoleId], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (21, 2, N'Медведев ', N'Ириней', N'Геннадьевич', N'i.medvedev', N'A9K++2')
INSERT [dbo].[User] ([UserId], [RoleId], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (22, 2, N'Суханова ', N'Евгения', N'Улебовна', N'e.suhanova', N'R1zh}|')
INSERT [dbo].[User] ([UserId], [RoleId], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (23, 2, N'Игнатьев ', N'Владлен', N'Дамирович', N'v.ignatev', N'F&IWf4')
INSERT [dbo].[User] ([UserId], [RoleId], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (24, 1, N'Ефремов ', N'Христофор', N'Владиславович', N'h.efremov', N'P1v24R')
INSERT [dbo].[User] ([UserId], [RoleId], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (25, 1, N'Кошелев ', N'Ростислав', N'Куприянович', N'r.koshelev', N'F}jGsJ')
INSERT [dbo].[User] ([UserId], [RoleId], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (26, 3, N'Галкина ', N'Тамара', N'Авксентьевна', N't.galkina', N'NKNkup')
INSERT [dbo].[User] ([UserId], [RoleId], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (27, 2, N'Журавлёва ', N'Вера', N'Арсеньевна', N'v.zhuravleva', N'c+CECK')
INSERT [dbo].[User] ([UserId], [RoleId], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (28, 3, N'Савина ', N'Таисия', N'Глебовна', N't.savina', N'XK3sOA')
INSERT [dbo].[User] ([UserId], [RoleId], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (29, 1, N'Иванов ', N'Яков', N'Мэлорович', N'y.ivanov', N'4Bbzpa')
INSERT [dbo].[User] ([UserId], [RoleId], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (30, 2, N'Лыткин ', N'Ким', N'Алексеевич', N'k.lytkin', N'vRtAP*')
INSERT [dbo].[User] ([UserId], [RoleId], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (31, 2, N'Логинов ', N'Федот', N'Святославович', N'f.loginov', N'7YD|BR')
INSERT [dbo].[User] ([UserId], [RoleId], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (32, 2, N'Русакова ', N'Марина', N'Юлиановна', N'm.rusakova', N'LhlmIl')
INSERT [dbo].[User] ([UserId], [RoleId], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (33, 3, N'Константинов ', N'Пётр', N'Кондратович', N'p.konstantinov', N'22beR}')
INSERT [dbo].[User] ([UserId], [RoleId], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (34, 1, N'Поляков ', N'Анатолий', N'Игоревич', N'a.polyakov', N'uQY0ZQ')
INSERT [dbo].[User] ([UserId], [RoleId], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (35, 3, N'Панфилова ', N'Василиса', N'Григорьевна', N'v.panfilova', N'*QkUxc')
INSERT [dbo].[User] ([UserId], [RoleId], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (36, 1, N'Воробьёв ', N'Герман', N'Романович', N'g.vorobev', N'HOGFbU')
INSERT [dbo].[User] ([UserId], [RoleId], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (37, 3, N'Андреев ', N'Ростислав', N'Федосеевич', N'r.andreev', N'58Jxrg')
INSERT [dbo].[User] ([UserId], [RoleId], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (38, 3, N'Бобров ', N'Агафон', N'Владимирович', N'a.bobrov', N'lLHqZf')
INSERT [dbo].[User] ([UserId], [RoleId], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (39, 3, N'Лапин ', N'Алексей', N'Витальевич', N'a.lapin', N'4fqLiO')
INSERT [dbo].[User] ([UserId], [RoleId], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (40, 1, N'Шестаков ', N'Авдей', N'Иванович', N'a.shestakov', N'wdio{u')
INSERT [dbo].[User] ([UserId], [RoleId], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (41, 1, N'Гаврилова ', N'Алина', N'Эдуардовна', N'a.gavrilova', N'yz1iMB')
INSERT [dbo].[User] ([UserId], [RoleId], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (42, 2, N'Жуков ', N'Юлиан', N'Валерьянович', N'y.zhukov', N'&4jYGs')
INSERT [dbo].[User] ([UserId], [RoleId], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (43, 1, N'Пономарёв ', N'Максим', N'Альвианович', N'm.ponomarev', N'rnh36{')
INSERT [dbo].[User] ([UserId], [RoleId], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (44, 2, N'Зиновьева ', N'Мария', N'Лаврентьевна', N'm.zinovieva', N'KjI1JR')
INSERT [dbo].[User] ([UserId], [RoleId], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (45, 1, N'Осипов ', N'Артём', N'Мэлорович', N'a.osipov', N'36|KhF')
INSERT [dbo].[User] ([UserId], [RoleId], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (46, 3, N'Лапин ', N'Вячеслав', N'Геласьевич', N'v.lapin', N'ussd8Q')
INSERT [dbo].[User] ([UserId], [RoleId], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (47, 1, N'Зуев ', N'Ириней', N'Вадимович', N'i.zuev', N'cJP+HC')
INSERT [dbo].[User] ([UserId], [RoleId], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (48, 2, N'Коновалова ', N'Агафья', N'Митрофановна', N'a.konovalova', N'dfz5Ii')
INSERT [dbo].[User] ([UserId], [RoleId], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (49, 2, N'Исаев ', N'Дмитрий', N'Аристархович', N'd.isaev', N'6dcR|9')
INSERT [dbo].[User] ([UserId], [RoleId], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (50, 1, N'Белозёрова ', N'Алевтина', N'Лаврентьевна', N'a.belozerova', N'5&qONH')
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_PickupPoint1] FOREIGN KEY([PickupPointId])
REFERENCES [dbo].[PickupPoint] ([PickupPointId])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_PickupPoint1]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_User]
GO
ALTER TABLE [dbo].[OrderProduct]  WITH CHECK ADD  CONSTRAINT [FK__OrderProd__Order__403A8C7D] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([OrderId])
GO
ALTER TABLE [dbo].[OrderProduct] CHECK CONSTRAINT [FK__OrderProd__Order__403A8C7D]
GO
ALTER TABLE [dbo].[OrderProduct]  WITH CHECK ADD  CONSTRAINT [FK__OrderProd__Produ__412EB0B6] FOREIGN KEY([ProductArticleNumber])
REFERENCES [dbo].[Product] ([ProductArticleNumber])
GO
ALTER TABLE [dbo].[OrderProduct] CHECK CONSTRAINT [FK__OrderProd__Produ__412EB0B6]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_ProductCategory] FOREIGN KEY([ProductCategoryId])
REFERENCES [dbo].[ProductCategory] ([ProductCategoryId])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_ProductCategory]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_ProductStatus] FOREIGN KEY([ProductStatusId])
REFERENCES [dbo].[ProductStatus] ([ProductStatusId])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_ProductStatus]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([RoleId])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role]
GO
