


CREATE procedure [dbo].[SendMMEmailAlert](@countryID int, @email nvarchar(MAX), @ccemail nvarchar(max))
AS 
BEGIN
    SET NOCOUNT ON;	
	DECLARE @tableHTML  NVARCHAR(MAX), @temp varchar(150), @string1 varchar(100), @fin date;
	SET @temp = GETDATE();
	SET @fin = CONVERT(date, @temp);
	
	SET @temp = @string1 + convert(varchar(150),@fin)
	SET @string1 = 'VIP Employees Error Report: ';

	SET @temp = @string1 + convert(varchar(150),@fin)

	--SET @temp = CONCAT('Terminated VIP Employees Since: ', @temp);
	SET @tableHTML =
	   N'<head>' +
		N'<style type="text/css">h2, body {font-family: Arial, verdana;} table{font-size:11px; border-collapse:collapse;} td{background-color:#F1F1F1; border:1px solid black; padding:3px;} th{background-color:#99CCFF;}</style>' +
	   N'<h2><font color="#0000ff" size="4"></font></h2>' +   
	   N'</head>' +
		N'<body> <p>Hello, <br>The following VIP Employees could not be loaded to the Web portal. Please check the MismatchReason field for the exact issue. <br /></p>' +
		N'<ul>
			<li>For finance code issues, please check the affected employees Department, Location and JobGradeCode to make sure they are correct in VIP</li>
			<li>For Mobile Money or Bank details issues:
				<ul>
					<li>Confirm that the mobile number is numeric and begins with the country code e.g. 2547XXXXXXX for Kenya, and that recipient name and carrier are specified</li>
					<li>Confirm that the bank account number, recipient name, bank name, branch and swiftcode are specified</li>
				</ul>
			</li>
			<li>For WebUser field issue, please check that the WebUser field is marked correctly for active employees, if the field is set to active then the employee must have a valid OAF email address <i>(e.g. first.lastname@oneacrefund.org)</i></li>
			</ul>' +
		N' <hr> <p><h2>Finance Codes / WebUser Issues</h2></p><br>' +
		N' <b><u>Note:</u></b><i>Please note that the WebUser field is now included in the error checks and should be updated to always reflect whether or not an employee with a valid oneacrefund email should have an acount on the finance portal <br />' +
   
      
		N'<table border="1">' +
		N'<tr><th>CompanyNumber</th><th>EmployeeCode</th>' +
		N'<th>Fullname</th><th>EmailAddress</th><th>JobgradeCode</th>' +
		N'<th>DepartmentCode</th>' +
		N'<th>LocationCode</th><th>WebUser</th><th>MismatchReason</th>
		</tr>' +
		CAST ( ( 
			 select 
						td = ISNULL(CompanyNumber,' '), '', 
						td = ISNULL(EmployeeCode, ' '), '',
						td = ISNULL(FullName, ' '), '',
						td = ISNULL(EmailAddress, ' '), '', 
						td = ISNULL(JobgradeCode, ' '), '',
						td = ISNULL(DepartmentCode, ' '),'', 
						td = ISNULL(LocationCode, ' '),	'',	
						td = ISNULL(WebUser, ' '), '',
						td = ISNULL(MismatchReason, ' '), ''
				from VIP_Employee_WebUserErrors() 
				where (ErrorSource='NoMatch' and DimCountryID=@countryID
					and Active=1 
					and (MismatchReason ='Department did not match Web portal' 
						or MismatchReason= 'Location did not match Web portal' 
						or MismatchReason= 'JobGrade did not match web portal')) 
						or (Active=1  and MismatchReason ='None')
						or (ErrorSource='Webuser' and DImCountryID=@countryID)

				  FOR XML PATH('tr'), TYPE 
		) AS NVARCHAR(MAX) ) +
		N'</table> ' +
		N' <hr> <p><h2>MM Issues</h2></p><br>' +
		N' ' +
		N'<table border="1">' +
		N'<tr><th>CompanyNumber</th><th>EmployeeCode</th>' +
		N'<th>Fullname</th><th>MMNumber</th><th>MMName</th>' +
		N'<th>Carrier</th>' +
		N'<th>MismatchReason</th><th></th>
		</tr>' +
		CAST ( ( select 
						td = ISNULL(CompanyNumber,' '), '', 
						td = ISNULL(EmployeeCode, ' '), '',
						td = ISNULL(concat(FirstName,' ', MiddleName, ' ', LastName), ' '), '',
						td = ISNULL(MMNumber, ' '), '', 
						td = ISNULL(MMName, ' '), '',
						td = ISNULL(MMCarrier, ' '),'', 
						td = ISNULL(MismatchReason, ' '), ''
				from NoMatchEmployee where (DImCountryID=@countryID and Active=1 and Source='VIP'  and MismatchReason = 'Mobile Money Details Error') or (Active=1 and Source='VIP' and MismatchReason ='None')
				  FOR XML PATH('tr'), TYPE 
		) AS NVARCHAR(MAX) ) +
		N'</table>
		
		<p>For further clarification please contact: <br> fredrick.mandela@oneacrefund.org <br><br>
		
		Regards, <br>
		BOS Datawarehouse Team</p>' ;
	 
		EXEC msdb.dbo.sp_send_dbmail @recipients=@email,
				@copy_recipients = @ccemail,
				@profile_name = 'default',
				@subject = @temp, 
				@body = @tableHTML,
				@body_format = 'HTML' ;

END

