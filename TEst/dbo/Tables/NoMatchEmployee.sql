CREATE TABLE [dbo].[NoMatchEmployee] (
    [EmployeeID]        INT            NULL,
    [EmployeeCode]      INT            NULL,
    [FirstName]         NVARCHAR (100) NULL,
    [MiddleName]        NVARCHAR (100) NULL,
    [Active]            INT            NULL,
    [LastName]          NVARCHAR (100) NULL,
    [ApplicationUserID] NVARCHAR (450) NULL,
    [DepartmentCode]    VARCHAR (4)    NULL,
    [LocationCode]      VARCHAR (4)    NULL,
    [JobgradeCode]      VARCHAR (30)   NULL,
    [DimCountryID]      INT            NULL,
    [DepartmentID]      INT            NULL,
    [LocationID]        INT            NULL,
    [MismatchReason]    NVARCHAR (300) NULL,
    [CompanyNumber]     INT            NULL,
    [FullName]          NVARCHAR (150) NULL,
    [EmailAddress]      VARCHAR (60)   NULL,
    [Source]            NVARCHAR (20)  NULL,
    [DayName]           VARCHAR (20)   NULL,
    [MMNumber]          VARCHAR (40)   NULL,
    [MMName]            VARCHAR (40)   NULL,
    [MMCarrier]         VARCHAR (40)   NULL,
    [BankAccountNumber] VARCHAR (50)   NULL,
    [BankName]          VARCHAR (50)   NULL,
    [BankAccountName]   VARCHAR (50)   NULL,
    [SwiftCode]         VARCHAR (30)   NULL
);


GO


CREATE TRIGGER [dbo].[VIPEmailAlert]
ON [dbo].[NoMatchEmployee]
AFTER INSERT
AS
BEGIN
	DECLARE	@return_value int
		IF EXISTS (SELECT 1 FROM VIP_Employee_WebUserErrors() where DimCountryID=1 and  MismatchReason!='None' and (ErrorSource in ('Nomatch','Webuser')) and DayName in ('Tuesday','Thursday'))
			BEGIN
				EXEC	@return_value = [dbo].[SendMMEmailAlert]
				@countryID = 1,--KE
				@email = 'peter.aminga@oneacrefund.org; grace.odongo@oneacrefund.org',
				@ccemail = N'bernard.ekea@oneacrefund.org; fredrick.mandela@oneacrefund.org;agnes.niyonsenga@oneacrefund.org; prince.harindintwari@oneacrefund.org; simon.makali@oneacrefund.org'
			END
		IF EXISTS (SELECT 1 FROM VIP_Employee_WebUserErrors() where DimCountryID=2 and  MismatchReason!='None' and (ErrorSource in ('Nomatch','Webuser')) and DayName in ('Tuesday','Thursday'))
			BEGIN
				EXEC	 [dbo].[SendBankEmailAlert]
				@countryID = 2, --RW
				@email = N'nadie.niyonkuru@oneacrefund.org; scholastique.mukandayise@oneacrefund.org; daniel.mutiganda@oneacrefund.org',
				@ccemail = N'bernard.ekea@oneacrefund.org;fredrick.mandela@oneacrefund.org;agnes.niyonsenga@oneacrefund.org; prince.harindintwari@oneacrefund.org; simon.makali@oneacrefund.org'

			END
		IF EXISTS (SELECT 1 FROM VIP_Employee_WebUserErrors() where DimCountryID=3 and  MismatchReason!='None' and (ErrorSource in ('Nomatch','Webuser')) and DayName in ('Tuesday','Thursday'))
			BEGIN
				EXEC	@return_value = [dbo].[SendMMEmailAlert]
				@countryID = 3, --TZ
				@email = N'christabell.isaac@oneacrefund.org; alasana.gasper@oneacrefund.org; audrey.hicks@oneacrefund.org',
				@ccemail = N'bernard.ekea@oneacrefund.org; fredrick.mandela@oneacrefund.org;agnes.niyonsenga@oneacrefund.org; prince.harindintwari@oneacrefund.org; simon.makali@oneacrefund.org'
			END
		IF EXISTS (SELECT 1 FROM VIP_Employee_WebUserErrors() where DimCountryID=4 and  MismatchReason!='None' and (ErrorSource in ('Nomatch','Webuser')) and DayName in ('Tuesday','Thursday'))
			BEGIN
				EXEC	@return_value = [dbo].[SendBankEmailAlert]
				@countryID = 4, -- BI
				@email = N'estella.bakuranahageze@oneacrefund.org; suavis.niyubahwe@oneacrefund.org; leslye.womack@oneacrefund.org',
				@ccemail = N'bernard.ekea@oneacrefund.org; fredrick.mandela@oneacrefund.org;agnes.niyonsenga@oneacrefund.org; prince.harindintwari@oneacrefund.org; simon.makali@oneacrefund.org'
			END
		IF EXISTS (SELECT 1 FROM VIP_Employee_WebUserErrors() where DimCountryID=6 and  MismatchReason!='None' and (ErrorSource in ('Nomatch','Webuser')) and DayName in ('Tuesday','Thursday'))
			BEGIN
				EXEC	@return_value = [dbo].[SendMMEmailAlert]
				@countryID = 6, -- UG
				@email = N'jane.nansubuga@oneacrefund',
				@ccemail = N'bernard.ekea@oneacrefund.org; fredrick.mandela@oneacrefund.org;agnes.niyonsenga@oneacrefund.org; prince.harindintwari@oneacrefund.org; simon.makali@oneacrefund.org'
			END
		IF EXISTS (SELECT 1 FROM VIP_Employee_WebUserErrors() where DimCountryID=7 and  MismatchReason!='None' and (ErrorSource in ('Nomatch','Webuser')) and DayName in ('Tuesday','Thursday'))
			BEGIN
				EXEC	@return_value = [dbo].[SendBankEmailAlert]
				@countryID = 7, -- MW
				@email = N'mirriam.phiri@oneacrefund.org; liviness.chiusiwa@oneacrefund.org; amari.alexander@oneacrefund.org',
				@ccemail = N'bernard.ekea@oneacrefund.org; fredrick.mandela@oneacrefund.org;agnes.niyonsenga@oneacrefund.org; prince.harindintwari@oneacrefund.org; simon.makali@oneacrefund.org'
			END
		IF EXISTS (SELECT 1 FROM VIP_Employee_WebUserErrors() where DimCountryID=10 and  MismatchReason!='None' and (ErrorSource in ('Nomatch','Webuser')) and DayName in ('Tuesday','Thursday'))
			BEGIN
				EXEC	@return_value = [dbo].[SendBankEmailAlert]
				@countryID = 10, -- ZA
				@email = N'kalaba.chikoti@oneacrefund.org; gina.herreramoreno@oneacrefund.org',
				@ccemail = N'bernard.ekea@oneacrefund.org; fredrick.mandela@oneacrefund.org;agnes.niyonsenga@oneacrefund.org; prince.harindintwari@oneacrefund.org; simon.makali@oneacrefund.org'
			END
		
	SELECT	'Return Value' = @return_value

