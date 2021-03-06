USE [ASIR_IgnacioGonzalo]
GO
/****** Object:  Schema [aviacion]    Script Date: 26/01/2018 18:56:13 ******/
CREATE SCHEMA [aviacion]
GO
/****** Object:  Table [aviacion].[Aeropuertos]    Script Date: 26/01/2018 18:56:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [aviacion].[Aeropuertos](
	[codAeropuerto] [smallint] NOT NULL,
	[nombre] [varchar](40) NULL,
	[ciudad] [varchar](40) NULL,
	[pais] [varchar](40) NULL,
	[longitudPista] [smallint] NULL,
 CONSTRAINT [PK_Aeropuertos] PRIMARY KEY CLUSTERED 
(
	[codAeropuerto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [aviacion].[Companias]    Script Date: 26/01/2018 18:56:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [aviacion].[Companias](
	[codCompania] [tinyint] NOT NULL,
	[nombre] [varchar](60) NULL,
	[pais] [varchar](60) NULL,
 CONSTRAINT [PK_Companias] PRIMARY KEY CLUSTERED 
(
	[codCompania] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [aviacion].[LineasReservas]    Script Date: 26/01/2018 18:56:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [aviacion].[LineasReservas](
	[codReserva] [int] NOT NULL,
	[numLinea] [tinyint] NOT NULL,
	[salida] [smalldatetime] NULL,
	[origen] [varchar](40) NULL,
	[destino] [varchar](40) NULL,
	[compania] [tinyint] NULL,
	[precioUnitario] [smallmoney] NULL,
	[numBilletes] [tinyint] NULL,
 CONSTRAINT [PK_LineasReservas] PRIMARY KEY CLUSTERED 
(
	[codReserva] ASC,
	[numLinea] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [aviacion].[Reservas]    Script Date: 26/01/2018 18:56:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [aviacion].[Reservas](
	[codReserva] [int] NOT NULL,
	[FechaReserva] [smalldatetime] NULL,
	[dni] [char](9) NULL,
	[nombre] [varchar](40) NULL,
	[apellido] [varchar](40) NULL,
	[PrecioTotal] [smallmoney] NULL,
 CONSTRAINT [PK_Reservas] PRIMARY KEY CLUSTERED 
(
	[codReserva] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [aviacion].[Vuelos]    Script Date: 26/01/2018 18:56:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [aviacion].[Vuelos](
	[codVuelo] [int] NOT NULL,
	[compania] [tinyint] NULL,
	[origen] [varchar](40) NULL,
	[destino] [varchar](40) NULL,
	[fechaSalida] [smalldatetime] NULL,
	[precio] [smallmoney] NULL,
	[disponibilidad] [smallint] NULL,
	[finalizado] [bit] NULL,
 CONSTRAINT [PK_Vuelos] PRIMARY KEY CLUSTERED 
(
	[codVuelo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [aviacion].[Aeropuertos] ([codAeropuerto], [nombre], [ciudad], [pais], [longitudPista]) VALUES (1, N'Hondarribia', N'Hondarribia', N'España', 1700)
INSERT [aviacion].[Aeropuertos] ([codAeropuerto], [nombre], [ciudad], [pais], [longitudPista]) VALUES (2, N'Adolfo Suarez', N'Madrid', N'España', 2800)
INSERT [aviacion].[Aeropuertos] ([codAeropuerto], [nombre], [ciudad], [pais], [longitudPista]) VALUES (3, N'Attaturk', N'Istanbul', N'Turquía', 2900)
INSERT [aviacion].[Aeropuertos] ([codAeropuerto], [nombre], [ciudad], [pais], [longitudPista]) VALUES (4, N'Cristiano Ronaldo', N'Madeira', N'Portugal', 2100)
INSERT [aviacion].[Aeropuertos] ([codAeropuerto], [nombre], [ciudad], [pais], [longitudPista]) VALUES (5, N'Dusseldorf', N'Dusseldorf', N'Alemania', 3000)
INSERT [aviacion].[Companias] ([codCompania], [nombre], [pais]) VALUES (1, N'Iberia', N'España')
INSERT [aviacion].[Companias] ([codCompania], [nombre], [pais]) VALUES (2, N'Lufthansa', N'Alemania')
INSERT [aviacion].[Companias] ([codCompania], [nombre], [pais]) VALUES (3, N'Ryanair', N'Irlanda')
INSERT [aviacion].[Companias] ([codCompania], [nombre], [pais]) VALUES (4, N'Air France', N'Francia')
INSERT [aviacion].[Companias] ([codCompania], [nombre], [pais]) VALUES (5, N'Turkish Airlines', N'Turquía')
INSERT [aviacion].[LineasReservas] ([codReserva], [numLinea], [salida], [origen], [destino], [compania], [precioUnitario], [numBilletes]) VALUES (1, 1, CAST(N'2018-01-20T00:00:00' AS SmallDateTime), N'Adolfo Suarez', N'Attaturk', 5, 200.0000, 2)
INSERT [aviacion].[LineasReservas] ([codReserva], [numLinea], [salida], [origen], [destino], [compania], [precioUnitario], [numBilletes]) VALUES (1, 2, CAST(N'2018-02-04T00:00:00' AS SmallDateTime), N'Attaturk', N'Adolfo Suarez', 5, 170.0000, 2)
INSERT [aviacion].[LineasReservas] ([codReserva], [numLinea], [salida], [origen], [destino], [compania], [precioUnitario], [numBilletes]) VALUES (2, 1, CAST(N'2018-02-14T00:00:00' AS SmallDateTime), N'Hondarribia', N'Adolfo Suarez', 1, 340.0000, 1)
INSERT [aviacion].[Reservas] ([codReserva], [FechaReserva], [dni], [nombre], [apellido], [PrecioTotal]) VALUES (1, CAST(N'2018-01-22T00:00:00' AS SmallDateTime), N'11111111M', N'Calixto', N'Almendrales', NULL)
INSERT [aviacion].[Reservas] ([codReserva], [FechaReserva], [dni], [nombre], [apellido], [PrecioTotal]) VALUES (2, CAST(N'2018-01-22T00:00:00' AS SmallDateTime), N'22222222L', N'Hortensia', N'Flores', NULL)
INSERT [aviacion].[Vuelos] ([codVuelo], [compania], [origen], [destino], [fechaSalida], [precio], [disponibilidad], [finalizado]) VALUES (1, 2, N'Dusseldorf', N'Adolfo Suarez', CAST(N'2018-01-23T00:00:00' AS SmallDateTime), 240.0000, 90, 0)
ALTER TABLE [aviacion].[LineasReservas]  WITH CHECK ADD  CONSTRAINT [FK_LineasReservas_Companias] FOREIGN KEY([compania])
REFERENCES [aviacion].[Companias] ([codCompania])
GO
ALTER TABLE [aviacion].[LineasReservas] CHECK CONSTRAINT [FK_LineasReservas_Companias]
GO
ALTER TABLE [aviacion].[LineasReservas]  WITH CHECK ADD  CONSTRAINT [FK_LineasReservas_Reservas] FOREIGN KEY([codReserva])
REFERENCES [aviacion].[Reservas] ([codReserva])
GO
ALTER TABLE [aviacion].[LineasReservas] CHECK CONSTRAINT [FK_LineasReservas_Reservas]
GO
ALTER TABLE [aviacion].[Vuelos]  WITH CHECK ADD  CONSTRAINT [FK_Vuelos_Companias] FOREIGN KEY([compania])
REFERENCES [aviacion].[Companias] ([codCompania])
GO
ALTER TABLE [aviacion].[Vuelos] CHECK CONSTRAINT [FK_Vuelos_Companias]
GO
