CREATE TABLE [dbo].[SFPaymentInformationDetail] (
    [ID]                          INT           IDENTITY (1, 1) NOT NULL,
    [EffectiveStartDate]          DATETIME      NULL,
    [ExternalCode]                VARCHAR (30)  NULL,
    [PaymentInformationV3_worker] VARCHAR (30)  NULL,
    [LastModifiedDateTime]        DATETIME      NULL,
    [CreatedDateTime]             DATETIME      NULL,
    [PaySequence]                 VARCHAR (10)  NULL,
    [BankCountry]                 VARCHAR (10)  NULL,
    [BankCode]                    VARCHAR (10)  NULL,
    [PayType]                     VARCHAR (20)  NULL,
    [SwiftCode]                   VARCHAR (30)  NULL,
    [BankAccountName]             VARCHAR (150) NULL,
    [MdfSystemRecordStatus]       VARCHAR (5)   NULL,
    [IBAN]                        VARCHAR (20)  NULL,
    [PaymentMethod]               VARCHAR (10)  NULL,
    [Currency]                    VARCHAR (20)  NULL,
    [BankAccountNumber]           VARCHAR (40)  NULL,
    [RoutingNumber]               VARCHAR (30)  NULL
);

