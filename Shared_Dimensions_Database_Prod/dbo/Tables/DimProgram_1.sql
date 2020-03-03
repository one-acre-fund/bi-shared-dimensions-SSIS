CREATE TABLE [dbo].[DimProgram] (
    [ProgramId]       INT           IDENTITY (1, 1) NOT NULL,
    [Program]         NVARCHAR (20) NULL,
    [RosterProgramId] INT           NULL,
    [CountryId]       INT           NULL,
    [CountryCode]     NVARCHAR (8)  NULL,
    [CountryName]     NVARCHAR (20) NULL
);

