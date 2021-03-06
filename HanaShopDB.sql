USE [master]
GO
/****** Object:  Database [HanaShopDB]    Script Date: 20/01/2021 4:48:11 CH ******/
CREATE DATABASE [HanaShopDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HanaShopDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\HanaShopDB.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'HanaShopDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\HanaShopDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [HanaShopDB] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HanaShopDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HanaShopDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HanaShopDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HanaShopDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HanaShopDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HanaShopDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [HanaShopDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HanaShopDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HanaShopDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HanaShopDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HanaShopDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HanaShopDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HanaShopDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HanaShopDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HanaShopDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HanaShopDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [HanaShopDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HanaShopDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HanaShopDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HanaShopDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HanaShopDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HanaShopDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HanaShopDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HanaShopDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [HanaShopDB] SET  MULTI_USER 
GO
ALTER DATABASE [HanaShopDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HanaShopDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HanaShopDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HanaShopDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [HanaShopDB] SET DELAYED_DURABILITY = DISABLED 
GO
USE [HanaShopDB]
GO
/****** Object:  Table [dbo].[HanaAccount]    Script Date: 20/01/2021 4:48:11 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HanaAccount](
	[userID] [nvarchar](50) NOT NULL,
	[password] [nvarchar](30) NULL,
	[name] [nvarchar](50) NULL,
	[isAdmin] [bit] NOT NULL,
 CONSTRAINT [PK_HanaAccount] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderList]    Script Date: 20/01/2021 4:48:11 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderList](
	[OrderID] [nchar](70) NOT NULL,
	[CustID] [nvarchar](50) NOT NULL,
	[OrderTime] [datetime] NOT NULL,
	[Amout] [money] NOT NULL,
 CONSTRAINT [PK_OrderList] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrdersDetail]    Script Date: 20/01/2021 4:48:11 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrdersDetail](
	[OrderID] [nchar](70) NOT NULL,
	[ProductID] [nchar](10) NOT NULL,
	[Quantity] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 20/01/2021 4:48:11 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ID] [nchar](10) NOT NULL,
	[name] [nvarchar](30) NOT NULL,
	[description] [nvarchar](70) NULL,
	[price] [money] NOT NULL,
	[createDate] [date] NOT NULL,
	[category] [nvarchar](30) NOT NULL,
	[quantity] [numeric](18, 0) NOT NULL,
	[isActive] [bit] NOT NULL,
	[urlImage] [nchar](70) NULL,
	[userID] [nvarchar](50) NULL,
	[lastModified] [date] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[HanaAccount] ([userID], [password], [name], [isAdmin]) VALUES (N'116150122021024666296', NULL, N'tanknse141107@fpt.edu.vn', 0)
INSERT [dbo].[HanaAccount] ([userID], [password], [name], [isAdmin]) VALUES (N'117393821974189470924', NULL, N'winnhat2000@gmail.com', 0)
INSERT [dbo].[HanaAccount] ([userID], [password], [name], [isAdmin]) VALUES (N'TanCl', N'123456', N'Win Kieu', 0)
INSERT [dbo].[HanaAccount] ([userID], [password], [name], [isAdmin]) VALUES (N'TanKN', N'114225', N'Kieu Nhat Tan', 1)
INSERT [dbo].[OrderList] ([OrderID], [CustID], [OrderTime], [Amout]) VALUES (N'116150122021024666296Tue Jan 19 18:33:01 ICT 2021                     ', N'116150122021024666296', CAST(N'2021-01-19T00:00:00.000' AS DateTime), 94000.0000)
INSERT [dbo].[OrderList] ([OrderID], [CustID], [OrderTime], [Amout]) VALUES (N'117393821974189470924Wed Jan 20 15:22:04 ICT 2021                     ', N'117393821974189470924', CAST(N'2021-01-20T00:00:00.000' AS DateTime), 265000.0000)
INSERT [dbo].[OrderList] ([OrderID], [CustID], [OrderTime], [Amout]) VALUES (N'117393821974189470924Wed Jan 20 15:22:41 ICT 2021                     ', N'117393821974189470924', CAST(N'2021-01-20T00:00:00.000' AS DateTime), 573000.0000)
INSERT [dbo].[OrderList] ([OrderID], [CustID], [OrderTime], [Amout]) VALUES (N'117393821974189470924Wed Jan 20 15:28:27 ICT 2021                     ', N'117393821974189470924', CAST(N'2021-01-20T00:00:00.000' AS DateTime), 570113.3750)
INSERT [dbo].[OrderList] ([OrderID], [CustID], [OrderTime], [Amout]) VALUES (N'TanClMon Jan 18 02:07:52 ICT 2021                                     ', N'TanCl', CAST(N'2021-01-18T00:00:00.000' AS DateTime), 152000.0000)
INSERT [dbo].[OrderList] ([OrderID], [CustID], [OrderTime], [Amout]) VALUES (N'TanClTue Jan 19 19:15:37 ICT 2021                                     ', N'TanCl', CAST(N'2021-01-19T00:00:00.000' AS DateTime), 242000.0000)
INSERT [dbo].[OrderList] ([OrderID], [CustID], [OrderTime], [Amout]) VALUES (N'TanClWed Jan 20 15:23:24 ICT 2021                                     ', N'TanCl', CAST(N'2021-01-20T00:00:00.000' AS DateTime), 906000.0000)
INSERT [dbo].[OrderList] ([OrderID], [CustID], [OrderTime], [Amout]) VALUES (N'TanClWed Jan 20 15:29:39 ICT 2021                                     ', N'TanCl', CAST(N'2021-01-20T00:00:00.000' AS DateTime), 1119000.0000)
INSERT [dbo].[OrderList] ([OrderID], [CustID], [OrderTime], [Amout]) VALUES (N'TanClWed Jan 20 15:29:46 ICT 2021                                     ', N'TanCl', CAST(N'2021-01-20T00:00:00.000' AS DateTime), 1095000.0000)
INSERT [dbo].[OrderList] ([OrderID], [CustID], [OrderTime], [Amout]) VALUES (N'TanClWed Jan 20 15:37:29 ICT 2021                                     ', N'TanCl', CAST(N'2021-01-20T00:00:00.000' AS DateTime), 259000.0000)
INSERT [dbo].[OrdersDetail] ([OrderID], [ProductID], [Quantity]) VALUES (N'TanClMon Jan 18 02:07:52 ICT 2021                                     ', N'013       ', 1)
INSERT [dbo].[OrdersDetail] ([OrderID], [ProductID], [Quantity]) VALUES (N'TanClMon Jan 18 02:07:52 ICT 2021                                     ', N'002       ', 1)
INSERT [dbo].[OrdersDetail] ([OrderID], [ProductID], [Quantity]) VALUES (N'TanClMon Jan 18 02:07:52 ICT 2021                                     ', N'007       ', 1)
INSERT [dbo].[OrdersDetail] ([OrderID], [ProductID], [Quantity]) VALUES (N'TanClMon Jan 18 02:07:52 ICT 2021                                     ', N'004       ', 1)
INSERT [dbo].[OrdersDetail] ([OrderID], [ProductID], [Quantity]) VALUES (N'116150122021024666296Tue Jan 19 18:33:01 ICT 2021                     ', N'011       ', 1)
INSERT [dbo].[OrdersDetail] ([OrderID], [ProductID], [Quantity]) VALUES (N'116150122021024666296Tue Jan 19 18:33:01 ICT 2021                     ', N'010       ', 1)
INSERT [dbo].[OrdersDetail] ([OrderID], [ProductID], [Quantity]) VALUES (N'116150122021024666296Tue Jan 19 18:33:01 ICT 2021                     ', N'013       ', 1)
INSERT [dbo].[OrdersDetail] ([OrderID], [ProductID], [Quantity]) VALUES (N'TanClTue Jan 19 19:15:37 ICT 2021                                     ', N'011       ', 2)
INSERT [dbo].[OrdersDetail] ([OrderID], [ProductID], [Quantity]) VALUES (N'TanClTue Jan 19 19:15:37 ICT 2021                                     ', N'002       ', 1)
INSERT [dbo].[OrdersDetail] ([OrderID], [ProductID], [Quantity]) VALUES (N'117393821974189470924Wed Jan 20 15:22:04 ICT 2021                     ', N'002       ', 2)
INSERT [dbo].[OrdersDetail] ([OrderID], [ProductID], [Quantity]) VALUES (N'117393821974189470924Wed Jan 20 15:22:04 ICT 2021                     ', N'009       ', 1)
INSERT [dbo].[OrdersDetail] ([OrderID], [ProductID], [Quantity]) VALUES (N'117393821974189470924Wed Jan 20 15:22:04 ICT 2021                     ', N'010       ', 1)
INSERT [dbo].[OrdersDetail] ([OrderID], [ProductID], [Quantity]) VALUES (N'117393821974189470924Wed Jan 20 15:22:04 ICT 2021                     ', N'015       ', 1)
INSERT [dbo].[OrdersDetail] ([OrderID], [ProductID], [Quantity]) VALUES (N'117393821974189470924Wed Jan 20 15:22:04 ICT 2021                     ', N'007       ', 1)
INSERT [dbo].[OrdersDetail] ([OrderID], [ProductID], [Quantity]) VALUES (N'117393821974189470924Wed Jan 20 15:22:04 ICT 2021                     ', N'026       ', 1)
INSERT [dbo].[OrdersDetail] ([OrderID], [ProductID], [Quantity]) VALUES (N'117393821974189470924Wed Jan 20 15:22:41 ICT 2021                     ', N'019       ', 1)
INSERT [dbo].[OrdersDetail] ([OrderID], [ProductID], [Quantity]) VALUES (N'117393821974189470924Wed Jan 20 15:22:41 ICT 2021                     ', N'002       ', 2)
INSERT [dbo].[OrdersDetail] ([OrderID], [ProductID], [Quantity]) VALUES (N'117393821974189470924Wed Jan 20 15:22:41 ICT 2021                     ', N'005       ', 2)
INSERT [dbo].[OrdersDetail] ([OrderID], [ProductID], [Quantity]) VALUES (N'117393821974189470924Wed Jan 20 15:22:41 ICT 2021                     ', N'009       ', 1)
INSERT [dbo].[OrdersDetail] ([OrderID], [ProductID], [Quantity]) VALUES (N'117393821974189470924Wed Jan 20 15:22:41 ICT 2021                     ', N'010       ', 1)
INSERT [dbo].[OrdersDetail] ([OrderID], [ProductID], [Quantity]) VALUES (N'117393821974189470924Wed Jan 20 15:22:41 ICT 2021                     ', N'015       ', 2)
INSERT [dbo].[OrdersDetail] ([OrderID], [ProductID], [Quantity]) VALUES (N'117393821974189470924Wed Jan 20 15:22:41 ICT 2021                     ', N'007       ', 1)
INSERT [dbo].[OrdersDetail] ([OrderID], [ProductID], [Quantity]) VALUES (N'117393821974189470924Wed Jan 20 15:22:41 ICT 2021                     ', N'014       ', 1)
INSERT [dbo].[OrdersDetail] ([OrderID], [ProductID], [Quantity]) VALUES (N'117393821974189470924Wed Jan 20 15:22:41 ICT 2021                     ', N'006       ', 1)
INSERT [dbo].[OrdersDetail] ([OrderID], [ProductID], [Quantity]) VALUES (N'117393821974189470924Wed Jan 20 15:22:41 ICT 2021                     ', N'026       ', 2)
INSERT [dbo].[OrdersDetail] ([OrderID], [ProductID], [Quantity]) VALUES (N'117393821974189470924Wed Jan 20 15:22:41 ICT 2021                     ', N'022       ', 1)
INSERT [dbo].[OrdersDetail] ([OrderID], [ProductID], [Quantity]) VALUES (N'TanClWed Jan 20 15:23:24 ICT 2021                                     ', N'020       ', 1)
INSERT [dbo].[OrdersDetail] ([OrderID], [ProductID], [Quantity]) VALUES (N'TanClWed Jan 20 15:23:24 ICT 2021                                     ', N'002       ', 2)
INSERT [dbo].[OrdersDetail] ([OrderID], [ProductID], [Quantity]) VALUES (N'TanClWed Jan 20 15:23:24 ICT 2021                                     ', N'005       ', 3)
INSERT [dbo].[OrdersDetail] ([OrderID], [ProductID], [Quantity]) VALUES (N'TanClWed Jan 20 15:23:24 ICT 2021                                     ', N'010       ', 1)
INSERT [dbo].[OrdersDetail] ([OrderID], [ProductID], [Quantity]) VALUES (N'TanClWed Jan 20 15:23:24 ICT 2021                                     ', N'013       ', 1)
INSERT [dbo].[OrdersDetail] ([OrderID], [ProductID], [Quantity]) VALUES (N'TanClWed Jan 20 15:23:24 ICT 2021                                     ', N'007       ', 2)
INSERT [dbo].[OrdersDetail] ([OrderID], [ProductID], [Quantity]) VALUES (N'TanClWed Jan 20 15:23:24 ICT 2021                                     ', N'006       ', 1)
INSERT [dbo].[OrdersDetail] ([OrderID], [ProductID], [Quantity]) VALUES (N'TanClWed Jan 20 15:23:24 ICT 2021                                     ', N'019       ', 3)
INSERT [dbo].[OrdersDetail] ([OrderID], [ProductID], [Quantity]) VALUES (N'TanClWed Jan 20 15:23:24 ICT 2021                                     ', N'009       ', 1)
INSERT [dbo].[OrdersDetail] ([OrderID], [ProductID], [Quantity]) VALUES (N'TanClWed Jan 20 15:23:24 ICT 2021                                     ', N'008       ', 1)
INSERT [dbo].[OrdersDetail] ([OrderID], [ProductID], [Quantity]) VALUES (N'TanClWed Jan 20 15:23:24 ICT 2021                                     ', N'015       ', 2)
INSERT [dbo].[OrdersDetail] ([OrderID], [ProductID], [Quantity]) VALUES (N'TanClWed Jan 20 15:23:24 ICT 2021                                     ', N'014       ', 2)
INSERT [dbo].[OrdersDetail] ([OrderID], [ProductID], [Quantity]) VALUES (N'TanClWed Jan 20 15:23:24 ICT 2021                                     ', N'026       ', 2)
INSERT [dbo].[OrdersDetail] ([OrderID], [ProductID], [Quantity]) VALUES (N'TanClWed Jan 20 15:23:24 ICT 2021                                     ', N'022       ', 1)
INSERT [dbo].[OrdersDetail] ([OrderID], [ProductID], [Quantity]) VALUES (N'TanClTue Jan 19 19:15:37 ICT 2021                                     ', N'004       ', 4)
INSERT [dbo].[OrdersDetail] ([OrderID], [ProductID], [Quantity]) VALUES (N'TanClTue Jan 19 19:15:37 ICT 2021                                     ', N'001       ', 1)
INSERT [dbo].[OrdersDetail] ([OrderID], [ProductID], [Quantity]) VALUES (N'TanClTue Jan 19 19:15:37 ICT 2021                                     ', N'013       ', 2)
INSERT [dbo].[OrdersDetail] ([OrderID], [ProductID], [Quantity]) VALUES (N'117393821974189470924Wed Jan 20 15:28:27 ICT 2021                     ', N'011       ', 2)
INSERT [dbo].[OrdersDetail] ([OrderID], [ProductID], [Quantity]) VALUES (N'117393821974189470924Wed Jan 20 15:28:27 ICT 2021                     ', N'004       ', 1)
INSERT [dbo].[OrdersDetail] ([OrderID], [ProductID], [Quantity]) VALUES (N'TanClWed Jan 20 15:37:29 ICT 2021                                     ', N'019       ', 2)
INSERT [dbo].[OrdersDetail] ([OrderID], [ProductID], [Quantity]) VALUES (N'TanClWed Jan 20 15:37:29 ICT 2021                                     ', N'002       ', 1)
INSERT [dbo].[OrdersDetail] ([OrderID], [ProductID], [Quantity]) VALUES (N'TanClWed Jan 20 15:37:29 ICT 2021                                     ', N'005       ', 1)
INSERT [dbo].[OrdersDetail] ([OrderID], [ProductID], [Quantity]) VALUES (N'TanClWed Jan 20 15:37:29 ICT 2021                                     ', N'010       ', 1)
INSERT [dbo].[OrdersDetail] ([OrderID], [ProductID], [Quantity]) VALUES (N'TanClWed Jan 20 15:37:29 ICT 2021                                     ', N'007       ', 1)
INSERT [dbo].[OrdersDetail] ([OrderID], [ProductID], [Quantity]) VALUES (N'117393821974189470924Wed Jan 20 15:28:27 ICT 2021                     ', N'005       ', 1)
INSERT [dbo].[OrdersDetail] ([OrderID], [ProductID], [Quantity]) VALUES (N'117393821974189470924Wed Jan 20 15:28:27 ICT 2021                     ', N'001       ', 1)
INSERT [dbo].[OrdersDetail] ([OrderID], [ProductID], [Quantity]) VALUES (N'117393821974189470924Wed Jan 20 15:28:27 ICT 2021                     ', N'013       ', 3)
INSERT [dbo].[OrdersDetail] ([OrderID], [ProductID], [Quantity]) VALUES (N'117393821974189470924Wed Jan 20 15:28:27 ICT 2021                     ', N'010       ', 1)
INSERT [dbo].[OrdersDetail] ([OrderID], [ProductID], [Quantity]) VALUES (N'117393821974189470924Wed Jan 20 15:28:27 ICT 2021                     ', N'0019      ', 2)
INSERT [dbo].[OrdersDetail] ([OrderID], [ProductID], [Quantity]) VALUES (N'117393821974189470924Wed Jan 20 15:28:27 ICT 2021                     ', N'007       ', 1)
INSERT [dbo].[OrdersDetail] ([OrderID], [ProductID], [Quantity]) VALUES (N'117393821974189470924Wed Jan 20 15:28:27 ICT 2021                     ', N'019       ', 1)
INSERT [dbo].[OrdersDetail] ([OrderID], [ProductID], [Quantity]) VALUES (N'117393821974189470924Wed Jan 20 15:28:27 ICT 2021                     ', N'009       ', 1)
INSERT [dbo].[OrdersDetail] ([OrderID], [ProductID], [Quantity]) VALUES (N'117393821974189470924Wed Jan 20 15:28:27 ICT 2021                     ', N'015       ', 1)
INSERT [dbo].[OrdersDetail] ([OrderID], [ProductID], [Quantity]) VALUES (N'117393821974189470924Wed Jan 20 15:28:27 ICT 2021                     ', N'014       ', 1)
INSERT [dbo].[OrdersDetail] ([OrderID], [ProductID], [Quantity]) VALUES (N'117393821974189470924Wed Jan 20 15:28:27 ICT 2021                     ', N'021       ', 1)
INSERT [dbo].[OrdersDetail] ([OrderID], [ProductID], [Quantity]) VALUES (N'117393821974189470924Wed Jan 20 15:28:27 ICT 2021                     ', N'026       ', 1)
INSERT [dbo].[OrdersDetail] ([OrderID], [ProductID], [Quantity]) VALUES (N'117393821974189470924Wed Jan 20 15:28:27 ICT 2021                     ', N'022       ', 1)
INSERT [dbo].[OrdersDetail] ([OrderID], [ProductID], [Quantity]) VALUES (N'117393821974189470924Wed Jan 20 15:28:27 ICT 2021                     ', N'024       ', 1)
INSERT [dbo].[OrdersDetail] ([OrderID], [ProductID], [Quantity]) VALUES (N'TanClWed Jan 20 15:29:46 ICT 2021                                     ', N'005       ', 1)
INSERT [dbo].[OrdersDetail] ([OrderID], [ProductID], [Quantity]) VALUES (N'TanClWed Jan 20 15:29:46 ICT 2021                                     ', N'001       ', 2)
INSERT [dbo].[OrdersDetail] ([OrderID], [ProductID], [Quantity]) VALUES (N'TanClWed Jan 20 15:29:46 ICT 2021                                     ', N'010       ', 1)
INSERT [dbo].[OrdersDetail] ([OrderID], [ProductID], [Quantity]) VALUES (N'TanClWed Jan 20 15:29:46 ICT 2021                                     ', N'007       ', 5)
INSERT [dbo].[OrdersDetail] ([OrderID], [ProductID], [Quantity]) VALUES (N'TanClWed Jan 20 15:29:46 ICT 2021                                     ', N'019       ', 3)
INSERT [dbo].[OrdersDetail] ([OrderID], [ProductID], [Quantity]) VALUES (N'TanClWed Jan 20 15:29:46 ICT 2021                                     ', N'009       ', 3)
INSERT [dbo].[OrdersDetail] ([OrderID], [ProductID], [Quantity]) VALUES (N'TanClWed Jan 20 15:29:46 ICT 2021                                     ', N'015       ', 5)
INSERT [dbo].[OrdersDetail] ([OrderID], [ProductID], [Quantity]) VALUES (N'TanClWed Jan 20 15:29:46 ICT 2021                                     ', N'014       ', 2)
INSERT [dbo].[OrdersDetail] ([OrderID], [ProductID], [Quantity]) VALUES (N'TanClWed Jan 20 15:29:46 ICT 2021                                     ', N'026       ', 5)
INSERT [dbo].[OrdersDetail] ([OrderID], [ProductID], [Quantity]) VALUES (N'TanClWed Jan 20 15:29:46 ICT 2021                                     ', N'022       ', 1)
INSERT [dbo].[OrdersDetail] ([OrderID], [ProductID], [Quantity]) VALUES (N'TanClWed Jan 20 15:29:46 ICT 2021                                     ', N'025       ', 1)
INSERT [dbo].[Products] ([ID], [name], [description], [price], [createDate], [category], [quantity], [isActive], [urlImage], [userID], [lastModified]) VALUES (N'001       ', N'7up', N'can', 12000.0000, CAST(N'2021-01-06' AS Date), N'Drink', CAST(0 AS Numeric(18, 0)), 1, N'Image/7up.jpg                                                         ', N'TanKN', CAST(N'2021-01-18' AS Date))
INSERT [dbo].[Products] ([ID], [name], [description], [price], [createDate], [category], [quantity], [isActive], [urlImage], [userID], [lastModified]) VALUES (N'0019      ', N'Chocolate', N'Long using', 56.7000, CAST(N'2021-01-13' AS Date), N'Food', CAST(30 AS Numeric(18, 0)), 1, N'Image\Vegan-Chocolate-Bars.jpg                                        ', NULL, NULL)
INSERT [dbo].[Products] ([ID], [name], [description], [price], [createDate], [category], [quantity], [isActive], [urlImage], [userID], [lastModified]) VALUES (N'002       ', N'Apples', N'vnd/kg', 48000.0000, CAST(N'2021-01-05' AS Date), N'Food', CAST(14 AS Numeric(18, 0)), 1, N'Image/Apple.jpg                                                       ', N'TanKN', CAST(N'2021-01-13' AS Date))
INSERT [dbo].[Products] ([ID], [name], [description], [price], [createDate], [category], [quantity], [isActive], [urlImage], [userID], [lastModified]) VALUES (N'003       ', N'banana', N'vnd/kg', 22000.0000, CAST(N'2021-01-06' AS Date), N'Food', CAST(12 AS Numeric(18, 0)), 0, N'Image/banana.jpg                                                      ', N'TanKN', CAST(N'2021-01-14' AS Date))
INSERT [dbo].[Products] ([ID], [name], [description], [price], [createDate], [category], [quantity], [isActive], [urlImage], [userID], [lastModified]) VALUES (N'004       ', N'banhmi', N'Cooked', 15000.0000, CAST(N'2021-01-06' AS Date), N'Food', CAST(20 AS Numeric(18, 0)), 1, N'Image/banhmi.jpg                                                      ', N'TanKN', CAST(N'2021-01-13' AS Date))
INSERT [dbo].[Products] ([ID], [name], [description], [price], [createDate], [category], [quantity], [isActive], [urlImage], [userID], [lastModified]) VALUES (N'005       ', N'Coca', N'can', 12000.0000, CAST(N'2021-01-06' AS Date), N'Drink', CAST(56 AS Numeric(18, 0)), 1, N'Image/Coca.jpg                                                        ', N'TanKN', CAST(N'2021-01-13' AS Date))
INSERT [dbo].[Products] ([ID], [name], [description], [price], [createDate], [category], [quantity], [isActive], [urlImage], [userID], [lastModified]) VALUES (N'006       ', N'dimsum', N'Cooked', 45000.0000, CAST(N'2021-01-06' AS Date), N'Food', CAST(5 AS Numeric(18, 0)), 1, N'Image/dimsum.jpg                                                      ', NULL, NULL)
INSERT [dbo].[Products] ([ID], [name], [description], [price], [createDate], [category], [quantity], [isActive], [urlImage], [userID], [lastModified]) VALUES (N'007       ', N'friedchicken', N'Cooked', 54000.0000, CAST(N'2021-01-06' AS Date), N'Food', CAST(25 AS Numeric(18, 0)), 1, N'Image/friedchicken.jpg                                                ', NULL, NULL)
INSERT [dbo].[Products] ([ID], [name], [description], [price], [createDate], [category], [quantity], [isActive], [urlImage], [userID], [lastModified]) VALUES (N'008       ', N'icecream', N'vnd/glass', 32000.0000, CAST(N'2021-01-06' AS Date), N'Food', CAST(25 AS Numeric(18, 0)), 1, N'Image/icecream.jpg                                                    ', NULL, NULL)
INSERT [dbo].[Products] ([ID], [name], [description], [price], [createDate], [category], [quantity], [isActive], [urlImage], [userID], [lastModified]) VALUES (N'009       ', N'hotdog', N'Cooked', 11000.0000, CAST(N'2021-01-06' AS Date), N'Food', CAST(18 AS Numeric(18, 0)), 1, N'Image/hotdog.jpg                                                      ', NULL, NULL)
INSERT [dbo].[Products] ([ID], [name], [description], [price], [createDate], [category], [quantity], [isActive], [urlImage], [userID], [lastModified]) VALUES (N'010       ', N'Milktea', N'vnd/glass', 33000.0000, CAST(N'2021-01-06' AS Date), N'Drink', CAST(41 AS Numeric(18, 0)), 1, N'Image/Milktea.jpg                                                     ', N'TanKN', CAST(N'2021-01-13' AS Date))
INSERT [dbo].[Products] ([ID], [name], [description], [price], [createDate], [category], [quantity], [isActive], [urlImage], [userID], [lastModified]) VALUES (N'011       ', N'noodle', N'Cooked', 26000.0000, CAST(N'2021-01-06' AS Date), N'Food', CAST(14 AS Numeric(18, 0)), 1, N'Image/noodle.jpg                                                      ', NULL, NULL)
INSERT [dbo].[Products] ([ID], [name], [description], [price], [createDate], [category], [quantity], [isActive], [urlImage], [userID], [lastModified]) VALUES (N'012       ', N'orange', N'vnd/kg', 41000.0000, CAST(N'2021-01-06' AS Date), N'Food', CAST(14 AS Numeric(18, 0)), 0, N'Image/orange.jpg                                                      ', N'TanKN', CAST(N'2021-01-14' AS Date))
INSERT [dbo].[Products] ([ID], [name], [description], [price], [createDate], [category], [quantity], [isActive], [urlImage], [userID], [lastModified]) VALUES (N'013       ', N'Pho', N'Cooked', 35000.0000, CAST(N'2021-01-06' AS Date), N'Food', CAST(6 AS Numeric(18, 0)), 1, N'Image/Pho.jpg                                                         ', N'TanKN', CAST(N'2021-01-13' AS Date))
INSERT [dbo].[Products] ([ID], [name], [description], [price], [createDate], [category], [quantity], [isActive], [urlImage], [userID], [lastModified]) VALUES (N'014       ', N'pizza', N'Cooked', 77000.0000, CAST(N'2021-01-06' AS Date), N'Food', CAST(16 AS Numeric(18, 0)), 1, N'Image/pizza.jpg                                                       ', N'TanKN', CAST(N'2021-01-13' AS Date))
INSERT [dbo].[Products] ([ID], [name], [description], [price], [createDate], [category], [quantity], [isActive], [urlImage], [userID], [lastModified]) VALUES (N'015       ', N'Potatoes', N'Cooked', 26000.0000, CAST(N'2021-01-09' AS Date), N'Food', CAST(8 AS Numeric(18, 0)), 1, N'Image\Fried-Potatoes-Yummy-Crispy-1024x640.jpg                        ', NULL, NULL)
INSERT [dbo].[Products] ([ID], [name], [description], [price], [createDate], [category], [quantity], [isActive], [urlImage], [userID], [lastModified]) VALUES (N'016       ', N'Rice', N'Cooked', 25000.0000, CAST(N'2021-01-04' AS Date), N'Food', CAST(37 AS Numeric(18, 0)), 0, N'Image/Rice.jsp                                                        ', N'TanKN', CAST(N'2021-01-13' AS Date))
INSERT [dbo].[Products] ([ID], [name], [description], [price], [createDate], [category], [quantity], [isActive], [urlImage], [userID], [lastModified]) VALUES (N'017       ', N'tea', N'vnd/glass', 17000.0000, CAST(N'2021-01-06' AS Date), N'Drink', CAST(26 AS Numeric(18, 0)), 0, N'Image/tea.jpg                                                         ', N'TanKN', CAST(N'2021-01-12' AS Date))
INSERT [dbo].[Products] ([ID], [name], [description], [price], [createDate], [category], [quantity], [isActive], [urlImage], [userID], [lastModified]) VALUES (N'018       ', N'Cheese', N'Fresh', 72000.0000, CAST(N'2021-01-12' AS Date), N'Food', CAST(7 AS Numeric(18, 0)), 0, N'Image\OIP.jpg                                                         ', NULL, NULL)
INSERT [dbo].[Products] ([ID], [name], [description], [price], [createDate], [category], [quantity], [isActive], [urlImage], [userID], [lastModified]) VALUES (N'019       ', N'spegetti', N'Cooked', 56000.0000, CAST(N'2021-01-19' AS Date), N'Food', CAST(5 AS Numeric(18, 0)), 1, N'Image/spegetti.jpg                                                    ', NULL, NULL)
INSERT [dbo].[Products] ([ID], [name], [description], [price], [createDate], [category], [quantity], [isActive], [urlImage], [userID], [lastModified]) VALUES (N'020       ', N'donut', N'long using', 11000.0000, CAST(N'2021-01-19' AS Date), N'Food', CAST(10 AS Numeric(18, 0)), 1, N'Image/Baked-Cake-Donuts-RC-500x500.jpg                                ', NULL, NULL)
INSERT [dbo].[Products] ([ID], [name], [description], [price], [createDate], [category], [quantity], [isActive], [urlImage], [userID], [lastModified]) VALUES (N'021       ', N'black coffee', N'glass', 23000.0000, CAST(N'2021-01-19' AS Date), N'Drink', CAST(35 AS Numeric(18, 0)), 1, N'Image/A_small_cup_of_coffee.jpg                                       ', NULL, NULL)
INSERT [dbo].[Products] ([ID], [name], [description], [price], [createDate], [category], [quantity], [isActive], [urlImage], [userID], [lastModified]) VALUES (N'022       ', N'peach tea', N'glass', 35000.0000, CAST(N'2021-01-19' AS Date), N'Drink', CAST(12 AS Numeric(18, 0)), 1, N'Image/peachtea.jpg                                                    ', NULL, NULL)
INSERT [dbo].[Products] ([ID], [name], [description], [price], [createDate], [category], [quantity], [isActive], [urlImage], [userID], [lastModified]) VALUES (N'023       ', N'espresso', N'glass', 33000.0000, CAST(N'2021-01-19' AS Date), N'Drink', CAST(15 AS Numeric(18, 0)), 1, N'Image/espresso-2.jpg                                                  ', NULL, NULL)
INSERT [dbo].[Products] ([ID], [name], [description], [price], [createDate], [category], [quantity], [isActive], [urlImage], [userID], [lastModified]) VALUES (N'024       ', N'cupcake', N'long using', 14000.0000, CAST(N'2021-01-19' AS Date), N'Food', CAST(16 AS Numeric(18, 0)), 1, N'Image/cupcake.jpg                                                     ', NULL, NULL)
INSERT [dbo].[Products] ([ID], [name], [description], [price], [createDate], [category], [quantity], [isActive], [urlImage], [userID], [lastModified]) VALUES (N'025       ', N'Lipton', N'bottle', 11000.0000, CAST(N'2021-01-19' AS Date), N'Drink', CAST(22 AS Numeric(18, 0)), 1, N'Image/lipton.jpg                                                      ', NULL, NULL)
INSERT [dbo].[Products] ([ID], [name], [description], [price], [createDate], [category], [quantity], [isActive], [urlImage], [userID], [lastModified]) VALUES (N'026       ', N'Hamberger', N'Cooked', 45000.0000, CAST(N'2021-01-19' AS Date), N'Food', CAST(10 AS Numeric(18, 0)), 1, N'Image/hamberger.jpg                                                   ', NULL, NULL)
ALTER TABLE [dbo].[OrderList]  WITH CHECK ADD  CONSTRAINT [FK_OrderList_HanaAccount] FOREIGN KEY([CustID])
REFERENCES [dbo].[HanaAccount] ([userID])
GO
ALTER TABLE [dbo].[OrderList] CHECK CONSTRAINT [FK_OrderList_HanaAccount]
GO
ALTER TABLE [dbo].[OrdersDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrdersDetail_OrderList] FOREIGN KEY([OrderID])
REFERENCES [dbo].[OrderList] ([OrderID])
GO
ALTER TABLE [dbo].[OrdersDetail] CHECK CONSTRAINT [FK_OrdersDetail_OrderList]
GO
ALTER TABLE [dbo].[OrdersDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrdersDetail_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ID])
GO
ALTER TABLE [dbo].[OrdersDetail] CHECK CONSTRAINT [FK_OrdersDetail_Products]
GO
USE [master]
GO
ALTER DATABASE [HanaShopDB] SET  READ_WRITE 
GO
