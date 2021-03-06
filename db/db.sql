CREATE DATABASE prueba_db;

USE prueba_db;

CREATE TABLE [dbo].[Curso](
[Id] [int] IDENTITY(1,1) NOT NULL,
[Nombre] [varchar](60) NOT NULL,
[NumeroCreditos] [int] NOT NULL,
CONSTRAINT [PK_Curso] PRIMARY KEY CLUSTERED
(
[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF,
ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE TABLE [dbo].[Estudiante](
[Id] [int] IDENTITY(1,1) NOT NULL,
[TipoIdentificacion] [varchar](2) NOT NULL,
[Identificacion] [varchar](15) NOT NULL,
[Nombre1] [varchar](20) NOT NULL,
[Nombre2] [varchar](20) NULL,
[Apellido1] [varchar](20) NOT NULL,
[Apellido2] [varchar](20) NULL,
[Email] [varchar](50) NULL,
[Celular] [varchar](20) NULL,
[Direccion] [varchar](50) NULL,



[Ciudad] [varchar](50) NOT NULL,
CONSTRAINT [PK_Estudiante] PRIMARY KEY CLUSTERED
(
[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF,
ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE TABLE [dbo].[EstudianteCurso](
[Id] [int] IDENTITY(1,1) NOT NULL,
[IdEstudiante] [int] NOT NULL,
[IdCurso] [int] NOT NULL,
[NotaFinal] [numeric](3, 2) NULL,
CONSTRAINT [PK_EstudianteCurso] PRIMARY KEY CLUSTERED
(
[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF,
ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Curso] ON [dbo].[Curso]
(
[Nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF,
IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON,
ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_EstudianteCurso] ON [dbo].[EstudianteCurso]
(
[IdEstudiante] ASC,
[IdCurso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF,
IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON,
ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[EstudianteCurso] WITH CHECK ADD CONSTRAINT
[FK_EstudianteCurso_Curso] FOREIGN KEY([IdCurso])
REFERENCES [dbo].[Curso] ([Id])
GO
ALTER TABLE [dbo].[EstudianteCurso] CHECK CONSTRAINT [FK_EstudianteCurso_Curso]
GO
ALTER TABLE [dbo].[EstudianteCurso] WITH CHECK ADD CONSTRAINT
[FK_EstudianteCurso_Estudiante] FOREIGN KEY([IdEstudiante])
REFERENCES [dbo].[Estudiante] ([Id])
GO
ALTER TABLE [dbo].[EstudianteCurso] CHECK CONSTRAINT [FK_EstudianteCurso_Estudiante]
GO