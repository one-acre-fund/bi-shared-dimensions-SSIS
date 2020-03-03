CREATE TABLE [dbo].[ETL_LoadLog] (
    [TableName]        NVARCHAR (30) NULL,
    [ExportStartDate]  DATETIME      NULL,
    [ExportEndDate]    DATETIME      NULL,
    [RowExtractCount]  INT           NULL,
    [RowInsertCount]   INT           NULL,
    [RowUpdateCount]   INT           NULL,
    [ID]               INT           IDENTITY (1, 1) NOT NULL,
    [LoadStartDate]    DATETIME      NULL,
    [LoadEndDate]      DATETIME      NULL,
    [Incremental_Load] INT           DEFAULT ((1)) NOT NULL,
    [Truncate_Load]    INT           DEFAULT ((0)) NOT NULL
);

