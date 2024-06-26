USE [master]
GO
/****** Object:  Database [KidProEdu]    Script Date: 6/10/2024 4:48:30 PM ******/
CREATE DATABASE [KidProEdu]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'KidProEdu', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\KidProEdu.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'KidProEdu_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\KidProEdu_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [KidProEdu] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [KidProEdu].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [KidProEdu] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [KidProEdu] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [KidProEdu] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [KidProEdu] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [KidProEdu] SET ARITHABORT OFF 
GO
ALTER DATABASE [KidProEdu] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [KidProEdu] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [KidProEdu] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [KidProEdu] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [KidProEdu] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [KidProEdu] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [KidProEdu] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [KidProEdu] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [KidProEdu] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [KidProEdu] SET  ENABLE_BROKER 
GO
ALTER DATABASE [KidProEdu] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [KidProEdu] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [KidProEdu] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [KidProEdu] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [KidProEdu] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [KidProEdu] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [KidProEdu] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [KidProEdu] SET RECOVERY FULL 
GO
ALTER DATABASE [KidProEdu] SET  MULTI_USER 
GO
ALTER DATABASE [KidProEdu] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [KidProEdu] SET DB_CHAINING OFF 
GO
ALTER DATABASE [KidProEdu] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [KidProEdu] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [KidProEdu] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [KidProEdu] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'KidProEdu', N'ON'
GO
ALTER DATABASE [KidProEdu] SET QUERY_STORE = ON
GO
ALTER DATABASE [KidProEdu] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [KidProEdu]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 6/10/2024 4:48:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AdviseRequest]    Script Date: 6/10/2024 4:48:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdviseRequest](
	[Id] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NULL,
	[FullName] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[Phone] [nvarchar](max) NOT NULL,
	[Address] [nvarchar](max) NOT NULL,
	[LocationId] [uniqueidentifier] NULL,
	[TestDate] [datetime2](7) NOT NULL,
	[StartTime] [datetime2](7) NULL,
	[EndTime] [datetime2](7) NULL,
	[IsTested] [bit] NULL,
	[StatusAdviseRequest] [int] NOT NULL,
	[SlotId] [uniqueidentifier] NULL,
	[CreationDate] [datetime2](7) NOT NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[ModificationDate] [datetime2](7) NULL,
	[ModificationBy] [uniqueidentifier] NULL,
	[DeletionDate] [datetime2](7) NULL,
	[DeleteBy] [uniqueidentifier] NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_AdviseRequest] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AnnualWorkingDay]    Script Date: 6/10/2024 4:48:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AnnualWorkingDay](
	[Id] [uniqueidentifier] NOT NULL,
	[Day] [datetime2](7) NOT NULL,
	[ShiftType] [int] NOT NULL,
	[TypeDate] [int] NOT NULL,
	[CreationDate] [datetime2](7) NOT NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[ModificationDate] [datetime2](7) NULL,
	[ModificationBy] [uniqueidentifier] NULL,
	[DeletionDate] [datetime2](7) NULL,
	[DeleteBy] [uniqueidentifier] NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_AnnualWorkingDay] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Attendance]    Script Date: 6/10/2024 4:48:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Attendance](
	[Id] [uniqueidentifier] NOT NULL,
	[ScheduleId] [uniqueidentifier] NOT NULL,
	[Date] [datetime2](7) NOT NULL,
	[ChildrenProfileId] [uniqueidentifier] NOT NULL,
	[StatusAttendance] [int] NOT NULL,
	[Note] [nvarchar](max) NULL,
	[CreationDate] [datetime2](7) NOT NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[ModificationDate] [datetime2](7) NULL,
	[ModificationBy] [uniqueidentifier] NULL,
	[DeletionDate] [datetime2](7) NULL,
	[DeleteBy] [uniqueidentifier] NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Attendance] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Blog]    Script Date: 6/10/2024 4:48:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Blog](
	[Id] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[Content] [nvarchar](max) NOT NULL,
	[Image] [nvarchar](max) NULL,
	[Title] [nvarchar](max) NOT NULL,
	[CreationDate] [datetime2](7) NOT NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[ModificationDate] [datetime2](7) NULL,
	[ModificationBy] [uniqueidentifier] NULL,
	[DeletionDate] [datetime2](7) NULL,
	[DeleteBy] [uniqueidentifier] NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Blog] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BlogTag]    Script Date: 6/10/2024 4:48:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BlogTag](
	[BlogsId] [uniqueidentifier] NOT NULL,
	[TagsId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_BlogTag] PRIMARY KEY CLUSTERED 
(
	[BlogsId] ASC,
	[TagsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CategoryEquipment]    Script Date: 6/10/2024 4:48:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CategoryEquipment](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Quantity] [int] NOT NULL,
	[TypeCategoryEquipment] [int] NOT NULL,
	[Code] [nvarchar](max) NULL,
	[CreationDate] [datetime2](7) NOT NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[ModificationDate] [datetime2](7) NULL,
	[ModificationBy] [uniqueidentifier] NULL,
	[DeletionDate] [datetime2](7) NULL,
	[DeleteBy] [uniqueidentifier] NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_CategoryEquipment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CategoryEquipmentLesson]    Script Date: 6/10/2024 4:48:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CategoryEquipmentLesson](
	[CategoryEquipmentsId] [uniqueidentifier] NOT NULL,
	[LessonsId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_CategoryEquipmentLesson] PRIMARY KEY CLUSTERED 
(
	[CategoryEquipmentsId] ASC,
	[LessonsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Certificate]    Script Date: 6/10/2024 4:48:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Certificate](
	[Id] [uniqueidentifier] NOT NULL,
	[ChildrenProfileId] [uniqueidentifier] NOT NULL,
	[CourseId] [uniqueidentifier] NOT NULL,
	[Code] [nvarchar](max) NOT NULL,
	[Url] [nvarchar](max) NOT NULL,
	[CreationDate] [datetime2](7) NOT NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[ModificationDate] [datetime2](7) NULL,
	[ModificationBy] [uniqueidentifier] NULL,
	[DeletionDate] [datetime2](7) NULL,
	[DeleteBy] [uniqueidentifier] NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Certificate] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChildrenAnswer]    Script Date: 6/10/2024 4:48:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChildrenAnswer](
	[Id] [uniqueidentifier] NOT NULL,
	[ChildrenProfileId] [uniqueidentifier] NOT NULL,
	[ExamId] [uniqueidentifier] NOT NULL,
	[QuestionId] [uniqueidentifier] NULL,
	[Answer] [nvarchar](max) NULL,
	[ScorePerQuestion] [float] NOT NULL,
	[CreationDate] [datetime2](7) NOT NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[ModificationDate] [datetime2](7) NULL,
	[ModificationBy] [uniqueidentifier] NULL,
	[DeletionDate] [datetime2](7) NULL,
	[DeleteBy] [uniqueidentifier] NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_ChildrenAnswer] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChildrenProfile]    Script Date: 6/10/2024 4:48:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChildrenProfile](
	[Id] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[FullName] [nvarchar](max) NOT NULL,
	[ChildrenCode] [nvarchar](max) NOT NULL,
	[GenderType] [nvarchar](max) NULL,
	[BirthDay] [datetime2](7) NOT NULL,
	[Avatar] [nvarchar](max) NULL,
	[SpecialSkill] [nvarchar](max) NULL,
	[Status] [int] NOT NULL,
	[CreationDate] [datetime2](7) NOT NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[ModificationDate] [datetime2](7) NULL,
	[ModificationBy] [uniqueidentifier] NULL,
	[DeletionDate] [datetime2](7) NULL,
	[DeleteBy] [uniqueidentifier] NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_ChildrenProfile] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Class]    Script Date: 6/10/2024 4:48:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Class](
	[Id] [uniqueidentifier] NOT NULL,
	[CourseId] [uniqueidentifier] NOT NULL,
	[ClassCode] [nvarchar](max) NOT NULL,
	[StartDate] [datetime2](7) NOT NULL,
	[EndDate] [datetime2](7) NOT NULL,
	[StatusOfClass] [int] NOT NULL,
	[MaxNumber] [int] NOT NULL,
	[ExpectedNumber] [int] NOT NULL,
	[ActualNumber] [int] NOT NULL,
	[CreationDate] [datetime2](7) NOT NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[ModificationDate] [datetime2](7) NULL,
	[ModificationBy] [uniqueidentifier] NULL,
	[DeletionDate] [datetime2](7) NULL,
	[DeleteBy] [uniqueidentifier] NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Class] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ConfigDay]    Script Date: 6/10/2024 4:48:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConfigDay](
	[Id] [uniqueidentifier] NOT NULL,
	[Normal] [int] NOT NULL,
	[Saturday] [int] NOT NULL,
	[Sunday] [int] NOT NULL,
	[Holiday] [int] NOT NULL,
	[CreationDate] [datetime2](7) NOT NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[ModificationDate] [datetime2](7) NULL,
	[ModificationBy] [uniqueidentifier] NULL,
	[DeletionDate] [datetime2](7) NULL,
	[DeleteBy] [uniqueidentifier] NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_ConfigDay] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ConfigJobType]    Script Date: 6/10/2024 4:48:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConfigJobType](
	[Id] [uniqueidentifier] NOT NULL,
	[JobType] [int] NOT NULL,
	[Slotperweek] [int] NOT NULL,
	[UserAccountId] [uniqueidentifier] NULL,
	[CreationDate] [datetime2](7) NOT NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[ModificationDate] [datetime2](7) NULL,
	[ModificationBy] [uniqueidentifier] NULL,
	[DeletionDate] [datetime2](7) NULL,
	[DeleteBy] [uniqueidentifier] NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_ConfigJobType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ConfigPointMultipliers]    Script Date: 6/10/2024 4:48:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConfigPointMultipliers](
	[Id] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[TestType] [int] NOT NULL,
	[Multiplier] [float] NOT NULL,
	[CreationDate] [datetime2](7) NOT NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[ModificationDate] [datetime2](7) NULL,
	[ModificationBy] [uniqueidentifier] NULL,
	[DeletionDate] [datetime2](7) NULL,
	[DeleteBy] [uniqueidentifier] NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_ConfigPointMultipliers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ConfigSystem]    Script Date: 6/10/2024 4:48:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConfigSystem](
	[Id] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[WebLogo] [nvarchar](max) NOT NULL,
	[TextLogo] [nvarchar](max) NOT NULL,
	[WebsiteName] [nvarchar](max) NOT NULL,
	[Favicon] [nvarchar](max) NOT NULL,
	[DefaultAvatar] [nvarchar](max) NOT NULL,
	[DefaultPassword] [nvarchar](max) NOT NULL,
	[CreationDate] [datetime2](7) NOT NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[ModificationDate] [datetime2](7) NULL,
	[ModificationBy] [uniqueidentifier] NULL,
	[DeletionDate] [datetime2](7) NULL,
	[DeleteBy] [uniqueidentifier] NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_ConfigSystem] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ConfigTheme]    Script Date: 6/10/2024 4:48:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConfigTheme](
	[Id] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[ColorCode] [nvarchar](max) NOT NULL,
	[BlurCode] [nvarchar](max) NOT NULL,
	[CreationDate] [datetime2](7) NOT NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[ModificationDate] [datetime2](7) NULL,
	[ModificationBy] [uniqueidentifier] NULL,
	[DeletionDate] [datetime2](7) NULL,
	[DeleteBy] [uniqueidentifier] NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_ConfigTheme] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contract]    Script Date: 6/10/2024 4:48:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contract](
	[Id] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[ConfigJobTypeId] [uniqueidentifier] NOT NULL,
	[ContractCode] [nvarchar](max) NOT NULL,
	[StartDate] [datetime2](7) NOT NULL,
	[EndDate] [datetime2](7) NOT NULL,
	[Job] [nvarchar](max) NOT NULL,
	[File] [nvarchar](max) NOT NULL,
	[StatusOfContract] [int] NOT NULL,
	[CreationDate] [datetime2](7) NOT NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[ModificationDate] [datetime2](7) NULL,
	[ModificationBy] [uniqueidentifier] NULL,
	[DeletionDate] [datetime2](7) NULL,
	[DeleteBy] [uniqueidentifier] NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Contract] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Course]    Script Date: 6/10/2024 4:48:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course](
	[Id] [uniqueidentifier] NOT NULL,
	[CourseCode] [nvarchar](max) NOT NULL,
	[Price] [float] NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[DurationTotal] [int] NOT NULL,
	[Syllabus] [nvarchar](max) NULL,
	[Level] [int] NULL,
	[EntryPoint] [int] NULL,
	[Image] [nvarchar](max) NULL,
	[CourseType] [int] NOT NULL,
	[ParentCourse] [uniqueidentifier] NULL,
	[CreationDate] [datetime2](7) NOT NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[ModificationDate] [datetime2](7) NULL,
	[ModificationBy] [uniqueidentifier] NULL,
	[DeletionDate] [datetime2](7) NULL,
	[DeleteBy] [uniqueidentifier] NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Division]    Script Date: 6/10/2024 4:48:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Division](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[CreationDate] [datetime2](7) NOT NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[ModificationDate] [datetime2](7) NULL,
	[ModificationBy] [uniqueidentifier] NULL,
	[DeletionDate] [datetime2](7) NULL,
	[DeleteBy] [uniqueidentifier] NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Division] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DivisionUserAccount]    Script Date: 6/10/2024 4:48:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DivisionUserAccount](
	[Id] [uniqueidentifier] NOT NULL,
	[DivisionId] [uniqueidentifier] NOT NULL,
	[UserAccountId] [uniqueidentifier] NOT NULL,
	[CreationDate] [datetime2](7) NOT NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[ModificationDate] [datetime2](7) NULL,
	[ModificationBy] [uniqueidentifier] NULL,
	[DeletionDate] [datetime2](7) NULL,
	[DeleteBy] [uniqueidentifier] NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_DivisionUserAccount] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Enrollment]    Script Date: 6/10/2024 4:48:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Enrollment](
	[Id] [uniqueidentifier] NOT NULL,
	[ClassId] [uniqueidentifier] NOT NULL,
	[ChildrenProfileId] [uniqueidentifier] NOT NULL,
	[RegisterDate] [datetime2](7) NULL,
	[Commission] [float] NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[UserAccountId] [uniqueidentifier] NULL,
	[CreationDate] [datetime2](7) NOT NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[ModificationDate] [datetime2](7) NULL,
	[ModificationBy] [uniqueidentifier] NULL,
	[DeletionDate] [datetime2](7) NULL,
	[DeleteBy] [uniqueidentifier] NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Enrollment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Equipment]    Script Date: 6/10/2024 4:48:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Equipment](
	[Id] [uniqueidentifier] NOT NULL,
	[CategoryEquipmentId] [uniqueidentifier] NOT NULL,
	[RoomId] [uniqueidentifier] NULL,
	[Name] [nvarchar](max) NULL,
	[Code] [nvarchar](max) NULL,
	[Price] [float] NULL,
	[Status] [int] NULL,
	[WarrantyPeriod] [nvarchar](max) NULL,
	[PurchaseDate] [datetime2](7) NULL,
	[CreationDate] [datetime2](7) NOT NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[ModificationDate] [datetime2](7) NULL,
	[ModificationBy] [uniqueidentifier] NULL,
	[DeletionDate] [datetime2](7) NULL,
	[DeleteBy] [uniqueidentifier] NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Equipment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Exam]    Script Date: 6/10/2024 4:48:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Exam](
	[Id] [uniqueidentifier] NOT NULL,
	[CourseId] [uniqueidentifier] NULL,
	[ClassId] [uniqueidentifier] NULL,
	[TestName] [nvarchar](max) NOT NULL,
	[TestCode] [nvarchar](max) NULL,
	[TestDate] [datetime2](7) NOT NULL,
	[TestDuration] [int] NOT NULL,
	[TotalQuestion] [int] NULL,
	[TestType] [int] NOT NULL,
	[CreationDate] [datetime2](7) NOT NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[ModificationDate] [datetime2](7) NULL,
	[ModificationBy] [uniqueidentifier] NULL,
	[DeletionDate] [datetime2](7) NULL,
	[DeleteBy] [uniqueidentifier] NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Exam] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 6/10/2024 4:48:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedback](
	[Id] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[RecipientId] [uniqueidentifier] NOT NULL,
	[ClassId] [uniqueidentifier] NULL,
	[Messages] [nvarchar](max) NULL,
	[Stars] [nvarchar](max) NULL,
	[CreationDate] [datetime2](7) NOT NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[ModificationDate] [datetime2](7) NULL,
	[ModificationBy] [uniqueidentifier] NULL,
	[DeletionDate] [datetime2](7) NULL,
	[DeleteBy] [uniqueidentifier] NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Feedback] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lesson]    Script Date: 6/10/2024 4:48:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lesson](
	[Id] [uniqueidentifier] NOT NULL,
	[CourseId] [uniqueidentifier] NOT NULL,
	[LessonNumber] [int] NULL,
	[Name] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[Duration] [int] NULL,
	[TypeOfPractice] [int] NULL,
	[GroupSize] [int] NULL,
	[CreationDate] [datetime2](7) NOT NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[ModificationDate] [datetime2](7) NULL,
	[ModificationBy] [uniqueidentifier] NULL,
	[DeletionDate] [datetime2](7) NULL,
	[DeleteBy] [uniqueidentifier] NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Lesson] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Location]    Script Date: 6/10/2024 4:48:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Location](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
	[CreationDate] [datetime2](7) NOT NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[ModificationDate] [datetime2](7) NULL,
	[ModificationBy] [uniqueidentifier] NULL,
	[DeletionDate] [datetime2](7) NULL,
	[DeleteBy] [uniqueidentifier] NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Location] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LogEquipment]    Script Date: 6/10/2024 4:48:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LogEquipment](
	[Id] [uniqueidentifier] NOT NULL,
	[EquipmentId] [uniqueidentifier] NULL,
	[CategoryEquipmentId] [uniqueidentifier] NULL,
	[UserAccountId] [uniqueidentifier] NULL,
	[Name] [nvarchar](max) NULL,
	[Code] [nvarchar](max) NULL,
	[Price] [float] NULL,
	[Status] [int] NULL,
	[RepairDate] [datetime2](7) NULL,
	[WarrantyPeriod] [nvarchar](max) NULL,
	[PurchaseDate] [datetime2](7) NULL,
	[BorrowedDate] [datetime2](7) NULL,
	[ReturnedDate] [datetime2](7) NULL,
	[ReturnedDealine] [datetime2](7) NULL,
	[RoomId] [uniqueidentifier] NULL,
	[Quantity] [int] NULL,
	[CreationDate] [datetime2](7) NOT NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[ModificationDate] [datetime2](7) NULL,
	[ModificationBy] [uniqueidentifier] NULL,
	[DeletionDate] [datetime2](7) NULL,
	[DeleteBy] [uniqueidentifier] NULL,
	[IsDeleted] [bit] NOT NULL,
	[Note] [nvarchar](max) NULL,
	[LogType] [int] NULL,
 CONSTRAINT [PK_LogEquipment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notification]    Script Date: 6/10/2024 4:48:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notification](
	[Id] [uniqueidentifier] NOT NULL,
	[Date] [datetime2](7) NULL,
	[Message] [nvarchar](max) NULL,
	[CreationDate] [datetime2](7) NOT NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[ModificationDate] [datetime2](7) NULL,
	[ModificationBy] [uniqueidentifier] NULL,
	[DeletionDate] [datetime2](7) NULL,
	[DeleteBy] [uniqueidentifier] NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Notification] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NotificationUser]    Script Date: 6/10/2024 4:48:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NotificationUser](
	[Id] [uniqueidentifier] NOT NULL,
	[NotificationId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[CreationDate] [datetime2](7) NOT NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[ModificationDate] [datetime2](7) NULL,
	[ModificationBy] [uniqueidentifier] NULL,
	[DeletionDate] [datetime2](7) NULL,
	[DeleteBy] [uniqueidentifier] NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_NotificationUser] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 6/10/2024 4:48:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[Id] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[OrderNumber] [nvarchar](max) NULL,
	[OrderDate] [datetime2](7) NOT NULL,
	[TotalAmount] [float] NOT NULL,
	[PaymentStatus] [int] NOT NULL,
	[URLPayment] [nvarchar](max) NULL,
	[EWalletMethod] [nvarchar](max) NULL,
	[CreationDate] [datetime2](7) NOT NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[ModificationDate] [datetime2](7) NULL,
	[ModificationBy] [uniqueidentifier] NULL,
	[DeletionDate] [datetime2](7) NULL,
	[DeleteBy] [uniqueidentifier] NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 6/10/2024 4:48:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[Id] [uniqueidentifier] NOT NULL,
	[OrderId] [uniqueidentifier] NULL,
	[ChildrenProfileId] [uniqueidentifier] NULL,
	[CourseId] [uniqueidentifier] NULL,
	[Quantity] [int] NULL,
	[UnitPrice] [float] NOT NULL,
	[TotalPrice] [float] NULL,
	[InstallmentTerm] [int] NULL,
	[PayType] [int] NULL,
	[ParentOrderDetail] [uniqueidentifier] NULL,
	[CreationDate] [datetime2](7) NOT NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[ModificationDate] [datetime2](7) NULL,
	[ModificationBy] [uniqueidentifier] NULL,
	[DeletionDate] [datetime2](7) NULL,
	[DeleteBy] [uniqueidentifier] NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Question]    Script Date: 6/10/2024 4:48:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Question](
	[Id] [uniqueidentifier] NOT NULL,
	[LessionId] [uniqueidentifier] NULL,
	[Title] [nvarchar](max) NULL,
	[Answer1] [nvarchar](max) NULL,
	[Answer2] [nvarchar](max) NULL,
	[Answer3] [nvarchar](max) NULL,
	[Answer4] [nvarchar](max) NULL,
	[RightAnswer] [nvarchar](max) NULL,
	[Level] [int] NULL,
	[Type] [int] NULL,
	[CreationDate] [datetime2](7) NOT NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[ModificationDate] [datetime2](7) NULL,
	[ModificationBy] [uniqueidentifier] NULL,
	[DeletionDate] [datetime2](7) NULL,
	[DeleteBy] [uniqueidentifier] NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Question] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rating]    Script Date: 6/10/2024 4:48:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rating](
	[Id] [uniqueidentifier] NOT NULL,
	[CourseId] [uniqueidentifier] NOT NULL,
	[UserAccountId] [uniqueidentifier] NOT NULL,
	[Comment] [nvarchar](max) NULL,
	[StarNumber] [nvarchar](max) NULL,
	[Date] [datetime2](7) NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[CreationDate] [datetime2](7) NOT NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[ModificationDate] [datetime2](7) NULL,
	[ModificationBy] [uniqueidentifier] NULL,
	[DeletionDate] [datetime2](7) NULL,
	[DeleteBy] [uniqueidentifier] NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Rating] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Request]    Script Date: 6/10/2024 4:48:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Request](
	[Id] [uniqueidentifier] NOT NULL,
	[RequestCode] [nvarchar](max) NULL,
	[RequestDescription] [nvarchar](max) NULL,
	[RequestType] [nvarchar](max) NULL,
	[LeaveDate] [datetime2](7) NULL,
	[LocationId] [uniqueidentifier] NULL,
	[FromClassId] [uniqueidentifier] NULL,
	[ToClassId] [uniqueidentifier] NULL,
	[ScheduleId] [uniqueidentifier] NULL,
	[TeachingDay] [datetime2](7) NULL,
	[ReceiverRefundId] [uniqueidentifier] NULL,
	[CourseCode] [nvarchar](max) NULL,
	[ChildrenCode] [nvarchar](max) NULL,
	[Status] [int] NULL,
	[CreationDate] [datetime2](7) NOT NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[ModificationDate] [datetime2](7) NULL,
	[ModificationBy] [uniqueidentifier] NULL,
	[DeletionDate] [datetime2](7) NULL,
	[DeleteBy] [uniqueidentifier] NULL,
	[IsDeleted] [bit] NOT NULL,
	[CategoryEquipmentId] [uniqueidentifier] NULL,
	[Quantity] [int] NULL,
	[ReturnDeadline] [datetime2](7) NULL,
	[RoomId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Request] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RequestUserAccount]    Script Date: 6/10/2024 4:48:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RequestUserAccount](
	[Id] [uniqueidentifier] NOT NULL,
	[RecieverId] [uniqueidentifier] NOT NULL,
	[RequestId] [uniqueidentifier] NOT NULL,
	[CreationDate] [datetime2](7) NOT NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[ModificationDate] [datetime2](7) NULL,
	[ModificationBy] [uniqueidentifier] NULL,
	[DeletionDate] [datetime2](7) NULL,
	[DeleteBy] [uniqueidentifier] NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_RequestUserAccount] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Resource]    Script Date: 6/10/2024 4:48:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Resource](
	[Id] [uniqueidentifier] NOT NULL,
	[CourseId] [uniqueidentifier] NOT NULL,
	[Url] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[CreationDate] [datetime2](7) NOT NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[ModificationDate] [datetime2](7) NULL,
	[ModificationBy] [uniqueidentifier] NULL,
	[DeletionDate] [datetime2](7) NULL,
	[DeleteBy] [uniqueidentifier] NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Resource] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 6/10/2024 4:48:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[CreationDate] [datetime2](7) NOT NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[ModificationDate] [datetime2](7) NULL,
	[ModificationBy] [uniqueidentifier] NULL,
	[DeletionDate] [datetime2](7) NULL,
	[DeleteBy] [uniqueidentifier] NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Room]    Script Date: 6/10/2024 4:48:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Room](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Status] [int] NULL,
	[CreationDate] [datetime2](7) NOT NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[ModificationDate] [datetime2](7) NULL,
	[ModificationBy] [uniqueidentifier] NULL,
	[DeletionDate] [datetime2](7) NULL,
	[DeleteBy] [uniqueidentifier] NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Room] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Schedule]    Script Date: 6/10/2024 4:48:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Schedule](
	[Id] [uniqueidentifier] NOT NULL,
	[ClassId] [uniqueidentifier] NOT NULL,
	[SlotId] [uniqueidentifier] NOT NULL,
	[DayInWeek] [nvarchar](max) NULL,
	[StartDate] [datetime2](7) NULL,
	[StartTime] [datetime2](7) NULL,
	[EndTime] [datetime2](7) NULL,
	[CreationDate] [datetime2](7) NOT NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[ModificationDate] [datetime2](7) NULL,
	[ModificationBy] [uniqueidentifier] NULL,
	[DeletionDate] [datetime2](7) NULL,
	[DeleteBy] [uniqueidentifier] NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Schedule] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ScheduleRoom]    Script Date: 6/10/2024 4:48:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ScheduleRoom](
	[Id] [uniqueidentifier] NOT NULL,
	[RoomId] [uniqueidentifier] NULL,
	[ScheduleId] [uniqueidentifier] NULL,
	[StartDate] [datetime2](7) NULL,
	[EndDate] [datetime2](7) NULL,
	[Status] [int] NULL,
	[CreationDate] [datetime2](7) NOT NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[ModificationDate] [datetime2](7) NULL,
	[ModificationBy] [uniqueidentifier] NULL,
	[DeletionDate] [datetime2](7) NULL,
	[DeleteBy] [uniqueidentifier] NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_ScheduleRoom] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Skill]    Script Date: 6/10/2024 4:48:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Skill](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[CreationDate] [datetime2](7) NOT NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[ModificationDate] [datetime2](7) NULL,
	[ModificationBy] [uniqueidentifier] NULL,
	[DeletionDate] [datetime2](7) NULL,
	[DeleteBy] [uniqueidentifier] NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Skill] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SkillCertificate]    Script Date: 6/10/2024 4:48:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SkillCertificate](
	[Id] [uniqueidentifier] NOT NULL,
	[UserAccountId] [uniqueidentifier] NOT NULL,
	[SkillId] [uniqueidentifier] NOT NULL,
	[Url] [nvarchar](max) NOT NULL,
	[CreationDate] [datetime2](7) NOT NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[ModificationDate] [datetime2](7) NULL,
	[ModificationBy] [uniqueidentifier] NULL,
	[DeletionDate] [datetime2](7) NULL,
	[DeleteBy] [uniqueidentifier] NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_SkillCertificate] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Slot]    Script Date: 6/10/2024 4:48:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Slot](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[StartTime] [time](7) NOT NULL,
	[EndTime] [time](7) NOT NULL,
	[SlotType] [int] NOT NULL,
	[CreationDate] [datetime2](7) NOT NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[ModificationDate] [datetime2](7) NULL,
	[ModificationBy] [uniqueidentifier] NULL,
	[DeletionDate] [datetime2](7) NULL,
	[DeleteBy] [uniqueidentifier] NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Slot] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tag]    Script Date: 6/10/2024 4:48:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tag](
	[Id] [uniqueidentifier] NOT NULL,
	[TagName] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[TagType] [int] NOT NULL,
	[CreationDate] [datetime2](7) NOT NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[ModificationDate] [datetime2](7) NULL,
	[ModificationBy] [uniqueidentifier] NULL,
	[DeletionDate] [datetime2](7) NULL,
	[DeleteBy] [uniqueidentifier] NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Tag] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TeachingClassHistory]    Script Date: 6/10/2024 4:48:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TeachingClassHistory](
	[Id] [uniqueidentifier] NOT NULL,
	[UserAccountId] [uniqueidentifier] NOT NULL,
	[ClassId] [uniqueidentifier] NOT NULL,
	[StartDate] [datetime2](7) NOT NULL,
	[EndDate] [datetime2](7) NOT NULL,
	[TeachingStatus] [int] NOT NULL,
	[CreationDate] [datetime2](7) NOT NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[ModificationDate] [datetime2](7) NULL,
	[ModificationBy] [uniqueidentifier] NULL,
	[DeletionDate] [datetime2](7) NULL,
	[DeleteBy] [uniqueidentifier] NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_TeachingClassHistory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transaction]    Script Date: 6/10/2024 4:48:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transaction](
	[Id] [uniqueidentifier] NOT NULL,
	[OrderDetailId] [uniqueidentifier] NULL,
	[BankingAccountNumber] [nvarchar](max) NULL,
	[BankingNumber] [nvarchar](max) NULL,
	[BankName] [nvarchar](max) NULL,
	[CourseName] [nvarchar](max) NULL,
	[CourseQuantity] [float] NULL,
	[TotalAmount] [float] NULL,
	[Message] [nvarchar](max) NULL,
	[PayDate] [datetime2](7) NULL,
	[InstallmentTerm] [int] NULL,
	[InstallmentPeriod] [datetime2](7) NULL,
	[StatusTransaction] [int] NULL,
	[ParentsTransaction] [uniqueidentifier] NULL,
	[CreationDate] [datetime2](7) NOT NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[ModificationDate] [datetime2](7) NULL,
	[ModificationBy] [uniqueidentifier] NULL,
	[DeletionDate] [datetime2](7) NULL,
	[DeleteBy] [uniqueidentifier] NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Transaction] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserAccount]    Script Date: 6/10/2024 4:48:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserAccount](
	[Id] [uniqueidentifier] NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL,
	[LocationId] [uniqueidentifier] NULL,
	[UserName] [nvarchar](max) NOT NULL,
	[PasswordHash] [nvarchar](max) NOT NULL,
	[FullName] [nvarchar](max) NOT NULL,
	[GenderType] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[Phone] [nvarchar](max) NOT NULL,
	[Address] [nvarchar](max) NULL,
	[DateOfBirth] [datetime2](7) NULL,
	[Avatar] [nvarchar](max) NULL,
	[OTP] [nvarchar](max) NULL,
	[BankAccountNumber] [nvarchar](max) NULL,
	[BankAccountName] [nvarchar](max) NULL,
	[BankName] [nvarchar](max) NULL,
	[Status] [int] NOT NULL,
	[CreationDate] [datetime2](7) NOT NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[ModificationDate] [datetime2](7) NULL,
	[ModificationBy] [uniqueidentifier] NULL,
	[DeletionDate] [datetime2](7) NULL,
	[DeleteBy] [uniqueidentifier] NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_UserAccount] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Index [IX_AdviseRequest_LocationId]    Script Date: 6/10/2024 4:48:30 PM ******/