END

GO



CREATE TRIGGER [dbo].[BambooHrEmailAlert]
ON [dbo].[NoMatchEmployee]
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

	DECLARE @tableHTML  NVARCHAR(MAX), @temp varchar(150), @string1 varchar(100), @fin date;
	SET @temp = GETDATE();
	SET @fin = CONVERT(date, @temp);
	SET @string1 = 'BambooHR Employees Error Report: ';

	SET @temp = @string1 + convert(varchar(150),@fin)

	--SET @temp = CONCAT('Terminated VIP Employees Since: ', @temp);
	SET @tableHTML =
	   N'<head>' +
		N'<style type="text/css">h2, body {font-family: Arial, verdana;} table{font-size:11px; border-collapse:collapse;} td{background-color:#F1F1F1; border:1px solid black; padding:3px;} th{background-color:#99CCFF;}</style>' +
	   N'<h2><font color="#0000ff" size="4"></font></h2>' +   
	   N'</head>' +
	N'<body> <p>Hello, <br>The following BambooHr Employees could not be loaded to the web portal. Please check the MismatchReason field for the exact issue. <br> </p>' +
	N' <hr> ' +
	N' ' +
   
      
		N'<table border="1">' +
		N'<tr><th>StartDate</th>' +
		N'<th>CountryCode</th><th>EmployeeCode</th>' +
		N'<th>Fullname</th><th>EmailAddress</th><th>JobgradeCode</th>' +
		N'<th>DepartmentCode</th>' +
		N'<th>LocationCode</th><th>MismatchReason</th>
		</tr>' +
		CAST ( ( select td = ISNULL(CONVERT(date,e.StartDate), ''), '',
						td = ISNULL(e.CountryCode,' '), '', 
						td = ISNULL(a.EmployeeCode, ' '), '',
						td = ISNULL(e.FullName, ' '), '',
						td = ISNULL(a.EmailAddress, ' '), '', 
						td = ISNULL(a.JobgradeCode, ' '), '',
						td = ISNULL(a.DepartmentCode, ' '),'', 
						td = ISNULL(a.LocationCode, ' '),	'',	
						td = ISNULL(a.MismatchReason, ' '), ''
				from NoMatchEmployee a join Employee e on a.EmployeeID=e.EmployeeID where a.Active=1 and a.Source='Bamboohr' and e.StartDate <= GETDATE()
				  FOR XML PATH('tr'), TYPE 
		) AS NVARCHAR(MAX) ) +
		N'</table>
		<p> <br> For further clarification contact <br> fredrick.mandela@oneacrefund.org </p><br>
		<p> Best Regards, <br> BOS Datawarehouse Team </p>' ;

    IF EXISTS (SELECT 1 FROM NomatchEmployee n join Employee e on n.EmployeeId=e.EmployeeID where n.Source='BambooHr' and e.StartDate<=GETDATE() and DayName in ('Tuesday','Thursday'))
    BEGIN
        EXEC msdb.dbo.sp_send_dbmail @recipients='fredrick.mandela@oneacrefund.org; 
													scott.noel@oneacrefund.org; 
													agnes.niyonsenga@oneacrefund.org; 
													marika.west@oneacrefund.org;
													pearl.pagarigan@oneacrefund.org;
													katie.henneman@oneacrefund.org;
													yvonne.oiye@oneacrefund.org',
          @profile_name = 'default',
          @subject = @temp, 
          @body = @tableHTML,
		  @body_format = 'HTML' ;
    END
END
