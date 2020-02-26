

--ALTER TRIGGER [dbo].[VIPEmailAlert]
--ON [dbo].[NoMatchEmployee]
--AFTER INSERT
--AS
--BEGIN
CREATE procedure [dbo].[RecentlyTermminated]
AS 
BEGIN
    SET NOCOUNT ON;	
	DECLARE @tableHTML  NVARCHAR(MAX), @temp varchar(150), @string1 varchar(100), @fin date;
	SET @temp = dateadd(month,-2, GETDATE());
	SET @fin = CONVERT(date, @temp);
	
	SET @temp = @string1 + convert(varchar(150),@fin)
	SET @string1 = 'Terminated Employees since : ';

	SET @temp = @string1 + convert(varchar(150),@fin)
	--SET @temp = CONCAT('Terminated VIP Employees Since: ', @temp);
	SET @tableHTML =
	   N'<head>' +
		N'<style type="text/css">h2, body {font-family: Arial, verdana;} table{font-size:11px; border-collapse:collapse;} td{background-color:#F1F1F1; border:1px solid black; padding:3px;} th{background-color:#99CCFF;}</style>' +
	   N'<h2><font color="#0000ff" size="4"></font></h2>' +   
	   N'</head>' +
		N'<body> <p>Hello, <br>Below is a list of terminated employees over the past two months who no longer require access to OAF systems. Kindly take steps to remove or revoke access to OAF systems you or your team manages for the affected employees listed below.</p>' +
		N' <hr> <p><h2>Recently Terminated Employees</h2></p><br>' +
		N' ' +
  
		N'<table border="1">' +
		N'<tr><th>Fullname</th><th>Email</th>' +
		N'<th>Country</th><th>JobGrade</th><th>Department</th>' +
		N'<th>TerminationDate</th>' + 
		CAST ( ( 
			 select 
						td = ISNULL(Fullname,' '), '', 
						td = ISNULL(EmailAddress, ' '), '',
						td = ISNULL(CountryCode, ' '), '', 
						td = ISNULL(JobgradeCode, ' '), '',
						td = ISNULL(DepartmentCode, ' '),'', 
						td = ISNULL(CONVERT(date,TerminationDate), ' '),	''
				from Employee 
				where terminationdate >= Dateadd(month, - 2, Dateadd(day, 1 - DAY(Getdate()), DATEADD(dd, DATEDIFF(dd, 0, getdate()), 0)))
					and TerminationDate <= GETDATE()
					and EmailAddress is not null 
					and EmailAddress!='' 
					and EmailAddress like '%@oneacrefund.org'  
				order by  CountryCode, DepartmentCode, TerminationDate Desc

				  FOR XML PATH('tr'), TYPE 
		) AS NVARCHAR(MAX) ) +
		N'</table> 
		<p><i>You are receiving this email because you or your department manage user access to OAF systems that the above users might have had access to. If there are individuals from your team you think should receive this notification you can contact fredrick.mandela@oneacrefund.org to have them included in the email.</i><br><br>
		
		Kind regards, <br>
		BOS Datawarehouse Team</p>' ;

	 
		BEGIN
			EXEC msdb.dbo.sp_send_dbmail @recipients='fredrick.mandela@oneacrefund.org',--; james.gerrior@oneacrefund.org; diana.kaitare@oneacrefund.org; marika.west@oneacrefund.org; william.packer@oneacrefund.org; jacktone.ndhine@oneacrefund.org',
				@copy_recipients ='bernard.ekea@oneacrefund.org',
				@profile_name = 'OAF BOS Mail',
				@subject = @temp, 
				@body = @tableHTML,
				@body_format = 'HTML' ;
		END

	
END

