CREATE TABLE [dbo].[UpdatedEmails] (
    [CountryCode]     NVARCHAR (10)  NULL,
    [DepartmentCode]  VARCHAR (4)    NULL,
    [LocationCode]    VARCHAR (4)    NULL,
    [FullName]        NVARCHAR (150) NULL,
    [NewEmailAddress] VARCHAR (60)   NULL,
    [EmployeeCode]    INT            NULL,
    [CompanyNumber]   INT            NULL,
    [TerminationDate] DATETIME       NULL,
    [StartDate]       DATETIME       NULL,
    [Source]          NVARCHAR (20)  NULL,
    [OldEmailAddress] VARCHAR (150)  NULL,
    [EmployeeID]      INT            NULL,
    [AddedDate]       DATETIME       NULL,
    [JobGradeCode]    VARCHAR (30)   NULL
);

