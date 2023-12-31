USE [master]
GO
/****** Object:  Database [Inicio_sesion]    Script Date: 06/10/2023 16:38:06 ******/
CREATE DATABASE [Inicio_sesion]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Inicio_sesion', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Inicio_sesion.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Inicio_sesion_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Inicio_sesion_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Inicio_sesion] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Inicio_sesion].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Inicio_sesion] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Inicio_sesion] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Inicio_sesion] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Inicio_sesion] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Inicio_sesion] SET ARITHABORT OFF 
GO
ALTER DATABASE [Inicio_sesion] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Inicio_sesion] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Inicio_sesion] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Inicio_sesion] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Inicio_sesion] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Inicio_sesion] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Inicio_sesion] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Inicio_sesion] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Inicio_sesion] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Inicio_sesion] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Inicio_sesion] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Inicio_sesion] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Inicio_sesion] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Inicio_sesion] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Inicio_sesion] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Inicio_sesion] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Inicio_sesion] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Inicio_sesion] SET RECOVERY FULL 
GO
ALTER DATABASE [Inicio_sesion] SET  MULTI_USER 
GO
ALTER DATABASE [Inicio_sesion] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Inicio_sesion] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Inicio_sesion] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Inicio_sesion] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Inicio_sesion] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Inicio_sesion] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Inicio_sesion', N'ON'
GO
ALTER DATABASE [Inicio_sesion] SET QUERY_STORE = OFF
GO
USE [Inicio_sesion]
GO
/****** Object:  User [victor]    Script Date: 06/10/2023 16:38:06 ******/
CREATE USER [victor] FOR LOGIN [victor] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [victor]
GO
/****** Object:  Table [dbo].[RegistrosIniciosSesion]    Script Date: 06/10/2023 16:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RegistrosIniciosSesion](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UsuarioId] [int] NULL,
	[FechaHora] [datetime] NOT NULL,
	[Accion] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[USUARIOS]    Script Date: 06/10/2023 16:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USUARIOS](
	[ID_US] [int] NOT NULL,
	[USUARIO] [varchar](60) NOT NULL,
	[CONTRASEÑA] [varchar](16) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_US] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[RegistrosIniciosSesion] ON 

INSERT [dbo].[RegistrosIniciosSesion] ([Id], [UsuarioId], [FechaHora], [Accion]) VALUES (1, 2, CAST(N'2023-10-06T16:33:16.300' AS DateTime), N'Inicio de sesión')
INSERT [dbo].[RegistrosIniciosSesion] ([Id], [UsuarioId], [FechaHora], [Accion]) VALUES (2, 2, CAST(N'2023-10-06T16:33:39.317' AS DateTime), N'Cierre de sesión')
INSERT [dbo].[RegistrosIniciosSesion] ([Id], [UsuarioId], [FechaHora], [Accion]) VALUES (3, 1, CAST(N'2023-10-06T16:34:14.327' AS DateTime), N'Inicio de sesión')
INSERT [dbo].[RegistrosIniciosSesion] ([Id], [UsuarioId], [FechaHora], [Accion]) VALUES (4, 1, CAST(N'2023-10-06T16:34:26.343' AS DateTime), N'Cierre de sesión')
SET IDENTITY_INSERT [dbo].[RegistrosIniciosSesion] OFF
GO
INSERT [dbo].[USUARIOS] ([ID_US], [USUARIO], [CONTRASEÑA]) VALUES (1, N'ProgramadorEC', N'123456p')
INSERT [dbo].[USUARIOS] ([ID_US], [USUARIO], [CONTRASEÑA]) VALUES (2, N'Programar', N'654321E')
GO
ALTER TABLE [dbo].[RegistrosIniciosSesion]  WITH CHECK ADD FOREIGN KEY([UsuarioId])
REFERENCES [dbo].[USUARIOS] ([ID_US])
GO
USE [master]
GO
ALTER DATABASE [Inicio_sesion] SET  READ_WRITE 
GO
