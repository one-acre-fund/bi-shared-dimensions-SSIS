CREATE TABLE [dbo].[DimHealthyPath] (
    [CountryCode]        NVARCHAR (255) NULL,
    [HealthyPathDate]    DATETIME       NULL,
    [HealthyPathPercent] DECIMAL (3, 2) NULL,
    [SeasonName]         NVARCHAR (255) NULL,
    [SeasonId]           INT            NULL,
    [SeasonWeek]         INT            NULL,
    [DimCountryID]       INT            NULL,
    [DimHealthyPathID]   BIGINT         NULL,
    [OperationalYear]    INT            NULL,
    [SeasonDate]         INT            NULL,
    [Year]               INT            NULL,
    [Month]              INT            NULL,
    [MonthName]          NVARCHAR (20)  NULL,
    [Quarter]            INT            NULL,
    [QuarterName]        NVARCHAR (10)  NULL,
    [ID]                 INT            IDENTITY (1, 1) NOT NULL,
    [WOSD]               INT            NULL,
    [HPPID]              INT            NULL,
    [HPP]                INT            NULL
);

