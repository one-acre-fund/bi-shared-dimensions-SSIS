CREATE TABLE [dbo].[FuzzyLookupMatchIndex_FLRef_180928_12:50:16_10308_4e0dfb96-949a-4ae6-bb8e-69de162c5092] (
    [RosterClientID]                                                 INT              NOT NULL,
    [CurrentRosterDistrictID]                                        INT              NOT NULL,
    [FirstName]                                                      NVARCHAR (255)   NULL,
    [LastName]                                                       NVARCHAR (255)   NULL,
    [GlobalClientID]                                                 UNIQUEIDENTIFIER NOT NULL,
    [Gender]                                                         VARCHAR (10)     NULL,
    [RosterFirstSeasonID]                                            INT              NULL,
    [ClientID]                                                       INT              NULL,
    [RID_180928_12:50:16_10308_4e0dfb96-949a-4ae6-bb8e-69de162c5092] INT              IDENTITY (1, 1) NOT NULL
);


GO
CREATE CLUSTERED INDEX [rid_idx]
    ON [dbo].[FuzzyLookupMatchIndex_FLRef_180928_12:50:16_10308_4e0dfb96-949a-4ae6-bb8e-69de162c5092]([RID_180928_12:50:16_10308_4e0dfb96-949a-4ae6-bb8e-69de162c5092] ASC);

