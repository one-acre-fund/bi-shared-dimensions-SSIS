CREATE VIEW dbo.v_Groups
AS
SELECT      dbo.DimGroup.GroupID, dbo.DimGroup.GroupName, dbo.DimGroup.CountryId, dbo.DimGroup.CountryCode, dbo.DimGroup.CountryName, dbo.DimGroup.Program, dbo.DimGroup.RegionID, dbo.DimGroup.RegionName, dbo.DimGroup.DistrictID, dbo.DimGroup.DistrictName, dbo.DimGroup.SectorID, dbo.DimGroup.SectorName, dbo.DimGroup.SiteID, dbo.DimGroup.SiteName, 
                dbo.DimGroup.FirstSeason, s1.SeasonName AS FirstSeasonName, dbo.DimGroup.LastSeason, s2.SeasonName AS LastSeasonName, dbo.DimGroup.Active, CASE WHEN COALESCE (s2.OperationalYear, YEAR(GETDATE())) - s1.OperationalYear + 1 < 0 THEN 0 ELSE COALESCE (s2.OperationalYear, YEAR(GETDATE())) - s1.OperationalYear + 1 END AS TotalOafYears, 
                dbo.DimGroup.firstname, dbo.DimGroup.lastname, dbo.DimGroup.payrollid
FROM        dbo.DimGroup LEFT OUTER JOIN
                dbo.DimSeasons AS s1 ON dbo.DimGroup.FirstSeason = s1.SeasonID LEFT OUTER JOIN
                dbo.DimSeasons AS s2 ON dbo.DimGroup.LastSeason = s2.SeasonID

GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[42] 4[31] 2[18] 3) )"
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
         Top = -192
         Left = 0
      End
      Begin Tables = 
         Begin Table = "DimGroup"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 171
               Right = 262
            End
            DisplayFlags = 280
            TopColumn = 23
         End
         Begin Table = "s1"
            Begin Extent = 
               Top = 6
               Left = 300
               Bottom = 171
               Right = 540
            End
            DisplayFlags = 280
            TopColumn = 5
         End
         Begin Table = "s2"
            Begin Extent = 
               Top = 6
               Left = 578
               Bottom = 171
               Right = 818
            End
            DisplayFlags = 280
            TopColumn = 2
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
         Column = 2730
         Alias = 3480
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
', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'v_Groups';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'v_Groups';

