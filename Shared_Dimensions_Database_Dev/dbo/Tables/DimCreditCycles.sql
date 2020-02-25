CREATE TABLE [dbo].[DimCreditCycles] (
    [CreditCycleID]        INT            IDENTITY (1, 1) NOT NULL,
    [RosterCreditCycleID]  INT            NULL,
    [RosterSeasonID]       INT            NULL,
    [CreditCycleName]      VARCHAR (100)  NULL,
    [DimSeasonID]          INT            NULL,
    [SeasonName]           NVARCHAR (100) NULL,
    [CountryID]            INT            NULL,
    [CreditCycleActive]    BIT            NULL,
    [RoundPrecisionLength] INT            NULL,
    [RoundisTruncated]     BIT            NULL,
    [CreditCycleDueDate]   INT            NULL,
    [OperationalYear]      INT            NULL
);

