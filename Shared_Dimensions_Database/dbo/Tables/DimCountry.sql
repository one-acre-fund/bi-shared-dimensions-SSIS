CREATE TABLE [dbo].[DimCountry] (
    [CountryId]    INT           IDENTITY (1, 1) NOT NULL,
    [CountryCode]  NVARCHAR (8)  NULL,
    [Active]       BIT           NOT NULL,
    [CountryName]  NVARCHAR (20) NULL,
    [CurrencyCode] NVARCHAR (4)  NULL,
    CONSTRAINT [PK_DimCountry_DimCountryID] PRIMARY KEY NONCLUSTERED ([CountryId] ASC)
);

