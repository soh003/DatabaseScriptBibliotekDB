USE [master]
GO
/****** Object:  Database [BibliotekDB]    Script Date: 27-05-2025 12:43:58 ******/
CREATE DATABASE [BibliotekDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BibliotekDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\BibliotekDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BibliotekDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\BibliotekDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [BibliotekDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BibliotekDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BibliotekDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BibliotekDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BibliotekDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BibliotekDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BibliotekDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [BibliotekDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BibliotekDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BibliotekDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BibliotekDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BibliotekDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BibliotekDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BibliotekDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BibliotekDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BibliotekDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BibliotekDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [BibliotekDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BibliotekDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BibliotekDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BibliotekDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BibliotekDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BibliotekDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BibliotekDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BibliotekDB] SET RECOVERY FULL 
GO
ALTER DATABASE [BibliotekDB] SET  MULTI_USER 
GO
ALTER DATABASE [BibliotekDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BibliotekDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BibliotekDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BibliotekDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BibliotekDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BibliotekDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'BibliotekDB', N'ON'
GO
ALTER DATABASE [BibliotekDB] SET QUERY_STORE = OFF
GO
USE [BibliotekDB]
GO
/****** Object:  Table [dbo].[Bog]    Script Date: 27-05-2025 12:43:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bog](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ISBN] [nvarchar](20) NOT NULL,
	[Titel] [nvarchar](200) NOT NULL,
	[Udgivelsesår] [int] NOT NULL,
	[Beskrivelse] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[ISBN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BogForfatter]    Script Date: 27-05-2025 12:43:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BogForfatter](
	[BogID] [int] NOT NULL,
	[ForfatterID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[BogID] ASC,
	[ForfatterID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BogGenre]    Script Date: 27-05-2025 12:43:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BogGenre](
	[BogID] [int] NOT NULL,
	[GenreID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[BogID] ASC,
	[GenreID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bruger]    Script Date: 27-05-2025 12:43:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bruger](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Fornavn] [nvarchar](100) NOT NULL,
	[Efternavn] [nvarchar](100) NOT NULL,
	[Adresse] [nvarchar](255) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[Telefon] [nvarchar](20) NOT NULL,
	[Oprettelsesdato] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Eksemplar]    Script Date: 27-05-2025 12:43:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Eksemplar](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[BogID] [int] NOT NULL,
	[Status] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Forfatter]    Script Date: 27-05-2025 12:43:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Forfatter](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Navn] [nvarchar](100) NOT NULL,
	[Fødselsår] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gebyr]    Script Date: 27-05-2025 12:43:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gebyr](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[BrugerID] [int] NOT NULL,
	[UdlånID] [int] NOT NULL,
	[Beløb] [decimal](10, 2) NOT NULL,
	[Beskrivelse] [nvarchar](255) NOT NULL,
	[Dato] [date] NOT NULL,
	[Betalt] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Genre]    Script Date: 27-05-2025 12:43:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Genre](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Navn] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Udlån]    Script Date: 27-05-2025 12:43:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Udlån](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EksemplarID] [int] NOT NULL,
	[BrugerID] [int] NOT NULL,
	[Udlånsdato] [date] NULL,
	[ForventetAfleveringsdato]  AS (dateadd(day,(30),[Udlånsdato])) PERSISTED,
	[Afleveringsdato] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Udlån] ADD  DEFAULT (getdate()) FOR [Udlånsdato]
GO
ALTER TABLE [dbo].[BogForfatter]  WITH CHECK ADD FOREIGN KEY([BogID])
REFERENCES [dbo].[Bog] ([ID])
GO
ALTER TABLE [dbo].[BogForfatter]  WITH CHECK ADD FOREIGN KEY([ForfatterID])
REFERENCES [dbo].[Forfatter] ([ID])
GO
ALTER TABLE [dbo].[BogGenre]  WITH CHECK ADD FOREIGN KEY([BogID])
REFERENCES [dbo].[Bog] ([ID])
GO
ALTER TABLE [dbo].[BogGenre]  WITH CHECK ADD FOREIGN KEY([GenreID])
REFERENCES [dbo].[Genre] ([ID])
GO
ALTER TABLE [dbo].[Eksemplar]  WITH CHECK ADD FOREIGN KEY([BogID])
REFERENCES [dbo].[Bog] ([ID])
GO
ALTER TABLE [dbo].[Gebyr]  WITH CHECK ADD FOREIGN KEY([BrugerID])
REFERENCES [dbo].[Bruger] ([ID])
GO
ALTER TABLE [dbo].[Gebyr]  WITH CHECK ADD FOREIGN KEY([UdlånID])
REFERENCES [dbo].[Udlån] ([ID])
GO
ALTER TABLE [dbo].[Udlån]  WITH CHECK ADD FOREIGN KEY([BrugerID])
REFERENCES [dbo].[Bruger] ([ID])
GO
ALTER TABLE [dbo].[Udlån]  WITH CHECK ADD FOREIGN KEY([EksemplarID])
REFERENCES [dbo].[Eksemplar] ([ID])
GO
/****** Object:  StoredProcedure [dbo].[spAfleverBog]    Script Date: 27-05-2025 12:43:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
==============================================
 Navn:           [dbo].[spAfleverBog]
 Formål:         Registrerer aflevering af en bog ved at opdatere Udlån og sætte Eksemplar til 'Tilgængelig'.
 Forfatter:      Din Navn
 Oprettet:       08-05-2025
 Parametre:
    @UdlånID INT – ID på det specifikke udlån, der afleveres.
 Returnerer:     Ingen direkte returnering; foretager opdateringer i databasen.
==============================================
*/

CREATE PROCEDURE [dbo].[spAfleverBog]
    @UdlånID INT
AS
BEGIN
    IF EXISTS (SELECT 1 FROM Udlån WHERE ID = @UdlånID)
    BEGIN
        DECLARE @EksemplarID INT;
        UPDATE Udlån SET Afleveringsdato = GETDATE() WHERE ID = @UdlånID;
        SELECT @EksemplarID = EksemplarID FROM Udlån WHERE ID = @UdlånID;
        UPDATE Eksemplar SET Status = 'Tilgængelig' WHERE ID = @EksemplarID;
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[spBetalGebyr]    Script Date: 27-05-2025 12:43:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Stored Procedure: Betal gebyr
CREATE PROCEDURE [dbo].[spBetalGebyr]
    @GebyrID INT
AS
BEGIN
    UPDATE Gebyr SET Betalt = 1 WHERE ID = @GebyrID;
END;

GO
/****** Object:  StoredProcedure [dbo].[spFindBogUdFraTitel]    Script Date: 27-05-2025 12:43:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
==============================================
 Navn:           [dbo].[spFindBogUdFraTitel]
 Formål:         Søger i tabellen Bog efter bøger, hvor titlen indeholder den angivne søgetekst.
 Forfatter:      Din Navn
 Oprettet:       08-05-2025
 Parametre:
    @Søgetekst NVARCHAR(200) – Del af titel, der skal søges efter (case-insensitive).
 Returnerer:     Resultatsæt med alle bøger hvor titlen matcher søgeteksten.
==============================================
*/

CREATE PROCEDURE [dbo].[spFindBogUdFraTitel]
    @Søgetekst NVARCHAR(200)
AS
BEGIN
    SELECT *
    FROM Bog
    WHERE LOWER(Titel) LIKE LOWER('%' + @Søgetekst + '%');
END;
GO
/****** Object:  StoredProcedure [dbo].[spFindBøgerAfForfatter]    Script Date: 27-05-2025 12:43:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
==============================================
 Navn:           [dbo].[spFindBøgerAfForfatter]
 Formål:         Finder alle bøger skrevet af en specifik forfatter.
 Forfatter:      Din Navn
 Oprettet:       08-05-2025
 Parametre:
    @ForfatterNavn NVARCHAR(100) – Navn på forfatteren der søges efter (case-insensitive).
 Returnerer:     Titler, ISBN og udgivelsesår for bøger skrevet af den angivne forfatter.
==============================================
*/

CREATE PROCEDURE [dbo].[spFindBøgerAfForfatter]
    @ForfatterNavn NVARCHAR(100)
AS
BEGIN
    SELECT B.Titel, B.ISBN, B.Udgivelsesår
    FROM Bog B
    JOIN BogForfatter BF ON B.ID = BF.BogID
    JOIN Forfatter F ON F.ID = BF.ForfatterID
    WHERE LOWER(F.Navn) = LOWER(@ForfatterNavn);
END;
GO
/****** Object:  StoredProcedure [dbo].[spFindBøgerMedGenre]    Script Date: 27-05-2025 12:43:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Stored Procedure: Find bøger med genre
CREATE PROCEDURE [dbo].[spFindBøgerMedGenre]
    @GenreNavn NVARCHAR(100)
AS
BEGIN
    SELECT B.Titel, B.ISBN, B.Udgivelsesår
    FROM Bog B
    JOIN BogGenre BG ON B.ID = BG.BogID
    JOIN Genre G ON G.ID = BG.GenreID
    WHERE LOWER(G.Navn) = LOWER(@GenreNavn);
END;

GO
/****** Object:  StoredProcedure [dbo].[spFindUbetalteGebyrer]    Script Date: 27-05-2025 12:43:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Stored Procedure: Find ubetalte gebyrer
CREATE PROCEDURE [dbo].[spFindUbetalteGebyrer]
    @BrugerID INT
AS
BEGIN
    SELECT *
    FROM Gebyr
    WHERE BrugerID = @BrugerID AND Betalt = 0;
END;

GO
/****** Object:  StoredProcedure [dbo].[spOpretBogMedForfatterOgGenre]    Script Date: 27-05-2025 12:43:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
==============================================
 Navn:           [dbo].[spOpretBogMedForfatterOgGenre]
 Formål:         Opretter en ny bog med tilhørende forfatter og en eller flere genrer.
                 Hvis forfatter eller genre ikke allerede findes, oprettes de automatisk.
 Forfatter:      Din Navn
 Oprettet:       08-05-2025
 Parametre:
    @ISBN NVARCHAR(20)         – Bogens ISBN (unik).
    @Titel NVARCHAR(200)       – Bogens titel.
    @Udgivelsesår INT          – Årstal for udgivelsen.
    @Beskrivelse NVARCHAR(MAX) – Beskrivelse af bogen.
    @ForfatterNavn NVARCHAR(100) – Navn på forfatteren.
    @Fødselsår INT             – Forfatterens fødselsår.
    @Genrer NVARCHAR(MAX)      – Kommasepareret liste over genrer (f.eks. 'Fantasy, Sci-Fi').
 Returnerer:     Ingen direkte returnering; opretter poster i tabellerne Bog, Forfatter, Genre og deres relationstabeller.
==============================================
*/

CREATE PROCEDURE [dbo].[spOpretBogMedForfatterOgGenre]
    @ISBN NVARCHAR(20),
    @Titel NVARCHAR(200),
    @Udgivelsesår INT,
    @Beskrivelse NVARCHAR(MAX),
    @ForfatterNavn NVARCHAR(100),
    @Fødselsår INT,
    @Genrer NVARCHAR(MAX) -- Kommasepareret liste over genrer
AS
BEGIN
    DECLARE @BogID INT, @ForfatterID INT, @GenreID INT;

    -- Tjek om ISBN allerede findes
    IF EXISTS (SELECT 1 FROM Bog WHERE ISBN = @ISBN)
        RETURN;

    -- Indsæt bog
    INSERT INTO Bog (ISBN, Titel, Udgivelsesår, Beskrivelse)
    VALUES (@ISBN, @Titel, @Udgivelsesår, @Beskrivelse);
    SET @BogID = SCOPE_IDENTITY();

    -- Tjek og opret forfatter
    SELECT @ForfatterID = ID FROM Forfatter WHERE LOWER(Navn) = LOWER(@ForfatterNavn) AND Fødselsår = @Fødselsår;
    IF @ForfatterID IS NULL
    BEGIN
        INSERT INTO Forfatter (Navn, Fødselsår)
        VALUES (@ForfatterNavn, @Fødselsår);
        SET @ForfatterID = SCOPE_IDENTITY();
    END

    -- Opret relation mellem bog og forfatter
    IF NOT EXISTS (SELECT 1 FROM BogForfatter WHERE BogID = @BogID AND ForfatterID = @ForfatterID)
    BEGIN
        INSERT INTO BogForfatter (BogID, ForfatterID) VALUES (@BogID, @ForfatterID);
    END

    -- Split og håndtér genrer via CROSS APPLY uden cursor
    DECLARE @Navn NVARCHAR(100);

    SELECT @Navn = LTRIM(RTRIM(value))
    FROM STRING_SPLIT(@Genrer, ',')
    CROSS APPLY (SELECT LTRIM(RTRIM(value)) AS trimmed) AS Cleaned
    WHERE value IS NOT NULL;

    INSERT INTO Genre (Navn)
    SELECT DISTINCT trimmed
    FROM STRING_SPLIT(@Genrer, ',')
    CROSS APPLY (SELECT LTRIM(RTRIM(value)) AS trimmed) AS Cleaned
    WHERE NOT EXISTS (
        SELECT 1 FROM Genre g WHERE LOWER(g.Navn) = LOWER(trimmed)
    );

    INSERT INTO BogGenre (BogID, GenreID)
    SELECT DISTINCT @BogID, g.ID
    FROM STRING_SPLIT(@Genrer, ',')
    CROSS APPLY (SELECT LTRIM(RTRIM(value)) AS trimmed) AS Cleaned
    JOIN Genre g ON LOWER(g.Navn) = LOWER(trimmed)
    WHERE NOT EXISTS (
        SELECT 1 FROM BogGenre bg
        WHERE bg.BogID = @BogID AND bg.GenreID = g.ID
    );
END;
GO
/****** Object:  StoredProcedure [dbo].[spOpretBruger]    Script Date: 27-05-2025 12:43:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Stored Procedure: Opret ny bruger
CREATE PROCEDURE [dbo].[spOpretBruger]
    @Fornavn NVARCHAR(100),
    @Efternavn NVARCHAR(100),
    @Adresse NVARCHAR(255),
    @Email NVARCHAR(100),
    @Telefon NVARCHAR(20)
AS
BEGIN
    INSERT INTO Bruger (Fornavn, Efternavn, Adresse, Email, Telefon, Oprettelsesdato)
    VALUES (@Fornavn, @Efternavn, @Adresse, @Email, @Telefon, GETDATE());
END;

GO
/****** Object:  StoredProcedure [dbo].[spOpretGebyr]    Script Date: 27-05-2025 12:43:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Stored Procedure: Opret gebyr
CREATE PROCEDURE [dbo].[spOpretGebyr]
    @BrugerID INT,
    @UdlånID INT,
    @Beløb DECIMAL(10,2),
    @Beskrivelse NVARCHAR(255)
AS
BEGIN
    IF EXISTS (SELECT 1 FROM Bruger WHERE ID = @BrugerID)
    AND EXISTS (SELECT 1 FROM Udlån WHERE ID = @UdlånID)
    BEGIN
        INSERT INTO Gebyr (BrugerID, UdlånID, Beløb, Beskrivelse, Dato, Betalt)
        VALUES (@BrugerID, @UdlånID, @Beløb, @Beskrivelse, GETDATE(), 0);
    END
END;

GO
/****** Object:  StoredProcedure [dbo].[spOpretUdlån]    Script Date: 27-05-2025 12:43:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Stored Procedure: Opret udlån
CREATE PROCEDURE [dbo].[spOpretUdlån]
    @EksemplarID INT,
    @BrugerID INT
AS
BEGIN
    IF NOT EXISTS (SELECT 1 FROM Bruger WHERE ID = @BrugerID)
        RETURN;

    IF EXISTS (
        SELECT 1 FROM Eksemplar 
        WHERE ID = @EksemplarID AND Status = 'Tilgængelig'
    )
    BEGIN
        INSERT INTO Udlån (EksemplarID, BrugerID)
        VALUES (@EksemplarID, @BrugerID);

        UPDATE Eksemplar SET Status = 'Udlejet' WHERE ID = @EksemplarID;
    END
END;

GO
/****** Object:  StoredProcedure [dbo].[spTilføjEksemplarer]    Script Date: 27-05-2025 12:43:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Stored Procedure: Tilføj eksemplarer
CREATE PROCEDURE [dbo].[spTilføjEksemplarer]
    @BogID INT,
    @Antal INT
AS
BEGIN
    IF NOT EXISTS (SELECT 1 FROM Bog WHERE ID = @BogID)
        RETURN;
    DECLARE @i INT = 1;
    WHILE @i <= @Antal
    BEGIN
        INSERT INTO Eksemplar (BogID, Status)
        VALUES (@BogID, N'Tilgængelig');
        SET @i = @i + 1;
    END
END;

GO
/****** Object:  StoredProcedure [dbo].[TestBrugerTabelPræsentation1]    Script Date: 27-05-2025 12:43:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[TestBrugerTabelPræsentation1]
AS
BEGIN
    SET NOCOUNT ON;

    -- ARRANGE
    DECLARE @errors INT = 0;
    DECLARE @kolonne NVARCHAR(128), @type NVARCHAR(50);
    PRINT 'Starter test af Bruger-tabellen.';

    -- Tjek om tabellen findes
    IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Bruger')
    BEGIN
        PRINT 'FEJL: Tabellen Bruger findes ikke.';
        SET @errors += 1;

        RAISERROR('Test fejlede: Tabellen Bruger findes ikke.', 16, 1);
        RETURN 1;
    END
    ELSE
    BEGIN
        PRINT 'Tabel Bruger findes.';
    END

    -- Forventede kolonner og datatyper
    DECLARE @columns TABLE (Kolonne NVARCHAR(128), Datatype NVARCHAR(50));
    INSERT INTO @columns VALUES
        ('ID', 'int'),
        ('Fornavn', 'nvarchar'),
        ('Efternavn', 'nvarchar'),
        ('Adresse', 'nvarchar'),
        ('Email', 'nvarchar'),
        ('Telefon', 'nvarchar'),
        ('Oprettelsesdato', 'date');

    DECLARE kolonner CURSOR FOR SELECT Kolonne, Datatype FROM @columns;
    OPEN kolonner;

    -- ACT
    FETCH NEXT FROM kolonner INTO @kolonne, @type;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'Bruger' AND COLUMN_NAME = @kolonne)
        BEGIN
            IF EXISTS (
                SELECT * FROM INFORMATION_SCHEMA.COLUMNS
                WHERE TABLE_NAME = 'Bruger' AND COLUMN_NAME = @kolonne AND DATA_TYPE = @type
            )
                PRINT 'Kolonne ' + @kolonne + ' har korrekt datatype: ' + @type;
            ELSE
            BEGIN
                PRINT 'FEJL: Kolonne ' + @kolonne + ' findes, men har forkert datatype.';
                SET @errors += 1;
            END
        END
        ELSE
        BEGIN
            PRINT 'FEJL: Kolonne ' + @kolonne + ' mangler.';
            SET @errors += 1;
        END

        FETCH NEXT FROM kolonner INTO @kolonne, @type;
    END

    CLOSE kolonner;
    DEALLOCATE kolonner;

    -- ASSERT
    PRINT 'Test af Bruger-tabellen afsluttet.';

    IF @errors = 0
    BEGIN
        PRINT 'Test bestået.';
        RETURN 0;
    END
    ELSE
    BEGIN
        DECLARE @msg NVARCHAR(200) = 'Test fejlet med ' + CAST(@errors AS NVARCHAR) + ' fejl.';
        PRINT @msg;
        RAISERROR(@msg, 16, 1);
        RETURN @errors;
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[TestDataIntegritet]    Script Date: 27-05-2025 12:43:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[TestDataIntegritet]
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @errors INT = 0;

    PRINT 'Data integrity test startet.';

    BEGIN TRANSACTION;

    -- Eksempel på NOT NULL-test
    BEGIN TRY
        INSERT INTO Bruger (Fornavn, Efternavn, Adresse, Email, Telefon, Oprettelsesdato)
        VALUES (NULL, 'Test', 'Adresse', 'test@example.com', '12345678', GETDATE());
        PRINT 'FEJL: NOT NULL-regel blev ikke håndhævet i Bruger.Fornavn';
        SET @errors += 1;
    END TRY
    BEGIN CATCH
        PRINT 'OK: NOT NULL-regel håndhævet korrekt for Bruger.Fornavn';
    END CATCH;

    -- Eksempel på UNIQUE-test
    BEGIN TRY
        INSERT INTO Bog (ISBN, Titel, Udgivelsesår, Beskrivelse)
        VALUES ('UNIK-123', 'Testbog 1', 2024, 'Første indførsel');

        INSERT INTO Bog (ISBN, Titel, Udgivelsesår, Beskrivelse)
        VALUES ('UNIK-123', 'Testbog 2', 2025, 'Gentaget ISBN');

        PRINT 'FEJL: UNIQUE-konflikt blev ikke håndhævet i Bog.ISBN';
        SET @errors += 1;
    END TRY
    BEGIN CATCH
        PRINT 'OK: UNIQUE-konflikt håndhævet korrekt for Bog.ISBN';
    END CATCH;

    -- Eksempel på FOREIGN KEY-test
    BEGIN TRY
        INSERT INTO BogGenre (BogID, GenreID)
        VALUES (99999, 99999); -- Forudsat at disse ID'er ikke findes
        PRINT 'FEJL: FOREIGN KEY-regel blev ikke håndhævet i BogGenre';
        SET @errors += 1;
    END TRY
    BEGIN CATCH
        PRINT 'OK: FOREIGN KEY-regel håndhævet korrekt for BogGenre';
    END CATCH;

    ROLLBACK TRANSACTION;

    PRINT 'Data integrity test afsluttet.';
    IF @errors = 0
        PRINT 'Test bestået.';
    ELSE
        PRINT 'Test fejlet med ' + CAST(@errors AS NVARCHAR) + ' fejl.';
END;
GO
/****** Object:  StoredProcedure [dbo].[TestLogik1Præsentation2]    Script Date: 27-05-2025 12:43:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[TestLogik1Præsentation2]
AS
BEGIN
    SET NOCOUNT ON;

    -- ARRANGE: Forbered testdata
    PRINT 'ARRANGE: Forbereder testmiljø...';

    -- Slet testbruger hvis den findes
    DELETE FROM Bruger WHERE Email = 'test@dummy.dk';

    DECLARE @Fornavn NVARCHAR(100) = 'Test';
    DECLARE @Efternavn NVARCHAR(100) = 'Bruger';
    DECLARE @Adresse NVARCHAR(255) = 'Testvej 1';
    DECLARE @Email NVARCHAR(100) = 'test@dummy.dk';
    DECLARE @Telefon NVARCHAR(20) = '12345678';

    -- ACT: Kald den stored procedure, der skal testes
    PRINT 'ACT: Kører spOpretBruger...';

    EXEC spOpretBruger
        @Fornavn = @Fornavn,
        @Efternavn = @Efternavn,
        @Adresse = @Adresse,
        @Email = @Email,
        @Telefon = @Telefon;

    -- ASSERT: Kontrollér om brugeren blev indsat korrekt
    PRINT 'ASSERT: Validerer resultat...';

    DECLARE @Fejl INT = 0;

    IF EXISTS (
        SELECT 1 FROM Bruger
        WHERE Email = @Email
          AND Fornavn = @Fornavn
          AND Efternavn = @Efternavn
          AND Adresse = @Adresse
          AND Telefon = @Telefon
    )
    BEGIN
        PRINT 'TEST BESTÅET: Bruger blev korrekt oprettet.';
    END
    ELSE
    BEGIN
        PRINT 'TEST FEJLET: Bruger blev ikke fundet med forventede værdier.';
        SET @Fejl = 1;
    END

    -- CLEANUP: Slet testbruger igen
    DELETE FROM Bruger WHERE Email = @Email;

    -- Returnér teststatus
    IF @Fejl = 0
    BEGIN
        RETURN 0;
    END
    ELSE
    BEGIN
        RAISERROR('Logiktesten fejlede: spOpretBruger indsatte ikke de forventede værdier.', 16, 1);
        RETURN 1;
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[TestStruktur]    Script Date: 27-05-2025 12:43:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[TestStruktur]
AS
BEGIN
    SET NOCOUNT ON;

    PRINT '--- Tabeltest: Finder forventede tabeller ---';
    SELECT TABLE_NAME
    FROM INFORMATION_SCHEMA.TABLES
    WHERE TABLE_TYPE = 'BASE TABLE'
      AND TABLE_NAME IN (
        'Bog', 'BogForfatter', 'BogGenre', 'Bruger', 'Eksemplar', 
        'Forfatter', 'Gebyr', 'Genre', 'Udlån'
      );

    PRINT '--- Kolonnetest: Bog ---';
    SELECT COLUMN_NAME, DATA_TYPE, CHARACTER_MAXIMUM_LENGTH
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_NAME = 'Bog';

    PRINT '--- Kolonnetest: BogForfatter ---';
    SELECT COLUMN_NAME, DATA_TYPE
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_NAME = 'BogForfatter';

    PRINT '--- Kolonnetest: BogGenre ---';
    SELECT COLUMN_NAME, DATA_TYPE
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_NAME = 'BogGenre';

    PRINT '--- Kolonnetest: Bruger ---';
    SELECT COLUMN_NAME, DATA_TYPE, CHARACTER_MAXIMUM_LENGTH
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_NAME = 'Bruger';

    PRINT '--- Kolonnetest: Eksemplar ---';
    SELECT COLUMN_NAME, DATA_TYPE
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_NAME = 'Eksemplar';

    PRINT '--- Kolonnetest: Forfatter ---';
    SELECT COLUMN_NAME, DATA_TYPE
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_NAME = 'Forfatter';

    PRINT '--- Kolonnetest: Gebyr ---';
    SELECT COLUMN_NAME, DATA_TYPE, NUMERIC_PRECISION, NUMERIC_SCALE
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_NAME = 'Gebyr';

    PRINT '--- Kolonnetest: Genre ---';
    SELECT COLUMN_NAME, DATA_TYPE
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_NAME = 'Genre';

    PRINT '--- Kolonnetest: Udlån ---';
    SELECT COLUMN_NAME, DATA_TYPE
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_NAME = 'Udlån';
END;
GO
/****** Object:  StoredProcedure [dbo].[TestStruktur2]    Script Date: 27-05-2025 12:43:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[TestStruktur2]
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @errors INT = 0;

    PRINT 'Strukturtest startet.';

    -- === Tabelkontrol og kolonnecheck ===

    -- Helper procedure to avoid repeating column checks
    DECLARE @tableName NVARCHAR(128), @columnName NVARCHAR(128), @expectedType NVARCHAR(128);

    DECLARE struktur CURSOR FOR
    SELECT * FROM (VALUES
        ('Bog', 'ID', 'int'),
        ('Bog', 'ISBN', 'nvarchar'),
        ('Bog', 'Titel', 'nvarchar'),
        ('Bog', 'Udgivelsesår', 'int'),
        ('Bog', 'Beskrivelse', 'nvarchar'),

        ('BogForfatter', 'BogID', 'int'),
        ('BogForfatter', 'ForfatterID', 'int'),

        ('BogGenre', 'BogID', 'int'),
        ('BogGenre', 'GenreID', 'int'),

        ('Bruger', 'ID', 'int'),
        ('Bruger', 'Fornavn', 'nvarchar'),
        ('Bruger', 'Efternavn', 'nvarchar'),
        ('Bruger', 'Adresse', 'nvarchar'),
        ('Bruger', 'Email', 'nvarchar'),
        ('Bruger', 'Telefon', 'nvarchar'),
        ('Bruger', 'Oprettelsesdato', 'date'),

        ('Eksemplar', 'ID', 'int'),
        ('Eksemplar', 'BogID', 'int'),
        ('Eksemplar', 'Status', 'nvarchar'),

        ('Forfatter', 'ID', 'int'),
        ('Forfatter', 'Navn', 'nvarchar'),
        ('Forfatter', 'Fødselsår', 'int'),

        ('Gebyr', 'ID', 'int'),
        ('Gebyr', 'BrugerID', 'int'),
        ('Gebyr', 'UdlånID', 'int'),
        ('Gebyr', 'Beløb', 'decimal'),
        ('Gebyr', 'Beskrivelse', 'nvarchar'),
        ('Gebyr', 'Dato', 'date'),
        ('Gebyr', 'Betalt', 'bit'),

        ('Genre', 'ID', 'int'),
        ('Genre', 'Navn', 'nvarchar'),

        ('Udlån', 'ID', 'int'),
        ('Udlån', 'EksemplarID', 'int'),
        ('Udlån', 'BrugerID', 'int'),
        ('Udlån', 'Udlånsdato', 'date'),
        ('Udlån', 'Afleveringsdato', 'date')
    ) AS struktur(TabelNavn, KolonneNavn, Datatype);

    DECLARE @lastTable NVARCHAR(128) = '';

    OPEN struktur
    FETCH NEXT FROM struktur INTO @tableName, @columnName, @expectedType

    WHILE @@FETCH_STATUS = 0
    BEGIN
        IF @lastTable != @tableName
        BEGIN
            PRINT 'Tjekker tabel: ' + @tableName;
            IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = @tableName)
            BEGIN
                PRINT 'FEJL: Tabellen ' + @tableName + ' findes ikke.';
                SET @errors += 1;
                FETCH NEXT FROM struktur INTO @tableName, @columnName, @expectedType
                CONTINUE
            END
            ELSE
                PRINT 'Tabel ' + @tableName + ' findes.';
            SET @lastTable = @tableName;
        END

        IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = @tableName AND COLUMN_NAME = @columnName)
        BEGIN
            IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = @tableName AND COLUMN_NAME = @columnName AND DATA_TYPE = @expectedType)
                PRINT 'Kolonne ' + @columnName + ' har korrekt datatype: ' + @expectedType;
            ELSE
            BEGIN
                PRINT 'FEJL: Kolonne ' + @columnName + ' findes, men har forkert datatype i ' + @tableName + '.';
                SET @errors += 1;
            END
        END
        ELSE
        BEGIN
            PRINT 'FEJL: Kolonne ' + @columnName + ' mangler i ' + @tableName + '.';
            SET @errors += 1;
        END

        FETCH NEXT FROM struktur INTO @tableName, @columnName, @expectedType
    END

    CLOSE struktur
    DEALLOCATE struktur

    PRINT 'Strukturtest afsluttet.';
    IF @errors = 0
        PRINT 'Test bestået.';
    ELSE
        PRINT 'Test fejlet med ' + CAST(@errors AS NVARCHAR) + ' fejl.';
END;
GO
/****** Object:  StoredProcedure [dbo].[TestTabelstruktur]    Script Date: 27-05-2025 12:43:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[TestTabelstruktur]
AS
BEGIN
    SET NOCOUNT ON;

    PRINT 'Starter test af tabelstruktur for Bruger-tabellen.';

    -- Tjek om tabellen Bruger findes
    IF OBJECT_ID('dbo.Bruger', 'U') IS NULL
    BEGIN
        PRINT 'FEJL: Tabellen Bruger findes ikke.';
        RETURN;
    END

    -- Forventede kolonner
    DECLARE @forventedeKolonner TABLE (Kolonne NVARCHAR(128));
    INSERT INTO @forventedeKolonner VALUES
        ('ID'),
        ('Fornavn'),
        ('Efternavn'),
        ('Adresse'),
        ('Email'),
        ('Telefon'),
        ('Oprettelsesdato');

    DECLARE @navn NVARCHAR(128);
    DECLARE @mangler INT = 0;

    DECLARE kolonneCursor CURSOR FOR SELECT Kolonne FROM @forventedeKolonner;
    OPEN kolonneCursor;
    FETCH NEXT FROM kolonneCursor INTO @navn;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        IF NOT EXISTS (
            SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
            WHERE TABLE_NAME = 'Bruger' AND COLUMN_NAME = @navn
        )
        BEGIN
            PRINT 'FEJL: Kolonne mangler: ' + @navn;
            SET @mangler += 1;
        END

        FETCH NEXT FROM kolonneCursor INTO @navn;
    END

    CLOSE kolonneCursor;
    DEALLOCATE kolonneCursor;

    IF @mangler = 0
    PRINT 'Test bestået.';
ELSE
    THROW 50001, 'Test fejlet – kolonner mangler.', 1;

END;
GO
/****** Object:  StoredProcedure [dbo].[TestValidering1Præsentation3]    Script Date: 27-05-2025 12:43:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[TestValidering1Præsentation3]
AS
BEGIN
    SET NOCOUNT ON;

    -- ARRANGE
    PRINT 'TEST: Validerer at Email er NOT NULL på Bruger-tabellen...';

    -- ACT
    BEGIN TRY
        INSERT INTO Bruger (Fornavn, Efternavn, Adresse, Email, Telefon)
        VALUES ('Fejltest', 'Bruger', 'Testvej 9', NULL, '99999999');

        -- ASSERT - fejlet, hvis vi når hertil
        PRINT 'TEST FEJLET: Rækken blev indsat uden e-mail.';
        RAISERROR('Valideringstest fejlede: E-mail blev accepteret som NULL.', 16, 1);
        RETURN 1;
    END TRY
    BEGIN CATCH
        -- ASSERT - bestået, hvis vi fanger en fejl
        PRINT 'TEST BESTÅET: Indsættelse fejlede som forventet.';
        PRINT 'Fejlmeddelelse: ' + ERROR_MESSAGE();
    END CATCH;

    -- CLEANUP
    DELETE FROM Bruger WHERE Fornavn = 'Fejltest' AND Email IS NULL;

    RETURN 0;
END;
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Registrerer aflevering af en bog og opdaterer afleveringsdato og eksemplarstatus.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'PROCEDURE',@level1name=N'spAfleverBog'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Markerer et gebyr som betalt for en bruger eller et udlån.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'PROCEDURE',@level1name=N'spBetalGebyr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Søger efter bøger hvor titlen indeholder en søgetekst (case-insensitive).' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'PROCEDURE',@level1name=N'spFindBogUdFraTitel'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Finder bøger skrevet af en bestemt forfatter ud fra navn.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'PROCEDURE',@level1name=N'spFindBøgerAfForfatter'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Søger efter bøger, der er tilknyttet en bestemt genre.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'PROCEDURE',@level1name=N'spFindBøgerMedGenre'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Finder alle ubetalte gebyrer for brugere eller udlån.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'PROCEDURE',@level1name=N'spFindUbetalteGebyrer'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Opretter en ny bog med tilhørende forfatter og genrer. Opretter også manglende relaterede data.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'PROCEDURE',@level1name=N'spOpretBogMedForfatterOgGenre'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Opretter en ny bruger i bibliotekssystemet.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'PROCEDURE',@level1name=N'spOpretBruger'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Opretter et nyt gebyr tilknyttet et udlån.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'PROCEDURE',@level1name=N'spOpretGebyr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Opretter et nyt udlån baseret på bruger og eksemplar.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'PROCEDURE',@level1name=N'spOpretUdlån'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tilføjer ét eller flere eksemplarer af en eksisterende bog.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'PROCEDURE',@level1name=N'spTilføjEksemplarer'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Bog-ID (Primærnøgle).' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Bog', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Internationalt standardnummer (ISBN), unikt for hver bog.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Bog', @level2type=N'COLUMN',@level2name=N'ISBN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Titel på bogen.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Bog', @level2type=N'COLUMN',@level2name=N'Titel'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Udgivelsesår for bogen.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Bog', @level2type=N'COLUMN',@level2name=N'Udgivelsesår'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Beskrivelse eller resumé af bogen.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Bog', @level2type=N'COLUMN',@level2name=N'Beskrivelse'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tabellen indeholder information om bøger i biblioteket.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Bog'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Many-to-many-relation mellem Bog og Forfatter.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BogForfatter'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Many-to-many-relation mellem Bog og Genre.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BogGenre'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Aktuelt status på eksemplaret: Tilgængelig, Udlånt, Reserveret.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Eksemplar', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Fysiske eksemplarer af bøger. Bruges til udlån.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Eksemplar'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Navn på forfatteren.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Forfatter', @level2type=N'COLUMN',@level2name=N'Navn'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Fødselsår for forfatteren.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Forfatter', @level2type=N'COLUMN',@level2name=N'Fødselsår'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Information om forfattere.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Forfatter'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tabellen indeholder boggenrer som Fantasy, Sci-fi, osv.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Genre'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Dato hvor bogen blev afleveret. Kan være NULL.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Udlån', @level2type=N'COLUMN',@level2name=N'Afleveringsdato'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tabellen registrerer udlån af bøger.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Udlån'
GO
USE [master]
GO
ALTER DATABASE [BibliotekDB] SET  READ_WRITE 
GO
