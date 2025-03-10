USE [master]
GO
/****** Object:  Database [MyShop]    Script Date: 6/9/2024 8:00:55 PM ******/
CREATE DATABASE [MyShop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MyShop', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS01\MSSQL\DATA\MyShop.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MyShop_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS01\MSSQL\DATA\MyShop_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [MyShop] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MyShop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MyShop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MyShop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MyShop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MyShop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MyShop] SET ARITHABORT OFF 
GO
ALTER DATABASE [MyShop] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [MyShop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MyShop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MyShop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MyShop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MyShop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MyShop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MyShop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MyShop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MyShop] SET  ENABLE_BROKER 
GO
ALTER DATABASE [MyShop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MyShop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MyShop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MyShop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MyShop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MyShop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MyShop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MyShop] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MyShop] SET  MULTI_USER 
GO
ALTER DATABASE [MyShop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MyShop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MyShop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MyShop] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MyShop] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MyShop] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [MyShop] SET QUERY_STORE = ON
GO
ALTER DATABASE [MyShop] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [MyShop]
GO
/****** Object:  Table [dbo].[bill]    Script Date: 6/9/2024 8:00:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bill](
	[bill_id] [bigint] IDENTITY(1,1) NOT NULL,
	[user_id] [bigint] NOT NULL,
	[total] [money] NOT NULL,
	[payment] [varchar](250) NOT NULL,
	[address] [ntext] NOT NULL,
	[date] [date] NOT NULL,
	[phone] [bigint] NOT NULL,
 CONSTRAINT [PK_bill] PRIMARY KEY CLUSTERED 
(
	[bill_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[bill_detail]    Script Date: 6/9/2024 8:00:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bill_detail](
	[detail_id] [bigint] IDENTITY(1,1) NOT NULL,
	[bill_id] [bigint] NOT NULL,
	[product_id] [varchar](100) NOT NULL,
	[quantity] [int] NOT NULL,
	[size] [nchar](10) NOT NULL,
	[color] [nvarchar](150) NOT NULL,
	[price] [money] NOT NULL,
 CONSTRAINT [PK_bill_detail] PRIMARY KEY CLUSTERED 
(
	[detail_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cart]    Script Date: 6/9/2024 8:00:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cart](
	[cart_id] [bigint] NOT NULL,
	[product_id] [varchar](100) NOT NULL,
	[product_name] [varchar](255) NOT NULL,
	[product_img] [varchar](255) NOT NULL,
	[product_price] [float] NOT NULL,
	[total] [float] NOT NULL,
	[quantity] [int] NOT NULL,
 CONSTRAINT [PK_cart] PRIMARY KEY CLUSTERED 
(
	[cart_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[category]    Script Date: 6/9/2024 8:00:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[category](
	[category_id] [int] IDENTITY(1,1) NOT NULL,
	[category_name] [varchar](255) NOT NULL,
 CONSTRAINT [PK_category] PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product]    Script Date: 6/9/2024 8:00:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product](
	[product_id] [varchar](100) NOT NULL,
	[category_id] [int] NOT NULL,
	[product_name] [nvarchar](max) NOT NULL,
	[product_price] [money] NOT NULL,
	[product_describe] [nvarchar](max) NOT NULL,
	[quantity] [int] NOT NULL,
	[img] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_product] PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product_color]    Script Date: 6/9/2024 8:00:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product_color](
	[product_id] [varchar](100) NOT NULL,
	[color] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product_size]    Script Date: 6/9/2024 8:00:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product_size](
	[product_id] [varchar](100) NOT NULL,
	[size] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 6/9/2024 8:00:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[user_id] [bigint] IDENTITY(1,1) NOT NULL,
	[user_name] [nvarchar](200) NULL,
	[user_email] [varchar](255) NOT NULL,
	[user_pass] [nvarchar](255) NOT NULL,
	[isAdmin] [nvarchar](50) NULL,
	[dateOfBirth] [varchar](255) NULL,
	[address] [varchar](255) NULL,
	[phoneNumber] [varchar](10) NULL,
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[bill] ON 

INSERT [dbo].[bill] ([bill_id], [user_id], [total], [payment], [address], [date], [phone]) VALUES (45, 5, 648000.0000, N'MOMO', N'Tiền Hải,Thái Bình', CAST(N'2024-06-04' AS Date), 348956373)
INSERT [dbo].[bill] ([bill_id], [user_id], [total], [payment], [address], [date], [phone]) VALUES (46, 5, 298000.0000, N'MOMO', N'Thái Bình', CAST(N'2024-06-04' AS Date), 348956373)
INSERT [dbo].[bill] ([bill_id], [user_id], [total], [payment], [address], [date], [phone]) VALUES (47, 5, 378000.0000, N'VNPAY', N'Thái Bình', CAST(N'2024-06-04' AS Date), 348956373)
INSERT [dbo].[bill] ([bill_id], [user_id], [total], [payment], [address], [date], [phone]) VALUES (48, 5, 270000.0000, N'Chua thanh toán (VNPAY)', N'Thái Bình', CAST(N'2024-06-04' AS Date), 348956373)
INSERT [dbo].[bill] ([bill_id], [user_id], [total], [payment], [address], [date], [phone]) VALUES (49, 5, 417000.0000, N'Chua thanh toán (VNPAY)', N'Thái Bình', CAST(N'2024-06-04' AS Date), 348956373)
INSERT [dbo].[bill] ([bill_id], [user_id], [total], [payment], [address], [date], [phone]) VALUES (50, 5, 567000.0000, N'COD', N'Thái Bình', CAST(N'2024-06-04' AS Date), 348956373)
INSERT [dbo].[bill] ([bill_id], [user_id], [total], [payment], [address], [date], [phone]) VALUES (51, 5, 278000.0000, N'COD', N'Thái Bình', CAST(N'2024-06-04' AS Date), 348956373)
INSERT [dbo].[bill] ([bill_id], [user_id], [total], [payment], [address], [date], [phone]) VALUES (52, 5, 189000.0000, N'COD', N'Thái Bình', CAST(N'2024-06-05' AS Date), 348956373)
INSERT [dbo].[bill] ([bill_id], [user_id], [total], [payment], [address], [date], [phone]) VALUES (53, 5, 259000.0000, N'MOMO', N'Thái Bình', CAST(N'2024-06-05' AS Date), 348956373)
INSERT [dbo].[bill] ([bill_id], [user_id], [total], [payment], [address], [date], [phone]) VALUES (54, 5, 270000.0000, N'VNPAY', N'Thái Bình', CAST(N'2024-06-05' AS Date), 348956373)
INSERT [dbo].[bill] ([bill_id], [user_id], [total], [payment], [address], [date], [phone]) VALUES (55, 5, 259000.0000, N'MOMO', N'Thái Bình', CAST(N'2024-06-05' AS Date), 348956373)
INSERT [dbo].[bill] ([bill_id], [user_id], [total], [payment], [address], [date], [phone]) VALUES (56, 5, 810000.0000, N'VNPAY', N'Thái Bình', CAST(N'2024-06-05' AS Date), 348956373)
INSERT [dbo].[bill] ([bill_id], [user_id], [total], [payment], [address], [date], [phone]) VALUES (57, 5, 149000.0000, N'MOMO', N'Thái Bình', CAST(N'2024-06-05' AS Date), 348956373)
INSERT [dbo].[bill] ([bill_id], [user_id], [total], [payment], [address], [date], [phone]) VALUES (58, 5, 417000.0000, N'VNPAY', N'Thái Bình', CAST(N'2024-06-05' AS Date), 348956373)
INSERT [dbo].[bill] ([bill_id], [user_id], [total], [payment], [address], [date], [phone]) VALUES (59, 5, 149000.0000, N'COD', N'Thái Bình', CAST(N'2024-06-05' AS Date), 348956373)
INSERT [dbo].[bill] ([bill_id], [user_id], [total], [payment], [address], [date], [phone]) VALUES (60, 5, 517000.0000, N'MOMO', N'Thái Bình', CAST(N'2024-06-05' AS Date), 348956373)
INSERT [dbo].[bill] ([bill_id], [user_id], [total], [payment], [address], [date], [phone]) VALUES (61, 5, 139000.0000, N'VNPAY', N'Thái Bình', CAST(N'2024-06-05' AS Date), 348956373)
INSERT [dbo].[bill] ([bill_id], [user_id], [total], [payment], [address], [date], [phone]) VALUES (62, 13, 2750000.0000, N'MOMO', N'Thái Bình', CAST(N'2024-06-05' AS Date), 348956373)
INSERT [dbo].[bill] ([bill_id], [user_id], [total], [payment], [address], [date], [phone]) VALUES (63, 13, 2880000.0000, N'VNPAY', N'Thái Bình', CAST(N'2024-06-05' AS Date), 348956373)
INSERT [dbo].[bill] ([bill_id], [user_id], [total], [payment], [address], [date], [phone]) VALUES (64, 1, 240000.0000, N'VNPAY', N'Thái Bình', CAST(N'2024-06-05' AS Date), 348956373)
INSERT [dbo].[bill] ([bill_id], [user_id], [total], [payment], [address], [date], [phone]) VALUES (65, 1, 169000.0000, N'VNPAY', N'Thái Bình', CAST(N'2024-06-05' AS Date), 348956373)
INSERT [dbo].[bill] ([bill_id], [user_id], [total], [payment], [address], [date], [phone]) VALUES (66, 1, 210000.0000, N'VNPAY', N'Thái Bình', CAST(N'2024-06-05' AS Date), 348956373)
INSERT [dbo].[bill] ([bill_id], [user_id], [total], [payment], [address], [date], [phone]) VALUES (67, 1, 1450000.0000, N'VNPAY', N'Thái Bình', CAST(N'2024-06-05' AS Date), 348956373)
INSERT [dbo].[bill] ([bill_id], [user_id], [total], [payment], [address], [date], [phone]) VALUES (68, 16, 600000.0000, N'COD', N'Thái Bình', CAST(N'2024-06-05' AS Date), 98272722)
INSERT [dbo].[bill] ([bill_id], [user_id], [total], [payment], [address], [date], [phone]) VALUES (69, 1, 150000.0000, N'MOMO', N'daihocfpt', CAST(N'2024-06-05' AS Date), 348956373)
INSERT [dbo].[bill] ([bill_id], [user_id], [total], [payment], [address], [date], [phone]) VALUES (70, 17, 298000.0000, N'MOMO', N'daihocfpt', CAST(N'2024-06-05' AS Date), 348956373)
INSERT [dbo].[bill] ([bill_id], [user_id], [total], [payment], [address], [date], [phone]) VALUES (71, 17, 1240000.0000, N'COD', N'daihocfpt', CAST(N'2024-06-05' AS Date), 348956373)
INSERT [dbo].[bill] ([bill_id], [user_id], [total], [payment], [address], [date], [phone]) VALUES (73, 17, 100000.0000, N'COD', N'Ha Noi', CAST(N'2024-05-05' AS Date), 348956373)
SET IDENTITY_INSERT [dbo].[bill] OFF
GO
SET IDENTITY_INSERT [dbo].[bill_detail] ON 

INSERT [dbo].[bill_detail] ([detail_id], [bill_id], [product_id], [quantity], [size], [color], [price]) VALUES (40, 45, N'T2129', 1, N'XS        ', N'White', 270000.0000)
INSERT [dbo].[bill_detail] ([detail_id], [bill_id], [product_id], [quantity], [size], [color], [price]) VALUES (41, 45, N'T2099', 2, N'S         ', N'Purple', 378000.0000)
INSERT [dbo].[bill_detail] ([detail_id], [bill_id], [product_id], [quantity], [size], [color], [price]) VALUES (42, 46, N'AT533', 2, N'S         ', N'White', 298000.0000)
INSERT [dbo].[bill_detail] ([detail_id], [bill_id], [product_id], [quantity], [size], [color], [price]) VALUES (43, 47, N'T2099', 2, N'L         ', N'Purple', 378000.0000)
INSERT [dbo].[bill_detail] ([detail_id], [bill_id], [product_id], [quantity], [size], [color], [price]) VALUES (44, 48, N'T2129', 1, N'XS        ', N'White', 270000.0000)
INSERT [dbo].[bill_detail] ([detail_id], [bill_id], [product_id], [quantity], [size], [color], [price]) VALUES (45, 49, N'AT536', 3, N'S         ', N'Red', 417000.0000)
INSERT [dbo].[bill_detail] ([detail_id], [bill_id], [product_id], [quantity], [size], [color], [price]) VALUES (46, 50, N'T2099', 3, N'S         ', N'Purple', 567000.0000)
INSERT [dbo].[bill_detail] ([detail_id], [bill_id], [product_id], [quantity], [size], [color], [price]) VALUES (47, 51, N'AT536', 2, N'S         ', N'Red', 278000.0000)
INSERT [dbo].[bill_detail] ([detail_id], [bill_id], [product_id], [quantity], [size], [color], [price]) VALUES (48, 52, N'T2099', 1, N'S         ', N'Purple', 189000.0000)
INSERT [dbo].[bill_detail] ([detail_id], [bill_id], [product_id], [quantity], [size], [color], [price]) VALUES (49, 53, N'T2127', 1, N'L         ', N'Black', 259000.0000)
INSERT [dbo].[bill_detail] ([detail_id], [bill_id], [product_id], [quantity], [size], [color], [price]) VALUES (50, 54, N'T2129', 1, N'XS        ', N'White', 270000.0000)
INSERT [dbo].[bill_detail] ([detail_id], [bill_id], [product_id], [quantity], [size], [color], [price]) VALUES (51, 55, N'T2128', 1, N'XS        ', N'White', 259000.0000)
INSERT [dbo].[bill_detail] ([detail_id], [bill_id], [product_id], [quantity], [size], [color], [price]) VALUES (52, 56, N'T2129', 3, N'XS        ', N'White', 810000.0000)
INSERT [dbo].[bill_detail] ([detail_id], [bill_id], [product_id], [quantity], [size], [color], [price]) VALUES (53, 57, N'AT533', 1, N'S         ', N'White', 149000.0000)
INSERT [dbo].[bill_detail] ([detail_id], [bill_id], [product_id], [quantity], [size], [color], [price]) VALUES (54, 58, N'AT536', 3, N'S         ', N'Red', 417000.0000)
INSERT [dbo].[bill_detail] ([detail_id], [bill_id], [product_id], [quantity], [size], [color], [price]) VALUES (55, 59, N'AT533', 1, N'S         ', N'White', 149000.0000)
INSERT [dbo].[bill_detail] ([detail_id], [bill_id], [product_id], [quantity], [size], [color], [price]) VALUES (56, 60, N'T2099', 2, N'S         ', N'Purple', 378000.0000)
INSERT [dbo].[bill_detail] ([detail_id], [bill_id], [product_id], [quantity], [size], [color], [price]) VALUES (57, 60, N'AT536', 1, N'L         ', N'Red', 139000.0000)
INSERT [dbo].[bill_detail] ([detail_id], [bill_id], [product_id], [quantity], [size], [color], [price]) VALUES (58, 61, N'AT536', 1, N'S         ', N'Red', 139000.0000)
INSERT [dbo].[bill_detail] ([detail_id], [bill_id], [product_id], [quantity], [size], [color], [price]) VALUES (59, 62, N'H1004', 3, N'S         ', N'Brown', 510000.0000)
INSERT [dbo].[bill_detail] ([detail_id], [bill_id], [product_id], [quantity], [size], [color], [price]) VALUES (60, 62, N'S1203', 4, N'S         ', N'White', 2240000.0000)
INSERT [dbo].[bill_detail] ([detail_id], [bill_id], [product_id], [quantity], [size], [color], [price]) VALUES (61, 63, N'T2130', 12, N'S         ', N'Grey', 2880000.0000)
INSERT [dbo].[bill_detail] ([detail_id], [bill_id], [product_id], [quantity], [size], [color], [price]) VALUES (62, 64, N'T2130', 1, N'S         ', N'Grey', 240000.0000)
INSERT [dbo].[bill_detail] ([detail_id], [bill_id], [product_id], [quantity], [size], [color], [price]) VALUES (63, 65, N'TD509', 1, N'S         ', N'Purple', 169000.0000)
INSERT [dbo].[bill_detail] ([detail_id], [bill_id], [product_id], [quantity], [size], [color], [price]) VALUES (64, 66, N'SW6002', 1, N'S         ', N'Black', 210000.0000)
INSERT [dbo].[bill_detail] ([detail_id], [bill_id], [product_id], [quantity], [size], [color], [price]) VALUES (65, 67, N'T3000', 5, N'S         ', N'Black', 1450000.0000)
INSERT [dbo].[bill_detail] ([detail_id], [bill_id], [product_id], [quantity], [size], [color], [price]) VALUES (66, 68, N'AS8004', 10, N'S         ', N'White', 600000.0000)
INSERT [dbo].[bill_detail] ([detail_id], [bill_id], [product_id], [quantity], [size], [color], [price]) VALUES (67, 69, N'AS8000', 1, N'S         ', N'Green', 150000.0000)
INSERT [dbo].[bill_detail] ([detail_id], [bill_id], [product_id], [quantity], [size], [color], [price]) VALUES (68, 70, N'AT533', 2, N'S         ', N'Black', 298000.0000)
INSERT [dbo].[bill_detail] ([detail_id], [bill_id], [product_id], [quantity], [size], [color], [price]) VALUES (69, 71, N'SW6000', 2, N'S         ', N'Red', 340000.0000)
INSERT [dbo].[bill_detail] ([detail_id], [bill_id], [product_id], [quantity], [size], [color], [price]) VALUES (70, 71, N'AS8001', 3, N'S         ', N'Black', 900000.0000)
SET IDENTITY_INSERT [dbo].[bill_detail] OFF
GO
SET IDENTITY_INSERT [dbo].[category] ON 

INSERT [dbo].[category] ([category_id], [category_name]) VALUES (1, N'SHIRT')
INSERT [dbo].[category] ([category_id], [category_name]) VALUES (2, N'T-SHIRT')
INSERT [dbo].[category] ([category_id], [category_name]) VALUES (3, N'OUTERWEAR')
INSERT [dbo].[category] ([category_id], [category_name]) VALUES (4, N'HOODIES')
INSERT [dbo].[category] ([category_id], [category_name]) VALUES (5, N'SHORT&PANTS')
INSERT [dbo].[category] ([category_id], [category_name]) VALUES (6, N'ACCESSORIES')
INSERT [dbo].[category] ([category_id], [category_name]) VALUES (7, N'SOCIAL')
INSERT [dbo].[category] ([category_id], [category_name]) VALUES (14, N'SWEATSHIRTS')
INSERT [dbo].[category] ([category_id], [category_name]) VALUES (15, N'POLO-SHIRT')
INSERT [dbo].[category] ([category_id], [category_name]) VALUES (17, N'no1')
SET IDENTITY_INSERT [dbo].[category] OFF
GO
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img]) VALUES (N'AS8000', 6, N'Giầy Lười Cảnh đồ Du Lịch', 150000.0000, N'Giày thể thao nam Mulgati Leather Sneaker - F23305 được làm từ chất liệu da cao cấp.
- Thiết kế form giày chuẩn đẹp, đường khâu tinh tế, chắc chắn', 98, N'images/AS8000.png')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img]) VALUES (N'AS8001', 6, N'GIÀY THỂ THAO NAM MULGATI LEATHER SNEAKER', 300000.0000, N'Giày thể thao nam Mulgati Leather Sneaker - F23305 được làm từ chất liệu da cao cấp.
- Thiết kế form giày chuẩn đẹp, đường khâu tinh tế, chắc chắn

- Đế giày được làm từ cao su lưu hóa, độ bền cao

- Lót giày êm ái, giúp chân luôn thoải mái.', 397, N'images/AS8001.png')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img]) VALUES (N'AS8004', 6, N'Dép unisex ', 60000.0000, N'chất liệu da thoáng mát, êm chân và có thể đi được nước. 
🔸Form slim fit có phần viền ôm dọc theo chiều dài của chân giúp tôn dáng và thoải mái ', 190, N'images/AS8004.png')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img]) VALUES (N'AT533', 2, N'Champion Graphic Big Logo T-Shirt', 149000.0000, N'Cổ TrònVạt NgangTay NgắnHình In Trướ', 184, N'images/AT533.png')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img]) VALUES (N'AT536', 2, N'Champion Change The World', 139000.0000, N'Cổ TrònVạt NgangTay NgắnHình Thêu Trước', 449, N'images/AT536.png')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img]) VALUES (N'H1001', 4, N'Áo hoodie động vật Bluza cắt dạ dày, nhân sư, động vật', 190000.0000, N'Thiết kế trẻ trung,chất liệu vải siêu mềm', 40, N'images/H1001.png')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img]) VALUES (N'H1002', 4, N'Áo hoodie đôi Navy ', 599000.0000, N'Áo đôi giành cho các cặp đôi,thiết kế thon gọn,trẻ trung,chất liệu vải cotton mang đến cho khách hàng cảm giác êm ái', 500, N'images/H1002.jpg')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img]) VALUES (N'H1004', 4, N'Áo hoodie Loose Fit', 170000.0000, N'In hình  Loose Fit mang tới cảm giác trẻ trung', 273, N'images/H1004.jpg')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img]) VALUES (N'H1005', 4, N'Áo hoodie in hình Loose Fit', 249000.0000, N'Phong cách thời thượng', 166, N'images/H1005.jpg')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img]) VALUES (N'H1006', 4, N'Áo hoodie Regular Fit', 299000.0000, N'Thiết kế trẻ trung,ấm áp', 675, N'images/H1006.jpg')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img]) VALUES (N'S1200', 5, N'Quần short jeans big size lưng thun', 350000.0000, N'Làm từ chất liệu jeans, có độ co giãn tốt và có lưng thun rộng', 467, N'images/S1201.jpg')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img]) VALUES (N'S1201', 5, N'Quần Short Kaki Big Size Navy', 199000.0000, N'Sản phẩm có đủ size từ 50kg-160kg. Form ôm. Chất vải Kaki thành phần cotton cao nên thoải mái khi sử dụng', 266, N'images/S1200.jpg')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img]) VALUES (N'S1202', 5, N'QUẦN SHORT JEANS BIG SIZE LƯNG THUN NAVY', 430000.0000, N'làm từ chất liệu jeans, có độ co giãn tốt và có lưng thun rộng', 454, N'images/S1203.jpg')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img]) VALUES (N'S1203', 5, N'QUẦN JOGGER MLB BASIC', 560000.0000, N'Thiết kế độc đáo,trẻ trung', 440, N'images/S1204.jpg')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img]) VALUES (N'S4000', 1, N'DRACO POLO SHIRT', 250000.0000, N'Chất liệu: Thun cá sấu 2 chiều, định lượng 230gsm.

Áo thun polo cổ dệt màu xanh tiffany, chất liệu dày vừa phải không cứng.

Chi tiết rồng thêu nét nổi, chi tiết chữ LD thêu xù hoạ tiết.

Áo phom rộng vừa, thiết kế unisex.', 456, N'images/S4000.png')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img]) VALUES (N'S4001', 1, N'LIDERISM CUBAN SHIRT', 690000.0000, N'Chất liệu: Cotton polyester xốp.Áo sơ mi cổ ve lật, dáng boxy, chất liệu đứng dáng.Chi tiết túi áo có thêu chữ nổi. Áo có thiết kế unisex.', 6, N'images/S4001.png')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img]) VALUES (N'S4002', 1, N'LIDERISM CUBAN SHIRT', 500000.0000, N'Chất liệu: Cotton polyester xốp.

Áo sơ mi cổ ve lật, dáng boxy, chất liệu đứng dáng.

Chi tiết túi áo có thêu chữ nổi. Áo có thiết kế unisex.', 8, N'images/S4002.png')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img]) VALUES (N'S4003', 1, N'LIDER CLASSIC SHIRT', 349000.0000, N'Chất liệu: Khaki, định lượng dày dặn. Màu: Xanh lá nhạt.

Áo sơ mi tay ngắn dáng boxy, thiết kế unisex.

Áo cổ ve lật, túi nhỏ trước ngực. 

Các chi tiết logo thuê nổi rải rác thân trước và thân sau áo.', 333, N'images/S4003.png')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img]) VALUES (N'S4004', 1, N'NINTH SAREALM SHIRT', 700000.0000, N'Chất liệu: Denim định lượng 12OZ dày dặn.

Áo sơ mi dáng rộng, thiết kế unisex.

Áo có chi tiết tay áo có thể tháo rời, được cố định bằng khoá zip -> Có thể kết hợp như sơ mi tay ngắn hoặc tay dài.

Chi tiết nón có thể tháo rời, có thể kết hợp cùng áo hoặc đội riêng lẻ.', 9, N'images/S4004.png')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img]) VALUES (N'S4005', 1, N'LINEN CLASSIC SHIRT ', 215000.0000, N'Chất liệu: Linen Bamboo - kết hợp sợi lanh và sợi dệt từ cây tre.Áo có độ mềm, rũ, thoáng mát và thấm hút mồ hôi tốt.Áo sơ mi tay dài thiết kế unisex, dáng dài rộng.Chi tiết logo thêu nổi thân trước và thân sau áo.', 600, N'images/S4005.png')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img]) VALUES (N'S4006', 1, N'THEEIGHTH JERSEY SHIRT', 299000.0000, N'Chất liệu: Polyester 2 da.

Áo thun cổ ve lật, tay dài raglan có rã phối viền vải trắng.

Các chi tiết trước và sau được in phồng. 

Cổ áo và cổ tay bo dệt dày dặn. 

Áo gồm size XS (dáng cropped) và size S-M-L (dáng rộng oversized).', 700, N'images/S4006.png')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img]) VALUES (N'S4007', 1, N'NECKLINE ZIPPED CROPPED SHIRT ', 349000.0000, N'Chất liệu: Nỉ chân cua định lượng 400gsm dày vừa.Áo sweatshirt dáng ngắn, thiết kế unisex.Chi tiết cổ cao có khoá kéo, có thể tuỳ chỉnh cổ áo thành cổ lật hoặc cổ lọ.Gấu áo có bo dệt bản 6cm dày dặn.', 298, N'images/S4007.png')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img]) VALUES (N'SW6000', 14, N'Áo Gió Red', 170000.0000, N'Thiết kế sang trọng', 797, N'images/SW6000.jpg')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img]) VALUES (N'SW6001', 14, N'áo gió DEST', 400000.0000, N'chất liệu da,ấm áp', 677, N'images/SW6001.jpg')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img]) VALUES (N'SW6002', 14, N'Áo phông Blazer ', 210000.0000, N'Sang trọng', 699, N'images/SW6002.jpg')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img]) VALUES (N'SW6003', 14, N'Áo Khoác Màu Vàng', 420000.0000, N'Thiết kế màu sắc,yêu đời', 655, N'images/SW6003.jpg')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img]) VALUES (N'SW6004', 14, N'Áo gió nam Uniqlo', 130000.0000, N'Thiết kế đơn giản', 100, N'images/SW6004.jpg')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img]) VALUES (N'T2099', 2, N'Áo Thun Polo Tay Ngắn Valentino Creations', 189000.0000, N'Chất liệu: thun cao cấp.Sản phẩm nhẹ, thoáng mát giúp người mặc luôn cảm thấy thoải mái.Thiết kế sang trọng, lịch lãm, dễ phối theo nhiều phong cách khác nhau', 69, N'images/T2099.png')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img]) VALUES (N'T2106', 2, N'Shin-chan Tee', 229000.0000, N'Chất liệu: thun cao cấp.

Sản phẩm nhẹ, thoáng mát giúp người mặc luôn cảm thấy thoải mái.

Thiết kế sang trọng, lịch lãm, dễ phối theo nhiều phong cách khác nhau.', 95, N'images/T2106.png')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img]) VALUES (N'T2109', 2, N'Tie Dye Orange Mint Tee', 290000.0000, N'Chất liệu: thun cao cấp.

Sản phẩm nhẹ, thoáng mát giúp người mặc luôn cảm thấy thoải mái.

Thiết kế sang trọng, lịch lãm, dễ phối theo nhiều phong cách khác nhau.', 75, N'images/T2109.png')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img]) VALUES (N'T2119', 2, N'The Sun Tie Dye', 280000.0000, N'Chất liệu: thun cao cấp.

Sản phẩm nhẹ, thoáng mát giúp người mặc luôn cảm thấy thoải mái.

Thiết kế sang trọng, lịch lãm, dễ phối theo nhiều phong cách khác nhau.', 82, N'images/T2119.png')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img]) VALUES (N'T2127', 2, N'Fucking Awesome Tee In Black', 259000.0000, N'Chất liệu: thun cao cấp.  Sản phẩm nhẹ, thoáng mát giúp người mặc luôn cảm thấy thoải mái.  Thiết kế sang trọng, lịch lãm, dễ phối theo nhiều phong cách khác nhau.', 94, N'images/T2127.png')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img]) VALUES (N'T2128', 2, N'Fucking Awesome Tee', 259000.0000, N'Chất liệu: thun cao cấp.  Sản phẩm nhẹ, thoáng mát giúp người mặc luôn cảm thấy thoải mái.  Thiết kế sang trọng, lịch lãm, dễ phối theo nhiều phong cách khác nhau.', 62, N'images/T2128.png')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img]) VALUES (N'T2129', 2, N'I''m Not Psycho Tee', 270000.0000, N'Sản phẩm nhẹ, thoáng mát giúp người mặc luôn cảm thấy thoải mái.  Thiết kế sang trọng, lịch lãm, dễ phối theo nhiều phong cách khác nhau.', 102, N'images/T2129.png')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img]) VALUES (N'T2130', 2, N'Acid Washed Dark', 240000.0000, N'Sản phẩm nhẹ, thoáng mát giúp người mặc luôn cảm thấy thoải mái.  Thiết kế sang trọng, lịch lãm, dễ phối theo nhiều phong cách khác nhau.', 287, N'images/T2130.png')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img]) VALUES (N'T2131', 2, N'Exceptional Tee With Distressed', 250000.0000, N'Sản phẩm nhẹ, thoáng mát giúp người mặc luôn cảm thấy thoải mái.  Thiết kế sang trọng, lịch lãm, dễ phối theo nhiều phong cách khác nhau.', 198, N'images/T2131.png')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img]) VALUES (N'T3000', 2, N'T-shirt black', 290000.0000, N'Thiết kế mát mẻ,trẻ trung', 138, N'images/T3000.png')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img]) VALUES (N'TD481', 14, N'''''Sinner'''' Sweater', 360000.0000, N'Cổ Tròn
Vạt Ngang
Tay Dài Bo
Hình In Mặt Trước Và Sau ', 29, N'images/TD481.png')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img]) VALUES (N'TD509', 14, N'Champion Sweater', 169000.0000, N'Cổ Tròn
Vạt Ngang
Tay Dài Bo
Hình Thêu Trước ', 446, N'images/TD509.png')
GO
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'T2131', N'Grey')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'T2131', N'Blue')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'AT536', N'Red')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'T2119', N'Pink')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'T2119', N'White')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'H1001', N'White')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'H1001', N'Blue')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'SW6000', N'Red')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'SW6000', N'Blue')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'S4007', N'White')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'S4001', N'Black')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'TD509', N'Purple')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'TD509', N'Blue')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'TD509', N'Black')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'TD509', N'White')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'TD481', N'White')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'T2109', N'Orange')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'T2128', N'White')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'T2128', N'Green')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'T2099', N'Purple')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'T2106', N'Yellow')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'SW6002', N'Black')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'SW6003', N'Yellow')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'SW6004', N'White')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'H1002', N'Green')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'H1002', N'Blue')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'H1004', N'Brown')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'H1005', N'Brown')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'H1005', N'Red')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'H1006', N'White')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'H1006', N'Blue')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'H1006', N'Black')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'S1201', N'White')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'S1201', N'Black')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'S1200', N'Black')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'S4004', N'Brown')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'S4005', N'Orange')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'S4005', N'Yelllow')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'S1202', N'Black')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'SW6004', N'Blue')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'SW6004', N'Black')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'AS8000', N'Green')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'S4000', N'Black')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'AS8000', N'Blue')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'T2127', N'Black')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'S1203', N'White')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'S1203', N'Blue')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'S1203', N'Black')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'S4006', N'Black')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'AS8004', N'White')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'AT533', N'Black')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'SW6001', N'Black')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'AS8001', N'Black')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'S4002', N'White')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'S4002', N'Blue')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'S4002', N'Black')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'S4003', N'Green')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'S4003', N'Blue')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'T3000', N'Black')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'T2129', N'White')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'T2130', N'Grey')
GO
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'T2129', N'XS')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'T2129', N'S')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'T2129', N'L')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'T2130', N'S')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'T2130', N'L')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'T2119', N'L')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'T2119', N'XL')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'H1001', N'S')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'H1001', N'L')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'T3000', N'S')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'SW6000', N'S')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'SW6000', N'L')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'S4007', N'S')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'TD509', N'S')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'TD509', N'L')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'TD509', N'XL')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'TD509', N'XXL')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'TD481', N'L')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'TD481', N'XL')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'T2109', N'L')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'T2109', N'XL')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'T2099', N'S')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'T2099', N'L')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'T2099', N'XL')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'T2129', N'XL')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'AT533', N'S')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'H1001', N'XL')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'T2106', N'S')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'T2106', N'L')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'T2106', N'XL')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'T2106', N'XXL')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'T2106', N'3XL')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'SW6000', N'XL')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'SW6003', N'S')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'SW6003', N'XXL')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'SW6004', N'S')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'H1004', N'S')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'H1004', N'L')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'H1004', N'XL')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'S1202', N'S')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'S1203', N'S')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'S1203', N'XXL')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'S4007', N'L')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'S4007', N'XL')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'S4000', N'')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'S4001', N'S')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'S4003', N'S')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'S4005', N'S')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'S4005', N'L')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'S4005', N'XL')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'S4006', N'S')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'S4006', N'L')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'S1200', N'S')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'SW6004', N'XXL')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'AT536', N'S')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'AS8004', N'S')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'H1002', N'S')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'H1002', N'L')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'H1002', N'XL')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'H1005', N'S')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'H1005', N'L')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'H1006', N'S')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'H1006', N'XXL')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'S1201', N'S')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'S1201', N'XXL')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'AS8000', N'S')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'AS8000', N'L')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'SW6002', N'S')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'S4004', N'S')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'S4004', N'L')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'S4004', N'XL')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'SW6002', N'L')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'S4002', N'S')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'S4002', N'XXL')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'SW6001', N'S')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'T2128', N'XS')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'T2128', N'L')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'T2128', N'XL')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'AS8001', N'S')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'T2131', N'L')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'T2131', N'XL')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'T2131', N'XXL')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'T2127', N'L')
GO
SET IDENTITY_INSERT [dbo].[users] ON 

INSERT [dbo].[users] ([user_id], [user_name], [user_email], [user_pass], [isAdmin], [dateOfBirth], [address], [phoneNumber]) VALUES (1, N'ADMIN', N'doanhtnhe172637@fpt.edu.vn', N'Dtran4673', N'TRUE', N'2003-04-03', N'Thai Binh', N'0348956373')
INSERT [dbo].[users] ([user_id], [user_name], [user_email], [user_pass], [isAdmin], [dateOfBirth], [address], [phoneNumber]) VALUES (4, N'AN', N'AN@gmail.com', N'1423', N'TRUE', N'2003-12-02', N'Ha Noi', N'0999999999')
INSERT [dbo].[users] ([user_id], [user_name], [user_email], [user_pass], [isAdmin], [dateOfBirth], [address], [phoneNumber]) VALUES (5, N'Tran Doanh', N'trandoanh@gmail.com', N'123', N'TRUE', N'2003-04-03', N'Thai Binh', N'0999999999')
INSERT [dbo].[users] ([user_id], [user_name], [user_email], [user_pass], [isAdmin], [dateOfBirth], [address], [phoneNumber]) VALUES (7, N'test5', N'test5@gmail.com', N'Dtran4673', N'False', N'2003-04-03', N'Thai Binh', N'0999999999')
INSERT [dbo].[users] ([user_id], [user_name], [user_email], [user_pass], [isAdmin], [dateOfBirth], [address], [phoneNumber]) VALUES (8, N'test6', N'test6@gmaii.com', N'123', N'False', N'2003-04-03', N'Thai Binh', N'0999999999')
INSERT [dbo].[users] ([user_id], [user_name], [user_email], [user_pass], [isAdmin], [dateOfBirth], [address], [phoneNumber]) VALUES (9, N'test7', N'test7@gmail.com', N'', N'False', N'2003-04-03', N'Thai Binh', N'0999999999')
INSERT [dbo].[users] ([user_id], [user_name], [user_email], [user_pass], [isAdmin], [dateOfBirth], [address], [phoneNumber]) VALUES (10, N'test8', N'test8@gmail.com', N'1', N'False', N'2003-04-03', N'Thai Binh', N'0999999999')
INSERT [dbo].[users] ([user_id], [user_name], [user_email], [user_pass], [isAdmin], [dateOfBirth], [address], [phoneNumber]) VALUES (11, N'test9', N'test9@gmail.com', N'1', N'False', N'2003-04-03', N'Thai Binh', N'0999999999')
INSERT [dbo].[users] ([user_id], [user_name], [user_email], [user_pass], [isAdmin], [dateOfBirth], [address], [phoneNumber]) VALUES (12, N'Doanh', N'doanh@gmail.com', N'Dtran4673', N'True', N'2003-04-03', N'Thai Binh', N'0999999999')
INSERT [dbo].[users] ([user_id], [user_name], [user_email], [user_pass], [isAdmin], [dateOfBirth], [address], [phoneNumber]) VALUES (13, N'test', N'testtest@gmail.com', N'1', N'False', N'2003-04-03', N'Thai Binh', N'0999999999')
INSERT [dbo].[users] ([user_id], [user_name], [user_email], [user_pass], [isAdmin], [dateOfBirth], [address], [phoneNumber]) VALUES (14, N'test10', N'dtran9@gmail.com', N'1', N'False', N'2003-04-03', N'Thai Binh', N'0999999999')
INSERT [dbo].[users] ([user_id], [user_name], [user_email], [user_pass], [isAdmin], [dateOfBirth], [address], [phoneNumber]) VALUES (15, N'thanh', N'test15@gmail.com', N'1', N'False', N'2003-04-03', N'Ha Noi', N'0999999999')
INSERT [dbo].[users] ([user_id], [user_name], [user_email], [user_pass], [isAdmin], [dateOfBirth], [address], [phoneNumber]) VALUES (16, N'phung an', N'dtran04032003@gmail.com', N'1', N'False', N'2003-04-03', N'Ha Noi', N'0999999999')
INSERT [dbo].[users] ([user_id], [user_name], [user_email], [user_pass], [isAdmin], [dateOfBirth], [address], [phoneNumber]) VALUES (17, N'Doanh', N'doanhdoanh@gmail.com', N'1', N'False', N'2003-04-03', N'Ha Noi', N'0999999999')
INSERT [dbo].[users] ([user_id], [user_name], [user_email], [user_pass], [isAdmin], [dateOfBirth], [address], [phoneNumber]) VALUES (18, N'Doanh', N'doanhtran1@gmail.com', N'123', N'False', N'2003-04-03', N'Ha Noi', N'0999999999')
INSERT [dbo].[users] ([user_id], [user_name], [user_email], [user_pass], [isAdmin], [dateOfBirth], [address], [phoneNumber]) VALUES (19, N'Doanh', N'dtran99@gmail.com', N'Dtran99', N'False', N'2003-04-03', N'Thai Binh', N'0999999999')
INSERT [dbo].[users] ([user_id], [user_name], [user_email], [user_pass], [isAdmin], [dateOfBirth], [address], [phoneNumber]) VALUES (20, N'thanh', N'doanh1@gmail.com', N'1', N'False', N'2003-04-03', N'Thai Binh', N'0999999999')
INSERT [dbo].[users] ([user_id], [user_name], [user_email], [user_pass], [isAdmin], [dateOfBirth], [address], [phoneNumber]) VALUES (21, N'thanh', N'test100@gmail.com', N'123', N'False', N'2003-04-03', N'Thai Binh', N'0999999999')
INSERT [dbo].[users] ([user_id], [user_name], [user_email], [user_pass], [isAdmin], [dateOfBirth], [address], [phoneNumber]) VALUES (22, N'Doanh', N'doanhtnhe172637@fpt.edu.vn', N'12', N'False', N'2003-04-03', N'Thai Binh', N'0999999999')
INSERT [dbo].[users] ([user_id], [user_name], [user_email], [user_pass], [isAdmin], [dateOfBirth], [address], [phoneNumber]) VALUES (23, N'Doanh', N'doanhtest@gmail.com', N'1', N'False', N'2003-04-03', N'Thai Binh', N'0999999999')
INSERT [dbo].[users] ([user_id], [user_name], [user_email], [user_pass], [isAdmin], [dateOfBirth], [address], [phoneNumber]) VALUES (24, N'Doanh', N'testhihi@gmail.com', N'1', N'False', N'2003-04-03', N'Thai Binh', N'0999999999')
INSERT [dbo].[users] ([user_id], [user_name], [user_email], [user_pass], [isAdmin], [dateOfBirth], [address], [phoneNumber]) VALUES (25, N'Doanh', N'dtran4673@gmail.com', N'904674', N'False', N'2003-04-03', N'Thai Binh', N'0999999999')
INSERT [dbo].[users] ([user_id], [user_name], [user_email], [user_pass], [isAdmin], [dateOfBirth], [address], [phoneNumber]) VALUES (26, N'Doanh', N'binokyo04032003@gmail.com', N'1', N'False', N'2003-04-03', N'Thai Binh', N'0999999999')
INSERT [dbo].[users] ([user_id], [user_name], [user_email], [user_pass], [isAdmin], [dateOfBirth], [address], [phoneNumber]) VALUES (27, N'', N'test20@gmail.com', N'Test', N'False', N'2003-04-03', N'Thai Binh', N'0999999999')
INSERT [dbo].[users] ([user_id], [user_name], [user_email], [user_pass], [isAdmin], [dateOfBirth], [address], [phoneNumber]) VALUES (28, N'', N'tranngocdoanh43@gmail.com', N'Dtran4673', N'False', N'2024-06-06', N'', N'')
SET IDENTITY_INSERT [dbo].[users] OFF
GO
ALTER TABLE [dbo].[bill]  WITH CHECK ADD  CONSTRAINT [FK_bill_users] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([user_id])
GO
ALTER TABLE [dbo].[bill] CHECK CONSTRAINT [FK_bill_users]
GO
ALTER TABLE [dbo].[bill_detail]  WITH CHECK ADD  CONSTRAINT [FK_bill_detail_bill] FOREIGN KEY([bill_id])
REFERENCES [dbo].[bill] ([bill_id])
GO
ALTER TABLE [dbo].[bill_detail] CHECK CONSTRAINT [FK_bill_detail_bill]
GO
ALTER TABLE [dbo].[bill_detail]  WITH CHECK ADD  CONSTRAINT [FK_bill_detail_product] FOREIGN KEY([product_id])
REFERENCES [dbo].[product] ([product_id])
GO
ALTER TABLE [dbo].[bill_detail] CHECK CONSTRAINT [FK_bill_detail_product]
GO
ALTER TABLE [dbo].[cart]  WITH CHECK ADD  CONSTRAINT [FK_cart_product] FOREIGN KEY([product_id])
REFERENCES [dbo].[product] ([product_id])
GO
ALTER TABLE [dbo].[cart] CHECK CONSTRAINT [FK_cart_product]
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD  CONSTRAINT [FK_product_category] FOREIGN KEY([category_id])
REFERENCES [dbo].[category] ([category_id])
GO
ALTER TABLE [dbo].[product] CHECK CONSTRAINT [FK_product_category]
GO
ALTER TABLE [dbo].[product_color]  WITH CHECK ADD  CONSTRAINT [FK_product_color_product] FOREIGN KEY([product_id])
REFERENCES [dbo].[product] ([product_id])
GO
ALTER TABLE [dbo].[product_color] CHECK CONSTRAINT [FK_product_color_product]
GO
ALTER TABLE [dbo].[product_size]  WITH CHECK ADD  CONSTRAINT [FK_product_size_product] FOREIGN KEY([product_id])
REFERENCES [dbo].[product] ([product_id])
GO
ALTER TABLE [dbo].[product_size] CHECK CONSTRAINT [FK_product_size_product]
GO
USE [master]
GO
ALTER DATABASE [MyShop] SET  READ_WRITE 
GO
