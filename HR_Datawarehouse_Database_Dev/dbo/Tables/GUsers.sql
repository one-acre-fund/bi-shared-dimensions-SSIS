CREATE TABLE [dbo].[GUsers] (
    [Country]          VARCHAR (255)  NULL,
    [FirstName]        VARCHAR (255)  NULL,
    [LastName]         VARCHAR (255)  NULL,
    [EmailAddress]     VARCHAR (255)  NULL,
    [OrgUnitPath]      VARCHAR (255)  NULL,
    [LastSignIn]       VARCHAR (255)  NULL,
    [EmailUsage]       VARCHAR (255)  NULL,
    [DriveUsage]       VARCHAR (255)  NULL,
    [TotalStorage]     VARCHAR (255)  NULL,
    [Status]           VARCHAR (255)  NULL,
    [HREmployeeID]     INT            NULL,
    [HRFullName]       NVARCHAR (150) NULL,
    [HREmailAddress]   VARCHAR (150)  NULL,
    [HRDepartmentCode] NVARCHAR (50)  NULL,
    [HRLocationCode]   NVARCHAR (50)  NULL,
    [HRJobGradeCode]   NVARCHAR (50)  NULL,
    [HRActive]         BIT            NULL
);

