-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE FUNCTION v_RosterEmployees
(	
)
RETURNS TABLE 
AS
RETURN 
(
WITH SectorSiteEmployees AS (
	select 
		se.DistrictID RosterDistrictID
		, e.EmployeeID RosterEmployeeID
		, se.SiteEmployeeID Sector_SiteID
		, s.RosterSectorID RosterSectorID
		, se.SiteID RosterSiteID
		, se.StartDate
		, se.EndDate
		, e.FirstName
		, e.LastName
		, PayrollID
		, e.rowguid
		, CASE 
			WHEN (RANK() OVER (PARTITION BY se.DistrictID, se.SiteID ORDER BY SiteEmployeeID ASC))=1 and EndDate is null then 1 
			when (RANK() OVER (PARTITION BY se.DistrictID, se.SiteID ORDER BY SiteEmployeeID ASC))>1 and EndDate is not null then 0 
			when (RANK() OVER (PARTITION BY se.DistrictID, se.SiteID ORDER BY SiteEmployeeID ASC))=1 and EndDate is not null then 0 
		  end as Active
		, CASE AccountTypeID 
			WHEN 0 then 'Field'
			WHEN 1 then 'Data Entry I'
			WHEN 2 then 'Data Entry II'
			WHEN 3 then 'Data Entry III'
			WHEN 4 then 'Logistics'
			WHEN 5 then 'Bookkeeper'
			WHEN 6 then 'Admin'
			WHEN 7 then 'DonneAuditor'
		ELSE Null 
		END as AccountType
		, CASE WHEN ISNUMERIC(PayrollID)=1 then cast(PayrollID as int) else Null end as RosterEmployeeCode,
		'FO' EmployeeType
from OAF_SHARED_DIMENSIONS_Staging..Employees e
join OAF_SHARED_DIMENSIONS_Staging..SiteEmployees se on e.DistrictID=se.DistrictID and e.EmployeeID=se.EmployeeID
join DimSite s on s.RosterDistrictID=e.DistrictID and s.RosterSiteID=se.SiteID
WHERE  s.IsDeleted=0 and  StartDate <= (CONVERT (date, GETDATE())) AND IsNull(EndDate, '2099-01-01') >= (CONVERT (date, GETDATE()))



union all

select 
		se.DistrictID RosterDistrictID
		, e.EmployeeID RosterEmployeeID
		, se.SectorEmployeeID Sector_SiteID
		, se.SectorID RosterSectorID
		, '' RosterSiteID
		, se.StartDate
		, se.EndDate
		, FirstName
		, LastName
		, PayrollID
		, e.rowguid
		, CASE 
			WHEN (RANK() OVER (PARTITION BY se.DistrictID, SectorID ORDER BY SectorEmployeeID ASC))=1 and EndDate is null then 1 
			when (RANK() OVER (PARTITION BY se.DistrictID, SectorID ORDER BY SectorEmployeeID ASC))>1 and EndDate is not null then 0 
			when (RANK() OVER (PARTITION BY se.DistrictID, SectorID ORDER BY SectorEmployeeID ASC))=1 and EndDate is not null then 0 
		  end as Active
		, CASE AccountTypeID 
			WHEN 0 then 'Field'
			WHEN 1 then 'Data Entry I'
			WHEN 2 then 'Data Entry II'
			WHEN 3 then 'Data Entry III'
			WHEN 4 then 'Logistics'
			WHEN 5 then 'Bookkeeper'
			WHEN 6 then 'Admin'
			WHEN 7 then 'DonneAuditor'
		ELSE Null 
		END as AccountType
		, CASE WHEN ISNUMERIC(PayrollID)=1 then cast(PayrollID as int) else Null end as RosterEmployeeCode
		, 'FM' EmployeeType
from OAF_SHARED_DIMENSIONS_Staging..Employees e
join OAF_SHARED_DIMENSIONS_Staging..SectorEmployees se on e.DistrictID=se.DistrictID and e.EmployeeID=se.EmployeeID
WHERE StartDate <= (CONVERT (date, GETDATE())) AND IsNull(EndDate, '2099-01-01') >= (CONVERT (date, GETDATE()))	),


---Get everything 
Final 
AS (select * from sectorSiteEmployees

union all 
select 
	  DistrictID RosterDistrictID
	,  EmployeeID RosterEmployeeID
	, Null SectorSiteID 
	, Null RosterSectorID 
	, Null RosterSiteID  
	, DateAdded StartDate
	, DateClosed EndDate
	, FirstName 
	, LastName 
	, PayrollID 
	, rowguid
    , CASE WHEN DateAdded <= CONVERT(date, GETDATE()) AND IsNull(DateClosed, '2099-01-01') >= CONVERT (date, GETDATE()) THEN 1
		ELSE 0
		ENd As Active
	, CASE AccountTypeID 
			WHEN 0 then 'Field'
			WHEN 1 then 'Data Entry I'
			WHEN 2 then 'Data Entry II'
			WHEN 3 then 'Data Entry III'
			WHEN 4 then 'Logistics'
			WHEN 5 then 'Bookkeeper'
			WHEN 6 then 'Admin'
			WHEN 7 then 'DonneAuditor'
		ELSE Null 
		END as AccountType
	, CASE WHEN ISNUMERIC(PayrollID)=1 then cast(PayrollID as int) else Null end as RosterEmployeeCode
	, 'Other' EmployeeType

from OAF_SHARED_DIMENSIONS_Staging..Employees where rowguid not in (select rowguid from SectorSiteEmployees) and DateAdded <= CONVERT(date, GETDATE()) AND IsNull(DateClosed, '2099-01-01') >= CONVERT (date, GETDATE()))

select * from Final


)
