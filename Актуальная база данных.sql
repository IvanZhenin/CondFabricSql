USE [master]
GO
/****** Object:  Database [CondFabric]    Script Date: 21.12.2023 20:47:28 ******/
CREATE DATABASE [CondFabric]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CondFabric', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\CondFabric.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CondFabric_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\CondFabric_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [CondFabric] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CondFabric].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CondFabric] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CondFabric] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CondFabric] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CondFabric] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CondFabric] SET ARITHABORT OFF 
GO
ALTER DATABASE [CondFabric] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [CondFabric] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CondFabric] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CondFabric] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CondFabric] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CondFabric] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CondFabric] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CondFabric] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CondFabric] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CondFabric] SET  ENABLE_BROKER 
GO
ALTER DATABASE [CondFabric] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CondFabric] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CondFabric] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CondFabric] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CondFabric] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CondFabric] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CondFabric] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CondFabric] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CondFabric] SET  MULTI_USER 
GO
ALTER DATABASE [CondFabric] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CondFabric] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CondFabric] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CondFabric] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CondFabric] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CondFabric] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [CondFabric] SET QUERY_STORE = OFF
GO
USE [CondFabric]
GO
/****** Object:  Table [dbo].[Clients]    Script Date: 21.12.2023 20:47:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clients](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](30) NULL,
	[SecondName] [nvarchar](30) NULL,
	[Telephone] [nvarchar](30) NULL,
	[Gender] [nvarchar](30) NULL,
 CONSTRAINT [PK_Clients] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 21.12.2023 20:47:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ClientCode] [int] NULL,
	[WorkerCode] [int] NULL,
	[FinalPrice] [money] NULL,
	[Status] [nvarchar](30) NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 21.12.2023 20:47:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](30) NULL,
	[Price] [money] NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PurchaseProducts]    Script Date: 21.12.2023 20:47:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PurchaseProducts](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[OrderCode] [int] NOT NULL,
	[ProductCode] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_PurchaseProducts] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 21.12.2023 20:47:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](30) NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Workers]    Script Date: 21.12.2023 20:47:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Workers](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](30) NULL,
	[SecondName] [nvarchar](30) NULL,
	[RoleCode] [int] NULL,
	[Login] [nvarchar](30) NULL,
	[Password] [nvarchar](30) NULL,
 CONSTRAINT [PK_Workers] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Clients] ON 

INSERT [dbo].[Clients] ([ID], [Name], [SecondName], [Telephone], [Gender]) VALUES (1, N'Михаил', N'Сергеев', N'7-982-423-32-32', N'Мужской')
INSERT [dbo].[Clients] ([ID], [Name], [SecondName], [Telephone], [Gender]) VALUES (2, N'Григорий', N'Михаилов', N'7-982-423-32-34', N'Мужской')
INSERT [dbo].[Clients] ([ID], [Name], [SecondName], [Telephone], [Gender]) VALUES (3, N'Александр', N'Григорьев', N'7-982-423-32-35', N'Мужской')
INSERT [dbo].[Clients] ([ID], [Name], [SecondName], [Telephone], [Gender]) VALUES (4, N'Марина', N'Леонтьева', N'7-982-423-32-74', N'Женский')
INSERT [dbo].[Clients] ([ID], [Name], [SecondName], [Telephone], [Gender]) VALUES (5, N'Игорь', N'Генадьев', N'7-982-423-32-85', N'Мужской')
INSERT [dbo].[Clients] ([ID], [Name], [SecondName], [Telephone], [Gender]) VALUES (6, N'Григорий', N'Иванов', N'7-943-542-22-11', N'Мужской')
SET IDENTITY_INSERT [dbo].[Clients] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([ID], [ClientCode], [WorkerCode], [FinalPrice], [Status]) VALUES (1, 1, 1, 2080.0000, N'Выполнен')
INSERT [dbo].[Orders] ([ID], [ClientCode], [WorkerCode], [FinalPrice], [Status]) VALUES (2, 2, 2, 3810.0000, N'Выполнен')
INSERT [dbo].[Orders] ([ID], [ClientCode], [WorkerCode], [FinalPrice], [Status]) VALUES (5, 1, 5, 2700.0000, N'Выполнен')
INSERT [dbo].[Orders] ([ID], [ClientCode], [WorkerCode], [FinalPrice], [Status]) VALUES (6, 3, 6, 5000.0000, N'Выполнен')
INSERT [dbo].[Orders] ([ID], [ClientCode], [WorkerCode], [FinalPrice], [Status]) VALUES (7, 4, 5, 4450.0000, N'Выполнен')
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ID], [Name], [Price]) VALUES (1, N'Картошка', 500.0000)
INSERT [dbo].[Products] ([ID], [Name], [Price]) VALUES (2, N'Крем-брюле', 450.0000)
INSERT [dbo].[Products] ([ID], [Name], [Price]) VALUES (3, N'Чизкейк', 550.0000)
INSERT [dbo].[Products] ([ID], [Name], [Price]) VALUES (4, N'Торт', 780.0000)
INSERT [dbo].[Products] ([ID], [Name], [Price]) VALUES (5, N'Мармелад', 520.0000)
INSERT [dbo].[Products] ([ID], [Name], [Price]) VALUES (6, N'Клубничное мороженное', 475.0000)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[PurchaseProducts] ON 

INSERT [dbo].[PurchaseProducts] ([ID], [OrderCode], [ProductCode], [Quantity]) VALUES (1, 1, 2, 4)
INSERT [dbo].[PurchaseProducts] ([ID], [OrderCode], [ProductCode], [Quantity]) VALUES (2, 1, 4, 5)
INSERT [dbo].[PurchaseProducts] ([ID], [OrderCode], [ProductCode], [Quantity]) VALUES (3, 2, 4, 5)
INSERT [dbo].[PurchaseProducts] ([ID], [OrderCode], [ProductCode], [Quantity]) VALUES (4, 5, 2, 7)
INSERT [dbo].[PurchaseProducts] ([ID], [OrderCode], [ProductCode], [Quantity]) VALUES (5, 5, 4, 5)
INSERT [dbo].[PurchaseProducts] ([ID], [OrderCode], [ProductCode], [Quantity]) VALUES (6, 6, 3, 8)
INSERT [dbo].[PurchaseProducts] ([ID], [OrderCode], [ProductCode], [Quantity]) VALUES (7, 6, 5, 8)
INSERT [dbo].[PurchaseProducts] ([ID], [OrderCode], [ProductCode], [Quantity]) VALUES (8, 7, 1, 8)
INSERT [dbo].[PurchaseProducts] ([ID], [OrderCode], [ProductCode], [Quantity]) VALUES (9, 7, 2, 7)
INSERT [dbo].[PurchaseProducts] ([ID], [OrderCode], [ProductCode], [Quantity]) VALUES (10, 5, 2, 6)
INSERT [dbo].[PurchaseProducts] ([ID], [OrderCode], [ProductCode], [Quantity]) VALUES (11, 2, 2, 3)
INSERT [dbo].[PurchaseProducts] ([ID], [OrderCode], [ProductCode], [Quantity]) VALUES (12, 2, 4, 2)
INSERT [dbo].[PurchaseProducts] ([ID], [OrderCode], [ProductCode], [Quantity]) VALUES (13, 6, 3, 5)
INSERT [dbo].[PurchaseProducts] ([ID], [OrderCode], [ProductCode], [Quantity]) VALUES (14, 7, 3, 4)
SET IDENTITY_INSERT [dbo].[PurchaseProducts] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([ID], [Name]) VALUES (1, N'Менеджер')
INSERT [dbo].[Roles] ([ID], [Name]) VALUES (2, N'Администратор')
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[Workers] ON 

INSERT [dbo].[Workers] ([ID], [Name], [SecondName], [RoleCode], [Login], [Password]) VALUES (1, N'Анна', N'Петрова', 1, N'ksdfsdkfo', N'49194111')
INSERT [dbo].[Workers] ([ID], [Name], [SecondName], [RoleCode], [Login], [Password]) VALUES (2, N'Анна', N'Сергеева', 2, N'ksdfsdk44', N'49194199')
INSERT [dbo].[Workers] ([ID], [Name], [SecondName], [RoleCode], [Login], [Password]) VALUES (5, N'Анна', N'Михайлова', 1, N'ksdfsd532', N'49194188')
INSERT [dbo].[Workers] ([ID], [Name], [SecondName], [RoleCode], [Login], [Password]) VALUES (6, N'Анна', N'Григорьева', 2, N'ksdfsdk77', N'49194144')
INSERT [dbo].[Workers] ([ID], [Name], [SecondName], [RoleCode], [Login], [Password]) VALUES (7, N'Григорий', N'Логинов', 2, N'ksdfsdDSA', N'49194142')
SET IDENTITY_INSERT [dbo].[Workers] OFF
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Clients] FOREIGN KEY([ClientCode])
REFERENCES [dbo].[Clients] ([ID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Clients]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Workers] FOREIGN KEY([WorkerCode])
REFERENCES [dbo].[Workers] ([ID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Workers]
GO
ALTER TABLE [dbo].[PurchaseProducts]  WITH CHECK ADD  CONSTRAINT [FK_PurchaseProducts_Orders] FOREIGN KEY([OrderCode])
REFERENCES [dbo].[Orders] ([ID])
GO
ALTER TABLE [dbo].[PurchaseProducts] CHECK CONSTRAINT [FK_PurchaseProducts_Orders]
GO
ALTER TABLE [dbo].[PurchaseProducts]  WITH CHECK ADD  CONSTRAINT [FK_PurchaseProducts_Products] FOREIGN KEY([ProductCode])
REFERENCES [dbo].[Products] ([ID])
GO
ALTER TABLE [dbo].[PurchaseProducts] CHECK CONSTRAINT [FK_PurchaseProducts_Products]
GO
ALTER TABLE [dbo].[Workers]  WITH CHECK ADD  CONSTRAINT [FK_Workers_Roles] FOREIGN KEY([RoleCode])
REFERENCES [dbo].[Roles] ([ID])
GO
ALTER TABLE [dbo].[Workers] CHECK CONSTRAINT [FK_Workers_Roles]
GO
USE [master]
GO
ALTER DATABASE [CondFabric] SET  READ_WRITE 
GO
