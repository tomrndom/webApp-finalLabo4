USE [master]
GO
ALTER DATABASE [Laboratorio4] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Laboratorio4].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Laboratorio4] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Laboratorio4] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Laboratorio4] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Laboratorio4] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Laboratorio4] SET ARITHABORT OFF 
GO
ALTER DATABASE [Laboratorio4] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Laboratorio4] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Laboratorio4] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Laboratorio4] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Laboratorio4] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Laboratorio4] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Laboratorio4] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Laboratorio4] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Laboratorio4] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Laboratorio4] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Laboratorio4] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Laboratorio4] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Laboratorio4] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Laboratorio4] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Laboratorio4] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Laboratorio4] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Laboratorio4] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Laboratorio4] SET RECOVERY FULL 
GO
ALTER DATABASE [Laboratorio4] SET  MULTI_USER 
GO
ALTER DATABASE [Laboratorio4] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Laboratorio4] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Laboratorio4] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Laboratorio4] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Laboratorio4] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Laboratorio4', N'ON'
GO
USE [Laboratorio4]
GO
/****** Object:  Table [dbo].[Articulo]    Script Date: 28/09/2017 01:54:26 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Articulo](
	[id_articulo] [int] IDENTITY(1,1) NOT NULL,
	[codigo] [nchar](15) NOT NULL,
	[denominacion] [varchar](50) NOT NULL,
	[precioCompra] [decimal](6, 2) NOT NULL,
	[precioVenta] [decimal](6, 2) NOT NULL,
	[iva] [decimal](4, 2) NOT NULL,
	[id_rubro] [int] NOT NULL,
 CONSTRAINT [PK_Articulo] PRIMARY KEY CLUSTERED 
(
	[id_articulo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 28/09/2017 01:54:26 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[id_cliente] [int] IDENTITY(1,1) NOT NULL,
	[razonSocial] [varchar](50) NOT NULL,
	[cuit] [varchar](50) NOT NULL,
	[saldo] [decimal](6, 2) NULL,
	[id_domicilio] [int] NOT NULL,
	[id_domicilioNegocio] [int] NOT NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[id_cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Domicilio]    Script Date: 28/09/2017 01:54:26 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Domicilio](
	[id_domicilio] [int] IDENTITY(1,1) NOT NULL,
	[calle] [varchar](50) NOT NULL,
	[numero] [int] NOT NULL,
	[localidad] [varchar](50) NOT NULL,
	[latitud] [varchar](50) NULL,
	[longitud] [varchar](50) NULL,
 CONSTRAINT [PK_Domicilio] PRIMARY KEY CLUSTERED 
(
	[id_domicilio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PedidoVenta]    Script Date: 28/09/2017 01:54:26 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PedidoVenta](
	[id_pedidoVenta] [int] IDENTITY(1,1) NOT NULL,
	[fechaEstimadaEntrega] [date] NOT NULL,
	[gastosEnvio] [decimal](6, 2) NOT NULL,
	[estado] [varchar](50) NOT NULL,
	[entregado] [bit] NOT NULL,
	[fechaPedido] [date] NOT NULL,
	[nroPedido] [bigint] NOT NULL,
	[subTotal] [decimal](6, 2) NOT NULL,
	[montoTotal] [decimal](6, 2) NOT NULL,
	[id_cliente] [int] NOT NULL,
	[id_domicilio] [int] NOT NULL,
 CONSTRAINT [PK_PedidoVenta] PRIMARY KEY CLUSTERED 
(
	[id_pedidoVenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PedidoVentaDetalle]    Script Date: 28/09/2017 01:54:26 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PedidoVentaDetalle](
	[id_pedidoVentaDetalle] [int] IDENTITY(1,1) NOT NULL,
	[cantidad] [int] NOT NULL,
	[subTotal] [decimal](6, 2) NOT NULL,
	[porcentajeDescuento] [float] NULL,
	[id_articulo] [int] NULL,
	[id_pedidoVenta] [int] NOT NULL,
 CONSTRAINT [PK_PedidoVentaDetalle] PRIMARY KEY CLUSTERED 
(
	[id_pedidoVentaDetalle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Rubro]    Script Date: 28/09/2017 01:54:26 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rubro](
	[id_rubro] [int] IDENTITY(1,1) NOT NULL,
	[codigo] [nchar](15) NOT NULL,
	[denominacion] [varchar](50) NOT NULL,
	[id_rubroPrimario] [int] NULL,
 CONSTRAINT [PK_Rubro] PRIMARY KEY CLUSTERED 
(
	[id_rubro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 28/09/2017 01:54:26 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[id_usuario] [int] IDENTITY(1,1) NOT NULL,
	[nombreUsuario] [varchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[nombreEmpleado] [varchar](50) NOT NULL,
	[apellidoEmpleado] [varchar](50) NOT NULL,
	[email] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[id_usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Articulo]  WITH CHECK ADD  CONSTRAINT [Rubro_Articulo] FOREIGN KEY([id_rubro])
REFERENCES [dbo].[Rubro] ([id_rubro])
GO
ALTER TABLE [dbo].[Articulo] CHECK CONSTRAINT [Rubro_Articulo]
GO
ALTER TABLE [dbo].[Cliente]  WITH CHECK ADD  CONSTRAINT [Cliente_Domicilio] FOREIGN KEY([id_domicilio])
REFERENCES [dbo].[Domicilio] ([id_domicilio])
GO
ALTER TABLE [dbo].[Cliente] CHECK CONSTRAINT [Cliente_Domicilio]
GO
ALTER TABLE [dbo].[Cliente]  WITH CHECK ADD  CONSTRAINT [Cliente_DomicilioNegocio] FOREIGN KEY([id_domicilioNegocio])
REFERENCES [dbo].[Domicilio] ([id_domicilio])
GO
ALTER TABLE [dbo].[Cliente] CHECK CONSTRAINT [Cliente_DomicilioNegocio]
GO
ALTER TABLE [dbo].[PedidoVenta]  WITH CHECK ADD  CONSTRAINT [PedidoVenta_Cliente] FOREIGN KEY([id_cliente])
REFERENCES [dbo].[Cliente] ([id_cliente])
GO
ALTER TABLE [dbo].[PedidoVenta] CHECK CONSTRAINT [PedidoVenta_Cliente]
GO
ALTER TABLE [dbo].[PedidoVenta]  WITH CHECK ADD  CONSTRAINT [PedidoVenta_Domicilio] FOREIGN KEY([id_domicilio])
REFERENCES [dbo].[Domicilio] ([id_domicilio])
GO
ALTER TABLE [dbo].[PedidoVenta] CHECK CONSTRAINT [PedidoVenta_Domicilio]
GO
ALTER TABLE [dbo].[PedidoVentaDetalle]  WITH CHECK ADD  CONSTRAINT [PedidoVentaDetalle_Articulo] FOREIGN KEY([id_articulo])
REFERENCES [dbo].[Articulo] ([id_articulo])
GO
ALTER TABLE [dbo].[PedidoVentaDetalle] CHECK CONSTRAINT [PedidoVentaDetalle_Articulo]
GO
ALTER TABLE [dbo].[PedidoVentaDetalle]  WITH CHECK ADD  CONSTRAINT [PedidoVentaDetalle_PedidoVenta] FOREIGN KEY([id_pedidoVenta])
REFERENCES [dbo].[PedidoVenta] ([id_pedidoVenta])
GO
ALTER TABLE [dbo].[PedidoVentaDetalle] CHECK CONSTRAINT [PedidoVentaDetalle_PedidoVenta]
GO
ALTER TABLE [dbo].[Rubro]  WITH CHECK ADD  CONSTRAINT [Rubro_Primario] FOREIGN KEY([id_rubroPrimario])
REFERENCES [dbo].[Rubro] ([id_rubro])
GO
ALTER TABLE [dbo].[Rubro] CHECK CONSTRAINT [Rubro_Primario]
GO
USE [master]
GO
ALTER DATABASE [Laboratorio4] SET  READ_WRITE 
GO
