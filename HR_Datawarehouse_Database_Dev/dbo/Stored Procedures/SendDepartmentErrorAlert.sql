

--ALTER TRIGGER [dbo].[VIPEmailAlert]
--ON [dbo].[NoMatchEmployee]
--AFTER INSERT
--AS
--BEGIN
CREATE procedure [dbo].[SendDepartmentErrorAlert]
AS 
BEGIN
    SET NOCOUNT ON;	
	DECLARE @tableHTML  NVARCHAR(MAX), @temp varchar(150), @string1 varchar(100), @fin date;
	SET @temp = GETDATE();
	SET @fin = CONVERT(date, @temp);
	
	SET @temp = @string1 + convert(varchar(150),@fin)
	SET @string1 = 'FOP Employees Error Report: ';

	SET @temp = @string1 + convert(varchar(150),@fin)

	--SET @temp = CONCAT('Terminated VIP Employees Since: ', @temp);
	SET @tableHTML =
	   N'<head>' +
		N'<style type="text/css">h2, body {font-family: Arial, verdana;} table{font-size:11px; border-collapse:collapse;} td{background-color:#F1F1F1; border:1px solid black; padding:3px;} th{background-color:#99CCFF;}</style>' +
	   N'<h2><font color="#0000ff" size="4"></font></h2>' +   
	   N'</head>' +
		N'<body> <p>Hello, <br>The following employee(s) do not have the correct Department (FOP) assigned. <br> Please review</p>' +
		N' <hr> <p><h2>Field Staff not Mapped to FOP Department</h2></p><br>' +
		N' ' +
   
      
		N'<table border="1">' +
		N'<tr><th>CompanyNumber</th><th>EmployeeCode</th>' +
		N'<th>Fullname</th><th>EmailAddress</th><th>JobgradeCode</th>' +
		N'<th>DepartmentCode</th>' +
		N'<th>LocationCode</th>
		</tr>' +
		CAST ( ( 
			 select 
						td = ISNULL(CompanyNumber,' '), '', 
						td = ISNULL(EmployeeCode, ' '), '',
						td = ISNULL(concat(FirstName,' ', MiddleName, ' ', LastName), ' '), '',
						td = ISNULL(EmailAddress, ' '), '', 
						td = ISNULL(JobgradeCode, ' '), '',
						td = ISNULL(DepartmentCode, ' '),'', 
						td = ISNULL(LocationCode, ' '),	''	
				from Employee where DimJobGradeID not in (1,2,3,12) and DepartmentCode <> 'FOP' and JobGradeCode in ('FD','FM','FO','SFD')  order by JobGradeCode

				  FOR XML PATH('tr'), TYPE 
		) AS NVARCHAR(MAX) ) +
		N'</table> 
		
		<p>For further clarification please contact: <br> fredrick.mandela@oneacrefund.org <br><br>
		
		Regards, <br>
		BOS Datawarehouse Team</p>' ;
		
		IF EXISTS (select 1 from Employee where DimJobGradeID not in (1,2,3,12) and DepartmentCode <> 'FOP' and JobGradeCode in ('FD','FM','FO','SFD'))
		BEGIN
			EXEC msdb.dbo.sp_send_dbmail @recipients='malgorzata.wojewodka@oneacrefund.org;fredrick.mandela@oneacrefund.org; aurelien.vetil@oneacrefund.org; agnes.niyonsenga@oneacrefund.org; bernard.ekea@oneacrefund.org; scott.noel@oneacrefund.org',
				@profile_name = 'OAF BOS Mail',
				@subject = @temp, 
				@body = @tableHTML,
				@body_format = 'HTML' ;
		END
	
END



