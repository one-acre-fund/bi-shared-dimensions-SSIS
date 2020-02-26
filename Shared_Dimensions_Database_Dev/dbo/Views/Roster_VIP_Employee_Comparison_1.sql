



/*
Country
Employee ID
Roster Name
Roster Email
Roster National ID
Roster Sector
Roster District 
Roster Site
Roster Active? -
VIP Name 
VIP Email
VIP National ID
VIP District
VIP Job Grade
VIP Department
VIP Active? 
Mismatch Reason (s)

VIP Employee ID does not exist in Roster (for VIP FOs & FMs)
Roster Employee ID does not exist in VIP
Department does not match between VIP and Roster (only FOP employees should be in Roster)
Job Grade does not match between VIP and Roster (only FO & FM employees should be in Roster)
District does not match between VIP and Roster
Name does not match between VIP and Roster 
National ID does not match between VIP and Roster
Active does not match between VIP and Roster (if active in one system then match)
Email does not match between VIP and Roster (soon)

--*/
CREATE VIEW [dbo].[Roster_VIP_Employee_Comparison]
AS
WITH comp AS 
		(SELECT 
			l.CountryName AS Country
			, de.RosterEmployeeID
			, de.PayrollID AS RosterEmployeeCode
			, de.FirstName
			, de.LastName
			, e.FirstName HRFirstName
			, e.MiddleName HRMiddleName
			, e.LastName HRLastName
			, de.RosterDistrictID
			, de.DimDistrictID
			, de.DimSiteID
			, CASE WHEN EndDate IS NULL THEN 1 ELSE 0 END AS RosterActive
			, l.LocationName RosterDistrictName
			, l.RegionName 
			, se.SectorName
			, SiteName
			, e.EmployeeCode AS HREmployeeCode
			, e.FullName HRFullName
			, e.EmailAddress
			, e.LocationName AS HRDistrictName
			, e.JobGradeCode
			, e.DepartmentCode
			, e.Active HRActive
			, de.AccountType
			, de.EmployeeType
			, PayrollID
			, ROW_NUMBER() OVER (Partition by de.RosterDistrictID, de.RosterEmployeeID order by  de.RosterSiteID, de.ROsterSectorId) RowNumber
         FROM  dbo.DimRosterEmployee AS de 
		 full outer  JOIN (select e.*, lo.LocationName, RosterDistrictID from [$(OAF_HR_DATAWAREHOUSE)].dbo.Employee AS e join DimLocations lo on e.DimLocationID=lo.LocationID where Source='VIP' and Active=1 and JobGradeCode in ('FO','FM')) e 
				ON e.EmployeeID=de.HREmployeeID
		 LEFT JOIN dbo.DimLocations AS l ON l.RosterDistrictID = de.RosterDistrictID 
		 LEFT JOIN dbo.DimSite s on s.RosterDistrictID=de.RosterDistrictID and s.RosterSiteID=de.RosterSiteID and IsDeleted=0
		 LEFT JOIN dbo.DimSector se on se.RosterDistrictId=de.RosterDistrictID and se.RosterSectorID=de.RosterSectorID

		 --Only active in VIP and Roster (then active/inactive check will be 1 and null)
        WHERE (de.EndDate IS NULL) AND AccountType not like '%Bookkeeper')
	SELECT  Country, RosterDistrictName DistrictName,SectorName, SiteName,  RosterDistrictID
			, RosterEmployeeID, FirstName, LastName, RosterActive, HRFullName, EmailAddress, HRDistrictName, JobGradeCode, DepartmentCode
			, HRActive AS HRActive
			, CASE 
				WHEN RosterActive=1 and HRActive is Null THEN 'FO/FM(s) In Roster missing in VIP' -- Simplify Active in Roster / Inactive in VIP
				WHEN RosterActive is Null and HRActive = 1 THEN 'FO/FM(s) in VIP missing in Roster' --Employee inactive in Roster but active in VIP HR '
				WHEN JobGradeCode='FO' and SiteName is Null THEN 'FO(s) in VIP not assigned to Site in Roster'
				WHEN JobGradeCode='FM' and SectorName is null THEN 'FM(s) in VIP not assigned to Sector in Roster'
				WHEN EmployeeType='FO' and (JobgradeCode!='FO' or DepartmentCode!='FOP') and SiteName is not null THEN 'FO(s) assigned to Site in Roster but not FOP-FO in VIP'
				WHEN EmployeeType='FM' and (JobGradeCode!='FM' or DepartmentCode!='FOP') and SectorName is not null THEN 'FM(s) assigned to Sector in Roster but not FOP-FM in VIP'
				WHEN RosterEmployeeCode is not null and ISNUMERIC(RosterEmployeeCode)=1 and HREmployeeCode is null then 'PayrollID(s) does not exist in VIP'--Roster employee code does not exist in VIP HR system'
				WHEN RosterDistrictName!=HRDistrictName AND RosterDistrictName is not null then 'Roster District does not match VIP District'--Roster District does not match VIP District'
				WHEN HRFullName= CONCAT(FirstName, ' ', LastName) 
					and (HRFirstName!=FirstName and HRFirstName!=LastName)
					and (HRLastName !=FirstName and HRLastName!=LastName)
					and CONCAT(HRFirstName, ' ', HRMiddleName)!= CONCAT(FirstName,' ', LastName) 
					and (HRFirstName!=FirstName and HRLastName!=LastName) 
				THEN 'Roster Name does not match VIP Name'
				WHEN RosterActive=1 and HRActive=1 THEN 'Matched'
			 ELSE Null 
			 END As MismatchReason
	 FROM            comp AS comp_1
	 where Country in ('Burundi','Kenya','Malawi','Rwanda','Tanzania','Uganda','Zambia') and RowNumber=1-- 

