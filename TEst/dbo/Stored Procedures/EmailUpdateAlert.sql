-- =============================================
-- Author:		Fredrick Mandela
-- Create date: 03/12/2019
-- Description:	Updated Email alert. this goes to Payroll admins and web user managers to notify them of a change in a staffer's email to ensure the update is valid 
-- =============================================


CREATE PROCEDURE [dbo].[EmailUpdateAlert]
AS
BEGIN
	SET NOCOUNT ON;	
	DECLARE @tableHTML  NVARCHAR(MAX), @temp varchar(150), @string1 varchar(100), @fin date;
	SET @temp = GETDATE();
	SET @fin = CONVERT(date, @temp);
	
	SET @temp = @string1 + convert(varchar(150),@fin)
	SET @string1 = 'List of Updated Employee Email Addresses: ';

	SET @temp = @string1 + convert(varchar(150),@fin)

	SET @tableHTML =
	   N'<head>' +
		N'<style type="text/css">h2, body {font-family: Arial, verdana;} table{font-size:11px; border-collapse:collapse;} td{background-color:#F1F1F1; border:1px solid black; padding:3px;} th{background-color:#99CCFF;}</style>' +
	   N'<h2><font color="#0000ff" size="4"></font></h2>' +   
	   N'</head>' +
		N'<body> <p>Hello, <br>The following employees have different email addresses in VIP and the web portal. Please verify the correct one and take the following steps to correct it: <br> <ul><li>If the VIP Email is incorrect then please coordinate with the VIP admin to make correction and the changes will be reflected in the next sync</li><li>If the web portal email is incorrect, then coordinated with Agnes (ccd) to updated the email in the web portal.</li></ul><br> </p>' +
		N' <hr> <p><h2>Employee List</h2></p><br>' +
		N' ' +
   
      
		N'<table border="1">' +
		N'<tr><th>CompanyNumber</th><th>EmployeeCode</th>' +
		N'<th>Fullname</th><th>EmailAddress</th><th>JobgradeCode</th>' +
		N'<th>DepartmentCode</th>' +
		N'<th>LocationCode</th><th>MismatchReason</th>
		</tr>' +
		CAST ( ( 
			 select 
						td = ISNULL(CountryCode,' '), '', 
						td = ISNULL(EmployeeCode, ' '), '',
						td = ISNULL(DepartmentCode, ' '), '',
						td = ISNULL(LocationCode, ' '), '', 
						td = ISNULL(JobgradeCode, ' '), '',
						td = ISNULL(FullName, ' '),'', 
						td = ISNULL(OldEmailAddress, ' '),	'',	
						td = ISNULL(NewEmailAddress, ' '), ''
				from UpdatedEmails where NewEmailAddress is not null and OldEmailAddress is not null

				  FOR XML PATH('tr'), TYPE 
		) AS NVARCHAR(MAX) ) +
		N'</table> 
		
		<p>For further clarification please contact: <br> fredrick.mandela@oneacrefund.org <br><br>
		
		Regards, <br>
		BOS Datawarehouse Team</p>' ;

	 
		BEGIN
			EXEC msdb.dbo.sp_send_dbmail @recipients='fredrick.mandela@oneacrefund.org',--bernard.ekea@oneacrefund.org; aurelien.vetil@oneacrefund.org; agnes.niyonsenga@oneacrefund.org',
				@profile_name = 'OAF BOS Mail',
				@subject = @temp, 
				@body = @tableHTML,
				@body_format = 'HTML' ;
		END
		

END


