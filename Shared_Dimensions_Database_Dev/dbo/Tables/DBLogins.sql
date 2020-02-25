CREATE TABLE [dbo].[DBLogins] (
    [DatabaseName]     NVARCHAR (128) NULL,
    [UserName]         NVARCHAR (128) NULL,
    [UserType]         VARCHAR (12)   NULL,
    [DatabaseUserName] NVARCHAR (128) NULL,
    [Role]             NVARCHAR (128) NULL,
    [PermissionType]   NVARCHAR (128) NULL,
    [PermissionState]  NVARCHAR (60)  NULL,
    [ObjectType]       NVARCHAR (60)  NULL,
    [ObjectName]       NVARCHAR (128) NULL,
    [ColumnName]       NVARCHAR (128) NULL
);

