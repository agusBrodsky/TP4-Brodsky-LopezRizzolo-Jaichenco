USE [master]
GO
/****** Object:  Database [TP4]    Script Date: 2/6/2023 12:12:05 ******/
CREATE DATABASE [TP4]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TP4', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\TP4.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TP4_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\TP4_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [TP4] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TP4].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TP4] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TP4] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TP4] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TP4] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TP4] SET ARITHABORT OFF 
GO
ALTER DATABASE [TP4] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TP4] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TP4] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TP4] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TP4] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TP4] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TP4] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TP4] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TP4] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TP4] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TP4] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TP4] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TP4] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TP4] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TP4] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TP4] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TP4] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TP4] SET RECOVERY FULL 
GO
ALTER DATABASE [TP4] SET  MULTI_USER 
GO
ALTER DATABASE [TP4] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TP4] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TP4] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TP4] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TP4] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'TP4', N'ON'
GO
ALTER DATABASE [TP4] SET QUERY_STORE = OFF
GO
USE [TP4]
GO
/****** Object:  User [Personajes]    Script Date: 2/6/2023 12:12:05 ******/
CREATE USER [Personajes] FOR LOGIN [Personajes] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [alumno]    Script Date: 2/6/2023 12:12:05 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [Personajes]
GO
/****** Object:  Table [dbo].[Pelicula]    Script Date: 2/6/2023 12:12:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pelicula](
	[IdPelicula] [int] IDENTITY(1,1) NOT NULL,
	[Imagen] [varchar](max) NOT NULL,
	[Titulo] [varchar](50) NOT NULL,
	[FechaDeCreacion] [date] NOT NULL,
	[Calificacion] [int] NOT NULL,
 CONSTRAINT [PK_Pelicula o Serie] PRIMARY KEY CLUSTERED 
(
	[IdPelicula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Personaje]    Script Date: 2/6/2023 12:12:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Personaje](
	[IdPersonaje] [int] IDENTITY(1,1) NOT NULL,
	[fkIdPelicula] [int] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Imagen] [varchar](999) NOT NULL,
	[Edad] [int] NOT NULL,
	[Peso] [int] NOT NULL,
	[Historia] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Personaje] PRIMARY KEY CLUSTERED 
(
	[IdPersonaje] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PersonajeXPelicula]    Script Date: 2/6/2023 12:12:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PersonajeXPelicula](
	[fkPelicula] [int] NOT NULL,
	[fkPersonaje] [int] NOT NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Pelicula] ON 

INSERT [dbo].[Pelicula] ([IdPelicula], [Imagen], [Titulo], [FechaDeCreacion], [Calificacion]) VALUES (1, N'https://static.wikia.nocookie.net/doblaje/images/7/7c/La_princesa_y_el_sapo_-_payoff.jpg/revision/latest?cb=20181111214803&path-prefix=es', N'La Princesa y el Sapo', CAST(N'2004-02-02' AS Date), 5)
INSERT [dbo].[Pelicula] ([IdPelicula], [Imagen], [Titulo], [FechaDeCreacion], [Calificacion]) VALUES (3, N'youtube.com', N'Morro querido dame fuerza', CAST(N'2006-07-02' AS Date), 4)
SET IDENTITY_INSERT [dbo].[Pelicula] OFF
GO
SET IDENTITY_INSERT [dbo].[Personaje] ON 

INSERT [dbo].[Personaje] ([IdPersonaje], [fkIdPelicula], [Nombre], [Imagen], [Edad], [Peso], [Historia]) VALUES (1, 1, N'Marpe', N'youtube.com', 17, 70, N'hajajajaja marpe')
INSERT [dbo].[Personaje] ([IdPersonaje], [fkIdPelicula], [Nombre], [Imagen], [Edad], [Peso], [Historia]) VALUES (2, 1, N'Agus', N'youtube.com', 17, 65, N'jajaja chino')
SET IDENTITY_INSERT [dbo].[Personaje] OFF
GO
INSERT [dbo].[PersonajeXPelicula] ([fkPelicula], [fkPersonaje]) VALUES (1, 7)
INSERT [dbo].[PersonajeXPelicula] ([fkPelicula], [fkPersonaje]) VALUES (2, 6)
INSERT [dbo].[PersonajeXPelicula] ([fkPelicula], [fkPersonaje]) VALUES (3, 6)
GO
USE [master]
GO
ALTER DATABASE [TP4] SET  READ_WRITE 
GO
