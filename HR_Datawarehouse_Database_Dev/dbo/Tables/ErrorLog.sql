CREATE TABLE [dbo].[ErrorLog] (
    [FirstName]          NVARCHAR (100) NULL,
    [LastName]           NVARCHAR (100) NULL,
    [Active]             BIT            NULL,
    [ApplicationUserID]  NVARCHAR (450) NULL,
    [EmailAddress]       NVARCHAR (256) NULL,
    [NormalizedEmail]    NVARCHAR (256) NULL,
    [NormalizedUserName] NVARCHAR (256) NULL,
    [UserName]           NVARCHAR (256) NULL,
    [DepartmentCode]     VARCHAR (4)    NULL,
    [LocationCode]       VARCHAR (4)    NULL,
    [EmployeeNumber]     INT            NULL,
    [JobTitle]           NVARCHAR (MAX) NULL,
    [JobGradeCode]       VARCHAR (30)   NULL,
    [MIddleName]         NVARCHAR (100) NULL,
    [TerminationDate]    DATETIME       NULL,
    [HireDate]           DATETIME       NULL,
    [CountryID]          INT            NULL,
    [DepartmentID]       INT            NULL,
    [LocationID]         INT            NULL,
    [JobGradeID]         INT            NULL
);

