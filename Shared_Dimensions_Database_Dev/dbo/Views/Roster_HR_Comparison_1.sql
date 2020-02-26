


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
CREATE VIEW [dbo].[Roster_HR_Comparison]
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

GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "comp_1"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 240
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'Roster_HR_Comparison';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'Roster_HR_Comparison';

