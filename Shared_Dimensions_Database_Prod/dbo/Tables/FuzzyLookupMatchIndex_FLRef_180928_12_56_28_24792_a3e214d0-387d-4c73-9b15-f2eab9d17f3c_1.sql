CREATE TABLE [dbo].[FuzzyLookupMatchIndex_FLRef_180928_12:56:28_24792_a3e214d0-387d-4c73-9b15-f2eab9d17f3c] (
    [RosterClientID]                                                 INT              NOT NULL,
    [CurrentRosterDistrictID]                                        INT              NOT NULL,
    [FirstName]                                                      NVARCHAR (255)   NULL,
    [LastName]                                                       NVARCHAR (255)   NULL,
    [GlobalClientID]                                                 UNIQUEIDENTIFIER NOT NULL,
    [Gender]                                                         VARCHAR (10)     NULL,
    [RosterFirstSeasonID]                                            INT              NULL,
    [ClientID]                                                       INT              NULL,
    [RID_180928_12:56:28_24792_a3e214d0-387d-4c73-9b15-f2eab9d17f3c] INT              IDENTITY (1, 1) NOT NULL
);


GO
CREATE CLUSTERED INDEX [rid_idx]
    ON [dbo].[FuzzyLookupMatchIndex_FLRef_180928_12:56:28_24792_a3e214d0-387d-4c73-9b15-f2eab9d17f3c]([RID_180928_12:56:28_24792_a3e214d0-387d-4c73-9b15-f2eab9d17f3c] ASC);

