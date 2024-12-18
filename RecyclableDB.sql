USE [master]
GO
/****** Object:  Database [RecyclableDB]    Script Date: 12/2/2024 8:44:44 AM ******/
CREATE DATABASE [RecyclableDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'RecyclableDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER03\MSSQL\DATA\RecyclableDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'RecyclableDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER03\MSSQL\DATA\RecyclableDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 COLLATE SQL_Latin1_General_CP1_CI_AS
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [RecyclableDB] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [RecyclableDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [RecyclableDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [RecyclableDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [RecyclableDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [RecyclableDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [RecyclableDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [RecyclableDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [RecyclableDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [RecyclableDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [RecyclableDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [RecyclableDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [RecyclableDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [RecyclableDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [RecyclableDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [RecyclableDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [RecyclableDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [RecyclableDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [RecyclableDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [RecyclableDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [RecyclableDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [RecyclableDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [RecyclableDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [RecyclableDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [RecyclableDB] SET RECOVERY FULL 
GO
ALTER DATABASE [RecyclableDB] SET  MULTI_USER 
GO
ALTER DATABASE [RecyclableDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [RecyclableDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [RecyclableDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [RecyclableDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [RecyclableDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [RecyclableDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'RecyclableDB', N'ON'
GO
ALTER DATABASE [RecyclableDB] SET QUERY_STORE = ON
GO
ALTER DATABASE [RecyclableDB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [RecyclableDB]
GO
/****** Object:  Table [dbo].[RecyclableItem]    Script Date: 12/2/2024 8:44:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RecyclableItem](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RecyclableTypeId] [int] NULL,
	[Weight] [decimal](18, 2) NOT NULL,
	[ComputedRate] [decimal](18, 2) NOT NULL,
	[ItemDescription] [varchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RecyclableType]    Script Date: 12/2/2024 8:44:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RecyclableType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Type] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Rate] [decimal](18, 2) NOT NULL,
	[MinKg] [decimal](18, 2) NOT NULL,
	[MaxKg] [decimal](18, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[RecyclableItem] ON 

INSERT [dbo].[RecyclableItem] ([Id], [RecyclableTypeId], [Weight], [ComputedRate], [ItemDescription]) VALUES (7, 4, CAST(5.20 AS Decimal(18, 2)), CAST(20.80 AS Decimal(18, 2)), N'50 crushed soda cans')
INSERT [dbo].[RecyclableItem] ([Id], [RecyclableTypeId], [Weight], [ComputedRate], [ItemDescription]) VALUES (8, 5, CAST(6.00 AS Decimal(18, 2)), CAST(30.00 AS Decimal(18, 2)), N'assorted PET bottles')
INSERT [dbo].[RecyclableItem] ([Id], [RecyclableTypeId], [Weight], [ComputedRate], [ItemDescription]) VALUES (9, 6, CAST(15.00 AS Decimal(18, 2)), CAST(90.00 AS Decimal(18, 2)), N'10 packaging boxes')
INSERT [dbo].[RecyclableItem] ([Id], [RecyclableTypeId], [Weight], [ComputedRate], [ItemDescription]) VALUES (10, 7, CAST(12.50 AS Decimal(18, 2)), CAST(87.50 AS Decimal(18, 2)), N'20 wine bottles')
INSERT [dbo].[RecyclableItem] ([Id], [RecyclableTypeId], [Weight], [ComputedRate], [ItemDescription]) VALUES (11, 8, CAST(45.00 AS Decimal(18, 2)), CAST(360.00 AS Decimal(18, 2)), N'assorted steel rods')
INSERT [dbo].[RecyclableItem] ([Id], [RecyclableTypeId], [Weight], [ComputedRate], [ItemDescription]) VALUES (12, 9, CAST(16.00 AS Decimal(18, 2)), CAST(144.00 AS Decimal(18, 2)), N'4 destroyed laptops')
INSERT [dbo].[RecyclableItem] ([Id], [RecyclableTypeId], [Weight], [ComputedRate], [ItemDescription]) VALUES (13, 10, CAST(6.40 AS Decimal(18, 2)), CAST(64.00 AS Decimal(18, 2)), N'newspapers and flyers')
INSERT [dbo].[RecyclableItem] ([Id], [RecyclableTypeId], [Weight], [ComputedRate], [ItemDescription]) VALUES (14, 11, CAST(28.30 AS Decimal(18, 2)), CAST(311.30 AS Decimal(18, 2)), N'4 used tires')
INSERT [dbo].[RecyclableItem] ([Id], [RecyclableTypeId], [Weight], [ComputedRate], [ItemDescription]) VALUES (15, 12, CAST(7.69 AS Decimal(18, 2)), CAST(92.28 AS Decimal(18, 2)), N'30m of electrical wiring')
INSERT [dbo].[RecyclableItem] ([Id], [RecyclableTypeId], [Weight], [ComputedRate], [ItemDescription]) VALUES (16, 13, CAST(11.23 AS Decimal(18, 2)), CAST(145.99 AS Decimal(18, 2)), N'old clothes')
INSERT [dbo].[RecyclableItem] ([Id], [RecyclableTypeId], [Weight], [ComputedRate], [ItemDescription]) VALUES (17, 14, CAST(36.64 AS Decimal(18, 2)), CAST(512.96 AS Decimal(18, 2)), N'3 damaged wood')
INSERT [dbo].[RecyclableItem] ([Id], [RecyclableTypeId], [Weight], [ComputedRate], [ItemDescription]) VALUES (18, 15, CAST(23.87 AS Decimal(18, 2)), CAST(358.05 AS Decimal(18, 2)), N'2 car batteries')
SET IDENTITY_INSERT [dbo].[RecyclableItem] OFF
GO
SET IDENTITY_INSERT [dbo].[RecyclableType] ON 

INSERT [dbo].[RecyclableType] ([Id], [Type], [Rate], [MinKg], [MaxKg]) VALUES (4, N'Aluminum Cans', CAST(11.50 AS Decimal(18, 2)), CAST(3.00 AS Decimal(18, 2)), CAST(50.00 AS Decimal(18, 2)))
INSERT [dbo].[RecyclableType] ([Id], [Type], [Rate], [MinKg], [MaxKg]) VALUES (5, N'Plastic Bottles', CAST(6.75 AS Decimal(18, 2)), CAST(2.00 AS Decimal(18, 2)), CAST(60.00 AS Decimal(18, 2)))
INSERT [dbo].[RecyclableType] ([Id], [Type], [Rate], [MinKg], [MaxKg]) VALUES (6, N'Cardboard', CAST(3.25 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), CAST(100.00 AS Decimal(18, 2)))
INSERT [dbo].[RecyclableType] ([Id], [Type], [Rate], [MinKg], [MaxKg]) VALUES (7, N'Glass Bottles', CAST(7.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), CAST(150.00 AS Decimal(18, 2)))
INSERT [dbo].[RecyclableType] ([Id], [Type], [Rate], [MinKg], [MaxKg]) VALUES (8, N'Steel Scraps', CAST(12.00 AS Decimal(18, 2)), CAST(3.00 AS Decimal(18, 2)), CAST(80.00 AS Decimal(18, 2)))
INSERT [dbo].[RecyclableType] ([Id], [Type], [Rate], [MinKg], [MaxKg]) VALUES (9, N'Electronic Parts', CAST(15.00 AS Decimal(18, 2)), CAST(0.50 AS Decimal(18, 2)), CAST(20.00 AS Decimal(18, 2)))
INSERT [dbo].[RecyclableType] ([Id], [Type], [Rate], [MinKg], [MaxKg]) VALUES (10, N'Mixed Papers', CAST(2.75 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), CAST(100.00 AS Decimal(18, 2)))
INSERT [dbo].[RecyclableType] ([Id], [Type], [Rate], [MinKg], [MaxKg]) VALUES (11, N'Rubber Tires', CAST(8.50 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), CAST(100.00 AS Decimal(18, 2)))
INSERT [dbo].[RecyclableType] ([Id], [Type], [Rate], [MinKg], [MaxKg]) VALUES (12, N'Copper Wires', CAST(18.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), CAST(30.00 AS Decimal(18, 2)))
INSERT [dbo].[RecyclableType] ([Id], [Type], [Rate], [MinKg], [MaxKg]) VALUES (13, N'Fabric Waste', CAST(4.00 AS Decimal(18, 2)), CAST(2.00 AS Decimal(18, 2)), CAST(70.00 AS Decimal(18, 2)))
INSERT [dbo].[RecyclableType] ([Id], [Type], [Rate], [MinKg], [MaxKg]) VALUES (14, N'Wooden Pallets', CAST(7.75 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), CAST(150.00 AS Decimal(18, 2)))
INSERT [dbo].[RecyclableType] ([Id], [Type], [Rate], [MinKg], [MaxKg]) VALUES (15, N'Lead Acid', CAST(20.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), CAST(50.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[RecyclableType] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Recyclab__F9B8A48B62E39F7D]    Script Date: 12/2/2024 8:44:44 AM ******/
ALTER TABLE [dbo].[RecyclableType] ADD UNIQUE NONCLUSTERED 
(
	[Type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[RecyclableItem]  WITH CHECK ADD FOREIGN KEY([RecyclableTypeId])
REFERENCES [dbo].[RecyclableType] ([Id])
GO
USE [master]
GO
ALTER DATABASE [RecyclableDB] SET  READ_WRITE 
GO
