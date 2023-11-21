USE [master]
GO
/****** Object:  Database [FuthubBD]    Script Date: 21/11/2023 08:23:33 ******/
CREATE DATABASE [FuthubBD]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FuthubBD', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\FuthubBD.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'FuthubBD_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\FuthubBD_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [FuthubBD] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FuthubBD].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FuthubBD] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FuthubBD] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FuthubBD] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FuthubBD] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FuthubBD] SET ARITHABORT OFF 
GO
ALTER DATABASE [FuthubBD] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FuthubBD] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FuthubBD] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FuthubBD] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FuthubBD] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FuthubBD] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FuthubBD] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FuthubBD] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FuthubBD] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FuthubBD] SET  DISABLE_BROKER 
GO
ALTER DATABASE [FuthubBD] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FuthubBD] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FuthubBD] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FuthubBD] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FuthubBD] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FuthubBD] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FuthubBD] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FuthubBD] SET RECOVERY FULL 
GO
ALTER DATABASE [FuthubBD] SET  MULTI_USER 
GO
ALTER DATABASE [FuthubBD] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FuthubBD] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FuthubBD] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FuthubBD] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FuthubBD] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'FuthubBD', N'ON'
GO
ALTER DATABASE [FuthubBD] SET QUERY_STORE = OFF
GO
USE [FuthubBD]
GO
/****** Object:  User [alumno]    Script Date: 21/11/2023 08:23:33 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Comentario]    Script Date: 21/11/2023 08:23:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comentario](
	[IdComentario] [int] IDENTITY(1,1) NOT NULL,
	[IdUsuario] [int] NOT NULL,
	[IdJugador] [int] NOT NULL,
	[Contenido] [varchar](500) NOT NULL,
	[Likes] [int] NOT NULL,
 CONSTRAINT [PK_Comentario] PRIMARY KEY CLUSTERED 
(
	[IdComentario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Equipo]    Script Date: 21/11/2023 08:23:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Equipo](
	[IdEquipo] [int] IDENTITY(1,1) NOT NULL,
	[IdPais] [int] NOT NULL,
	[Imagen] [varchar](500) NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Descripcion] [varchar](500) NOT NULL,
 CONSTRAINT [PK_Equipo] PRIMARY KEY CLUSTERED 
(
	[IdEquipo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Jugador]    Script Date: 21/11/2023 08:23:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Jugador](
	[IdJugador] [int] IDENTITY(1,1) NOT NULL,
	[IdPais] [int] NOT NULL,
	[IdEquipoActual] [int] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[ImagenJugador] [varchar](5000) NULL,
	[Edad] [int] NOT NULL,
	[Descripcion] [varchar](500) NOT NULL,
	[Posicion] [varchar](40) NOT NULL,
	[PartidosJugados] [int] NOT NULL,
	[Goles] [int] NOT NULL,
	[Likes] [int] NOT NULL,
	[Dislikes] [int] NOT NULL,
 CONSTRAINT [PK_Jugador] PRIMARY KEY CLUSTERED 
(
	[IdJugador] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pais]    Script Date: 21/11/2023 08:23:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pais](
	[IdPais] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Imagen] [varchar](50) NULL,
 CONSTRAINT [PK_Pais] PRIMARY KEY CLUSTERED 
(
	[IdPais] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Titulos]    Script Date: 21/11/2023 08:23:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Titulos](
	[IdTitulo] [int] IDENTITY(1,1) NOT NULL,
	[IdPais] [int] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Imagen] [varchar](500) NOT NULL,
 CONSTRAINT [PK_Titulos] PRIMARY KEY CLUSTERED 
(
	[IdTitulo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TituloXEquipo]    Script Date: 21/11/2023 08:23:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TituloXEquipo](
	[IdTituloXEquipo] [int] IDENTITY(1,1) NOT NULL,
	[IdEquipo] [int] NOT NULL,
	[IdTitulo] [int] NOT NULL,
	[Año] [int] NOT NULL,
 CONSTRAINT [PK_TituloXEquipo] PRIMARY KEY CLUSTERED 
(
	[IdTituloXEquipo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TituloXJugador]    Script Date: 21/11/2023 08:23:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TituloXJugador](
	[IdTituloGanado] [int] IDENTITY(1,1) NOT NULL,
	[IdJugador] [int] NOT NULL,
	[IdTitulo] [int] NOT NULL,
	[Año] [int] NOT NULL,
 CONSTRAINT [PK_TituloXJugador] PRIMARY KEY CLUSTERED 
(
	[IdTituloGanado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 21/11/2023 08:23:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[IdUsuario] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](50) NOT NULL,
	[Mail] [varchar](50) NOT NULL,
	[Contraseña] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Equipo] ON 

INSERT [dbo].[Equipo] ([IdEquipo], [IdPais], [Imagen], [Nombre], [Descripcion]) VALUES (2, 1, N'https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/Escudo_del_C_A_River_Plate.svg/1200px-Escudo_del_C_A_River_Plate.svg.png', N'River Plate', N'River es un equipo de Argentina, es uno de los 5 denominados "Equipos grandes". Tiene una gran historia y para muchos es considerado el mas grande de su pais.')
INSERT [dbo].[Equipo] ([IdEquipo], [IdPais], [Imagen], [Nombre], [Descripcion]) VALUES (3, 1, NULL, N'Boca Juniors', N'Boca es un equipo de Argentina, es uno de los 5 denominados "Equipos grandes". Tiene una gran historia y para muchos es considerado el mas grande de su pais.')
INSERT [dbo].[Equipo] ([IdEquipo], [IdPais], [Imagen], [Nombre], [Descripcion]) VALUES (4, 1, NULL, N'Racing Club de Avellaneda', N'Racing es un equipo argentino, es uno de los 5 denominados "Equipos grandes". Fue el primer argentino en ganar la Copa Intercontinental tras vencer al Celtic.')
INSERT [dbo].[Equipo] ([IdEquipo], [IdPais], [Imagen], [Nombre], [Descripcion]) VALUES (5, 1, NULL, N'Independiente', N'Independiente es un equipo argentino, es uno de los 5 denominados "Equipos grandes". Es el equipo argentino con mas libertadores en su vitrina, con 7.')
INSERT [dbo].[Equipo] ([IdEquipo], [IdPais], [Imagen], [Nombre], [Descripcion]) VALUES (6, 2, NULL, N'Real Madrid', N'Real Madrid es un equipo español. Es el equipo con mas champions leagues conquistadas, con 14.')
INSERT [dbo].[Equipo] ([IdEquipo], [IdPais], [Imagen], [Nombre], [Descripcion]) VALUES (7, 2, NULL, N'Atletico Madrid', N'Atletico Madrid es un equipo español. Es un equipo popularmente considerado grande dentro de españa gracias a su gran prestigio tanto nacional como internacional. Es el derby del Real Madrid')
INSERT [dbo].[Equipo] ([IdEquipo], [IdPais], [Imagen], [Nombre], [Descripcion]) VALUES (8, 2, NULL, N'Barcelona FC', N'Barcelona es un equipo de Cataluña. Considerado grande por casi todo el mundo. Siempre jugando bajo su lema "Mas que un club".')
INSERT [dbo].[Equipo] ([IdEquipo], [IdPais], [Imagen], [Nombre], [Descripcion]) VALUES (9, 3, NULL, N'Liverpool', N'Liverpool es un equipo ingles.')
INSERT [dbo].[Equipo] ([IdEquipo], [IdPais], [Imagen], [Nombre], [Descripcion]) VALUES (10, 3, NULL, N'Manchester City', N'Manchester City es un equipo ingles.')
INSERT [dbo].[Equipo] ([IdEquipo], [IdPais], [Imagen], [Nombre], [Descripcion]) VALUES (11, 3, NULL, N'Manchester United', N'Manchester United es un equipo ingles.')
INSERT [dbo].[Equipo] ([IdEquipo], [IdPais], [Imagen], [Nombre], [Descripcion]) VALUES (12, 3, NULL, N'Arsenal', N'Arsenal es un equipo ingles.')
INSERT [dbo].[Equipo] ([IdEquipo], [IdPais], [Imagen], [Nombre], [Descripcion]) VALUES (13, 1, NULL, N'Atlanta', N'Atlanta es un equipo argentino.')
INSERT [dbo].[Equipo] ([IdEquipo], [IdPais], [Imagen], [Nombre], [Descripcion]) VALUES (14, 3, NULL, N'Chelsea', N'Chelsea es un equipo ingles.')
SET IDENTITY_INSERT [dbo].[Equipo] OFF
GO
SET IDENTITY_INSERT [dbo].[Jugador] ON 

INSERT [dbo].[Jugador] ([IdJugador], [IdPais], [IdEquipoActual], [Nombre], [ImagenJugador], [Edad], [Descripcion], [Posicion], [PartidosJugados], [Goles], [Likes], [Dislikes]) VALUES (1, 1, 2, N'Nicolas De la Cruz', N'https://img.a.transfermarkt.technology/portrait/big/397458-1625771741.png?lm=1', 26, N'Diego Nicolás de la Cruz Arcosa es un futbolista uruguayo. Juega como centrocampista y su actual equipo es el C. A. River Plate de la Primera División de Argentina. Es internacional absoluto con la selección de Uruguay', N'Centrocampista', 100, 50, 5, 1)
INSERT [dbo].[Jugador] ([IdJugador], [IdPais], [IdEquipoActual], [Nombre], [ImagenJugador], [Edad], [Descripcion], [Posicion], [PartidosJugados], [Goles], [Likes], [Dislikes]) VALUES (3, 1, 2, N'Ramiro Funes Mori', N'https://img.a.transfermarkt.technology/portrait/big/11111-1693314815.png?lm=1', 32, N'Rogelio Gabriel Funes Mori es un futbolista argentino naturalizado mexicano que juega de delantero en el C.F. Monterrey de la Primera División de México.', N'Defensor', 150, 20, 22, 0)
INSERT [dbo].[Jugador] ([IdJugador], [IdPais], [IdEquipoActual], [Nombre], [ImagenJugador], [Edad], [Descripcion], [Posicion], [PartidosJugados], [Goles], [Likes], [Dislikes]) VALUES (4, 1, 3, N'Sergio Romero', N'https://img.a.transfermarkt.technology/portrait/big/30690-1596803710.jpg?lm=1', 36, N'Sergio Germán Romero ? es un futbolista profesional argentino. Actualmente se desempeña como arquero en el Club Atlético Boca Juniors de la Liga Profesional de Fútbol de Argentina. Fue internacional con la selección de fútbol de Argentina, siendo el arquero con más presencias en la historia con 96 partidos.', N'Arquero', 310, 0, 50, 5)
INSERT [dbo].[Jugador] ([IdJugador], [IdPais], [IdEquipoActual], [Nombre], [ImagenJugador], [Edad], [Descripcion], [Posicion], [PartidosJugados], [Goles], [Likes], [Dislikes]) VALUES (5, 16, 3, N'Luis Advincula', N'https://img.a.transfermarkt.technology/portrait/big/103890-1689009563.jpg?lm=1', 33, N'Luis Jan Piers Advíncula Castrillón es un futbolista profesional peruano. Juega como lateral derecho, extremo derecho o volante y su equipo actual es el C. A. Boca Juniors de la Liga Profesional del Fútbol Argentino. Es internacional con la selección peruana desde el año 2010.', N'Defensor derecho', 200, 20, 33, 0)
INSERT [dbo].[Jugador] ([IdJugador], [IdPais], [IdEquipoActual], [Nombre], [ImagenJugador], [Edad], [Descripcion], [Posicion], [PartidosJugados], [Goles], [Likes], [Dislikes]) VALUES (6, 1, 3, N'Nicolas Valentini', N'https://img.a.transfermarkt.technology/portrait/big/860992-1652278200.JPG?lm=1', 22, N'Nicolás Valentini, ? es un futbolista profesional argentino que se desempeña como defensor central. Su equipo actual es Club Atlético Boca Juniors de la Primera División de Argentina.', N'Defensor central', 50, 10, 10, 0)
INSERT [dbo].[Jugador] ([IdJugador], [IdPais], [IdEquipoActual], [Nombre], [ImagenJugador], [Edad], [Descripcion], [Posicion], [PartidosJugados], [Goles], [Likes], [Dislikes]) VALUES (7, 17, 4, N'Gabriel Arias', N'https://img.a.transfermarkt.technology/portrait/big/54330-1694003785.JPG?lm=1', 36, N'Gabriel Arias Arroyo es un futbolista chileno nacido en Argentina. Juega como arquero en Racing Club de la Primera División de Argentina y es internacional con la selección de Chile.', N'Arquero', 300, 0, 70, 10)
INSERT [dbo].[Jugador] ([IdJugador], [IdPais], [IdEquipoActual], [Nombre], [ImagenJugador], [Edad], [Descripcion], [Posicion], [PartidosJugados], [Goles], [Likes], [Dislikes]) VALUES (8, 12, 4, N'Juan Fernando Quintero', N'https://img.a.transfermarkt.technology/portrait/big/122582-1644877928.png?lm=1', 30, N'Juan Fernando Quintero Paniagua, conocido también como Juanfer Quintero, es un futbolista colombiano. Juega como centrocampista y actualmente milita en Racing Club de la Primera División de Argentina. Campeón de la Copa Libertadores 2018 con River Plate, marcó el gol de la victoria en la final contra el Boca Juniors.', N'Delantero', 270, 100, 30, 5)
INSERT [dbo].[Jugador] ([IdJugador], [IdPais], [IdEquipoActual], [Nombre], [ImagenJugador], [Edad], [Descripcion], [Posicion], [PartidosJugados], [Goles], [Likes], [Dislikes]) VALUES (9, 12, 4, N'Roger Martinez', N'https://img.a.transfermarkt.technology/portrait/big/285771-1694003905.JPG?lm=1', 29, N'Roger Beyker Martínez es un futbolista colombiano que juega como delantero actualmente se encuentra en Racing Club de Avellaneda de la Primera División de Argentina.?Ha tenido participación en la selección de fútbol de Colombia en sus categorías sub-23 y absoluta. ', N'Delantero', 150, 50, 44, 7)
INSERT [dbo].[Jugador] ([IdJugador], [IdPais], [IdEquipoActual], [Nombre], [ImagenJugador], [Edad], [Descripcion], [Posicion], [PartidosJugados], [Goles], [Likes], [Dislikes]) VALUES (10, 1, 5, N'Federico Mancuello', N'https://img.a.transfermarkt.technology/portrait/big/96313-1636330654.JPG?lm=1', 34, N'Federico Andrés Mancuello es un futbolista argentino. Juega como mediocentro ofensivo en Independiente de la Primera División de Argentina', N'Delantero', 100, 120, 77, 21)
INSERT [dbo].[Jugador] ([IdJugador], [IdPais], [IdEquipoActual], [Nombre], [ImagenJugador], [Edad], [Descripcion], [Posicion], [PartidosJugados], [Goles], [Likes], [Dislikes]) VALUES (11, 1, 5, N'Santiago Toloza', N'https://img.a.transfermarkt.technology/portrait/big/995585-1662913657.png?lm=1', 21, N'Santiago Federico Toloza ? es un jugador de futbol que actualmente se encuentra jugando en el Club Atlético Independiente de la Primera División de Argentina y cumple las labores de un centrocampista ofensivo. ', N'Centrocampista', 50, 10, 19, 0)
INSERT [dbo].[Jugador] ([IdJugador], [IdPais], [IdEquipoActual], [Nombre], [ImagenJugador], [Edad], [Descripcion], [Posicion], [PartidosJugados], [Goles], [Likes], [Dislikes]) VALUES (12, 1, 2, N'Enzo Perez', N'https://img.a.transfermarkt.technology/portrait/big/56066-1625771376.png?lm=1', 37, N'Enzo Nicolás Pérez es un futbolista argentino. Juega de mediocampista en el C. A. River Plate de la Primera División de Argentina, donde es capitán del equipo. Como jugador del Estudiantes de La Plata, ganó la Copa Libertadores 2009', N'Mediocampista', 200, 30, 88, 12)
SET IDENTITY_INSERT [dbo].[Jugador] OFF
GO
SET IDENTITY_INSERT [dbo].[Pais] ON 

INSERT [dbo].[Pais] ([IdPais], [Nombre], [Imagen]) VALUES (1, N'Argentina', NULL)
INSERT [dbo].[Pais] ([IdPais], [Nombre], [Imagen]) VALUES (2, N'España', NULL)
INSERT [dbo].[Pais] ([IdPais], [Nombre], [Imagen]) VALUES (3, N'Inglaterra', NULL)
INSERT [dbo].[Pais] ([IdPais], [Nombre], [Imagen]) VALUES (4, N'Francia', NULL)
INSERT [dbo].[Pais] ([IdPais], [Nombre], [Imagen]) VALUES (5, N'Brasil', NULL)
INSERT [dbo].[Pais] ([IdPais], [Nombre], [Imagen]) VALUES (6, N'Alemania', NULL)
INSERT [dbo].[Pais] ([IdPais], [Nombre], [Imagen]) VALUES (7, N'Italia', NULL)
INSERT [dbo].[Pais] ([IdPais], [Nombre], [Imagen]) VALUES (8, N'Portugal', NULL)
INSERT [dbo].[Pais] ([IdPais], [Nombre], [Imagen]) VALUES (9, N'Países Bajos', NULL)
INSERT [dbo].[Pais] ([IdPais], [Nombre], [Imagen]) VALUES (10, N'Uruguay', NULL)
INSERT [dbo].[Pais] ([IdPais], [Nombre], [Imagen]) VALUES (11, N'México', NULL)
INSERT [dbo].[Pais] ([IdPais], [Nombre], [Imagen]) VALUES (12, N'Colombia', NULL)
INSERT [dbo].[Pais] ([IdPais], [Nombre], [Imagen]) VALUES (13, N'Nigeria', NULL)
INSERT [dbo].[Pais] ([IdPais], [Nombre], [Imagen]) VALUES (14, N'Japón', NULL)
INSERT [dbo].[Pais] ([IdPais], [Nombre], [Imagen]) VALUES (15, N'Corea del Sur', NULL)
INSERT [dbo].[Pais] ([IdPais], [Nombre], [Imagen]) VALUES (16, N'Peru', NULL)
INSERT [dbo].[Pais] ([IdPais], [Nombre], [Imagen]) VALUES (17, N'Chile', NULL)
SET IDENTITY_INSERT [dbo].[Pais] OFF
GO
SET IDENTITY_INSERT [dbo].[Titulos] ON 

INSERT [dbo].[Titulos] ([IdTitulo], [IdPais], [Nombre], [Imagen]) VALUES (1, 1, N'Copa Argentina', N'https://www.directvsports.com/__export/1675279867289/sites/dsports/img/2023/02/01/20230201_043107125_8c2e4eef-1dd5-4c79-939d-2eaa560552f6.jpg_2062789929.jpg')
INSERT [dbo].[Titulos] ([IdTitulo], [IdPais], [Nombre], [Imagen]) VALUES (2, 1, N'Copa LPF', N'https://upload.wikimedia.org/wikipedia/commons/1/16/Copa_de_la_Liga_Profesional_de_F%C3%BAtbol.png')
INSERT [dbo].[Titulos] ([IdTitulo], [IdPais], [Nombre], [Imagen]) VALUES (3, 1, N'Copa Libertadores', N'https://upload.wikimedia.org/wikipedia/commons/7/7a/328-3287452_copa-libertadores-primer-trofeo-hd-png-download.png')
INSERT [dbo].[Titulos] ([IdTitulo], [IdPais], [Nombre], [Imagen]) VALUES (4, 2, N'Copa del Rey', N'https://cadenaser.com/resizer/8FLkzK_MKEkZS2d3c80nUP1vLKg=/1200x1200/filters:format(jpg):quality(70)/cloudfront-eu-central-1.images.arcpublishing.com/prisaradio/DH6B5CFHWREKXB3XOIUURZFXBQ.jpg')
INSERT [dbo].[Titulos] ([IdTitulo], [IdPais], [Nombre], [Imagen]) VALUES (5, 2, N'Supercopa de España', N'https://phantom-marca.unidadeditorial.es/fa7820ef06c673346aac4ec315509bcc/resize/1200/f/webp/assets/multimedia/imagenes/2023/01/15/16737733261470.jpg')
INSERT [dbo].[Titulos] ([IdTitulo], [IdPais], [Nombre], [Imagen]) VALUES (6, 2, N'Copa de la Liga', N'https://preview.free3d.com/img/2015/07/2704953147293435772/cnalrniu.jpg')
INSERT [dbo].[Titulos] ([IdTitulo], [IdPais], [Nombre], [Imagen]) VALUES (7, 3, N'Premier League', N'https://media.ambito.com/p/fb50a700b0cd71fc1030fcb4c05d3134/adjuntos/239/imagenes/037/635/0037635603/1200x675/smart/premier-league.png')
INSERT [dbo].[Titulos] ([IdTitulo], [IdPais], [Nombre], [Imagen]) VALUES (8, 3, N'Champions League', N'https://phantom-marca.unidadeditorial.es/594875c462f467b67a75c45a524c0184/resize/828/f/jpg/assets/multimedia/imagenes/2023/03/13/16787259352864.jpg')
SET IDENTITY_INSERT [dbo].[Titulos] OFF
GO
SET IDENTITY_INSERT [dbo].[TituloXJugador] ON 

INSERT [dbo].[TituloXJugador] ([IdTituloGanado], [IdJugador], [IdTitulo], [Año]) VALUES (1, 1, 1, 2019)
INSERT [dbo].[TituloXJugador] ([IdTituloGanado], [IdJugador], [IdTitulo], [Año]) VALUES (2, 1, 2, 2021)
INSERT [dbo].[TituloXJugador] ([IdTituloGanado], [IdJugador], [IdTitulo], [Año]) VALUES (3, 1, 3, 2018)
INSERT [dbo].[TituloXJugador] ([IdTituloGanado], [IdJugador], [IdTitulo], [Año]) VALUES (4, 3, 3, 2015)
INSERT [dbo].[TituloXJugador] ([IdTituloGanado], [IdJugador], [IdTitulo], [Año]) VALUES (5, 3, 2, 2014)
INSERT [dbo].[TituloXJugador] ([IdTituloGanado], [IdJugador], [IdTitulo], [Año]) VALUES (6, 4, 2, 2022)
SET IDENTITY_INSERT [dbo].[TituloXJugador] OFF
GO
ALTER TABLE [dbo].[Comentario]  WITH CHECK ADD  CONSTRAINT [FK_Comentario_Jugador] FOREIGN KEY([IdJugador])
REFERENCES [dbo].[Jugador] ([IdJugador])
GO
ALTER TABLE [dbo].[Comentario] CHECK CONSTRAINT [FK_Comentario_Jugador]
GO
ALTER TABLE [dbo].[Comentario]  WITH CHECK ADD  CONSTRAINT [FK_Comentario_Usuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[Comentario] CHECK CONSTRAINT [FK_Comentario_Usuario]
GO
ALTER TABLE [dbo].[Equipo]  WITH CHECK ADD  CONSTRAINT [FK_Equipo_Pais] FOREIGN KEY([IdPais])
REFERENCES [dbo].[Pais] ([IdPais])
GO
ALTER TABLE [dbo].[Equipo] CHECK CONSTRAINT [FK_Equipo_Pais]
GO
ALTER TABLE [dbo].[Jugador]  WITH CHECK ADD  CONSTRAINT [FK_Jugador_Equipo] FOREIGN KEY([IdEquipoActual])
REFERENCES [dbo].[Equipo] ([IdEquipo])
GO
ALTER TABLE [dbo].[Jugador] CHECK CONSTRAINT [FK_Jugador_Equipo]
GO
ALTER TABLE [dbo].[Jugador]  WITH CHECK ADD  CONSTRAINT [FK_Jugador_Pais] FOREIGN KEY([IdPais])
REFERENCES [dbo].[Pais] ([IdPais])
GO
ALTER TABLE [dbo].[Jugador] CHECK CONSTRAINT [FK_Jugador_Pais]
GO
ALTER TABLE [dbo].[Titulos]  WITH CHECK ADD  CONSTRAINT [FK_Titulos_Pais] FOREIGN KEY([IdPais])
REFERENCES [dbo].[Pais] ([IdPais])
GO
ALTER TABLE [dbo].[Titulos] CHECK CONSTRAINT [FK_Titulos_Pais]
GO
ALTER TABLE [dbo].[TituloXEquipo]  WITH CHECK ADD  CONSTRAINT [FK_TituloXEquipo_Equipo] FOREIGN KEY([IdEquipo])
REFERENCES [dbo].[Equipo] ([IdEquipo])
GO
ALTER TABLE [dbo].[TituloXEquipo] CHECK CONSTRAINT [FK_TituloXEquipo_Equipo]
GO
ALTER TABLE [dbo].[TituloXEquipo]  WITH CHECK ADD  CONSTRAINT [FK_TituloXEquipo_Titulos] FOREIGN KEY([IdTitulo])
REFERENCES [dbo].[Titulos] ([IdTitulo])
GO
ALTER TABLE [dbo].[TituloXEquipo] CHECK CONSTRAINT [FK_TituloXEquipo_Titulos]
GO
ALTER TABLE [dbo].[TituloXJugador]  WITH CHECK ADD  CONSTRAINT [FK_TituloXJugador_Jugador] FOREIGN KEY([IdJugador])
REFERENCES [dbo].[Jugador] ([IdJugador])
GO
ALTER TABLE [dbo].[TituloXJugador] CHECK CONSTRAINT [FK_TituloXJugador_Jugador]
GO
ALTER TABLE [dbo].[TituloXJugador]  WITH CHECK ADD  CONSTRAINT [FK_TituloXJugador_Titulos] FOREIGN KEY([IdTitulo])
REFERENCES [dbo].[Titulos] ([IdTitulo])
GO
ALTER TABLE [dbo].[TituloXJugador] CHECK CONSTRAINT [FK_TituloXJugador_Titulos]
GO
/****** Object:  StoredProcedure [dbo].[GetComentarioByJugador]    Script Date: 21/11/2023 08:23:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[GetComentarioByJugador](@idJugador int)
as
begin
select * from Comentario where IdJugador=@idJugador
end
GO
/****** Object:  StoredProcedure [dbo].[GetEquipoByID]    Script Date: 21/11/2023 08:23:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[GetEquipoByID](@idEquipo int)
as
begin
select Equipo.*,Pais.Imagen from Equipo 
inner join Pais on Pais.IdPais=Equipo.IdPais
where IdEquipo=@idEquipo
end
GO
/****** Object:  StoredProcedure [dbo].[GetEquiposByPais]    Script Date: 21/11/2023 08:23:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[GetEquiposByPais](@idPais int)
as
begin
select * from Equipo where IdPais=@idPais
end
GO
/****** Object:  StoredProcedure [dbo].[GetJugadorByID]    Script Date: 21/11/2023 08:23:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetJugadorByID](@idJugador int)
as
begin
select J.*, E.Imagen, P.Imagen from Jugador J
inner join Equipo E on E.IdEquipo=J.IdEquipoActual
inner join Pais P on P.IdPais=J.IdPais
where IdJugador=@idJugador
end
GO
/****** Object:  StoredProcedure [dbo].[GetJugadoresByEquipo]    Script Date: 21/11/2023 08:23:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[GetJugadoresByEquipo](@idEquipo int)
as
begin
select * from Jugador where IdEquipoActual=@idEquipo
end
GO
/****** Object:  StoredProcedure [dbo].[GetJugadoresByPais]    Script Date: 21/11/2023 08:23:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[GetJugadoresByPais](@idPais int)
as
begin
select * from Jugador where IdPais=@idPais
end
GO
/****** Object:  StoredProcedure [dbo].[GetTENPlayers]    Script Date: 21/11/2023 08:23:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetTENPlayers]
as
begin
select TOP 10 * FROM Jugador
ORDER BY Likes DESC
end
GO
/****** Object:  StoredProcedure [dbo].[GetTitulosByEquipo]    Script Date: 21/11/2023 08:23:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[GetTitulosByEquipo](@idEquipo int)
as
begin
select TE.*,T.Imagen,T.Nombre from TituloXEquipo TE
inner join Titulos T on T.IdTitulo=TE.IdTitulo
where IdEquipo=@idEquipo
end
GO
/****** Object:  StoredProcedure [dbo].[GetTitulosByJugador]    Script Date: 21/11/2023 08:23:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[GetTitulosByJugador](@idJugador int)
as
begin
select *,T.Imagen,T.Nombre from TituloXJugador TJ
inner join Titulos T on T.IdTitulo=TJ.IdTitulo
where IdJugador=@idJugador
end
GO
/****** Object:  StoredProcedure [dbo].[GetUsuarioByID]    Script Date: 21/11/2023 08:23:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[GetUsuarioByID](@idUsuario int) 
as
begin
select * from  Usuario where IdUsuario=@idUsuario

end
GO
USE [master]
GO
ALTER DATABASE [FuthubBD] SET  READ_WRITE 
GO
