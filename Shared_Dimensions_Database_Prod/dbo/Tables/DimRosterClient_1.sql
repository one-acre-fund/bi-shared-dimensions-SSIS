CREATE TABLE [dbo].[DimRosterClient] (
    [ClientID]                INT              NOT NULL,
    [GlobalClientID]          UNIQUEIDENTIFIER NOT NULL,
    [DateAdded]               INT              NULL,
    [Enrollmentdate]          INT              NULL,
    [CurrentRosterDistrictID] INT              NOT NULL,
    [RosterClientID]          INT              NOT NULL,
    [AccountNumber]           INT              NULL,
    [FirstName]               NVARCHAR (255)   NULL,
    [LastName]                NVARCHAR (255)   NULL,
    [Deceased]                BIT              NULL,
    [DeceasedDate]            INT              NULL,
    [Ban]                     BIT              NULL,
    [BannedDate]              INT              NULL,
    [ClientBirthYear]         NVARCHAR (50)    NULL,
    [Gender]                  VARCHAR (10)     NULL,
    [NationalID]              VARCHAR (255)    NULL,
    [RosterFirstSeasonID]     INT              NULL,
    [ValidationCode]          INT              NULL,
    [CanEnrollAsNewMember]    BIT              NULL,
    [DImDistrictID]           INT              NULL,
    [FirstSeasonID]           INT              NULL,
    [DimCountryID]            INT              NULL,
    [BeneficiaryFirstName]    NVARCHAR (100)   NULL,
    [BeneficiaryLastName]     NVARCHAR (100)   NULL,
    [BeneficiaryBirthYear]    NVARCHAR (50)    NULL,
    [BeneficiaryNationalID]   VARCHAR (255)    NULL,
    [DimGroupID]              INT              NULL,
    [DimSiteID]               INT              NULL,
    [GovLocationGrandParent]  VARCHAR (100)    NULL,
    [GovLocationParent]       VARCHAR (100)    NULL,
    [GovLocationChild]        VARCHAR (100)    NULL,
    [GovLocationGrandChild]   VARCHAR (100)    NULL,
    CONSTRAINT [PK_DimRosterClient] PRIMARY KEY CLUSTERED ([ClientID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [RosterClientID_Index]
    ON [dbo].[DimRosterClient]([CurrentRosterDistrictID] ASC, [RosterClientID] ASC)
    INCLUDE([ClientID]);


GO
CREATE NONCLUSTERED INDEX [GlobalClientID_IDX]
    ON [dbo].[DimRosterClient]([GlobalClientID] ASC);

