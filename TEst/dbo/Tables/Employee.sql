CREATE TABLE [dbo].[Employee] (
    [EmployeeID]        INT            IDENTITY (1, 1) NOT NULL,
    [CountryCode]       NVARCHAR (10)  NULL,
    [DepartmentCode]    VARCHAR (4)    NULL,
    [LocationCode]      VARCHAR (4)    NULL,
    [FullName]          NVARCHAR (150) NULL,
    [FirstName]         NVARCHAR (100) NULL,
    [MiddleName]        NVARCHAR (100) NULL,
    [Active]            INT            NULL,
    [LastName]          NVARCHAR (100) NULL,
    [JobGradeCode]      VARCHAR (30)   NULL,
    [EmailAddress]      VARCHAR (60)   NULL,
    [DimCountryID]      INT            NULL,
    [DimDepartmentID]   INT            NULL,
    [DimLocationID]     INT            NULL,
    [DimJobGradeID]     INT            NULL,
    [EmployeeCode]      INT            NULL,
    [CompanyNumber]     INT            NULL,
    [BankName]          VARCHAR (50)   NULL,
    [BankAccountNumber] VARCHAR (50)   NULL,
    [BankAccountName]   VARCHAR (30)   NULL,
    [BankBranchName]    VARCHAR (50)   NULL,
    [ApplicationUserID] NVARCHAR (450) NULL,
    [SwiftCode]         VARCHAR (30)   NULL,
    [StartDate]         DATETIME       NULL,
    [TerminationDate]   DATETIME       NULL,
    [PayGrade]          VARCHAR (8)    NULL,
    [JobTitle]          VARCHAR (40)   NULL,
    [MMNumber]          VARCHAR (40)   NULL,
    [MMName]            VARCHAR (40)   NULL,
    [MMCarrier]         VARCHAR (40)   NULL,
    [Source]            NVARCHAR (20)  NULL,
    [BambooHrID]        INT            NULL,
    [Project]           NVARCHAR (50)  NULL,
    [Nationality]       NVARCHAR (100) NULL,
    [WorkCity]          NVARCHAR (100) NULL,
    [Gender]            VARCHAR (5)    NULL,
    [CellPhoneNo]       VARCHAR (20)   NULL,
    [IDNumber]          VARCHAR (20)   NULL,
    [PayInfo2]          VARCHAR (30)   NULL,
    [WebUser]           VARCHAR (40)   NULL,
    [LastUpdatedDate]   DATETIME       NULL,
    [UpdateRoles]       INT            NULL,
    CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED ([EmployeeID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [v_Bamboo_Souce]
    ON [dbo].[Employee]([Source] ASC)
    INCLUDE([FullName], [FirstName], [LastName], [JobGradeCode], [EmailAddress], [Nationality], [DimCountryID], [DimDepartmentID], [DimLocationID], [EmployeeCode], [StartDate], [TerminationDate]);