CREATE NONCLUSTERED INDEX [IX_AdviseRequest_LocationId] ON [dbo].[AdviseRequest]
(
	[LocationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_AdviseRequest_SlotId]    Script Date: 6/10/2024 4:48:30 PM ******/
CREATE NONCLUSTERED INDEX [IX_AdviseRequest_SlotId] ON [dbo].[AdviseRequest]
(
	[SlotId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_AdviseRequest_UserId]    Script Date: 6/10/2024 4:48:30 PM ******/
CREATE NONCLUSTERED INDEX [IX_AdviseRequest_UserId] ON [dbo].[AdviseRequest]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Attendance_ChildrenProfileId]    Script Date: 6/10/2024 4:48:30 PM ******/
CREATE NONCLUSTERED INDEX [IX_Attendance_ChildrenProfileId] ON [dbo].[Attendance]
(
	[ChildrenProfileId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Attendance_ScheduleId]    Script Date: 6/10/2024 4:48:30 PM ******/
CREATE NONCLUSTERED INDEX [IX_Attendance_ScheduleId] ON [dbo].[Attendance]
(
	[ScheduleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Blog_UserId]    Script Date: 6/10/2024 4:48:30 PM ******/
CREATE NONCLUSTERED INDEX [IX_Blog_UserId] ON [dbo].[Blog]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_BlogTag_TagsId]    Script Date: 6/10/2024 4:48:30 PM ******/
CREATE NONCLUSTERED INDEX [IX_BlogTag_TagsId] ON [dbo].[BlogTag]
(
	[TagsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_CategoryEquipmentLesson_LessonsId]    Script Date: 6/10/2024 4:48:30 PM ******/
CREATE NONCLUSTERED INDEX [IX_CategoryEquipmentLesson_LessonsId] ON [dbo].[CategoryEquipmentLesson]
(
	[LessonsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Certificate_ChildrenProfileId]    Script Date: 6/10/2024 4:48:30 PM ******/
CREATE NONCLUSTERED INDEX [IX_Certificate_ChildrenProfileId] ON [dbo].[Certificate]
(
	[ChildrenProfileId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Certificate_CourseId]    Script Date: 6/10/2024 4:48:30 PM ******/
CREATE NONCLUSTERED INDEX [IX_Certificate_CourseId] ON [dbo].[Certificate]
(
	[CourseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ChildrenAnswer_ChildrenProfileId]    Script Date: 6/10/2024 4:48:30 PM ******/
CREATE NONCLUSTERED INDEX [IX_ChildrenAnswer_ChildrenProfileId] ON [dbo].[ChildrenAnswer]
(
	[ChildrenProfileId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ChildrenAnswer_ExamId]    Script Date: 6/10/2024 4:48:30 PM ******/
CREATE NONCLUSTERED INDEX [IX_ChildrenAnswer_ExamId] ON [dbo].[ChildrenAnswer]
(
	[ExamId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ChildrenAnswer_QuestionId]    Script Date: 6/10/2024 4:48:30 PM ******/
CREATE NONCLUSTERED INDEX [IX_ChildrenAnswer_QuestionId] ON [dbo].[ChildrenAnswer]
(
	[QuestionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ChildrenProfile_UserId]    Script Date: 6/10/2024 4:48:30 PM ******/
CREATE NONCLUSTERED INDEX [IX_ChildrenProfile_UserId] ON [dbo].[ChildrenProfile]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Class_CourseId]    Script Date: 6/10/2024 4:48:30 PM ******/
CREATE NONCLUSTERED INDEX [IX_Class_CourseId] ON [dbo].[Class]
(
	[CourseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ConfigJobType_UserAccountId]    Script Date: 6/10/2024 4:48:30 PM ******/
CREATE NONCLUSTERED INDEX [IX_ConfigJobType_UserAccountId] ON [dbo].[ConfigJobType]
(
	[UserAccountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ConfigPointMultipliers_UserId]    Script Date: 6/10/2024 4:48:30 PM ******/
CREATE NONCLUSTERED INDEX [IX_ConfigPointMultipliers_UserId] ON [dbo].[ConfigPointMultipliers]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ConfigSystem_UserId]    Script Date: 6/10/2024 4:48:30 PM ******/
CREATE NONCLUSTERED INDEX [IX_ConfigSystem_UserId] ON [dbo].[ConfigSystem]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ConfigTheme_UserId]    Script Date: 6/10/2024 4:48:30 PM ******/
CREATE NONCLUSTERED INDEX [IX_ConfigTheme_UserId] ON [dbo].[ConfigTheme]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Contract_ConfigJobTypeId]    Script Date: 6/10/2024 4:48:30 PM ******/
CREATE NONCLUSTERED INDEX [IX_Contract_ConfigJobTypeId] ON [dbo].[Contract]
(
	[ConfigJobTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Contract_UserId]    Script Date: 6/10/2024 4:48:30 PM ******/
CREATE NONCLUSTERED INDEX [IX_Contract_UserId] ON [dbo].[Contract]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_DivisionUserAccount_DivisionId]    Script Date: 6/10/2024 4:48:30 PM ******/
CREATE NONCLUSTERED INDEX [IX_DivisionUserAccount_DivisionId] ON [dbo].[DivisionUserAccount]
(
	[DivisionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_DivisionUserAccount_UserAccountId]    Script Date: 6/10/2024 4:48:30 PM ******/
CREATE NONCLUSTERED INDEX [IX_DivisionUserAccount_UserAccountId] ON [dbo].[DivisionUserAccount]
(
	[UserAccountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Enrollment_ChildrenProfileId]    Script Date: 6/10/2024 4:48:30 PM ******/
CREATE NONCLUSTERED INDEX [IX_Enrollment_ChildrenProfileId] ON [dbo].[Enrollment]
(
	[ChildrenProfileId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Enrollment_ClassId]    Script Date: 6/10/2024 4:48:30 PM ******/
CREATE NONCLUSTERED INDEX [IX_Enrollment_ClassId] ON [dbo].[Enrollment]
(
	[ClassId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Enrollment_UserAccountId]    Script Date: 6/10/2024 4:48:30 PM ******/
CREATE NONCLUSTERED INDEX [IX_Enrollment_UserAccountId] ON [dbo].[Enrollment]
(
	[UserAccountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Equipment_CategoryEquipmentId]    Script Date: 6/10/2024 4:48:30 PM ******/
CREATE NONCLUSTERED INDEX [IX_Equipment_CategoryEquipmentId] ON [dbo].[Equipment]
(
	[CategoryEquipmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Equipment_RoomId]    Script Date: 6/10/2024 4:48:30 PM ******/
CREATE NONCLUSTERED INDEX [IX_Equipment_RoomId] ON [dbo].[Equipment]
(
	[RoomId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Exam_ClassId]    Script Date: 6/10/2024 4:48:30 PM ******/
CREATE NONCLUSTERED INDEX [IX_Exam_ClassId] ON [dbo].[Exam]
(
	[ClassId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Exam_CourseId]    Script Date: 6/10/2024 4:48:30 PM ******/
CREATE NONCLUSTERED INDEX [IX_Exam_CourseId] ON [dbo].[Exam]
(
	[CourseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Feedback_ClassId]    Script Date: 6/10/2024 4:48:30 PM ******/
CREATE NONCLUSTERED INDEX [IX_Feedback_ClassId] ON [dbo].[Feedback]
(
	[ClassId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Feedback_UserId]    Script Date: 6/10/2024 4:48:30 PM ******/
CREATE NONCLUSTERED INDEX [IX_Feedback_UserId] ON [dbo].[Feedback]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Lesson_CourseId]    Script Date: 6/10/2024 4:48:30 PM ******/
CREATE NONCLUSTERED INDEX [IX_Lesson_CourseId] ON [dbo].[Lesson]
(
	[CourseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_LogEquipment_CategoryEquipmentId]    Script Date: 6/10/2024 4:48:30 PM ******/
CREATE NONCLUSTERED INDEX [IX_LogEquipment_CategoryEquipmentId] ON [dbo].[LogEquipment]
(
	[CategoryEquipmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_LogEquipment_EquipmentId]    Script Date: 6/10/2024 4:48:30 PM ******/
CREATE NONCLUSTERED INDEX [IX_LogEquipment_EquipmentId] ON [dbo].[LogEquipment]
(
	[EquipmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_LogEquipment_UserAccountId]    Script Date: 6/10/2024 4:48:30 PM ******/
CREATE NONCLUSTERED INDEX [IX_LogEquipment_UserAccountId] ON [dbo].[LogEquipment]
(
	[UserAccountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_NotificationUser_NotificationId]    Script Date: 6/10/2024 4:48:30 PM ******/
CREATE NONCLUSTERED INDEX [IX_NotificationUser_NotificationId] ON [dbo].[NotificationUser]
(
	[NotificationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_NotificationUser_UserId]    Script Date: 6/10/2024 4:48:30 PM ******/
CREATE NONCLUSTERED INDEX [IX_NotificationUser_UserId] ON [dbo].[NotificationUser]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Order_UserId]    Script Date: 6/10/2024 4:48:30 PM ******/
CREATE NONCLUSTERED INDEX [IX_Order_UserId] ON [dbo].[Order]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_OrderDetail_ChildrenProfileId]    Script Date: 6/10/2024 4:48:30 PM ******/
CREATE NONCLUSTERED INDEX [IX_OrderDetail_ChildrenProfileId] ON [dbo].[OrderDetail]
(
	[ChildrenProfileId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_OrderDetail_CourseId]    Script Date: 6/10/2024 4:48:30 PM ******/
CREATE NONCLUSTERED INDEX [IX_OrderDetail_CourseId] ON [dbo].[OrderDetail]
(
	[CourseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_OrderDetail_OrderId]    Script Date: 6/10/2024 4:48:30 PM ******/
CREATE NONCLUSTERED INDEX [IX_OrderDetail_OrderId] ON [dbo].[OrderDetail]
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Question_LessionId]    Script Date: 6/10/2024 4:48:30 PM ******/
CREATE NONCLUSTERED INDEX [IX_Question_LessionId] ON [dbo].[Question]
(
	[LessionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Rating_CourseId]    Script Date: 6/10/2024 4:48:30 PM ******/
CREATE NONCLUSTERED INDEX [IX_Rating_CourseId] ON [dbo].[Rating]
(
	[CourseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Rating_UserAccountId]    Script Date: 6/10/2024 4:48:30 PM ******/
CREATE NONCLUSTERED INDEX [IX_Rating_UserAccountId] ON [dbo].[Rating]
(
	[UserAccountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_RequestUserAccount_RecieverId]    Script Date: 6/10/2024 4:48:30 PM ******/
CREATE NONCLUSTERED INDEX [IX_RequestUserAccount_RecieverId] ON [dbo].[RequestUserAccount]
(
	[RecieverId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_RequestUserAccount_RequestId]    Script Date: 6/10/2024 4:48:30 PM ******/
CREATE NONCLUSTERED INDEX [IX_RequestUserAccount_RequestId] ON [dbo].[RequestUserAccount]
(
	[RequestId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Resource_CourseId]    Script Date: 6/10/2024 4:48:30 PM ******/
CREATE NONCLUSTERED INDEX [IX_Resource_CourseId] ON [dbo].[Resource]
(
	[CourseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Schedule_ClassId]    Script Date: 6/10/2024 4:48:30 PM ******/
CREATE NONCLUSTERED INDEX [IX_Schedule_ClassId] ON [dbo].[Schedule]
(
	[ClassId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Schedule_SlotId]    Script Date: 6/10/2024 4:48:30 PM ******/
CREATE NONCLUSTERED INDEX [IX_Schedule_SlotId] ON [dbo].[Schedule]
(
	[SlotId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ScheduleRoom_RoomId]    Script Date: 6/10/2024 4:48:30 PM ******/
CREATE NONCLUSTERED INDEX [IX_ScheduleRoom_RoomId] ON [dbo].[ScheduleRoom]
(
	[RoomId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ScheduleRoom_ScheduleId]    Script Date: 6/10/2024 4:48:30 PM ******/
CREATE NONCLUSTERED INDEX [IX_ScheduleRoom_ScheduleId] ON [dbo].[ScheduleRoom]
(
	[ScheduleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_SkillCertificate_SkillId]    Script Date: 6/10/2024 4:48:30 PM ******/
CREATE NONCLUSTERED INDEX [IX_SkillCertificate_SkillId] ON [dbo].[SkillCertificate]
(
	[SkillId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_SkillCertificate_UserAccountId]    Script Date: 6/10/2024 4:48:30 PM ******/
CREATE NONCLUSTERED INDEX [IX_SkillCertificate_UserAccountId] ON [dbo].[SkillCertificate]
(
	[UserAccountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_TeachingClassHistory_ClassId]    Script Date: 6/10/2024 4:48:30 PM ******/
CREATE NONCLUSTERED INDEX [IX_TeachingClassHistory_ClassId] ON [dbo].[TeachingClassHistory]
(
	[ClassId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_TeachingClassHistory_UserAccountId]    Script Date: 6/10/2024 4:48:30 PM ******/
CREATE NONCLUSTERED INDEX [IX_TeachingClassHistory_UserAccountId] ON [dbo].[TeachingClassHistory]
(
	[UserAccountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Transaction_OrderDetailId]    Script Date: 6/10/2024 4:48:30 PM ******/
CREATE NONCLUSTERED INDEX [IX_Transaction_OrderDetailId] ON [dbo].[Transaction]
(
	[OrderDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserAccount_LocationId]    Script Date: 6/10/2024 4:48:30 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserAccount_LocationId] ON [dbo].[UserAccount]
(
	[LocationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserAccount_RoleId]    Script Date: 6/10/2024 4:48:30 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserAccount_RoleId] ON [dbo].[UserAccount]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AdviseRequest]  WITH CHECK ADD  CONSTRAINT [FK_AdviseRequest_Location_LocationId] FOREIGN KEY([LocationId])
REFERENCES [dbo].[Location] ([Id])
GO
ALTER TABLE [dbo].[AdviseRequest] CHECK CONSTRAINT [FK_AdviseRequest_Location_LocationId]
GO
ALTER TABLE [dbo].[AdviseRequest]  WITH CHECK ADD  CONSTRAINT [FK_AdviseRequest_Slot_SlotId] FOREIGN KEY([SlotId])
REFERENCES [dbo].[Slot] ([Id])
GO
ALTER TABLE [dbo].[AdviseRequest] CHECK CONSTRAINT [FK_AdviseRequest_Slot_SlotId]
GO
ALTER TABLE [dbo].[AdviseRequest]  WITH CHECK ADD  CONSTRAINT [FK_AdviseRequest_UserAccount_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[UserAccount] ([Id])
GO
ALTER TABLE [dbo].[AdviseRequest] CHECK CONSTRAINT [FK_AdviseRequest_UserAccount_UserId]
GO
ALTER TABLE [dbo].[Attendance]  WITH CHECK ADD  CONSTRAINT [FK_Attendance_ChildrenProfile_ChildrenProfileId] FOREIGN KEY([ChildrenProfileId])
REFERENCES [dbo].[ChildrenProfile] ([Id])
GO
ALTER TABLE [dbo].[Attendance] CHECK CONSTRAINT [FK_Attendance_ChildrenProfile_ChildrenProfileId]
GO
ALTER TABLE [dbo].[Attendance]  WITH CHECK ADD  CONSTRAINT [FK_Attendance_Schedule_ScheduleId] FOREIGN KEY([ScheduleId])
REFERENCES [dbo].[Schedule] ([Id])
GO
ALTER TABLE [dbo].[Attendance] CHECK CONSTRAINT [FK_Attendance_Schedule_ScheduleId]
GO
ALTER TABLE [dbo].[Blog]  WITH CHECK ADD  CONSTRAINT [FK_Blog_UserAccount_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[UserAccount] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Blog] CHECK CONSTRAINT [FK_Blog_UserAccount_UserId]
GO
ALTER TABLE [dbo].[BlogTag]  WITH CHECK ADD  CONSTRAINT [FK_BlogTag_Blog_BlogsId] FOREIGN KEY([BlogsId])
REFERENCES [dbo].[Blog] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BlogTag] CHECK CONSTRAINT [FK_BlogTag_Blog_BlogsId]
GO
ALTER TABLE [dbo].[BlogTag]  WITH CHECK ADD  CONSTRAINT [FK_BlogTag_Tag_TagsId] FOREIGN KEY([TagsId])
REFERENCES [dbo].[Tag] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BlogTag] CHECK CONSTRAINT [FK_BlogTag_Tag_TagsId]
GO
ALTER TABLE [dbo].[CategoryEquipmentLesson]  WITH CHECK ADD  CONSTRAINT [FK_CategoryEquipmentLesson_CategoryEquipment_CategoryEquipmentsId] FOREIGN KEY([CategoryEquipmentsId])
REFERENCES [dbo].[CategoryEquipment] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CategoryEquipmentLesson] CHECK CONSTRAINT [FK_CategoryEquipmentLesson_CategoryEquipment_CategoryEquipmentsId]
GO
ALTER TABLE [dbo].[CategoryEquipmentLesson]  WITH CHECK ADD  CONSTRAINT [FK_CategoryEquipmentLesson_Lesson_LessonsId] FOREIGN KEY([LessonsId])
REFERENCES [dbo].[Lesson] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CategoryEquipmentLesson] CHECK CONSTRAINT [FK_CategoryEquipmentLesson_Lesson_LessonsId]
GO
ALTER TABLE [dbo].[Certificate]  WITH CHECK ADD  CONSTRAINT [FK_Certificate_ChildrenProfile_ChildrenProfileId] FOREIGN KEY([ChildrenProfileId])
REFERENCES [dbo].[ChildrenProfile] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Certificate] CHECK CONSTRAINT [FK_Certificate_ChildrenProfile_ChildrenProfileId]
GO
ALTER TABLE [dbo].[Certificate]  WITH CHECK ADD  CONSTRAINT [FK_Certificate_Course_CourseId] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Course] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Certificate] CHECK CONSTRAINT [FK_Certificate_Course_CourseId]
GO
ALTER TABLE [dbo].[ChildrenAnswer]  WITH CHECK ADD  CONSTRAINT [FK_ChildrenAnswer_ChildrenProfile_ChildrenProfileId] FOREIGN KEY([ChildrenProfileId])
REFERENCES [dbo].[ChildrenProfile] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ChildrenAnswer] CHECK CONSTRAINT [FK_ChildrenAnswer_ChildrenProfile_ChildrenProfileId]
GO
ALTER TABLE [dbo].[ChildrenAnswer]  WITH CHECK ADD  CONSTRAINT [FK_ChildrenAnswer_Exam_ExamId] FOREIGN KEY([ExamId])
REFERENCES [dbo].[Exam] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ChildrenAnswer] CHECK CONSTRAINT [FK_ChildrenAnswer_Exam_ExamId]
GO
ALTER TABLE [dbo].[ChildrenAnswer]  WITH CHECK ADD  CONSTRAINT [FK_ChildrenAnswer_Question_QuestionId] FOREIGN KEY([QuestionId])
REFERENCES [dbo].[Question] ([Id])
GO
ALTER TABLE [dbo].[ChildrenAnswer] CHECK CONSTRAINT [FK_ChildrenAnswer_Question_QuestionId]
GO
ALTER TABLE [dbo].[ChildrenProfile]  WITH CHECK ADD  CONSTRAINT [FK_ChildrenProfile_UserAccount_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[UserAccount] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ChildrenProfile] CHECK CONSTRAINT [FK_ChildrenProfile_UserAccount_UserId]
GO
ALTER TABLE [dbo].[Class]  WITH CHECK ADD  CONSTRAINT [FK_Class_Course_CourseId] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Course] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Class] CHECK CONSTRAINT [FK_Class_Course_CourseId]
GO
ALTER TABLE [dbo].[ConfigJobType]  WITH CHECK ADD  CONSTRAINT [FK_ConfigJobType_UserAccount_UserAccountId] FOREIGN KEY([UserAccountId])
REFERENCES [dbo].[UserAccount] ([Id])
GO
ALTER TABLE [dbo].[ConfigJobType] CHECK CONSTRAINT [FK_ConfigJobType_UserAccount_UserAccountId]
GO
ALTER TABLE [dbo].[ConfigPointMultipliers]  WITH CHECK ADD  CONSTRAINT [FK_ConfigPointMultipliers_UserAccount_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[UserAccount] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ConfigPointMultipliers] CHECK CONSTRAINT [FK_ConfigPointMultipliers_UserAccount_UserId]
GO
ALTER TABLE [dbo].[ConfigSystem]  WITH CHECK ADD  CONSTRAINT [FK_ConfigSystem_UserAccount_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[UserAccount] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ConfigSystem] CHECK CONSTRAINT [FK_ConfigSystem_UserAccount_UserId]
GO
ALTER TABLE [dbo].[ConfigTheme]  WITH CHECK ADD  CONSTRAINT [FK_ConfigTheme_UserAccount_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[UserAccount] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ConfigTheme] CHECK CONSTRAINT [FK_ConfigTheme_UserAccount_UserId]
GO
ALTER TABLE [dbo].[Contract]  WITH CHECK ADD  CONSTRAINT [FK_Contract_ConfigJobType_ConfigJobTypeId] FOREIGN KEY([ConfigJobTypeId])
REFERENCES [dbo].[ConfigJobType] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Contract] CHECK CONSTRAINT [FK_Contract_ConfigJobType_ConfigJobTypeId]
GO
ALTER TABLE [dbo].[Contract]  WITH CHECK ADD  CONSTRAINT [FK_Contract_UserAccount_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[UserAccount] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Contract] CHECK CONSTRAINT [FK_Contract_UserAccount_UserId]
GO
ALTER TABLE [dbo].[DivisionUserAccount]  WITH CHECK ADD  CONSTRAINT [FK_DivisionUserAccount_Division_DivisionId] FOREIGN KEY([DivisionId])
REFERENCES [dbo].[Division] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DivisionUserAccount] CHECK CONSTRAINT [FK_DivisionUserAccount_Division_DivisionId]
GO
ALTER TABLE [dbo].[DivisionUserAccount]  WITH CHECK ADD  CONSTRAINT [FK_DivisionUserAccount_UserAccount_UserAccountId] FOREIGN KEY([UserAccountId])
REFERENCES [dbo].[UserAccount] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DivisionUserAccount] CHECK CONSTRAINT [FK_DivisionUserAccount_UserAccount_UserAccountId]
GO
ALTER TABLE [dbo].[Enrollment]  WITH CHECK ADD  CONSTRAINT [FK_Enrollment_ChildrenProfile_ChildrenProfileId] FOREIGN KEY([ChildrenProfileId])
REFERENCES [dbo].[ChildrenProfile] ([Id])
GO
ALTER TABLE [dbo].[Enrollment] CHECK CONSTRAINT [FK_Enrollment_ChildrenProfile_ChildrenProfileId]
GO
ALTER TABLE [dbo].[Enrollment]  WITH CHECK ADD  CONSTRAINT [FK_Enrollment_Class_ClassId] FOREIGN KEY([ClassId])
REFERENCES [dbo].[Class] ([Id])
GO
ALTER TABLE [dbo].[Enrollment] CHECK CONSTRAINT [FK_Enrollment_Class_ClassId]
GO
ALTER TABLE [dbo].[Enrollment]  WITH CHECK ADD  CONSTRAINT [FK_Enrollment_UserAccount_UserAccountId] FOREIGN KEY([UserAccountId])
REFERENCES [dbo].[UserAccount] ([Id])
GO
ALTER TABLE [dbo].[Enrollment] CHECK CONSTRAINT [FK_Enrollment_UserAccount_UserAccountId]
GO
ALTER TABLE [dbo].[Equipment]  WITH CHECK ADD  CONSTRAINT [FK_Equipment_CategoryEquipment_CategoryEquipmentId] FOREIGN KEY([CategoryEquipmentId])
REFERENCES [dbo].[CategoryEquipment] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Equipment] CHECK CONSTRAINT [FK_Equipment_CategoryEquipment_CategoryEquipmentId]
GO
ALTER TABLE [dbo].[Equipment]  WITH CHECK ADD  CONSTRAINT [FK_Equipment_Room_RoomId] FOREIGN KEY([RoomId])
REFERENCES [dbo].[Room] ([Id])
GO
ALTER TABLE [dbo].[Equipment] CHECK CONSTRAINT [FK_Equipment_Room_RoomId]
GO
ALTER TABLE [dbo].[Exam]  WITH CHECK ADD  CONSTRAINT [FK_Exam_Class_ClassId] FOREIGN KEY([ClassId])
REFERENCES [dbo].[Class] ([Id])
GO
ALTER TABLE [dbo].[Exam] CHECK CONSTRAINT [FK_Exam_Class_ClassId]
GO
ALTER TABLE [dbo].[Exam]  WITH CHECK ADD  CONSTRAINT [FK_Exam_Course_CourseId] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Course] ([Id])
GO
ALTER TABLE [dbo].[Exam] CHECK CONSTRAINT [FK_Exam_Course_CourseId]
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD  CONSTRAINT [FK_Feedback_Class_ClassId] FOREIGN KEY([ClassId])
REFERENCES [dbo].[Class] ([Id])
GO
ALTER TABLE [dbo].[Feedback] CHECK CONSTRAINT [FK_Feedback_Class_ClassId]
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD  CONSTRAINT [FK_Feedback_UserAccount_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[UserAccount] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Feedback] CHECK CONSTRAINT [FK_Feedback_UserAccount_UserId]
GO
ALTER TABLE [dbo].[Lesson]  WITH CHECK ADD  CONSTRAINT [FK_Lesson_Course_CourseId] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Course] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Lesson] CHECK CONSTRAINT [FK_Lesson_Course_CourseId]
GO
ALTER TABLE [dbo].[LogEquipment]  WITH CHECK ADD  CONSTRAINT [FK_LogEquipment_CategoryEquipment_CategoryEquipmentId] FOREIGN KEY([CategoryEquipmentId])
REFERENCES [dbo].[CategoryEquipment] ([Id])
GO
ALTER TABLE [dbo].[LogEquipment] CHECK CONSTRAINT [FK_LogEquipment_CategoryEquipment_CategoryEquipmentId]
GO
ALTER TABLE [dbo].[LogEquipment]  WITH CHECK ADD  CONSTRAINT [FK_LogEquipment_Equipment_EquipmentId] FOREIGN KEY([EquipmentId])
REFERENCES [dbo].[Equipment] ([Id])
GO
ALTER TABLE [dbo].[LogEquipment] CHECK CONSTRAINT [FK_LogEquipment_Equipment_EquipmentId]
GO
ALTER TABLE [dbo].[LogEquipment]  WITH CHECK ADD  CONSTRAINT [FK_LogEquipment_UserAccount_UserAccountId] FOREIGN KEY([UserAccountId])
REFERENCES [dbo].[UserAccount] ([Id])
GO
ALTER TABLE [dbo].[LogEquipment] CHECK CONSTRAINT [FK_LogEquipment_UserAccount_UserAccountId]
GO
ALTER TABLE [dbo].[NotificationUser]  WITH CHECK ADD  CONSTRAINT [FK_NotificationUser_Notification_NotificationId] FOREIGN KEY([NotificationId])
REFERENCES [dbo].[Notification] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[NotificationUser] CHECK CONSTRAINT [FK_NotificationUser_Notification_NotificationId]
GO
ALTER TABLE [dbo].[NotificationUser]  WITH CHECK ADD  CONSTRAINT [FK_NotificationUser_UserAccount_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[UserAccount] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[NotificationUser] CHECK CONSTRAINT [FK_NotificationUser_UserAccount_UserId]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_UserAccount_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[UserAccount] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_UserAccount_UserId]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_ChildrenProfile_ChildrenProfileId] FOREIGN KEY([ChildrenProfileId])
REFERENCES [dbo].[ChildrenProfile] ([Id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_ChildrenProfile_ChildrenProfileId]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Course_CourseId] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Course] ([Id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Course_CourseId]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Order_OrderId] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Order_OrderId]
GO
ALTER TABLE [dbo].[Question]  WITH CHECK ADD  CONSTRAINT [FK_Question_Lesson_LessionId] FOREIGN KEY([LessionId])
REFERENCES [dbo].[Lesson] ([Id])
GO
ALTER TABLE [dbo].[Question] CHECK CONSTRAINT [FK_Question_Lesson_LessionId]
GO
ALTER TABLE [dbo].[Rating]  WITH CHECK ADD  CONSTRAINT [FK_Rating_Course_CourseId] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Course] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Rating] CHECK CONSTRAINT [FK_Rating_Course_CourseId]
GO
ALTER TABLE [dbo].[Rating]  WITH CHECK ADD  CONSTRAINT [FK_Rating_UserAccount_UserAccountId] FOREIGN KEY([UserAccountId])
REFERENCES [dbo].[UserAccount] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Rating] CHECK CONSTRAINT [FK_Rating_UserAccount_UserAccountId]
GO
ALTER TABLE [dbo].[RequestUserAccount]  WITH CHECK ADD  CONSTRAINT [FK_RequestUserAccount_Request_RequestId] FOREIGN KEY([RequestId])
REFERENCES [dbo].[Request] ([Id])
GO
ALTER TABLE [dbo].[RequestUserAccount] CHECK CONSTRAINT [FK_RequestUserAccount_Request_RequestId]
GO
ALTER TABLE [dbo].[RequestUserAccount]  WITH CHECK ADD  CONSTRAINT [FK_RequestUserAccount_UserAccount_RecieverId] FOREIGN KEY([RecieverId])
REFERENCES [dbo].[UserAccount] ([Id])
GO
ALTER TABLE [dbo].[RequestUserAccount] CHECK CONSTRAINT [FK_RequestUserAccount_UserAccount_RecieverId]
GO
ALTER TABLE [dbo].[Resource]  WITH CHECK ADD  CONSTRAINT [FK_Resource_Course_CourseId] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Course] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Resource] CHECK CONSTRAINT [FK_Resource_Course_CourseId]
GO
ALTER TABLE [dbo].[Schedule]  WITH CHECK ADD  CONSTRAINT [FK_Schedule_Class_ClassId] FOREIGN KEY([ClassId])
REFERENCES [dbo].[Class] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Schedule] CHECK CONSTRAINT [FK_Schedule_Class_ClassId]
GO
ALTER TABLE [dbo].[Schedule]  WITH CHECK ADD  CONSTRAINT [FK_Schedule_Slot_SlotId] FOREIGN KEY([SlotId])
REFERENCES [dbo].[Slot] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Schedule] CHECK CONSTRAINT [FK_Schedule_Slot_SlotId]
GO
ALTER TABLE [dbo].[ScheduleRoom]  WITH CHECK ADD  CONSTRAINT [FK_ScheduleRoom_Room_RoomId] FOREIGN KEY([RoomId])
REFERENCES [dbo].[Room] ([Id])
GO
ALTER TABLE [dbo].[ScheduleRoom] CHECK CONSTRAINT [FK_ScheduleRoom_Room_RoomId]
GO
ALTER TABLE [dbo].[ScheduleRoom]  WITH CHECK ADD  CONSTRAINT [FK_ScheduleRoom_Schedule_ScheduleId] FOREIGN KEY([ScheduleId])
REFERENCES [dbo].[Schedule] ([Id])
GO
ALTER TABLE [dbo].[ScheduleRoom] CHECK CONSTRAINT [FK_ScheduleRoom_Schedule_ScheduleId]
GO
ALTER TABLE [dbo].[SkillCertificate]  WITH CHECK ADD  CONSTRAINT [FK_SkillCertificate_Skill_SkillId] FOREIGN KEY([SkillId])
REFERENCES [dbo].[Skill] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SkillCertificate] CHECK CONSTRAINT [FK_SkillCertificate_Skill_SkillId]
GO
ALTER TABLE [dbo].[SkillCertificate]  WITH CHECK ADD  CONSTRAINT [FK_SkillCertificate_UserAccount_UserAccountId] FOREIGN KEY([UserAccountId])
REFERENCES [dbo].[UserAccount] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SkillCertificate] CHECK CONSTRAINT [FK_SkillCertificate_UserAccount_UserAccountId]
GO
ALTER TABLE [dbo].[TeachingClassHistory]  WITH CHECK ADD  CONSTRAINT [FK_TeachingClassHistory_Class_ClassId] FOREIGN KEY([ClassId])
REFERENCES [dbo].[Class] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TeachingClassHistory] CHECK CONSTRAINT [FK_TeachingClassHistory_Class_ClassId]
GO
ALTER TABLE [dbo].[TeachingClassHistory]  WITH CHECK ADD  CONSTRAINT [FK_TeachingClassHistory_UserAccount_UserAccountId] FOREIGN KEY([UserAccountId])
REFERENCES [dbo].[UserAccount] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TeachingClassHistory] CHECK CONSTRAINT [FK_TeachingClassHistory_UserAccount_UserAccountId]
GO
ALTER TABLE [dbo].[Transaction]  WITH CHECK ADD  CONSTRAINT [FK_Transaction_OrderDetail_OrderDetailId] FOREIGN KEY([OrderDetailId])
REFERENCES [dbo].[OrderDetail] ([Id])
GO
ALTER TABLE [dbo].[Transaction] CHECK CONSTRAINT [FK_Transaction_OrderDetail_OrderDetailId]
GO
ALTER TABLE [dbo].[UserAccount]  WITH CHECK ADD  CONSTRAINT [FK_UserAccount_Location_LocationId] FOREIGN KEY([LocationId])
REFERENCES [dbo].[Location] ([Id])
GO
ALTER TABLE [dbo].[UserAccount] CHECK CONSTRAINT [FK_UserAccount_Location_LocationId]
GO
ALTER TABLE [dbo].[UserAccount]  WITH CHECK ADD  CONSTRAINT [FK_UserAccount_Role_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserAccount] CHECK CONSTRAINT [FK_UserAccount_Role_RoleId]
GO
USE [master]
GO
ALTER DATABASE [KidProEdu] SET  READ_WRITE 
GO
