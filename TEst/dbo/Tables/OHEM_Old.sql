CREATE TABLE [dbo].[OHEM_Old] (
    [firstname]    NVARCHAR (50)  NULL,
    [lastname]     NVARCHAR (50)  NULL,
    [middlename]   NVARCHAR (50)  NULL,
    [email]        NVARCHAR (100) NULL,
    [active]       VARCHAR (1)    NULL,
    [ExtEmpNo]     NVARCHAR (20)  NULL,
    [U_WebUser]    NVARCHAR (3)   NULL,
    [CountryCode]  NVARCHAR (10)  NULL,
    [EmpId]        INT            NULL,
    [U_U_JobGrade] INT            NULL,
    [workBlock]    NVARCHAR (100) NULL,
    [workzip]      NVARCHAR (20)  NULL,
    [jobTitle]     NVARCHAR (20)  NULL,
    [officeExt]    NVARCHAR (20)  NULL,
    [U_DApprover]  NVARCHAR (50)  NULL,
    [U_BApprover]  NVARCHAR (50)  NULL
);

