USE [ASS]
GO
/****** Object:  Table [dbo].[tblCategory]    Script Date: 11/7/2023 1:43:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCategory](
	[categoryID] [int] IDENTITY(1,1) NOT NULL,
	[categoryName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Category_CategoryID] PRIMARY KEY CLUSTERED 
(
	[categoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOrder]    Script Date: 11/7/2023 1:43:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrder](
	[orderID] [int] IDENTITY(1,1) NOT NULL,
	[orderDate] [date] NOT NULL,
	[totalmoney] [money] NULL,
	[userID] [int] NOT NULL,
 CONSTRAINT [PK_Order_OrderID] PRIMARY KEY CLUSTERED 
(
	[orderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOrderDetail]    Script Date: 11/7/2023 1:43:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrderDetail](
	[detailID] [int] IDENTITY(1,1) NOT NULL,
	[oid] [int] NOT NULL,
	[pid] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[price] [money] NOT NULL,
 CONSTRAINT [PK_OrderDetail_DetailID] PRIMARY KEY CLUSTERED 
(
	[detailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblProduct]    Script Date: 11/7/2023 1:43:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProduct](
	[pid] [int] IDENTITY(1,1) NOT NULL,
	[productname] [nvarchar](250) NOT NULL,
	[describle] [nvarchar](500) NULL,
	[image] [varchar](500) NOT NULL,
	[price] [float] NOT NULL,
	[quantity] [int] NULL,
	[categoryID] [int] NOT NULL,
	[importDate] [date] NULL,
	[usingDate] [date] NULL,
 CONSTRAINT [PK_Product_ProductID] PRIMARY KEY CLUSTERED 
(
	[pid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblRoles]    Script Date: 11/7/2023 1:43:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRoles](
	[roleID] [int] NOT NULL,
	[rolename] [varchar](50) NULL,
 CONSTRAINT [PK_Role_RoleID] PRIMARY KEY CLUSTERED 
(
	[roleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUsers]    Script Date: 11/7/2023 1:43:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUsers](
	[userID] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](255) NULL,
	[password] [varchar](255) NULL,
	[fullName] [nvarchar](255) NULL,
	[roleID] [int] NULL,
	[address] [nvarchar](255) NULL,
	[birthday] [date] NULL,
	[phone] [varchar](15) NULL,
	[gmail] [nvarchar](255) NULL,
 CONSTRAINT [PK_User_UserID] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tblCategory] ON 

INSERT [dbo].[tblCategory] ([categoryID], [categoryName]) VALUES (1, N'Rau Lá')
INSERT [dbo].[tblCategory] ([categoryID], [categoryName]) VALUES (2, N'Rau Gia Vị')
INSERT [dbo].[tblCategory] ([categoryID], [categoryName]) VALUES (3, N'Rau Thân Củ')
INSERT [dbo].[tblCategory] ([categoryID], [categoryName]) VALUES (4, N'Đậu Tươi')
INSERT [dbo].[tblCategory] ([categoryID], [categoryName]) VALUES (5, N'Nấm')
SET IDENTITY_INSERT [dbo].[tblCategory] OFF
GO
SET IDENTITY_INSERT [dbo].[tblOrder] ON 

INSERT [dbo].[tblOrder] ([orderID], [orderDate], [totalmoney], [userID]) VALUES (1, CAST(N'2023-11-01' AS Date), 4.0000, 6)
INSERT [dbo].[tblOrder] ([orderID], [orderDate], [totalmoney], [userID]) VALUES (3, CAST(N'2023-11-01' AS Date), 4.0000, 9)
INSERT [dbo].[tblOrder] ([orderID], [orderDate], [totalmoney], [userID]) VALUES (5, CAST(N'2023-11-01' AS Date), 4.0000, 3)
INSERT [dbo].[tblOrder] ([orderID], [orderDate], [totalmoney], [userID]) VALUES (6, CAST(N'2023-11-01' AS Date), 6.0000, 4)
INSERT [dbo].[tblOrder] ([orderID], [orderDate], [totalmoney], [userID]) VALUES (1002, CAST(N'2023-11-05' AS Date), 39.0000, 6)
INSERT [dbo].[tblOrder] ([orderID], [orderDate], [totalmoney], [userID]) VALUES (1003, CAST(N'2023-11-06' AS Date), 5.0000, 6)
INSERT [dbo].[tblOrder] ([orderID], [orderDate], [totalmoney], [userID]) VALUES (1004, CAST(N'2023-11-06' AS Date), 12.0000, 1003)
INSERT [dbo].[tblOrder] ([orderID], [orderDate], [totalmoney], [userID]) VALUES (1005, CAST(N'2023-11-07' AS Date), 6.0000, 4)
INSERT [dbo].[tblOrder] ([orderID], [orderDate], [totalmoney], [userID]) VALUES (1006, CAST(N'2023-11-07' AS Date), 11.0000, 4)
INSERT [dbo].[tblOrder] ([orderID], [orderDate], [totalmoney], [userID]) VALUES (1007, CAST(N'2023-11-07' AS Date), 6.0000, 1003)
INSERT [dbo].[tblOrder] ([orderID], [orderDate], [totalmoney], [userID]) VALUES (1008, CAST(N'2023-11-07' AS Date), 3.0000, 1003)
SET IDENTITY_INSERT [dbo].[tblOrder] OFF
GO
SET IDENTITY_INSERT [dbo].[tblOrderDetail] ON 

INSERT [dbo].[tblOrderDetail] ([detailID], [oid], [pid], [quantity], [price]) VALUES (1, 5, 2, 1, 3.3000)
INSERT [dbo].[tblOrderDetail] ([detailID], [oid], [pid], [quantity], [price]) VALUES (2, 6, 1, 1, 3.3000)
INSERT [dbo].[tblOrderDetail] ([detailID], [oid], [pid], [quantity], [price]) VALUES (3, 6, 2, 1, 3.3000)
INSERT [dbo].[tblOrderDetail] ([detailID], [oid], [pid], [quantity], [price]) VALUES (1002, 1002, 1, 3, 3.3000)
INSERT [dbo].[tblOrderDetail] ([detailID], [oid], [pid], [quantity], [price]) VALUES (1003, 1002, 2, 3, 3.3000)
INSERT [dbo].[tblOrderDetail] ([detailID], [oid], [pid], [quantity], [price]) VALUES (1004, 1002, 3, 3, 4.4000)
INSERT [dbo].[tblOrderDetail] ([detailID], [oid], [pid], [quantity], [price]) VALUES (1005, 1002, 4, 1, 3.3000)
INSERT [dbo].[tblOrderDetail] ([detailID], [oid], [pid], [quantity], [price]) VALUES (1006, 1002, 5, 1, 3.3000)
INSERT [dbo].[tblOrderDetail] ([detailID], [oid], [pid], [quantity], [price]) VALUES (1007, 1002, 6, 1, 3.3000)
INSERT [dbo].[tblOrderDetail] ([detailID], [oid], [pid], [quantity], [price]) VALUES (1008, 1003, 7, 1, 2.2000)
INSERT [dbo].[tblOrderDetail] ([detailID], [oid], [pid], [quantity], [price]) VALUES (1009, 1003, 5, 1, 3.3000)
INSERT [dbo].[tblOrderDetail] ([detailID], [oid], [pid], [quantity], [price]) VALUES (1010, 1004, 5, 2, 3.3000)
INSERT [dbo].[tblOrderDetail] ([detailID], [oid], [pid], [quantity], [price]) VALUES (1011, 1004, 4, 2, 3.3000)
INSERT [dbo].[tblOrderDetail] ([detailID], [oid], [pid], [quantity], [price]) VALUES (1012, 1005, 1, 1, 3.3000)
INSERT [dbo].[tblOrderDetail] ([detailID], [oid], [pid], [quantity], [price]) VALUES (1013, 1005, 2, 1, 3.3000)
INSERT [dbo].[tblOrderDetail] ([detailID], [oid], [pid], [quantity], [price]) VALUES (1014, 1006, 2, 1, 3.3000)
INSERT [dbo].[tblOrderDetail] ([detailID], [oid], [pid], [quantity], [price]) VALUES (1015, 1006, 5, 2, 3.3000)
INSERT [dbo].[tblOrderDetail] ([detailID], [oid], [pid], [quantity], [price]) VALUES (1016, 1006, 8, 2, 1.1000)
INSERT [dbo].[tblOrderDetail] ([detailID], [oid], [pid], [quantity], [price]) VALUES (1017, 1007, 1, 1, 3.3000)
INSERT [dbo].[tblOrderDetail] ([detailID], [oid], [pid], [quantity], [price]) VALUES (1018, 1007, 2, 1, 3.3000)
INSERT [dbo].[tblOrderDetail] ([detailID], [oid], [pid], [quantity], [price]) VALUES (1019, 1008, 7, 1, 2.2000)
INSERT [dbo].[tblOrderDetail] ([detailID], [oid], [pid], [quantity], [price]) VALUES (1020, 1008, 8, 1, 1.1000)
SET IDENTITY_INSERT [dbo].[tblOrderDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[tblProduct] ON 

INSERT [dbo].[tblProduct] ([pid], [productname], [describle], [image], [price], [quantity], [categoryID], [importDate], [usingDate]) VALUES (1, N'Xà Lách', N'Rau tươi ngon số 1 việt nam', N'https://vinmec-prod.s3.amazonaws.com/images/20210106_041321_793265_hat-giong-rau-xa-la.max-1800x1800.jpg', 3, 144, 1, CAST(N'2023-10-30' AS Date), CAST(N'2023-11-09' AS Date))
INSERT [dbo].[tblProduct] ([pid], [productname], [describle], [image], [price], [quantity], [categoryID], [importDate], [usingDate]) VALUES (2, N'Cải Ngọt ', N'Rau cải tươi ngon số 1 việt nam', N'https://storage.googleapis.com/mm-online-bucket/ecommerce-website/uploads/media/349301.jpg', 3, 97, 1, CAST(N'2023-11-07' AS Date), CAST(N'2023-11-23' AS Date))
INSERT [dbo].[tblProduct] ([pid], [productname], [describle], [image], [price], [quantity], [categoryID], [importDate], [usingDate]) VALUES (3, N'Hành Lá', N'Hành lá tươi ngon', N'https://media-cdn-v2.laodong.vn/Storage/NewsPortal/2020/9/30/840429/Hanh-La-Tot-Suc-Khoe.jpg', 4, 97, 2, CAST(N'2023-10-27' AS Date), CAST(N'2024-10-27' AS Date))
INSERT [dbo].[tblProduct] ([pid], [productname], [describle], [image], [price], [quantity], [categoryID], [importDate], [usingDate]) VALUES (4, N'Bắp Cải Tím', N'Bắp Cải tươi ngon số 1 Việt Nam', N'https://product.hstatic.net/200000423303/product/bap-cai-tim-huu-co_203f203060064cf5a24b9f8e9c352214_1024x1024.jpg', 3, 47, 3, CAST(N'2023-10-28' AS Date), CAST(N'2023-10-31' AS Date))
INSERT [dbo].[tblProduct] ([pid], [productname], [describle], [image], [price], [quantity], [categoryID], [importDate], [usingDate]) VALUES (5, N'Đậu Bắp', N'Đậu Bắp tươi ngon', N'https://product.hstatic.net/200000423303/product/dau-bap-huu-co_e059bcf650af44dbb4c1e044d34b419d_1024x1024.jpg', 3, 94, 4, CAST(N'2023-10-27' AS Date), CAST(N'2024-10-27' AS Date))
INSERT [dbo].[tblProduct] ([pid], [productname], [describle], [image], [price], [quantity], [categoryID], [importDate], [usingDate]) VALUES (6, N'Nấm Đùi Gà', N'Nấm Đùi Gà tươi ngon', N'https://images-handler.kamereo.vn/eyJidWNrZXQiOiJpbWFnZS1oYW5kbGVyLXByb2QiLCJrZXkiOiJzdXBwbGllci82NTQvUFJPRFVDVF9JTUFHRS81YmJhNDIxMy00ZGVlLTQ5NjUtODIzMi05YTM2MzlmNzQ0N2MuanBnIn0=', 3, 99, 5, CAST(N'2023-10-27' AS Date), CAST(N'2024-10-27' AS Date))
INSERT [dbo].[tblProduct] ([pid], [productname], [describle], [image], [price], [quantity], [categoryID], [importDate], [usingDate]) VALUES (7, N'Đậu Cô Ve', N'Đậu CôVe tươi ngon', N'https://product.hstatic.net/200000423303/product/dau-cove-huu-co_ad40962f4583495398654ddbef3e9504_1024x1024.jpg', 2, 98, 4, CAST(N'2023-10-27' AS Date), CAST(N'2024-10-27' AS Date))
INSERT [dbo].[tblProduct] ([pid], [productname], [describle], [image], [price], [quantity], [categoryID], [importDate], [usingDate]) VALUES (8, N'Nấm Mèo', N'Nấm Mèo tươi ngon', N'https://thucphambaotam.vn/wp-content/uploads/2020/09/nam-meo-den-2.jpg', 1, 97, 5, CAST(N'2023-10-27' AS Date), CAST(N'2024-10-27' AS Date))
INSERT [dbo].[tblProduct] ([pid], [productname], [describle], [image], [price], [quantity], [categoryID], [importDate], [usingDate]) VALUES (10, N'Rau Dền', N'Rau Dền tươi ngon', N'https://bizweb.dktcdn.net/100/390/808/products/rauden-master.jpg?v=1593162117040', 3, 100, 3, CAST(N'2023-10-27' AS Date), CAST(N'2024-10-27' AS Date))
INSERT [dbo].[tblProduct] ([pid], [productname], [describle], [image], [price], [quantity], [categoryID], [importDate], [usingDate]) VALUES (1003, N'Mồng Tơi', N'Rau mồng tơi tươi ngón đến ngọn', N'https://bizweb.dktcdn.net/100/390/808/products/1-101-a84348debba24fcd95719a117b6ff32d-master.jpg?v=1592900299463', 3, 150, 1, CAST(N'2023-10-28' AS Date), CAST(N'2023-11-10' AS Date))
INSERT [dbo].[tblProduct] ([pid], [productname], [describle], [image], [price], [quantity], [categoryID], [importDate], [usingDate]) VALUES (1006, N'Cải Cay', N'Rau Cải Cay Nồng', N'https://product.hstatic.net/200000423303/product/cai-xanh-huu-co_6e554418635142bab42cb6cbb78c27ce_1024x1024.jpg', 2, 150, 1, CAST(N'2023-10-30' AS Date), CAST(N'2023-11-15' AS Date))
INSERT [dbo].[tblProduct] ([pid], [productname], [describle], [image], [price], [quantity], [categoryID], [importDate], [usingDate]) VALUES (1032, N'Nấm Kim Châm', N'Nấm kim châm bổ dưỡng loại 1 ', N'https://product.hstatic.net/200000423303/product/nam-kim-cham-han-quoc_05050b0f8abf415cbb679c2d62cf05f4.jpg', 2, 100, 5, CAST(N'2023-10-28' AS Date), CAST(N'2023-11-23' AS Date))
INSERT [dbo].[tblProduct] ([pid], [productname], [describle], [image], [price], [quantity], [categoryID], [importDate], [usingDate]) VALUES (1033, N'Đậu Nành', N'Đậu Nàng tươi ngon', N'https://bizweb.dktcdn.net/100/390/808/products/thuong-thuc-dau-nanh-theo-phong-cach-singapore-1.jpg?v=1592987555860', 3, 100, 4, CAST(N'2023-10-28' AS Date), CAST(N'2023-10-31' AS Date))
INSERT [dbo].[tblProduct] ([pid], [productname], [describle], [image], [price], [quantity], [categoryID], [importDate], [usingDate]) VALUES (1034, N'Đậu Đỏ', N'Đậu Đỏ bổ dưỡng', N'https://dalatfarm.net/wp-content/uploads/2021/10/dau-ngu-tuoi-da-lat.jpg', 5, 100, 4, CAST(N'2023-10-29' AS Date), CAST(N'2023-12-31' AS Date))
INSERT [dbo].[tblProduct] ([pid], [productname], [describle], [image], [price], [quantity], [categoryID], [importDate], [usingDate]) VALUES (2002, N'Rau Quế', N'Rau quế chuyên phở , bún', N'https://product.hstatic.net/200000423303/product/hung-que-huu-co_47ca788924f14811b41f71d21eab7035_1024x1024.jpg', 3, 100, 2, CAST(N'2023-11-05' AS Date), CAST(N'2023-11-22' AS Date))
INSERT [dbo].[tblProduct] ([pid], [productname], [describle], [image], [price], [quantity], [categoryID], [importDate], [usingDate]) VALUES (2005, N'Ngò  Gai', N'Ngò gai đà nẵng', N'https://goodprice.vn/files/common/rau-ngo-gai-rbmaw.jpg', 2, 100, 2, CAST(N'2023-11-22' AS Date), CAST(N'2023-11-23' AS Date))
INSERT [dbo].[tblProduct] ([pid], [productname], [describle], [image], [price], [quantity], [categoryID], [importDate], [usingDate]) VALUES (2006, N'Rau Muống', N'Rau muống sông hương', N'https://www.btaskee.com/wp-content/uploads/2021/09/buoc-2-chia-nho-rau-muong.jpg', 2, 100, 1, CAST(N'2023-11-21' AS Date), CAST(N'2023-11-23' AS Date))
INSERT [dbo].[tblProduct] ([pid], [productname], [describle], [image], [price], [quantity], [categoryID], [importDate], [usingDate]) VALUES (2007, N'Nấm Hương', N'Nấm Hương  cao cấp', N'https://nongtrainam.com/wp-content/uploads/2022/08/nam-huong-tuoi.jpg', 10, 50, 5, CAST(N'2023-11-05' AS Date), CAST(N'2023-11-30' AS Date))
SET IDENTITY_INSERT [dbo].[tblProduct] OFF
GO
INSERT [dbo].[tblRoles] ([roleID], [rolename]) VALUES (1, N'admin')
INSERT [dbo].[tblRoles] ([roleID], [rolename]) VALUES (2, N'user')
GO
SET IDENTITY_INSERT [dbo].[tblUsers] ON 

INSERT [dbo].[tblUsers] ([userID], [username], [password], [fullName], [roleID], [address], [birthday], [phone], [gmail]) VALUES (3, N'vinhhung', N'admin', N'Admin Hưng', 1, N'123 Nguy?n Trãi', CAST(N'2003-02-13' AS Date), N'123-456-7890', NULL)
INSERT [dbo].[tblUsers] ([userID], [username], [password], [fullName], [roleID], [address], [birthday], [phone], [gmail]) VALUES (4, N'hanhnguyen', N'user', N'Hạnh Nguyên', 2, N'234 H? Nghinh', CAST(N'2003-02-21' AS Date), N'987-654-3210', N'hanhnguyen@gmail.com')
INSERT [dbo].[tblUsers] ([userID], [username], [password], [fullName], [roleID], [address], [birthday], [phone], [gmail]) VALUES (6, N'tom', N'123', NULL, 2, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([userID], [username], [password], [fullName], [roleID], [address], [birthday], [phone], [gmail]) VALUES (9, N'tom', N'123', NULL, 2, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([userID], [username], [password], [fullName], [roleID], [address], [birthday], [phone], [gmail]) VALUES (1002, N'thuyen123', N'123', NULL, 2, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([userID], [username], [password], [fullName], [roleID], [address], [birthday], [phone], [gmail]) VALUES (1003, N'tom1535', N'123', N'Louis Tom', 2, N'Đà Nẵng', NULL, N'0975480734', N'hophuocvinhhung@gmail.com')
SET IDENTITY_INSERT [dbo].[tblUsers] OFF
GO
/****** Object:  Index [UQ_OrderDetail_OID_PID]    Script Date: 11/7/2023 1:43:41 AM ******/
ALTER TABLE [dbo].[tblOrderDetail] ADD  CONSTRAINT [UQ_OrderDetail_OID_PID] UNIQUE NONCLUSTERED 
(
	[oid] ASC,
	[pid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblOrder]  WITH CHECK ADD  CONSTRAINT [FK_Order_User] FOREIGN KEY([userID])
REFERENCES [dbo].[tblUsers] ([userID])
GO
ALTER TABLE [dbo].[tblOrder] CHECK CONSTRAINT [FK_Order_User]
GO
ALTER TABLE [dbo].[tblOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Order] FOREIGN KEY([oid])
REFERENCES [dbo].[tblOrder] ([orderID])
GO
ALTER TABLE [dbo].[tblOrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Order]
GO
ALTER TABLE [dbo].[tblOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Product] FOREIGN KEY([pid])
REFERENCES [dbo].[tblProduct] ([pid])
GO
ALTER TABLE [dbo].[tblOrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Product]
GO
ALTER TABLE [dbo].[tblProduct]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([categoryID])
REFERENCES [dbo].[tblCategory] ([categoryID])
GO
ALTER TABLE [dbo].[tblProduct] CHECK CONSTRAINT [FK_Product_Category]
GO
ALTER TABLE [dbo].[tblUsers]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([roleID])
REFERENCES [dbo].[tblRoles] ([roleID])
GO
ALTER TABLE [dbo].[tblUsers] CHECK CONSTRAINT [FK_User_Role]
GO
