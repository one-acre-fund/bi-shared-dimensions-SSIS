CREATE TABLE [dbo].[WebUpdate] (
    [ID]              NVARCHAR (450) NULL,
    [EmployeeNumber]  NVARCHAR (20)  NULL,
    [Email]           NVARCHAR (256) NULL,
    [Fullname]        NVARCHAR (201) NULL,
    [DepartmentID]    INT            NULL,
    [LocationID]      INT            NULL,
    [CountryID]       INT            NULL,
    [StartDate]       DATETIME2 (7)  NULL,
    [TerminationDate] NVARCHAR (MAX) NULL
);

