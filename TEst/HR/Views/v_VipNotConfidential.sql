/*
V8: MW 2019-04-16 - added job title
V7: MW 2019-03-24
	Trim leading and trailing spaces on JobGradeCode
	Use table logic for global departments rather than hardcoding
V6: MW 2018-10-17
	Added VIP only filter
	updated WebEmployee to come from OAF_SAP_DATAWAREHOUSE (WebEmployee is not refreshing on OAF_HR_DW)
V5:
	Updated to use Employee table
V4:
	Fixed some old JG classifications for terminated employees
V3: 
	Added recruitment data requests, 
	trimmed leading zeros in EmpID
V2: 
	Added termination date, start date, email
*/

CREATE view HR.v_VipNotConfidential as
--use OAF_HR_DATAWAREHOUSE;

-- JG1-4 (VIP)
select distinct
	emp.EmployeeCode--,emp.EmployeeCode
	,emp.FirstName as FirstName
	,emp.LastName as LastName
	,emp.FullName
	,c.countryname as CountryLocation
	,Case
		When emp.JobGradeCode = 'OFF' and emp.DepartmentCode = 'FOP' then 'FO'
		When emp.JobGradeCode = 'Offi' and emp.DepartmentCode = 'FOP' then 'FO'
		When emp.JobGradeCode = 'Mana' and emp.DepartmentCode = 'FOP' then 'FM'
		When emp.JobGradeCode = 'MAN' and emp.DepartmentCode = 'FOP' then 'FM'
		When emp.JobGradeCode = 'SD' and emp.DepartmentCode = 'FOP' then 'SFD'
		When emp.JobGradeCode = 'AD' and emp.DepartmentCode = 'FOP' then 'FD'
		When emp.JobGradeCode = 'ADir' and emp.DepartmentCode = 'FOP' then 'FD'
		When emp.JobGradeCode = 'OFF' then 'JG1'
		When emp.JobGradeCode = 'Offi' then 'JG1'
		When emp.JobGradeCode = 'PG1' then 'JG1'
		When emp.JobGradeCode = 'PG3' then 'JG1'
		When emp.JobGradeCode = '2' then 'JG1'
		When emp.JobGradeCode = '1' then 'JG1'
		When emp.JobGradeCode = 'PG4' then 'JG2'
		When emp.JobGradeCode = 'PG6' then 'JG2'
		When emp.JobGradeCode = '6' then 'JG2'
		When emp.JobGradeCode = '7' then 'JG3'
		When emp.JobGradeCode = 'PG11' then 'JG4'
		When emp.JobGradeCode = 'PG12' then 'JG4'
		When emp.JobGradeCode = 'PS' then 'JG4'
		else RTRIM(LTRIM(emp.JobGradeCode)) end as JobGrade
	,l.LocationName--city,
	,d.DepartmentName as Department
	,case
		when d.DepartmentType = 'Global' then 'Global'
		when c.CountryCode = 'US' then 'Global'
	else c.CountryName End as CountryFinance
	,emp.StartDate
	,emp.TerminationDate
	,emp.EmailAddress as Email
	,emp.Source as SourceSystem
	,null as BambooHomeCountry
	,m.ApproverName as Manager
	,null as HomeEmail
	,emp.JobTitle

from oaf_hr_datawarehouse.dbo.employee emp
left join OAF_SHARED_DIMENSIONS.dbo.DimCountry c on emp.DimCountryID = c.CountryId
left join OAF_SHARED_DIMENSIONS.dbo.DimLocations l on emp.DimLocationID = l.LocationID
left join OAF_SHARED_DIMENSIONS.dbo.DimDepartments d on emp.DimDepartmentID = d.DepartmentID
left join OAF_SAP_DATAWAREHOUSE.dbo.WebEmployee m on m.RequesterEmail = emp.EmailAddress

where Emp.Source = 'VIP'

/* Employee status key
N=Normal;
R=Resigned;
D=Discharged;
P=Pensioned;
T=Transferred;
R=Retrenched;
A=Absconded;
D=Deceased
*/
