USE [master]
GO
/****** Object:  Database [GreenSlateDB]    Script Date: 3/4/2020 3:44:05 PM ******/
CREATE DATABASE [GreenSlateDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'GreenSlateDB', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\GreenSlateDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'GreenSlateDB_log', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\GreenSlateDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [GreenSlateDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [GreenSlateDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [GreenSlateDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [GreenSlateDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [GreenSlateDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [GreenSlateDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [GreenSlateDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [GreenSlateDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [GreenSlateDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [GreenSlateDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [GreenSlateDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [GreenSlateDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [GreenSlateDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [GreenSlateDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [GreenSlateDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [GreenSlateDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [GreenSlateDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [GreenSlateDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [GreenSlateDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [GreenSlateDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [GreenSlateDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [GreenSlateDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [GreenSlateDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [GreenSlateDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [GreenSlateDB] SET RECOVERY FULL 
GO
ALTER DATABASE [GreenSlateDB] SET  MULTI_USER 
GO
ALTER DATABASE [GreenSlateDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [GreenSlateDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [GreenSlateDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [GreenSlateDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [GreenSlateDB] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'GreenSlateDB', N'ON'
GO
ALTER DATABASE [GreenSlateDB] SET QUERY_STORE = OFF
GO
USE [GreenSlateDB]
GO
/****** Object:  Table [dbo].[Project]    Script Date: 3/4/2020 3:44:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Project](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
	[Credits] [int] NOT NULL,
 CONSTRAINT [PK_Project] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 3/4/2020 3:44:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserProject]    Script Date: 3/4/2020 3:44:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserProject](
	[UserId] [int] NOT NULL,
	[ProjectId] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[AssignedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_UserProject] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[ProjectId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Project] ON 

INSERT [dbo].[Project] ([Id], [StartDate], [EndDate], [Credits]) VALUES (1, CAST(N'2020-03-03T00:00:00.000' AS DateTime), CAST(N'2020-04-03T00:00:00.000' AS DateTime), 4)
INSERT [dbo].[Project] ([Id], [StartDate], [EndDate], [Credits]) VALUES (2, CAST(N'2020-01-01T00:00:00.000' AS DateTime), CAST(N'2020-01-15T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Project] ([Id], [StartDate], [EndDate], [Credits]) VALUES (3, CAST(N'2020-01-16T00:00:00.000' AS DateTime), CAST(N'2020-01-22T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Project] ([Id], [StartDate], [EndDate], [Credits]) VALUES (4, CAST(N'2019-12-23T00:00:00.000' AS DateTime), CAST(N'2019-12-30T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Project] ([Id], [StartDate], [EndDate], [Credits]) VALUES (5, CAST(N'2019-12-14T00:00:00.000' AS DateTime), CAST(N'2019-12-22T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Project] ([Id], [StartDate], [EndDate], [Credits]) VALUES (6, CAST(N'2019-12-01T00:00:00.000' AS DateTime), CAST(N'2019-12-31T00:00:00.000' AS DateTime), 4)
INSERT [dbo].[Project] ([Id], [StartDate], [EndDate], [Credits]) VALUES (8, CAST(N'2020-01-02T00:00:00.000' AS DateTime), CAST(N'2020-01-15T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Project] ([Id], [StartDate], [EndDate], [Credits]) VALUES (9, CAST(N'2020-01-16T00:00:00.000' AS DateTime), CAST(N'2020-01-23T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Project] ([Id], [StartDate], [EndDate], [Credits]) VALUES (10, CAST(N'2020-01-24T00:00:00.000' AS DateTime), CAST(N'2020-01-31T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Project] ([Id], [StartDate], [EndDate], [Credits]) VALUES (11, CAST(N'2020-02-01T00:00:00.000' AS DateTime), CAST(N'2020-03-15T00:00:00.000' AS DateTime), 6)
INSERT [dbo].[Project] ([Id], [StartDate], [EndDate], [Credits]) VALUES (12, CAST(N'2020-02-16T00:00:00.000' AS DateTime), CAST(N'2020-03-14T00:00:00.000' AS DateTime), 4)
INSERT [dbo].[Project] ([Id], [StartDate], [EndDate], [Credits]) VALUES (13, CAST(N'2020-02-01T00:00:00.000' AS DateTime), CAST(N'2020-02-15T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Project] ([Id], [StartDate], [EndDate], [Credits]) VALUES (15, CAST(N'2020-01-16T00:00:00.000' AS DateTime), CAST(N'2020-01-30T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Project] ([Id], [StartDate], [EndDate], [Credits]) VALUES (16, CAST(N'2020-01-01T00:00:00.000' AS DateTime), CAST(N'2020-01-15T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Project] ([Id], [StartDate], [EndDate], [Credits]) VALUES (17, CAST(N'2019-12-02T00:00:00.000' AS DateTime), CAST(N'2019-12-30T00:00:00.000' AS DateTime), 4)
SET IDENTITY_INSERT [dbo].[Project] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([Id], [FirstName], [LastName]) VALUES (1, N'Armando', N'Ramirez')
INSERT [dbo].[User] ([Id], [FirstName], [LastName]) VALUES (2, N'Jose', N'Perez')
INSERT [dbo].[User] ([Id], [FirstName], [LastName]) VALUES (3, N'Carla', N'Lopez')
SET IDENTITY_INSERT [dbo].[User] OFF
INSERT [dbo].[UserProject] ([UserId], [ProjectId], [IsActive], [AssignedDate]) VALUES (1, 1, 1, CAST(N'2020-03-02T00:00:00.000' AS DateTime))
INSERT [dbo].[UserProject] ([UserId], [ProjectId], [IsActive], [AssignedDate]) VALUES (1, 2, 0, CAST(N'2019-12-31T00:00:00.000' AS DateTime))
INSERT [dbo].[UserProject] ([UserId], [ProjectId], [IsActive], [AssignedDate]) VALUES (1, 3, 0, CAST(N'2020-01-14T00:00:00.000' AS DateTime))
INSERT [dbo].[UserProject] ([UserId], [ProjectId], [IsActive], [AssignedDate]) VALUES (1, 4, 0, CAST(N'2019-12-25T00:00:00.000' AS DateTime))
INSERT [dbo].[UserProject] ([UserId], [ProjectId], [IsActive], [AssignedDate]) VALUES (1, 5, 0, CAST(N'2019-12-15T00:00:00.000' AS DateTime))
INSERT [dbo].[UserProject] ([UserId], [ProjectId], [IsActive], [AssignedDate]) VALUES (2, 6, 0, CAST(N'2019-12-02T00:00:00.000' AS DateTime))
INSERT [dbo].[UserProject] ([UserId], [ProjectId], [IsActive], [AssignedDate]) VALUES (2, 8, 0, CAST(N'2020-01-04T00:00:00.000' AS DateTime))
INSERT [dbo].[UserProject] ([UserId], [ProjectId], [IsActive], [AssignedDate]) VALUES (2, 9, 0, CAST(N'2020-01-17T00:00:00.000' AS DateTime))
INSERT [dbo].[UserProject] ([UserId], [ProjectId], [IsActive], [AssignedDate]) VALUES (2, 10, 0, CAST(N'2020-01-23T00:00:00.000' AS DateTime))
INSERT [dbo].[UserProject] ([UserId], [ProjectId], [IsActive], [AssignedDate]) VALUES (2, 11, 1, CAST(N'2020-01-30T00:00:00.000' AS DateTime))
INSERT [dbo].[UserProject] ([UserId], [ProjectId], [IsActive], [AssignedDate]) VALUES (3, 12, 1, CAST(N'2020-02-15T00:00:00.000' AS DateTime))
INSERT [dbo].[UserProject] ([UserId], [ProjectId], [IsActive], [AssignedDate]) VALUES (3, 13, 0, CAST(N'2020-02-02T00:00:00.000' AS DateTime))
INSERT [dbo].[UserProject] ([UserId], [ProjectId], [IsActive], [AssignedDate]) VALUES (3, 15, 0, CAST(N'2020-01-14T00:00:00.000' AS DateTime))
INSERT [dbo].[UserProject] ([UserId], [ProjectId], [IsActive], [AssignedDate]) VALUES (3, 16, 0, CAST(N'2020-01-02T00:00:00.000' AS DateTime))
INSERT [dbo].[UserProject] ([UserId], [ProjectId], [IsActive], [AssignedDate]) VALUES (3, 17, 0, CAST(N'2019-12-01T00:00:00.000' AS DateTime))
ALTER TABLE [dbo].[UserProject]  WITH CHECK ADD  CONSTRAINT [FK_UserProject_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Project] ([Id])
GO
ALTER TABLE [dbo].[UserProject] CHECK CONSTRAINT [FK_UserProject_Project]
GO
ALTER TABLE [dbo].[UserProject]  WITH CHECK ADD  CONSTRAINT [FK_UserProject_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[UserProject] CHECK CONSTRAINT [FK_UserProject_User]
GO
USE [master]
GO
ALTER DATABASE [GreenSlateDB] SET  READ_WRITE 
GO
