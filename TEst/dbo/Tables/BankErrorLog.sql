CREATE TABLE [dbo].[BankErrorLog] (
    [EmployeeID]       INT            NULL,
    [EmployeeCode]     INT            NULL,
    [CountryID]        INT            NULL,
    [BankAccontNumber] NVARCHAR (50)  NULL,
    [BankAccountName]  NVARCHAR (100) NULL,
    [BankBranchName]   NVARCHAR (100) NULL,
    [BankName]         NVARCHAR (100) NULL,
    [SwiftCode]        NVARCHAR (20)  NULL,
    [UpdateDate]       DATETIME       NULL
);

