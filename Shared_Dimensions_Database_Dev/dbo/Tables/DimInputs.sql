CREATE TABLE [dbo].[DimInputs] (
    [InputID]       INT              IDENTITY (1, 1) NOT NULL,
    [RosterInputID] INT              NULL,
    [InputCategory] NVARCHAR (255)   NULL,
    [InputType]     NVARCHAR (255)   NULL,
    [InputName]     NVARCHAR (255)   NULL,
    [InputNotes]    VARCHAR (255)    NULL,
    [Active]        BIT              NULL,
    [Warranty]      BIT              NULL,
    [Deliverable]   BIT              NULL,
    [Ag]            INT              NULL,
    [NonAg]         INT              NULL,
    [RowGuid]       UNIQUEIDENTIFIER NULL
);


GO
CREATE NONCLUSTERED INDEX [DimInputs_InputID]
    ON [dbo].[DimInputs]([InputID] ASC)
    INCLUDE([InputName]);

