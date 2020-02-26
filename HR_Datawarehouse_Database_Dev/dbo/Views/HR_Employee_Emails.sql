
CREATE VIEW [dbo].[HR_Employee_Emails] 
AS 
select  FirstName, LastName, EmailAddress [EmailAddress],CONCAT(l.CountryName, ';', l.LocationName) [Work Address], LocationName [Cost Center], DepartmentName [Department], JobGradeCode [EmployeeType],Case e.CountryCode 	When 'KE' then '/Kenya' When 'TZ' then '/Tanzania'	When 'UG' then '/Uganda'	When 'RW' then '/Rwanda'	When 'BI' then '/Burundi'	When 'MW' then '/Malawi'	When 'ZA' then '/Zambia'	When 'ETH' then '/Ethiopia'	When 'IN' then '/India'	When 'NG' then '/Nigeria'	When 'US' then '/USA' else 'Other' end as [Org Unit Path], CASE e.Active WHEN 1 then 'Active' When 0 then 'Suspended' else Null end AS [New Status] --, EmployeeCode [EmployeeID] 
from Employee e left join OAF_SHARED_DIMENSIONS.dbo.DimLocations l on e.DimLocationID=l.LocationID and e.DimCountryID=l.CountryID left join OAF_SHARED_DIMENSIONS.dbo.DimDepartments d on e.DimDepartmentID=d.DepartmentID
where e.Active=1 and EmailAddress is not null


