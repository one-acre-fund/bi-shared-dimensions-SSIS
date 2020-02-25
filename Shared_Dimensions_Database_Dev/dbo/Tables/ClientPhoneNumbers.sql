CREATE TABLE [dbo].[ClientPhoneNumbers] (
    [ClientPhoneNumberID]     INT          IDENTITY (1, 1) NOT NULL,
    [DImDistrictID]           INT          NULL,
    [CurrentRosterDistrictID] INT          NULL,
    [DimClientID]             INT          NULL,
    [DimSiteID]               INT          NULL,
    [DimSectorID]             INT          NULL,
    [DimRegionID]             INT          NULL,
    [DimCountryID]            INT          NULL,
    [RosterClientID]          INT          NULL,
    [ClientPhoneNumber]       VARCHAR (20) NULL,
    [PhoneNumberTypeName]     VARCHAR (15) NULL,
    [IsInactive]              BIT          NULL,
    [InactiveDate]            DATETIME     NULL
);


GO
CREATE NONCLUSTERED INDEX [ClientPhoneNumbers_DimClientID_PhoneNumberTypeName_Active]
    ON [dbo].[ClientPhoneNumbers]([DimClientID] ASC, [PhoneNumberTypeName] ASC, [IsInactive] ASC);

