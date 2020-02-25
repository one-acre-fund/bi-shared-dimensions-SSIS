




CREATE VIEW [dbo].[v_TaxiRequesters]
AS


	select 
	'1 - Interview Candidate' [FullName],
	'CRO Corporate Operations' [Department],
	Null [Location],
	'Interview' [JobGradeName]

	union all

	select 
	'3 - Other Visitor' [FullName],
	'CRO Corporate Operations' [Department],
	Null [Location],
	'Visitor' [JobGradeName]

	union all
	
	select 
	'2 - Onboarder' [FullName],
	'CRO Corporate Operations' [Department],
	Null [Location],
	'Onboarder' [JobGradeName]

	union all
	select 
	[v_TaxiRequestersBasicInfo].FullName [FullName],
	{ fn concat( { fn concat(dimdepartments.departmentcode, ' ') }, dimdepartments.departmentname) } as [Department],
	{ fn concat( { fn concat(dimlocations.locationcode, ' ') }, dimlocations.locationname) } as [Location],
	Dimjobgrade.JobgradeName [JobGradeName]
	from [OAF_HR_DATAWAREHOUSE].[dbo].[v_TaxiRequestersBasicInfo]
	left join [OAF_SHARED_DIMENSIONS].dbo.dimlocations on [v_TaxiRequestersBasicInfo].locationid = dimlocations.webportallocationid and [v_TaxiRequestersBasicInfo].countryid = dimlocations.Countryid
	left join [OAF_SHARED_DIMENSIONS].dbo.dimdepartments on [v_TaxiRequestersBasicInfo].departmentid = dimdepartments.webportaldepartmentid and [v_TaxiRequestersBasicInfo].countryid = dimdepartments.countryid
	left join [OAF_SAP_DATAWAREHOUSE].dbo.dimjobgrade on [v_TaxiRequestersBasicInfo].JobGradeId = dimjobgrade.JobGradeId

	where [v_TaxiRequestersBasicInfo].active = 1 and Dimjobgrade.JobgradeName IN ('JG4', 'JG5', 'JG6', 'JG7', 'JG5TEMP') or 
	({ fn concat( { fn concat(dimlocations.locationcode, ' ') }, dimlocations.locationname) } like 'ZHQ%' and Dimjobgrade.JobgradeName IN ('JG1','JG2','JG3','JG4', 'JG5', 'JG6', 'JG7', 'JG5TEMP')) 



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
         Begin Table = "A"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
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
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
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
', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'v_TaxiRequesters';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'v_TaxiRequesters';

