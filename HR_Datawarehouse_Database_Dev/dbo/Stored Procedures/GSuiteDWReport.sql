
CREATE procedure [dbo].[GSuiteDWReport]
AS 
BEGIN
	/** Get comparison report summaries
	*/
    SET NOCOUNT ON;	
	DECLARE @tableHTML  NVARCHAR(MAX), @temp varchar(150), @string1 varchar(100), @fin date,@na int, @gactive int, @hractive int;
	SET @temp = GETDATE();
	SET @fin = CONVERT(date, @temp);
	set @na = (SELECT count(*) from GUsers where HRActive is null and Status='Active')
	set @gactive = (select count(*) from GUsers where Status='Active' and HRActive=0)
	set @hractive = (select count(*) from GUsers where Status!='Active' and HRActive=1)
	SET @temp = @string1 + convert(varchar(150),@fin)
	SET @string1 = 'G-Suite <> HR Comparison Report: ';

	SET @temp = @string1 + convert(varchar(150),@fin)

	SET @tableHTML =
	   N'<head>' +
		N'<style type="text/css">h2, body {font-family: Arial, verdana;} table{font-size:11px; border-collapse:collapse;} td{background-color:#F1F1F1; border:1px solid black; padding:3px;} th{background-color:#99CCFF;}</style>' +
	   N'<h2><font color="#0000ff" size="4"></font></h2>' +   
	   N'</head>' +
		N'<body> <p>Hello, <br>Below is a summary of the comparison of the G-Suite user list with the list of employees pulled from our HR systems (VIP, BamboohR). The comparison was done using the email address:</p>' +
		N' <hr> <p>
			<ul>
			 <li>There are '+ convert(varchar(5),@na) +' user emails that do not exist in our HR systems (VIP, BambooHR) </li>
			 <li>There are ' +convert(varchar(5),@gactive)+' users who are Active in G-Suite but are Inactive in our HR systems (VIP, BambooHR) </li>
			 <li>There are ' +convert(varchar(5),@hractive)+' users who are Suspended in G-Suite but Active in our HR systems (VIP, BambooHR) </li>
			</ul></p><br>' +
		N' <p>For the full report on G-Suite <> HR mismatches, please see the <a href = "https://drive.google.com/drive/u/1/folders/1zy2UDvBwk-yaOjbV-mGtrby2Nrpi2agw">BOS - Collab/Gsuite_HR_Mismatches</a> shared drive folder for the GSuite_HR_Mismatches_Report for more details on the mismatch reason. The last part of the file name gives the date when the export was made.</p>' +
		
   
		'<p>For further clarification please contact: <br> fredrick.mandela@oneacrefund.org <br><br>
		
		Regards, <br>
		BOS Datawarehouse Team</p>' ;

	 

		BEGIN
			EXEC msdb.dbo.sp_send_dbmail @recipients='fredrick.mandela@oneacrefund.org; aurelien.vetil@oneacrefund.org;james.gerrior@oneacrefund.org; shiro.wachira@oneacrefund.org',
				@profile_name = 'OAF BOS Mail',
				@subject = @temp, 
				@body = @tableHTML,
				@body_format = 'HTML' ;
		END

	
END

