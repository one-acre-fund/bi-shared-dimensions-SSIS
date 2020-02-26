-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE FUNCTION [dbo].[VIP_Employee_WebUserErrors]
(
)
RETURNS 
 TABLE 

AS
RETURN 
Select * 
From (
	select DimCountryID
		, Active
		, CompanyNumber
		, EmployeeCode
		, FullName
		, EmailAddress
		, JobGradeCode
		, DepartmentCode
		, LocationCode
		, CASE 
			WHEN Active=1 and WebUser=1 and (EmailAddress is null or EmailAddress not like '%@oneacrefund.org') THEN 'WebUser active but Invalid/Null EmailAddress'
			WHEN Active=1 and WebUser is Null and (EmailAddress not like '%@oneacrefund.org') THEN 'WebUser field not set for Active VIP employee'
			WHEN Active=0 and WebUser=1 and (EmailAddress is not null or EmailAddress like '%@oneacrefund.org') THEN 'WebUser active but for Inactive VIP employee'
			ELSE 'Good'
		END AS MismatchReason
		, WebUser
		, 'WebUser' ErrorSource
		,  DayName = (select top 1 DayName from Nomatchemployee)
		
	from Employee
	where Active=1 
		and Source='VIP' 
		and DimJobGradeID not in (10,11) 
		and EmployeeID not in (select EmployeeID from NoMatchEmployee where Source='VIP' and EmployeeID is not null)
	
	) emp
where MismatchReason!='Good' --and EmailAddress='esther.mukankubana@oneacrefund.org'
union all
select 
	DimCountryID
	, Active
	, CompanyNumber
	, EmployeeCode
	, FullName 
	, EmailAddress
	, JobGradeCode 
	, DepartmentCode
	, LocationCode 
	, MismatchReason
	, Null WebUser
	, 'Nomatch' ErrorSource
	, DayName
from NoMatchEmployee where Source='VIP'



