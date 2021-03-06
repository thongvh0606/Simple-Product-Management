USE [master]
GO
/****** Object:  Database [Product]    Script Date: 12/03/2017 9:55:43 AM ******/
CREATE DATABASE [Product]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Product', FILENAME = N'E:\Learning\PRJ321\Project1\Product.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Product_log', FILENAME = N'E:\Learning\PRJ321\Project1\Product_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Product] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Product].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Product] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Product] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Product] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Product] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Product] SET ARITHABORT OFF 
GO
ALTER DATABASE [Product] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Product] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Product] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Product] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Product] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Product] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Product] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Product] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Product] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Product] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Product] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Product] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Product] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Product] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Product] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Product] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Product] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Product] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Product] SET  MULTI_USER 
GO
ALTER DATABASE [Product] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Product] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Product] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Product] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Product] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Product]
GO
/****** Object:  Table [dbo].[tbl_account]    Script Date: 12/03/2017 9:55:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_account](
	[accountID] [nvarchar](10) NOT NULL,
	[employeeName] [nvarchar](50) NULL,
	[password] [nvarchar](20) NULL,
	[expired] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[accountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_import]    Script Date: 12/03/2017 9:55:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_import](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[importDate] [datetime] NULL,
	[price] [float] NULL,
	[quantity] [int] NULL,
	[product_id] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_product]    Script Date: 12/03/2017 9:55:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_product](
	[product_id] [varchar](10) NOT NULL,
	[product_name] [nvarchar](50) NULL,
	[price] [float] NULL,
	[quantity] [int] NULL,
	[unit] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[tbl_account] ([accountID], [employeeName], [password], [expired]) VALUES (N'tamvt', N'tam', N'123', CAST(N'2011-03-13 00:00:00.000' AS DateTime))
INSERT [dbo].[tbl_account] ([accountID], [employeeName], [password], [expired]) VALUES (N'thongvh', N'thong', N'123', CAST(N'2017-12-11 00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[tbl_import] ON 

INSERT [dbo].[tbl_import] ([id], [importDate], [price], [quantity], [product_id]) VALUES (8, CAST(N'2017-02-23 13:30:56.087' AS DateTime), 20.5, 1, N'P0004')
INSERT [dbo].[tbl_import] ([id], [importDate], [price], [quantity], [product_id]) VALUES (9, CAST(N'2017-02-23 13:30:58.947' AS DateTime), 125.5, 1, N'P0003')
INSERT [dbo].[tbl_import] ([id], [importDate], [price], [quantity], [product_id]) VALUES (10, CAST(N'2017-02-23 13:31:02.117' AS DateTime), 120, 1, N'P0002')
INSERT [dbo].[tbl_import] ([id], [importDate], [price], [quantity], [product_id]) VALUES (11, CAST(N'2017-02-23 13:31:05.387' AS DateTime), 1111.5, 1, N'P0001')
INSERT [dbo].[tbl_import] ([id], [importDate], [price], [quantity], [product_id]) VALUES (12, CAST(N'2017-02-23 13:31:09.057' AS DateTime), 123.5, 1, N'P00001')
INSERT [dbo].[tbl_import] ([id], [importDate], [price], [quantity], [product_id]) VALUES (20, CAST(N'2017-02-23 21:56:24.117' AS DateTime), 20.5, 1, N'P0004')
INSERT [dbo].[tbl_import] ([id], [importDate], [price], [quantity], [product_id]) VALUES (21, CAST(N'2017-02-23 22:00:32.723' AS DateTime), 20.5, 1, N'P0004')
INSERT [dbo].[tbl_import] ([id], [importDate], [price], [quantity], [product_id]) VALUES (22, CAST(N'2017-02-23 22:03:29.460' AS DateTime), 20.5, 1, N'P0004')
INSERT [dbo].[tbl_import] ([id], [importDate], [price], [quantity], [product_id]) VALUES (23, CAST(N'2017-02-23 22:04:12.300' AS DateTime), 20.5, 1, N'P0004')
INSERT [dbo].[tbl_import] ([id], [importDate], [price], [quantity], [product_id]) VALUES (24, CAST(N'2017-02-23 22:05:44.177' AS DateTime), 20.5, 1, N'P0004')
INSERT [dbo].[tbl_import] ([id], [importDate], [price], [quantity], [product_id]) VALUES (25, CAST(N'2017-02-23 22:05:45.077' AS DateTime), 20.5, 1, N'P0004')
INSERT [dbo].[tbl_import] ([id], [importDate], [price], [quantity], [product_id]) VALUES (84, CAST(N'2017-02-24 23:03:45.453' AS DateTime), 123.5, 100000, N'P00001')
INSERT [dbo].[tbl_import] ([id], [importDate], [price], [quantity], [product_id]) VALUES (85, CAST(N'2017-02-24 23:03:52.587' AS DateTime), 123.5, 999999, N'P00001')
INSERT [dbo].[tbl_import] ([id], [importDate], [price], [quantity], [product_id]) VALUES (86, CAST(N'2017-02-25 12:23:32.627' AS DateTime), 123.5, 99999, N'P00001')
INSERT [dbo].[tbl_import] ([id], [importDate], [price], [quantity], [product_id]) VALUES (87, CAST(N'2017-02-25 12:23:39.817' AS DateTime), 123.5, 800000, N'P00001')
INSERT [dbo].[tbl_import] ([id], [importDate], [price], [quantity], [product_id]) VALUES (88, CAST(N'2017-02-25 12:44:57.393' AS DateTime), 123, 1000000, N'ddddd')
INSERT [dbo].[tbl_import] ([id], [importDate], [price], [quantity], [product_id]) VALUES (89, CAST(N'2017-02-25 12:45:10.237' AS DateTime), 123, 1000000, N'ddddd')
INSERT [dbo].[tbl_import] ([id], [importDate], [price], [quantity], [product_id]) VALUES (91, CAST(N'2017-02-25 17:58:02.923' AS DateTime), 1111.5, 11, N'P0001')
INSERT [dbo].[tbl_import] ([id], [importDate], [price], [quantity], [product_id]) VALUES (92, CAST(N'2017-02-25 17:58:05.783' AS DateTime), 1111.5, 11, N'P0001')
INSERT [dbo].[tbl_import] ([id], [importDate], [price], [quantity], [product_id]) VALUES (94, CAST(N'2017-02-25 18:50:25.863' AS DateTime), 1111.5, 1, N'P0001')
INSERT [dbo].[tbl_import] ([id], [importDate], [price], [quantity], [product_id]) VALUES (96, CAST(N'2017-02-25 18:51:05.820' AS DateTime), 120, 1, N'P0002')
INSERT [dbo].[tbl_import] ([id], [importDate], [price], [quantity], [product_id]) VALUES (97, CAST(N'2017-02-25 18:51:09.027' AS DateTime), 120, 3, N'P0002')
INSERT [dbo].[tbl_import] ([id], [importDate], [price], [quantity], [product_id]) VALUES (98, CAST(N'2017-02-25 18:51:12.770' AS DateTime), 120, 2, N'P0002')
INSERT [dbo].[tbl_import] ([id], [importDate], [price], [quantity], [product_id]) VALUES (99, CAST(N'2017-02-25 18:51:15.787' AS DateTime), 120, 3, N'P0002')
SET IDENTITY_INSERT [dbo].[tbl_import] OFF
INSERT [dbo].[tbl_product] ([product_id], [product_name], [price], [quantity], [unit]) VALUES (N'ddddd', N'dwqdwqdwq', 111, 2000000, N'20 boxes x 8 bottles')
INSERT [dbo].[tbl_product] ([product_id], [product_name], [price], [quantity], [unit]) VALUES (N'P00001', N'dsa', 123.5, 2000000, N'20 boxes x 8 bottles')
INSERT [dbo].[tbl_product] ([product_id], [product_name], [price], [quantity], [unit]) VALUES (N'P0001', N'Coca Cola', 1111.5, 134, N'10 boxes x 6 cans')
INSERT [dbo].[tbl_product] ([product_id], [product_name], [price], [quantity], [unit]) VALUES (N'P0002', N'Pepsi', 120, 60, N'10 boxes x 8 cans')
INSERT [dbo].[tbl_product] ([product_id], [product_name], [price], [quantity], [unit]) VALUES (N'P0003', N'Sting Strawberry', 125.5, 11, N'20 boxes x 6 bottles')
INSERT [dbo].[tbl_product] ([product_id], [product_name], [price], [quantity], [unit]) VALUES (N'P0004', N'Green Monster Engergy', 20.5, 21, N'5 boxes x 6 cans')
ALTER TABLE [dbo].[tbl_import]  WITH CHECK ADD  CONSTRAINT [FK_tbl_import_tbl_product] FOREIGN KEY([product_id])
REFERENCES [dbo].[tbl_product] ([product_id])
GO
ALTER TABLE [dbo].[tbl_import] CHECK CONSTRAINT [FK_tbl_import_tbl_product]
GO
USE [master]
GO
ALTER DATABASE [Product] SET  READ_WRITE 
GO
