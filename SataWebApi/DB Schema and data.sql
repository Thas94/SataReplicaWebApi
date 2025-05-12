USE [master]
GO
/****** Object:  Database [SataReplicaDB]    Script Date: 5/12/2025 10:08:38 PM ******/
CREATE DATABASE [SataReplicaDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SataReplicaDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\SataReplicaDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SataReplicaDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\SataReplicaDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [SataReplicaDB] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SataReplicaDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SataReplicaDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SataReplicaDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SataReplicaDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SataReplicaDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SataReplicaDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [SataReplicaDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SataReplicaDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SataReplicaDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SataReplicaDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SataReplicaDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SataReplicaDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SataReplicaDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SataReplicaDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SataReplicaDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SataReplicaDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SataReplicaDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SataReplicaDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SataReplicaDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SataReplicaDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SataReplicaDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SataReplicaDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SataReplicaDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SataReplicaDB] SET RECOVERY FULL 
GO
ALTER DATABASE [SataReplicaDB] SET  MULTI_USER 
GO
ALTER DATABASE [SataReplicaDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SataReplicaDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SataReplicaDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SataReplicaDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SataReplicaDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SataReplicaDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'SataReplicaDB', N'ON'
GO
ALTER DATABASE [SataReplicaDB] SET QUERY_STORE = ON
GO
ALTER DATABASE [SataReplicaDB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [SataReplicaDB]
GO
/****** Object:  Table [dbo].[AgendaDays]    Script Date: 5/12/2025 10:08:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AgendaDays](
	[DayId] [int] IDENTITY(1,1) NOT NULL,
	[Date] [datetime] NULL,
	[TextStyle] [nvarchar](250) NULL,
 CONSTRAINT [PK_AgendaDays] PRIMARY KEY CLUSTERED 
(
	[DayId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AgendaLinks]    Script Date: 5/12/2025 10:08:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AgendaLinks](
	[AgendaLinkId] [int] IDENTITY(1,1) NOT NULL,
	[AgendaId] [int] NULL,
	[SpeakerId] [int] NULL,
	[FacilitatorId] [int] NULL,
	[PanelMemberId] [int] NULL,
 CONSTRAINT [PK_AgendaLinkss] PRIMARY KEY CLUSTERED 
(
	[AgendaLinkId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Agendas]    Script Date: 5/12/2025 10:08:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Agendas](
	[AgendaId] [int] IDENTITY(1,1) NOT NULL,
	[AgendaDayId] [int] NOT NULL,
	[AgendaTopicId] [int] NOT NULL,
	[StartTime] [nvarchar](50) NOT NULL,
	[EndTime] [nvarchar](50) NOT NULL,
	[HasSpeakers] [bit] NULL,
	[HasFacilitators] [bit] NULL,
	[HasPanelMembers] [bit] NULL,
 CONSTRAINT [PK_Agendas] PRIMARY KEY CLUSTERED 
(
	[AgendaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AgendaTopics]    Script Date: 5/12/2025 10:08:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AgendaTopics](
	[AgendaTopicId] [int] IDENTITY(1,1) NOT NULL,
	[AgendaTopic] [nvarchar](250) NULL,
 CONSTRAINT [PK_AgendaTopics] PRIMARY KEY CLUSTERED 
(
	[AgendaTopicId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Facilitators]    Script Date: 5/12/2025 10:08:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Facilitators](
	[FacilitatorId] [int] IDENTITY(1,1) NOT NULL,
	[FacilitatorName] [nvarchar](250) NULL,
 CONSTRAINT [PK_Facilitators] PRIMARY KEY CLUSTERED 
(
	[FacilitatorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PanelMembers]    Script Date: 5/12/2025 10:08:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PanelMembers](
	[PanelMemberId] [int] IDENTITY(1,1) NOT NULL,
	[PanelMemberName] [nvarchar](250) NULL,
 CONSTRAINT [PK_PanelMembers] PRIMARY KEY CLUSTERED 
(
	[PanelMemberId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Speakers]    Script Date: 5/12/2025 10:08:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Speakers](
	[SpeakerId] [int] IDENTITY(1,1) NOT NULL,
	[SpeakerName] [nvarchar](250) NULL,
 CONSTRAINT [PK_Speakers] PRIMARY KEY CLUSTERED 
(
	[SpeakerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[AgendaDays] ON 
GO
INSERT [dbo].[AgendaDays] ([DayId], [Date], [TextStyle]) VALUES (1, CAST(N'2025-05-12T21:42:20.680' AS DateTime), N'md:text-xl text-white')
GO
INSERT [dbo].[AgendaDays] ([DayId], [Date], [TextStyle]) VALUES (2, CAST(N'2025-05-13T21:42:20.680' AS DateTime), N'md:text-xl text-white')
GO
INSERT [dbo].[AgendaDays] ([DayId], [Date], [TextStyle]) VALUES (3, CAST(N'2025-05-14T21:42:20.680' AS DateTime), N'md:text-xl text-white')
GO
SET IDENTITY_INSERT [dbo].[AgendaDays] OFF
GO
SET IDENTITY_INSERT [dbo].[AgendaLinks] ON 
GO
INSERT [dbo].[AgendaLinks] ([AgendaLinkId], [AgendaId], [SpeakerId], [FacilitatorId], [PanelMemberId]) VALUES (1, 2, 1, NULL, NULL)
GO
INSERT [dbo].[AgendaLinks] ([AgendaLinkId], [AgendaId], [SpeakerId], [FacilitatorId], [PanelMemberId]) VALUES (2, 3, 2, NULL, NULL)
GO
INSERT [dbo].[AgendaLinks] ([AgendaLinkId], [AgendaId], [SpeakerId], [FacilitatorId], [PanelMemberId]) VALUES (3, 4, 3, NULL, NULL)
GO
INSERT [dbo].[AgendaLinks] ([AgendaLinkId], [AgendaId], [SpeakerId], [FacilitatorId], [PanelMemberId]) VALUES (4, 5, 4, NULL, NULL)
GO
INSERT [dbo].[AgendaLinks] ([AgendaLinkId], [AgendaId], [SpeakerId], [FacilitatorId], [PanelMemberId]) VALUES (5, 7, 5, NULL, NULL)
GO
INSERT [dbo].[AgendaLinks] ([AgendaLinkId], [AgendaId], [SpeakerId], [FacilitatorId], [PanelMemberId]) VALUES (6, 8, 6, NULL, NULL)
GO
INSERT [dbo].[AgendaLinks] ([AgendaLinkId], [AgendaId], [SpeakerId], [FacilitatorId], [PanelMemberId]) VALUES (7, 9, 7, NULL, NULL)
GO
INSERT [dbo].[AgendaLinks] ([AgendaLinkId], [AgendaId], [SpeakerId], [FacilitatorId], [PanelMemberId]) VALUES (8, 9, 3, NULL, NULL)
GO
INSERT [dbo].[AgendaLinks] ([AgendaLinkId], [AgendaId], [SpeakerId], [FacilitatorId], [PanelMemberId]) VALUES (9, 9, 2, NULL, NULL)
GO
INSERT [dbo].[AgendaLinks] ([AgendaLinkId], [AgendaId], [SpeakerId], [FacilitatorId], [PanelMemberId]) VALUES (10, 9, 5, NULL, NULL)
GO
INSERT [dbo].[AgendaLinks] ([AgendaLinkId], [AgendaId], [SpeakerId], [FacilitatorId], [PanelMemberId]) VALUES (11, 9, 6, NULL, NULL)
GO
INSERT [dbo].[AgendaLinks] ([AgendaLinkId], [AgendaId], [SpeakerId], [FacilitatorId], [PanelMemberId]) VALUES (12, 14, NULL, 1, NULL)
GO
INSERT [dbo].[AgendaLinks] ([AgendaLinkId], [AgendaId], [SpeakerId], [FacilitatorId], [PanelMemberId]) VALUES (13, 14, NULL, 2, NULL)
GO
INSERT [dbo].[AgendaLinks] ([AgendaLinkId], [AgendaId], [SpeakerId], [FacilitatorId], [PanelMemberId]) VALUES (14, 14, NULL, NULL, 1)
GO
INSERT [dbo].[AgendaLinks] ([AgendaLinkId], [AgendaId], [SpeakerId], [FacilitatorId], [PanelMemberId]) VALUES (15, 14, NULL, NULL, 2)
GO
INSERT [dbo].[AgendaLinks] ([AgendaLinkId], [AgendaId], [SpeakerId], [FacilitatorId], [PanelMemberId]) VALUES (16, 14, NULL, NULL, 3)
GO
INSERT [dbo].[AgendaLinks] ([AgendaLinkId], [AgendaId], [SpeakerId], [FacilitatorId], [PanelMemberId]) VALUES (17, 14, NULL, NULL, 4)
GO
INSERT [dbo].[AgendaLinks] ([AgendaLinkId], [AgendaId], [SpeakerId], [FacilitatorId], [PanelMemberId]) VALUES (18, 14, NULL, NULL, 5)
GO
INSERT [dbo].[AgendaLinks] ([AgendaLinkId], [AgendaId], [SpeakerId], [FacilitatorId], [PanelMemberId]) VALUES (19, 17, 2, NULL, NULL)
GO
INSERT [dbo].[AgendaLinks] ([AgendaLinkId], [AgendaId], [SpeakerId], [FacilitatorId], [PanelMemberId]) VALUES (20, 21, 8, NULL, NULL)
GO
INSERT [dbo].[AgendaLinks] ([AgendaLinkId], [AgendaId], [SpeakerId], [FacilitatorId], [PanelMemberId]) VALUES (21, 23, 9, NULL, NULL)
GO
INSERT [dbo].[AgendaLinks] ([AgendaLinkId], [AgendaId], [SpeakerId], [FacilitatorId], [PanelMemberId]) VALUES (22, 24, 1, NULL, NULL)
GO
INSERT [dbo].[AgendaLinks] ([AgendaLinkId], [AgendaId], [SpeakerId], [FacilitatorId], [PanelMemberId]) VALUES (23, 27, 10, NULL, NULL)
GO
INSERT [dbo].[AgendaLinks] ([AgendaLinkId], [AgendaId], [SpeakerId], [FacilitatorId], [PanelMemberId]) VALUES (24, 29, 1, NULL, NULL)
GO
INSERT [dbo].[AgendaLinks] ([AgendaLinkId], [AgendaId], [SpeakerId], [FacilitatorId], [PanelMemberId]) VALUES (25, 30, 11, NULL, NULL)
GO
INSERT [dbo].[AgendaLinks] ([AgendaLinkId], [AgendaId], [SpeakerId], [FacilitatorId], [PanelMemberId]) VALUES (29, 32, 2, NULL, NULL)
GO
INSERT [dbo].[AgendaLinks] ([AgendaLinkId], [AgendaId], [SpeakerId], [FacilitatorId], [PanelMemberId]) VALUES (30, 34, 12, NULL, NULL)
GO
INSERT [dbo].[AgendaLinks] ([AgendaLinkId], [AgendaId], [SpeakerId], [FacilitatorId], [PanelMemberId]) VALUES (31, 35, 13, NULL, NULL)
GO
INSERT [dbo].[AgendaLinks] ([AgendaLinkId], [AgendaId], [SpeakerId], [FacilitatorId], [PanelMemberId]) VALUES (32, 36, NULL, 3, NULL)
GO
INSERT [dbo].[AgendaLinks] ([AgendaLinkId], [AgendaId], [SpeakerId], [FacilitatorId], [PanelMemberId]) VALUES (33, 36, NULL, NULL, 6)
GO
INSERT [dbo].[AgendaLinks] ([AgendaLinkId], [AgendaId], [SpeakerId], [FacilitatorId], [PanelMemberId]) VALUES (34, 36, NULL, NULL, 7)
GO
INSERT [dbo].[AgendaLinks] ([AgendaLinkId], [AgendaId], [SpeakerId], [FacilitatorId], [PanelMemberId]) VALUES (35, 36, NULL, NULL, 8)
GO
INSERT [dbo].[AgendaLinks] ([AgendaLinkId], [AgendaId], [SpeakerId], [FacilitatorId], [PanelMemberId]) VALUES (36, 36, NULL, NULL, 9)
GO
INSERT [dbo].[AgendaLinks] ([AgendaLinkId], [AgendaId], [SpeakerId], [FacilitatorId], [PanelMemberId]) VALUES (37, 36, NULL, NULL, 5)
GO
INSERT [dbo].[AgendaLinks] ([AgendaLinkId], [AgendaId], [SpeakerId], [FacilitatorId], [PanelMemberId]) VALUES (38, 39, 14, NULL, NULL)
GO
INSERT [dbo].[AgendaLinks] ([AgendaLinkId], [AgendaId], [SpeakerId], [FacilitatorId], [PanelMemberId]) VALUES (39, 40, 15, NULL, NULL)
GO
INSERT [dbo].[AgendaLinks] ([AgendaLinkId], [AgendaId], [SpeakerId], [FacilitatorId], [PanelMemberId]) VALUES (40, 41, 16, NULL, NULL)
GO
INSERT [dbo].[AgendaLinks] ([AgendaLinkId], [AgendaId], [SpeakerId], [FacilitatorId], [PanelMemberId]) VALUES (41, 42, 1, NULL, NULL)
GO
INSERT [dbo].[AgendaLinks] ([AgendaLinkId], [AgendaId], [SpeakerId], [FacilitatorId], [PanelMemberId]) VALUES (42, 46, 17, NULL, NULL)
GO
INSERT [dbo].[AgendaLinks] ([AgendaLinkId], [AgendaId], [SpeakerId], [FacilitatorId], [PanelMemberId]) VALUES (43, 49, 1, NULL, NULL)
GO
INSERT [dbo].[AgendaLinks] ([AgendaLinkId], [AgendaId], [SpeakerId], [FacilitatorId], [PanelMemberId]) VALUES (44, 50, 2, NULL, NULL)
GO
INSERT [dbo].[AgendaLinks] ([AgendaLinkId], [AgendaId], [SpeakerId], [FacilitatorId], [PanelMemberId]) VALUES (45, 51, 5, NULL, NULL)
GO
INSERT [dbo].[AgendaLinks] ([AgendaLinkId], [AgendaId], [SpeakerId], [FacilitatorId], [PanelMemberId]) VALUES (46, 52, 2, NULL, NULL)
GO
INSERT [dbo].[AgendaLinks] ([AgendaLinkId], [AgendaId], [SpeakerId], [FacilitatorId], [PanelMemberId]) VALUES (47, 52, 5, NULL, NULL)
GO
INSERT [dbo].[AgendaLinks] ([AgendaLinkId], [AgendaId], [SpeakerId], [FacilitatorId], [PanelMemberId]) VALUES (48, 52, 18, NULL, NULL)
GO
INSERT [dbo].[AgendaLinks] ([AgendaLinkId], [AgendaId], [SpeakerId], [FacilitatorId], [PanelMemberId]) VALUES (49, 55, NULL, 1, NULL)
GO
INSERT [dbo].[AgendaLinks] ([AgendaLinkId], [AgendaId], [SpeakerId], [FacilitatorId], [PanelMemberId]) VALUES (50, 56, 18, NULL, NULL)
GO
INSERT [dbo].[AgendaLinks] ([AgendaLinkId], [AgendaId], [SpeakerId], [FacilitatorId], [PanelMemberId]) VALUES (51, 59, 19, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[AgendaLinks] OFF
GO
SET IDENTITY_INSERT [dbo].[Agendas] ON 
GO
INSERT [dbo].[Agendas] ([AgendaId], [AgendaDayId], [AgendaTopicId], [StartTime], [EndTime], [HasSpeakers], [HasFacilitators], [HasPanelMembers]) VALUES (1, 1, 1, N'8:00', N'9:00', NULL, NULL, NULL)
GO
INSERT [dbo].[Agendas] ([AgendaId], [AgendaDayId], [AgendaTopicId], [StartTime], [EndTime], [HasSpeakers], [HasFacilitators], [HasPanelMembers]) VALUES (2, 1, 2, N'9:00', N'9:05', 1, NULL, NULL)
GO
INSERT [dbo].[Agendas] ([AgendaId], [AgendaDayId], [AgendaTopicId], [StartTime], [EndTime], [HasSpeakers], [HasFacilitators], [HasPanelMembers]) VALUES (3, 1, 3, N'9:05', N'9:10', 1, NULL, NULL)
GO
INSERT [dbo].[Agendas] ([AgendaId], [AgendaDayId], [AgendaTopicId], [StartTime], [EndTime], [HasSpeakers], [HasFacilitators], [HasPanelMembers]) VALUES (4, 1, 4, N'9:10', N'9:15', 1, NULL, NULL)
GO
INSERT [dbo].[Agendas] ([AgendaId], [AgendaDayId], [AgendaTopicId], [StartTime], [EndTime], [HasSpeakers], [HasFacilitators], [HasPanelMembers]) VALUES (5, 1, 5, N'9:15', N'9:45', 1, NULL, NULL)
GO
INSERT [dbo].[Agendas] ([AgendaId], [AgendaDayId], [AgendaTopicId], [StartTime], [EndTime], [HasSpeakers], [HasFacilitators], [HasPanelMembers]) VALUES (7, 1, 6, N'9:45', N'10:00', 1, NULL, NULL)
GO
INSERT [dbo].[Agendas] ([AgendaId], [AgendaDayId], [AgendaTopicId], [StartTime], [EndTime], [HasSpeakers], [HasFacilitators], [HasPanelMembers]) VALUES (8, 1, 7, N'10:00', N'10:10', 1, NULL, NULL)
GO
INSERT [dbo].[Agendas] ([AgendaId], [AgendaDayId], [AgendaTopicId], [StartTime], [EndTime], [HasSpeakers], [HasFacilitators], [HasPanelMembers]) VALUES (9, 1, 8, N'10:10', N'10:20', 1, NULL, NULL)
GO
INSERT [dbo].[Agendas] ([AgendaId], [AgendaDayId], [AgendaTopicId], [StartTime], [EndTime], [HasSpeakers], [HasFacilitators], [HasPanelMembers]) VALUES (11, 1, 9, N'10:20', N'10:40', NULL, NULL, NULL)
GO
INSERT [dbo].[Agendas] ([AgendaId], [AgendaDayId], [AgendaTopicId], [StartTime], [EndTime], [HasSpeakers], [HasFacilitators], [HasPanelMembers]) VALUES (13, 1, 10, N'10:20', N'10:40', NULL, NULL, NULL)
GO
INSERT [dbo].[Agendas] ([AgendaId], [AgendaDayId], [AgendaTopicId], [StartTime], [EndTime], [HasSpeakers], [HasFacilitators], [HasPanelMembers]) VALUES (14, 1, 11, N'10:40', N'11:30', NULL, 1, 1)
GO
INSERT [dbo].[Agendas] ([AgendaId], [AgendaDayId], [AgendaTopicId], [StartTime], [EndTime], [HasSpeakers], [HasFacilitators], [HasPanelMembers]) VALUES (16, 1, 12, N'11:30', N'11:35', NULL, NULL, NULL)
GO
INSERT [dbo].[Agendas] ([AgendaId], [AgendaDayId], [AgendaTopicId], [StartTime], [EndTime], [HasSpeakers], [HasFacilitators], [HasPanelMembers]) VALUES (17, 1, 13, N'11:35', N'12:20', 1, NULL, NULL)
GO
INSERT [dbo].[Agendas] ([AgendaId], [AgendaDayId], [AgendaTopicId], [StartTime], [EndTime], [HasSpeakers], [HasFacilitators], [HasPanelMembers]) VALUES (21, 1, 14, N'12:20', N'13:00', 1, NULL, NULL)
GO
INSERT [dbo].[Agendas] ([AgendaId], [AgendaDayId], [AgendaTopicId], [StartTime], [EndTime], [HasSpeakers], [HasFacilitators], [HasPanelMembers]) VALUES (22, 1, 15, N'13:00', N'14:05', NULL, NULL, NULL)
GO
INSERT [dbo].[Agendas] ([AgendaId], [AgendaDayId], [AgendaTopicId], [StartTime], [EndTime], [HasSpeakers], [HasFacilitators], [HasPanelMembers]) VALUES (23, 1, 16, N'14:05', N'15:05', 1, NULL, NULL)
GO
INSERT [dbo].[Agendas] ([AgendaId], [AgendaDayId], [AgendaTopicId], [StartTime], [EndTime], [HasSpeakers], [HasFacilitators], [HasPanelMembers]) VALUES (24, 1, 17, N'15:05', N'15:15', 1, NULL, NULL)
GO
INSERT [dbo].[Agendas] ([AgendaId], [AgendaDayId], [AgendaTopicId], [StartTime], [EndTime], [HasSpeakers], [HasFacilitators], [HasPanelMembers]) VALUES (25, 1, 10, N'15:15', N'16:00', NULL, NULL, NULL)
GO
INSERT [dbo].[Agendas] ([AgendaId], [AgendaDayId], [AgendaTopicId], [StartTime], [EndTime], [HasSpeakers], [HasFacilitators], [HasPanelMembers]) VALUES (26, 1, 18, N'16:00', N'17:30', NULL, NULL, NULL)
GO
INSERT [dbo].[Agendas] ([AgendaId], [AgendaDayId], [AgendaTopicId], [StartTime], [EndTime], [HasSpeakers], [HasFacilitators], [HasPanelMembers]) VALUES (27, 1, 19, N'17:30', N'21:00', 1, NULL, NULL)
GO
INSERT [dbo].[Agendas] ([AgendaId], [AgendaDayId], [AgendaTopicId], [StartTime], [EndTime], [HasSpeakers], [HasFacilitators], [HasPanelMembers]) VALUES (28, 2, 20, N'8:00', N'9:00', NULL, NULL, NULL)
GO
INSERT [dbo].[Agendas] ([AgendaId], [AgendaDayId], [AgendaTopicId], [StartTime], [EndTime], [HasSpeakers], [HasFacilitators], [HasPanelMembers]) VALUES (29, 2, 2, N'9:00', N'9:05', 1, NULL, NULL)
GO
INSERT [dbo].[Agendas] ([AgendaId], [AgendaDayId], [AgendaTopicId], [StartTime], [EndTime], [HasSpeakers], [HasFacilitators], [HasPanelMembers]) VALUES (30, 2, 21, N'9:05', N'10:05', 1, NULL, NULL)
GO
INSERT [dbo].[Agendas] ([AgendaId], [AgendaDayId], [AgendaTopicId], [StartTime], [EndTime], [HasSpeakers], [HasFacilitators], [HasPanelMembers]) VALUES (32, 2, 22, N'10:05', N'10:30', 1, NULL, NULL)
GO
INSERT [dbo].[Agendas] ([AgendaId], [AgendaDayId], [AgendaTopicId], [StartTime], [EndTime], [HasSpeakers], [HasFacilitators], [HasPanelMembers]) VALUES (33, 2, 10, N'10:30', N'11:00', NULL, NULL, NULL)
GO
INSERT [dbo].[Agendas] ([AgendaId], [AgendaDayId], [AgendaTopicId], [StartTime], [EndTime], [HasSpeakers], [HasFacilitators], [HasPanelMembers]) VALUES (34, 2, 23, N'11:00', N'11:30', 1, NULL, NULL)
GO
INSERT [dbo].[Agendas] ([AgendaId], [AgendaDayId], [AgendaTopicId], [StartTime], [EndTime], [HasSpeakers], [HasFacilitators], [HasPanelMembers]) VALUES (35, 2, 24, N'11:30', N'12:00', 1, NULL, NULL)
GO
INSERT [dbo].[Agendas] ([AgendaId], [AgendaDayId], [AgendaTopicId], [StartTime], [EndTime], [HasSpeakers], [HasFacilitators], [HasPanelMembers]) VALUES (36, 2, 25, N'12:00', N'13:00', NULL, 1, 1)
GO
INSERT [dbo].[Agendas] ([AgendaId], [AgendaDayId], [AgendaTopicId], [StartTime], [EndTime], [HasSpeakers], [HasFacilitators], [HasPanelMembers]) VALUES (37, 2, 15, N'13:00', N'14:00', NULL, NULL, NULL)
GO
INSERT [dbo].[Agendas] ([AgendaId], [AgendaDayId], [AgendaTopicId], [StartTime], [EndTime], [HasSpeakers], [HasFacilitators], [HasPanelMembers]) VALUES (39, 2, 26, N'14:00', N'14:30', 1, NULL, NULL)
GO
INSERT [dbo].[Agendas] ([AgendaId], [AgendaDayId], [AgendaTopicId], [StartTime], [EndTime], [HasSpeakers], [HasFacilitators], [HasPanelMembers]) VALUES (40, 2, 27, N'14:30', N'15:00', 1, NULL, NULL)
GO
INSERT [dbo].[Agendas] ([AgendaId], [AgendaDayId], [AgendaTopicId], [StartTime], [EndTime], [HasSpeakers], [HasFacilitators], [HasPanelMembers]) VALUES (41, 2, 28, N'15:00', N'15:30', 1, NULL, NULL)
GO
INSERT [dbo].[Agendas] ([AgendaId], [AgendaDayId], [AgendaTopicId], [StartTime], [EndTime], [HasSpeakers], [HasFacilitators], [HasPanelMembers]) VALUES (42, 2, 29, N'15:30', N'15:35', 1, NULL, NULL)
GO
INSERT [dbo].[Agendas] ([AgendaId], [AgendaDayId], [AgendaTopicId], [StartTime], [EndTime], [HasSpeakers], [HasFacilitators], [HasPanelMembers]) VALUES (43, 2, 10, N'15:35', N'16:00', NULL, NULL, NULL)
GO
INSERT [dbo].[Agendas] ([AgendaId], [AgendaDayId], [AgendaTopicId], [StartTime], [EndTime], [HasSpeakers], [HasFacilitators], [HasPanelMembers]) VALUES (44, 2, 18, N'16:00', N'17:30', NULL, NULL, NULL)
GO
INSERT [dbo].[Agendas] ([AgendaId], [AgendaDayId], [AgendaTopicId], [StartTime], [EndTime], [HasSpeakers], [HasFacilitators], [HasPanelMembers]) VALUES (45, 2, 30, N'17:30', N'18:00', NULL, NULL, NULL)
GO
INSERT [dbo].[Agendas] ([AgendaId], [AgendaDayId], [AgendaTopicId], [StartTime], [EndTime], [HasSpeakers], [HasFacilitators], [HasPanelMembers]) VALUES (46, 2, 31, N'18:00', N'21:30', 1, NULL, NULL)
GO
INSERT [dbo].[Agendas] ([AgendaId], [AgendaDayId], [AgendaTopicId], [StartTime], [EndTime], [HasSpeakers], [HasFacilitators], [HasPanelMembers]) VALUES (47, 2, 32, N'21:30', N'22:00', NULL, NULL, NULL)
GO
INSERT [dbo].[Agendas] ([AgendaId], [AgendaDayId], [AgendaTopicId], [StartTime], [EndTime], [HasSpeakers], [HasFacilitators], [HasPanelMembers]) VALUES (48, 3, 20, N'8:00', N'9:00', NULL, NULL, NULL)
GO
INSERT [dbo].[Agendas] ([AgendaId], [AgendaDayId], [AgendaTopicId], [StartTime], [EndTime], [HasSpeakers], [HasFacilitators], [HasPanelMembers]) VALUES (49, 3, 2, N'9:00', N'9:05', 1, NULL, NULL)
GO
INSERT [dbo].[Agendas] ([AgendaId], [AgendaDayId], [AgendaTopicId], [StartTime], [EndTime], [HasSpeakers], [HasFacilitators], [HasPanelMembers]) VALUES (50, 3, 33, N'9:05', N'9:30', 1, NULL, NULL)
GO
INSERT [dbo].[Agendas] ([AgendaId], [AgendaDayId], [AgendaTopicId], [StartTime], [EndTime], [HasSpeakers], [HasFacilitators], [HasPanelMembers]) VALUES (51, 3, 33, N'9:30', N'10:30', 1, NULL, NULL)
GO
INSERT [dbo].[Agendas] ([AgendaId], [AgendaDayId], [AgendaTopicId], [StartTime], [EndTime], [HasSpeakers], [HasFacilitators], [HasPanelMembers]) VALUES (52, 3, 33, N'10:30', N'10:40', 1, NULL, NULL)
GO
INSERT [dbo].[Agendas] ([AgendaId], [AgendaDayId], [AgendaTopicId], [StartTime], [EndTime], [HasSpeakers], [HasFacilitators], [HasPanelMembers]) VALUES (53, 3, 34, N'10:40', N'11:00', NULL, NULL, NULL)
GO
INSERT [dbo].[Agendas] ([AgendaId], [AgendaDayId], [AgendaTopicId], [StartTime], [EndTime], [HasSpeakers], [HasFacilitators], [HasPanelMembers]) VALUES (54, 3, 10, N'10:40', N'11:00', NULL, NULL, NULL)
GO
INSERT [dbo].[Agendas] ([AgendaId], [AgendaDayId], [AgendaTopicId], [StartTime], [EndTime], [HasSpeakers], [HasFacilitators], [HasPanelMembers]) VALUES (55, 3, 35, N'11:00', N'11:30', NULL, 1, NULL)
GO
INSERT [dbo].[Agendas] ([AgendaId], [AgendaDayId], [AgendaTopicId], [StartTime], [EndTime], [HasSpeakers], [HasFacilitators], [HasPanelMembers]) VALUES (56, 3, 36, N'11:30', N'11:40', 1, NULL, NULL)
GO
INSERT [dbo].[Agendas] ([AgendaId], [AgendaDayId], [AgendaTopicId], [StartTime], [EndTime], [HasSpeakers], [HasFacilitators], [HasPanelMembers]) VALUES (57, 3, 37, N'11:40', N'12:00', NULL, NULL, NULL)
GO
INSERT [dbo].[Agendas] ([AgendaId], [AgendaDayId], [AgendaTopicId], [StartTime], [EndTime], [HasSpeakers], [HasFacilitators], [HasPanelMembers]) VALUES (58, 3, 15, N'12:00', N'13:00', NULL, NULL, NULL)
GO
INSERT [dbo].[Agendas] ([AgendaId], [AgendaDayId], [AgendaTopicId], [StartTime], [EndTime], [HasSpeakers], [HasFacilitators], [HasPanelMembers]) VALUES (59, 3, 38, N'13:00', N'15:00', 1, NULL, NULL)
GO
INSERT [dbo].[Agendas] ([AgendaId], [AgendaDayId], [AgendaTopicId], [StartTime], [EndTime], [HasSpeakers], [HasFacilitators], [HasPanelMembers]) VALUES (61, 3, 39, N'15:00', N'16:00', NULL, NULL, NULL)
GO
INSERT [dbo].[Agendas] ([AgendaId], [AgendaDayId], [AgendaTopicId], [StartTime], [EndTime], [HasSpeakers], [HasFacilitators], [HasPanelMembers]) VALUES (62, 3, 40, N'18:00', N'21:30', NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Agendas] OFF
GO
SET IDENTITY_INSERT [dbo].[AgendaTopics] ON 
GO
INSERT [dbo].[AgendaTopics] ([AgendaTopicId], [AgendaTopic]) VALUES (1, N'Delegates Registration')
GO
INSERT [dbo].[AgendaTopics] ([AgendaTopicId], [AgendaTopic]) VALUES (2, N'OPENING REMARKS BY THE MC')
GO
INSERT [dbo].[AgendaTopics] ([AgendaTopicId], [AgendaTopic]) VALUES (3, N'SATA EXECUTIVE SECRETARY ADDRESS')
GO
INSERT [dbo].[AgendaTopics] ([AgendaTopicId], [AgendaTopic]) VALUES (4, N'OPENING REMARKS AND INTRODUCING THE MINISTER BY TELKOM GROUP CEO')
GO
INSERT [dbo].[AgendaTopics] ([AgendaTopicId], [AgendaTopic]) VALUES (5, N'KEYNOTE ADDRESS BY MINISTER OF COMMUNICATIONS & DIGITAL COMMUNICATIONS')
GO
INSERT [dbo].[AgendaTopics] ([AgendaTopicId], [AgendaTopic]) VALUES (6, N'WELCOME REMARKS BY SATA CHAIRMAN: BOFINET')
GO
INSERT [dbo].[AgendaTopics] ([AgendaTopicId], [AgendaTopic]) VALUES (7, N'SADC SECRETARIAT ADDRESS')
GO
INSERT [dbo].[AgendaTopics] ([AgendaTopicId], [AgendaTopic]) VALUES (8, N'PHOTO OPPORTUNITY')
GO
INSERT [dbo].[AgendaTopics] ([AgendaTopicId], [AgendaTopic]) VALUES (9, N'Exhibition walk-about')
GO
INSERT [dbo].[AgendaTopics] ([AgendaTopicId], [AgendaTopic]) VALUES (10, N'Tea Break')
GO
INSERT [dbo].[AgendaTopics] ([AgendaTopicId], [AgendaTopic]) VALUES (11, N'G20 PANEL DISCUSSION')
GO
INSERT [dbo].[AgendaTopics] ([AgendaTopicId], [AgendaTopic]) VALUES (12, N'Musical performance')
GO
INSERT [dbo].[AgendaTopics] ([AgendaTopicId], [AgendaTopic]) VALUES (13, N'PRESENTATION: DRAFT CONFERENCE RECOMMENDATIONS')
GO
INSERT [dbo].[AgendaTopics] ([AgendaTopicId], [AgendaTopic]) VALUES (14, N'PRESENTATION: OPENSERVE’S REGIONAL AND GLOBAL SUBMARINE CONNECTIVITY MUSCLE')
GO
INSERT [dbo].[AgendaTopics] ([AgendaTopicId], [AgendaTopic]) VALUES (15, N'Lunch')
GO
INSERT [dbo].[AgendaTopics] ([AgendaTopicId], [AgendaTopic]) VALUES (16, N'LAUNCH: AFRICA INVESTMENT GUIDEBOOK BY WORLD BROADBAND ASSOCIATION')
GO
INSERT [dbo].[AgendaTopics] ([AgendaTopicId], [AgendaTopic]) VALUES (17, N'MC TO CLOSE OFF DAY 1')
GO
INSERT [dbo].[AgendaTopics] ([AgendaTopicId], [AgendaTopic]) VALUES (18, N'All Delegates get ready for Dinner')
GO
INSERT [dbo].[AgendaTopics] ([AgendaTopicId], [AgendaTopic]) VALUES (19, N'SAN DECK DINNER HOSTED BY BCX')
GO
INSERT [dbo].[AgendaTopics] ([AgendaTopicId], [AgendaTopic]) VALUES (20, N'Welcome Coffee & Tea')
GO
INSERT [dbo].[AgendaTopics] ([AgendaTopicId], [AgendaTopic]) VALUES (21, N'PRESENTATION: SADC DATA CENTRE PROJECT BY DIGITAL INVESTMENT FACILITY')
GO
INSERT [dbo].[AgendaTopics] ([AgendaTopicId], [AgendaTopic]) VALUES (22, N'PRESENTATION: SATA 2025/2030 BUSINESS MODEL')
GO
INSERT [dbo].[AgendaTopics] ([AgendaTopicId], [AgendaTopic]) VALUES (23, N'PRESENTATION: MASTERING RURAL CONNECTIVITY''S VALUE')
GO
INSERT [dbo].[AgendaTopics] ([AgendaTopicId], [AgendaTopic]) VALUES (24, N'PRESENTATION: THE ESG IMPERATIVE: SHAPING AI FOR A BETTER WORLD')
GO
INSERT [dbo].[AgendaTopics] ([AgendaTopicId], [AgendaTopic]) VALUES (25, N'PANEL DISCUSSION: HOW DO WE ADDRESS THE CONNECTIVITY USAGE GAP WITHIN THE SADC COUNTRIES')
GO
INSERT [dbo].[AgendaTopics] ([AgendaTopicId], [AgendaTopic]) VALUES (26, N'PRESENTATION: CLOUD & DATA CENTRE')
GO
INSERT [dbo].[AgendaTopics] ([AgendaTopicId], [AgendaTopic]) VALUES (27, N'PRESENTATION: TOPIC: AGENTIC ERA FOR TELCOS')
GO
INSERT [dbo].[AgendaTopics] ([AgendaTopicId], [AgendaTopic]) VALUES (28, N'PRESENTATION: TOPIC CITIZEN-FOCUSED CONNECTIVITY & MEASUREMENT')
GO
INSERT [dbo].[AgendaTopics] ([AgendaTopicId], [AgendaTopic]) VALUES (29, N'CLOSING REMARKS BY THE MC')
GO
INSERT [dbo].[AgendaTopics] ([AgendaTopicId], [AgendaTopic]) VALUES (30, N'Delegates Transported to the venue Signature (Morningside)')
GO
INSERT [dbo].[AgendaTopics] ([AgendaTopicId], [AgendaTopic]) VALUES (31, N'DINNER AT SIGNATURE HOSTED BY TELKOM')
GO
INSERT [dbo].[AgendaTopics] ([AgendaTopicId], [AgendaTopic]) VALUES (32, N'Delegates Transported back to SCC')
GO
INSERT [dbo].[AgendaTopics] ([AgendaTopicId], [AgendaTopic]) VALUES (33, N'HANDING OVER OF THE CHAIRMANSHIP CEREMONY')
GO
INSERT [dbo].[AgendaTopics] ([AgendaTopicId], [AgendaTopic]) VALUES (34, N'Photo opportunity')
GO
INSERT [dbo].[AgendaTopics] ([AgendaTopicId], [AgendaTopic]) VALUES (35, N'ADOPTION OF THE CONFERENCE FINAL RECOMMENDATIONS')
GO
INSERT [dbo].[AgendaTopics] ([AgendaTopicId], [AgendaTopic]) VALUES (36, N'VOTE OF THANKS BY THE NEW SATA CHAIRMAN')
GO
INSERT [dbo].[AgendaTopics] ([AgendaTopicId], [AgendaTopic]) VALUES (37, N'Delegates Transported to the venue Constitutional Court')
GO
INSERT [dbo].[AgendaTopics] ([AgendaTopicId], [AgendaTopic]) VALUES (38, N'CONSTITUTIONAL COURT TOUR + WINE TASTING & BILTONG PAIRING + GIANT MURAL PAINTING')
GO
INSERT [dbo].[AgendaTopics] ([AgendaTopicId], [AgendaTopic]) VALUES (39, N'Delegates transported back to Sandton City')
GO
INSERT [dbo].[AgendaTopics] ([AgendaTopicId], [AgendaTopic]) VALUES (40, N'Dinner at SCC hosted by Openserve')
GO
SET IDENTITY_INSERT [dbo].[AgendaTopics] OFF
GO
SET IDENTITY_INSERT [dbo].[Facilitators] ON 
GO
INSERT [dbo].[Facilitators] ([FacilitatorId], [FacilitatorName]) VALUES (1, N'Jacob Munodawafa')
GO
INSERT [dbo].[Facilitators] ([FacilitatorId], [FacilitatorName]) VALUES (2, N'Mpho Sithole')
GO
INSERT [dbo].[Facilitators] ([FacilitatorId], [FacilitatorName]) VALUES (3, N'Richard Cazalet')
GO
SET IDENTITY_INSERT [dbo].[Facilitators] OFF
GO
SET IDENTITY_INSERT [dbo].[PanelMembers] ON 
GO
INSERT [dbo].[PanelMembers] ([PanelMemberId], [PanelMemberName]) VALUES (1, N'Busisiwe Mavuso')
GO
INSERT [dbo].[PanelMembers] ([PanelMemberId], [PanelMemberName]) VALUES (2, N'Serame Taukobong')
GO
INSERT [dbo].[PanelMembers] ([PanelMemberId], [PanelMemberName]) VALUES (3, N'Khulekani Mathe')
GO
INSERT [dbo].[PanelMembers] ([PanelMemberId], [PanelMemberName]) VALUES (4, N'Nonqkubela Dyani-Jordan')
GO
INSERT [dbo].[PanelMembers] ([PanelMemberId], [PanelMemberName]) VALUES (5, N'Keabetswe Segole')
GO
INSERT [dbo].[PanelMembers] ([PanelMemberId], [PanelMemberName]) VALUES (6, N'Liza Zouabi')
GO
INSERT [dbo].[PanelMembers] ([PanelMemberId], [PanelMemberName]) VALUES (7, N'Judy Vilakazi')
GO
INSERT [dbo].[PanelMembers] ([PanelMemberId], [PanelMemberName]) VALUES (8, N'Dr. George Ah-Thew')
GO
INSERT [dbo].[PanelMembers] ([PanelMemberId], [PanelMemberName]) VALUES (9, N'Dr. Stanley Shanapinda')
GO
SET IDENTITY_INSERT [dbo].[PanelMembers] OFF
GO
SET IDENTITY_INSERT [dbo].[Speakers] ON 
GO
INSERT [dbo].[Speakers] ([SpeakerId], [SpeakerName]) VALUES (1, N'Mpho Sithole')
GO
INSERT [dbo].[Speakers] ([SpeakerId], [SpeakerName]) VALUES (2, N'Jacob Munodawafa')
GO
INSERT [dbo].[Speakers] ([SpeakerId], [SpeakerName]) VALUES (3, N'Serame Taukobong')
GO
INSERT [dbo].[Speakers] ([SpeakerId], [SpeakerName]) VALUES (4, N'Honourable Solly Malatsi')
GO
INSERT [dbo].[Speakers] ([SpeakerId], [SpeakerName]) VALUES (5, N'Keabetswe Segole')
GO
INSERT [dbo].[Speakers] ([SpeakerId], [SpeakerName]) VALUES (6, N'Dr. George Ah-Thew')
GO
INSERT [dbo].[Speakers] ([SpeakerId], [SpeakerName]) VALUES (7, N'Solly Malatsi')
GO
INSERT [dbo].[Speakers] ([SpeakerId], [SpeakerName]) VALUES (8, N'Motlalepula Ramaisa')
GO
INSERT [dbo].[Speakers] ([SpeakerId], [SpeakerName]) VALUES (9, N'Martin Creaner')
GO
INSERT [dbo].[Speakers] ([SpeakerId], [SpeakerName]) VALUES (10, N'Jonas Bogoshi')
GO
INSERT [dbo].[Speakers] ([SpeakerId], [SpeakerName]) VALUES (11, N'Juha Miettinen')
GO
INSERT [dbo].[Speakers] ([SpeakerId], [SpeakerName]) VALUES (12, N'Sthembiso Dlamini')
GO
INSERT [dbo].[Speakers] ([SpeakerId], [SpeakerName]) VALUES (13, N'Ashvir Singh')
GO
INSERT [dbo].[Speakers] ([SpeakerId], [SpeakerName]) VALUES (14, N'Tshepo Masigo')
GO
INSERT [dbo].[Speakers] ([SpeakerId], [SpeakerName]) VALUES (15, N'Kerry-Ann Murgatroyd')
GO
INSERT [dbo].[Speakers] ([SpeakerId], [SpeakerName]) VALUES (16, N'Darya Nasr')
GO
INSERT [dbo].[Speakers] ([SpeakerId], [SpeakerName]) VALUES (17, N'Lunga Siyo')
GO
INSERT [dbo].[Speakers] ([SpeakerId], [SpeakerName]) VALUES (18, N'Selby Khuzwayo')
GO
INSERT [dbo].[Speakers] ([SpeakerId], [SpeakerName]) VALUES (19, N'All Delegates')
GO
SET IDENTITY_INSERT [dbo].[Speakers] OFF
GO
ALTER TABLE [dbo].[AgendaLinks]  WITH CHECK ADD  CONSTRAINT [FK_AgendaLinks_Agendas] FOREIGN KEY([AgendaId])
REFERENCES [dbo].[Agendas] ([AgendaId])
GO
ALTER TABLE [dbo].[AgendaLinks] CHECK CONSTRAINT [FK_AgendaLinks_Agendas]
GO
ALTER TABLE [dbo].[AgendaLinks]  WITH CHECK ADD  CONSTRAINT [FK_AgendaLinks_Facilitators] FOREIGN KEY([FacilitatorId])
REFERENCES [dbo].[Facilitators] ([FacilitatorId])
GO
ALTER TABLE [dbo].[AgendaLinks] CHECK CONSTRAINT [FK_AgendaLinks_Facilitators]
GO
ALTER TABLE [dbo].[AgendaLinks]  WITH CHECK ADD  CONSTRAINT [FK_AgendaLinks_PanelMembers] FOREIGN KEY([PanelMemberId])
REFERENCES [dbo].[PanelMembers] ([PanelMemberId])
GO
ALTER TABLE [dbo].[AgendaLinks] CHECK CONSTRAINT [FK_AgendaLinks_PanelMembers]
GO
ALTER TABLE [dbo].[AgendaLinks]  WITH CHECK ADD  CONSTRAINT [FK_AgendaLinks_Speakers] FOREIGN KEY([SpeakerId])
REFERENCES [dbo].[Speakers] ([SpeakerId])
GO
ALTER TABLE [dbo].[AgendaLinks] CHECK CONSTRAINT [FK_AgendaLinks_Speakers]
GO
ALTER TABLE [dbo].[Agendas]  WITH CHECK ADD  CONSTRAINT [FK_Agendas_AgendaDays] FOREIGN KEY([AgendaDayId])
REFERENCES [dbo].[AgendaDays] ([DayId])
GO
ALTER TABLE [dbo].[Agendas] CHECK CONSTRAINT [FK_Agendas_AgendaDays]
GO
ALTER TABLE [dbo].[Agendas]  WITH CHECK ADD  CONSTRAINT [FK_Agendas_AgendaTopics] FOREIGN KEY([AgendaTopicId])
REFERENCES [dbo].[AgendaTopics] ([AgendaTopicId])
GO
ALTER TABLE [dbo].[Agendas] CHECK CONSTRAINT [FK_Agendas_AgendaTopics]
GO
USE [master]
GO
ALTER DATABASE [SataReplicaDB] SET  READ_WRITE 
GO
