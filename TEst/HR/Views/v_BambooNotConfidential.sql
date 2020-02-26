/*
Update hist:
	V9: MW 2019-04-16 - Added job title
	V8: MW 2019-03-24 - Update global department designation to be based on table vs hard coded
	V7: MW 2018-10-17 - Update main source data to be the employee table and added where clause for bamboo as source system
	V6: AV 2018-09-20 - (1) updated WebEmployee to come from OAF_SAP_DATAWAREHOUSE (WebEmployee is not refreshing on OAF_HR_DW)
		(2) Updated singlerow join to a left join so that employees without a set manager in web portal still show up in this view
	V5: Shifted to use dim department on the shared db
	V4: Updated source to AspNetusers
	V3: Added recruitment data requests (source system, home country)
	V2: Added termination date, start date, email (termination date isn't populated, so it only shows active employees still)
*/

CREATE view HR.v_BambooNotConfidential as
--use OAF_HR_DATAWAREHOUSE;

WITH singleRows AS (
SELECT
    *
    , ROW_NUMBER() OVER (PARTITION BY requesteremail ORDER BY approveremail) as rownum
FROM
    OAF_SAP_DATAWAREHOUSE.dbo.WebEmployee)

-- JG5+
select distinct
	emp.EmployeeCode as EmployeeCode
	,emp.FirstName
	,emp.LastName
	,emp.FullName
	,c.countryname as CountryLocation
	,emp.JobGradeCode  as JobGrade--jobgrade
	,l.LocationName--city,
	,d.DepartmentName as Department--department
	,case
		when d.DepartmentType = 'Global' then 'Global'
		when c.CountryCode = 'US' then 'Global'
		when l.LocationName = 'Global' then 'Global'
	else c.CountryName End as CountryFinance
	,emp.StartDate
	,emp.TerminationDate
	,emp.EmailAddress as Email
	,emp.Source as SourceSystem
	,emp.Nationality as BambooHomeCountry
	,m.ApproverName as Manager
	,null as HomeEmail
	,emp.JobTitle

from oaf_hr_datawarehouse.dbo.employee emp
left join OAF_SHARED_DIMENSIONS.dbo.DimCountry c on emp.DimCountryID = c.CountryId
left join OAF_SHARED_DIMENSIONS.dbo.DimLocations l on emp.DimLocationID = l.LocationID
left join OAF_SHARED_DIMENSIONS.dbo.DimDepartments d on emp.DimDepartmentID = d.DepartmentID
left join singleRows m on m.RequesterEmail = emp.EmailAddress and m.rownum=1

where
	--emp.Active = 1
	--and isnull(emp.EmploymentHistoryStatus,'') <> 'terminated' and
	emp.Source = 'BambooHr'

--select top 10 * from oaf_hr_datawarehouse.dbo.employee where source like 'bam%'
