USE [master]
GO
/****** Object:  Database [BookStoreManager]    Script Date: 7/18/2022 4:21:01 PM ******/
CREATE DATABASE [BookStoreManager]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BookStoreManager', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.HUUTRI\MSSQL\DATA\BookStoreManager.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BookStoreManager_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.HUUTRI\MSSQL\DATA\BookStoreManager_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [BookStoreManager] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BookStoreManager].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BookStoreManager] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BookStoreManager] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BookStoreManager] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BookStoreManager] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BookStoreManager] SET ARITHABORT OFF 
GO
ALTER DATABASE [BookStoreManager] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [BookStoreManager] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BookStoreManager] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BookStoreManager] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BookStoreManager] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BookStoreManager] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BookStoreManager] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BookStoreManager] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BookStoreManager] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BookStoreManager] SET  ENABLE_BROKER 
GO
ALTER DATABASE [BookStoreManager] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BookStoreManager] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BookStoreManager] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BookStoreManager] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BookStoreManager] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BookStoreManager] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BookStoreManager] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BookStoreManager] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BookStoreManager] SET  MULTI_USER 
GO
ALTER DATABASE [BookStoreManager] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BookStoreManager] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BookStoreManager] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BookStoreManager] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BookStoreManager] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BookStoreManager] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [BookStoreManager] SET QUERY_STORE = OFF
GO
USE [BookStoreManager]
GO
/****** Object:  Table [dbo].[tblAccount]    Script Date: 7/18/2022 4:21:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAccount](
	[username] [varchar](50) NOT NULL,
	[password] [varchar](20) NOT NULL,
	[fullName] [nvarchar](50) NOT NULL,
	[isRole] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblBook]    Script Date: 7/18/2022 4:21:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblBook](
	[bookID] [varchar](50) NOT NULL,
	[bookName] [varchar](100) NOT NULL,
	[imagePath] [varchar](300) NOT NULL,
	[quantity] [int] NOT NULL,
	[price] [decimal](18, 3) NULL,
	[status] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[bookID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOrder]    Script Date: 7/18/2022 4:21:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrder](
	[orderID] [char](6) NOT NULL,
	[purchaseDate] [date] NOT NULL,
	[username] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[orderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOrder_Details]    Script Date: 7/18/2022 4:21:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrder_Details](
	[idOrder_Details] [int] IDENTITY(1,1) NOT NULL,
	[quantity] [int] NOT NULL,
	[totalPrice] [decimal](18, 3) NULL,
	[orderID] [char](6) NOT NULL,
	[bookID] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idOrder_Details] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUser]    Script Date: 7/18/2022 4:21:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUser](
	[userID] [int] IDENTITY(1,1) NOT NULL,
	[address] [nvarchar](200) NULL,
	[birthday] [date] NULL,
	[phoneNumber] [varchar](10) NULL,
	[username] [varchar](50) NOT NULL,
	[gender] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[tblAccount] ([username], [password], [fullName], [isRole]) VALUES (N'admin1', N'12345', N'Admin', 1)
INSERT [dbo].[tblAccount] ([username], [password], [fullName], [isRole]) VALUES (N'thanhnh', N'12345', N'Hữu Thanh', 0)
INSERT [dbo].[tblAccount] ([username], [password], [fullName], [isRole]) VALUES (N'trith', N'12345', N'Hữu Trí', 1)
INSERT [dbo].[tblAccount] ([username], [password], [fullName], [isRole]) VALUES (N'user1', N'12345', N'Hữu Trí', 0)
GO
INSERT [dbo].[tblBook] ([bookID], [bookName], [imagePath], [quantity], [price], [status]) VALUES (N'B001', N'English Grammar in Use Book w Ans', N'english_grammar_in_use_book_w_ans_1_2018_09_19_15_25_47.jpg', 0, CAST(28.000 AS Decimal(18, 3)), 0)
INSERT [dbo].[tblBook] ([bookID], [bookName], [imagePath], [quantity], [price], [status]) VALUES (N'B002', N'Diary of a Wimpy Kid', N'81R2N4PRuUL.jpg', 1, CAST(34.000 AS Decimal(18, 3)), 1)
INSERT [dbo].[tblBook] ([bookID], [bookName], [imagePath], [quantity], [price], [status]) VALUES (N'B003', N'I-learn Smart World 8 SB', N'st8.jpg', 5, CAST(21.000 AS Decimal(18, 3)), 1)
INSERT [dbo].[tblBook] ([bookID], [bookName], [imagePath], [quantity], [price], [status]) VALUES (N'B004', N'Outliers', N'9780141043029_1.jpg', 36, CAST(16.000 AS Decimal(18, 3)), 1)
INSERT [dbo].[tblBook] ([bookID], [bookName], [imagePath], [quantity], [price], [status]) VALUES (N'B005', N'David and Goliath', N'image_140174.jpg', 41, CAST(24.000 AS Decimal(18, 3)), 1)
INSERT [dbo].[tblBook] ([bookID], [bookName], [imagePath], [quantity], [price], [status]) VALUES (N'B006', N'The Travelling Cat Chronicles', N'image_180164_2_48.jpg', 0, CAST(51.000 AS Decimal(18, 3)), 0)
INSERT [dbo].[tblBook] ([bookID], [bookName], [imagePath], [quantity], [price], [status]) VALUES (N'B007', N'The Old Boys', N'image_50930_thanh_ly_1.jpg', 21, CAST(22.000 AS Decimal(18, 3)), 1)
INSERT [dbo].[tblBook] ([bookID], [bookName], [imagePath], [quantity], [price], [status]) VALUES (N'B008', N'The Last Song', N'image_195509_1_22104_thanh_ly_1.jpg', 67, CAST(27.000 AS Decimal(18, 3)), 1)
INSERT [dbo].[tblBook] ([bookID], [bookName], [imagePath], [quantity], [price], [status]) VALUES (N'B009', N'Das Lächeln der Sterne', N'image_135596.jpg', 7, CAST(60.000 AS Decimal(18, 3)), 1)
INSERT [dbo].[tblBook] ([bookID], [bookName], [imagePath], [quantity], [price], [status]) VALUES (N'B010', N'Wo steckst du, Bernadette?', N'image_136291.jpg', 0, CAST(41.000 AS Decimal(18, 3)), 0)
INSERT [dbo].[tblBook] ([bookID], [bookName], [imagePath], [quantity], [price], [status]) VALUES (N'B011', N'True Colours', N'image_217827.jpg', 22, CAST(43.000 AS Decimal(18, 3)), 1)
INSERT [dbo].[tblBook] ([bookID], [bookName], [imagePath], [quantity], [price], [status]) VALUES (N'B012', N'Goulash', N'image_195509_1_26252.jpg', 5, CAST(70.000 AS Decimal(18, 3)), 1)
INSERT [dbo].[tblBook] ([bookID], [bookName], [imagePath], [quantity], [price], [status]) VALUES (N'B013', N'Promise Me, Dad', N'9781509890088_2.jpg', 23, CAST(68.000 AS Decimal(18, 3)), 1)
INSERT [dbo].[tblBook] ([bookID], [bookName], [imagePath], [quantity], [price], [status]) VALUES (N'B014', N'Homo Deus: A Brief History of Tomorrow', N'image_179629.jpg', 14, CAST(98.000 AS Decimal(18, 3)), 1)
INSERT [dbo].[tblBook] ([bookID], [bookName], [imagePath], [quantity], [price], [status]) VALUES (N'B015', N'Freedom at Midnight', N'image_128803.jpg', 0, CAST(65.000 AS Decimal(18, 3)), 0)
INSERT [dbo].[tblBook] ([bookID], [bookName], [imagePath], [quantity], [price], [status]) VALUES (N'B016', N'Meditations', N'image_180164_1_43_1_57_1_4_1_2_1_210_1_29_1_98_1_25_1_21_1_5_1_3_1_18_1_18_1_45_1_26_1_32_1_14_1_3070.jpg', 10, CAST(72.000 AS Decimal(18, 3)), 1)
INSERT [dbo].[tblBook] ([bookID], [bookName], [imagePath], [quantity], [price], [status]) VALUES (N'B017', N'When Breath Becomes Air', N'image_195509_1_33143.jpg', 31, CAST(70.000 AS Decimal(18, 3)), 1)
INSERT [dbo].[tblBook] ([bookID], [bookName], [imagePath], [quantity], [price], [status]) VALUES (N'B018', N'Once More We Saw Stars', N'8934986053090.jpg', 18, CAST(66.000 AS Decimal(18, 3)), 1)
INSERT [dbo].[tblBook] ([bookID], [bookName], [imagePath], [quantity], [price], [status]) VALUES (N'B019', N'Hard Pushed: A Midwife’s Story', N'image_216340.jpg', 12, CAST(81.000 AS Decimal(18, 3)), 1)
INSERT [dbo].[tblBook] ([bookID], [bookName], [imagePath], [quantity], [price], [status]) VALUES (N'B020', N'Educated', N'image_195509_1_33119.jpg', 20, CAST(90.000 AS Decimal(18, 3)), 1)
GO
INSERT [dbo].[tblOrder] ([orderID], [purchaseDate], [username]) VALUES (N'ID0001', CAST(N'2022-07-15' AS Date), N'thanhse')
INSERT [dbo].[tblOrder] ([orderID], [purchaseDate], [username]) VALUES (N'ID0002', CAST(N'2022-07-18' AS Date), N'trith')
GO
SET IDENTITY_INSERT [dbo].[tblOrder_Details] ON 

INSERT [dbo].[tblOrder_Details] ([idOrder_Details], [quantity], [totalPrice], [orderID], [bookID]) VALUES (40, 5, CAST(110.000 AS Decimal(18, 3)), N'ID0001', N'B007')
INSERT [dbo].[tblOrder_Details] ([idOrder_Details], [quantity], [totalPrice], [orderID], [bookID]) VALUES (41, 5, CAST(450.000 AS Decimal(18, 3)), N'ID0001', N'B020')
INSERT [dbo].[tblOrder_Details] ([idOrder_Details], [quantity], [totalPrice], [orderID], [bookID]) VALUES (42, 20, CAST(560.000 AS Decimal(18, 3)), N'ID0002', N'B001')
SET IDENTITY_INSERT [dbo].[tblOrder_Details] OFF
GO
SET IDENTITY_INSERT [dbo].[tblUser] ON 

INSERT [dbo].[tblUser] ([userID], [address], [birthday], [phoneNumber], [username], [gender]) VALUES (1, N'26 Duong 12c', CAST(N'2001-05-27' AS Date), N'0326549533', N'thanhnh', 1)
INSERT [dbo].[tblUser] ([userID], [address], [birthday], [phoneNumber], [username], [gender]) VALUES (7, N'77/7', CAST(N'2001-04-13' AS Date), N'0328595889', N'trith', 1)
INSERT [dbo].[tblUser] ([userID], [address], [birthday], [phoneNumber], [username], [gender]) VALUES (10, N'123abc', CAST(N'2001-05-27' AS Date), N'0326549533', N'thanhnhse151252', 1)
SET IDENTITY_INSERT [dbo].[tblUser] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__tblUser__F3DBC5727E6F26B6]    Script Date: 7/18/2022 4:21:01 PM ******/
ALTER TABLE [dbo].[tblUser] ADD UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblOrder]  WITH CHECK ADD  CONSTRAINT [FK_ORDER_ACCOUNT] FOREIGN KEY([username])
REFERENCES [dbo].[tblAccount] ([username])
GO
ALTER TABLE [dbo].[tblOrder] CHECK CONSTRAINT [FK_ORDER_ACCOUNT]
GO
ALTER TABLE [dbo].[tblOrder_Details]  WITH CHECK ADD  CONSTRAINT [FK_ORDER_DETAILS_BOOK] FOREIGN KEY([bookID])
REFERENCES [dbo].[tblBook] ([bookID])
GO
ALTER TABLE [dbo].[tblOrder_Details] CHECK CONSTRAINT [FK_ORDER_DETAILS_BOOK]
GO
ALTER TABLE [dbo].[tblOrder_Details]  WITH CHECK ADD  CONSTRAINT [FK_ORDER_DETAILS_ORDERS] FOREIGN KEY([orderID])
REFERENCES [dbo].[tblOrder] ([orderID])
GO
ALTER TABLE [dbo].[tblOrder_Details] CHECK CONSTRAINT [FK_ORDER_DETAILS_ORDERS]
GO
ALTER TABLE [dbo].[tblUser]  WITH CHECK ADD  CONSTRAINT [FK_USER_ACCOUNT] FOREIGN KEY([username])
REFERENCES [dbo].[tblAccount] ([username])
GO
ALTER TABLE [dbo].[tblUser] CHECK CONSTRAINT [FK_USER_ACCOUNT]
GO
USE [master]
GO
ALTER DATABASE [BookStoreManager] SET  READ_WRITE 
GO
