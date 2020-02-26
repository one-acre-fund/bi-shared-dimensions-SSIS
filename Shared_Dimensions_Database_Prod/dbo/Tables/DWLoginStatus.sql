CREATE TABLE [dbo].[DWLoginStatus] (
    [Name]          [sysname]     NOT NULL,
    [Description]   NVARCHAR (60) COLLATE Latin1_General_CI_AS_KS_WS NULL,
    [create_date]   DATETIME      NOT NULL,
    [Active]        INT           NOT NULL,
    [LastLoginDate] DATETIME      NULL
);

