CREATE TABLE [dbo].[VIP_Payroll] (
    [Number]                     INT           NULL,
    [Deduction Short Name]       VARCHAR (60)  NULL,
    [Earnings Short Name]        VARCHAR (60)  NULL,
    [Deduction Alt Name]         VARCHAR (60)  NULL,
    [Earnings Alt Name]          VARCHAR (60)  NULL,
    [Deduction Eng Name]         VARCHAR (60)  NULL,
    [Earnings Eng Name]          VARCHAR (60)  NULL,
    [Deduction Account]          VARCHAR (60)  NULL,
    [Deduction ContraAccount]    VARCHAR (60)  NULL,
    [Earn Account]               VARCHAR (60)  NULL,
    [Earning ContraAccount]      VARCHAR (60)  NULL,
    [Contribution Account]       VARCHAR (60)  NULL,
    [Contribution ContraAccount] VARCHAR (60)  NULL,
    [CountryCode]                NVARCHAR (10) NULL
);

