USE [master]
GO
/****** Object:  Database [db_funcionarios]    Script Date: 09/06/2023 10:42:22 ******/
CREATE DATABASE [db_funcionarios]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'db_funcionarios', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\db_funcionarios.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'db_funcionarios_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\db_funcionarios_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [db_funcionarios] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [db_funcionarios].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [db_funcionarios] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [db_funcionarios] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [db_funcionarios] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [db_funcionarios] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [db_funcionarios] SET ARITHABORT OFF 
GO
ALTER DATABASE [db_funcionarios] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [db_funcionarios] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [db_funcionarios] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [db_funcionarios] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [db_funcionarios] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [db_funcionarios] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [db_funcionarios] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [db_funcionarios] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [db_funcionarios] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [db_funcionarios] SET  ENABLE_BROKER 
GO
ALTER DATABASE [db_funcionarios] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [db_funcionarios] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [db_funcionarios] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [db_funcionarios] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [db_funcionarios] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [db_funcionarios] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [db_funcionarios] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [db_funcionarios] SET RECOVERY FULL 
GO
ALTER DATABASE [db_funcionarios] SET  MULTI_USER 
GO
ALTER DATABASE [db_funcionarios] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [db_funcionarios] SET DB_CHAINING OFF 
GO
ALTER DATABASE [db_funcionarios] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [db_funcionarios] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [db_funcionarios] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [db_funcionarios] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'db_funcionarios', N'ON'
GO
ALTER DATABASE [db_funcionarios] SET QUERY_STORE = ON
GO
ALTER DATABASE [db_funcionarios] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [db_funcionarios]
GO
/****** Object:  Table [dbo].[funcionarios]    Script Date: 09/06/2023 10:42:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[funcionarios](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nomefuncionario] [varchar](100) NULL,
	[emailfuncionario] [varchar](100) NULL,
	[sexofuncionario] [char](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Itens_Pedido]    Script Date: 09/06/2023 10:42:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Itens_Pedido](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[pedido_id] [int] NULL,
	[produto_id] [int] NULL,
	[quantidade] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pedidos]    Script Date: 09/06/2023 10:42:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pedidos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[usuario_id] [int] NULL,
	[data_pedido] [datetime] NULL,
	[valor_total] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Produtos]    Script Date: 09/06/2023 10:42:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Produtos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nome] [varchar](100) NULL,
	[preco] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 09/06/2023 10:42:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nome] [varchar](100) NULL,
	[email] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Pedidos] ADD  DEFAULT (getdate()) FOR [data_pedido]
GO
ALTER TABLE [dbo].[Itens_Pedido]  WITH CHECK ADD FOREIGN KEY([pedido_id])
REFERENCES [dbo].[Pedidos] ([id])
GO
ALTER TABLE [dbo].[Itens_Pedido]  WITH CHECK ADD FOREIGN KEY([produto_id])
REFERENCES [dbo].[Produtos] ([id])
GO
ALTER TABLE [dbo].[Pedidos]  WITH CHECK ADD FOREIGN KEY([usuario_id])
REFERENCES [dbo].[Usuarios] ([id])
GO
ALTER TABLE [dbo].[Itens_Pedido]  WITH CHECK ADD  CONSTRAINT [quantidade_maior_que_zero] CHECK  (([quantidade]>(0)))
GO
ALTER TABLE [dbo].[Itens_Pedido] CHECK CONSTRAINT [quantidade_maior_que_zero]
GO
USE [master]
GO
ALTER DATABASE [db_funcionarios] SET  READ_WRITE 
GO
