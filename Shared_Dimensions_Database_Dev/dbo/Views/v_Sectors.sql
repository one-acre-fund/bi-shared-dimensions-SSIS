﻿CREATE VIEW dbo.v_Sectors
AS
SELECT      dbo.DimSector.SectorID, dbo.DimSector.SectorName, dbo.DimSector.CountryID, dbo.DimSector.CountryCode, dbo.DimSector.CountryName, dbo.DimSector.Program, dbo.DimSector.RegionID, dbo.DimSector.RegionName, dbo.DimSector.DistrictID, dbo.DimSector.DistrictName, dbo.DimSector.FirstSeason, s1.SeasonName AS FirstSeasonName, dbo.DimSector.LastSeason, 
                s2.SeasonName AS LastSeasonName, CASE WHEN COALESCE (s2.OperationalYear, YEAR(GETDATE())) - s1.OperationalYear + 1 < 0 THEN 0 ELSE COALESCE (s2.OperationalYear, YEAR(GETDATE())) - s1.OperationalYear + 1 END AS TotalOafYears, dbo.DimSector.Active
FROM        dbo.DimSector LEFT OUTER JOIN
                dbo.DimSeasons AS s1 ON dbo.DimSector.FirstSeason = s1.SeasonID LEFT OUTER JOIN
                dbo.DimSeasons AS s2 ON dbo.DimSector.LastSeason = s2.SeasonID

GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[23] 4[19] 2[44] 3) )"
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
         Begin Table = "DimSector"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 171
               Right = 260
            End
            DisplayFlags = 280
            TopColumn = 3
         End
         Begin Table = "s1"
            Begin Extent = 
               Top = 6
               Left = 298
               Bottom = 171
               Right = 538
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "s2"
            Begin Extent = 
               Top = 6
               Left = 576
               Bottom = 171
               Right = 816
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
         Alias = 2730
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
', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'v_Sectors';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'v_Sectors';

