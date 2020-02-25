
CREATE VIEW [dbo].[v_ClientsWithAccountNumber]
AS
SELECT      dbo.DimRosterClient.ClientID AS DimClientID, dbo.DimRosterClient.GlobalClientID, dbo.DimRosterClient.FirstName, dbo.DimRosterClient.LastName, dbo.DimRosterClient.Deceased, dbo.DimRosterClient.DeceasedDate, 
                         dbo.DimRosterClient.Ban, dbo.DimRosterClient.BannedDate, dbo.DimRosterClient.ClientBirthYear, dbo.DimRosterClient.Gender, dbo.DimRosterClient.NationalID, dbo.DimRosterClient.ValidationCode, 
                         dbo.DimRosterClient.CanEnrollAsNewMember, dbo.DimRosterClient.Enrollmentdate, dbo.DimRosterClient.AccountNumber, dbo.DimGroup.CountryName AS CurrentCountryName, 
                         dbo.DimGroup.RegionName AS CurrentRegionName, dbo.DimGroup.DistrictName AS CurrentDistrictName, dbo.DimGroup.SectorName AS CurrentSectorName, dbo.DimGroup.SiteName AS CurrentSiteName, 
                         dbo.DimGroup.GroupName AS CurrentGroupName, dbo.DimSeasons.SeasonName AS FirstSeasonName, dbo.DimRosterClient.DImDistrictID AS CurrentDistrictId, dbo.DimRosterClient.FirstSeasonID, 
                         dbo.DimRosterClient.RosterClientID AS OAFID, dbo.DimRosterClient.BeneficiaryFirstName, dbo.DimRosterClient.BeneficiaryLastName, dbo.DimRosterClient.BeneficiaryBirthYear, 
                         dbo.DimRosterClient.BeneficiaryNationalID, GroupID DimGroupID, SiteID DimSiteID
FROM            dbo.DimRosterClient LEFT OUTER JOIN
                         dbo.DimSeasons ON dbo.DimRosterClient.FirstSeasonID = dbo.DimSeasons.SeasonID LEFT OUTER JOIN
                         dbo.DimGroup ON dbo.DimRosterClient.DimGroupID = dbo.DimGroup.GroupID

GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[20] 2[19] 3) )"
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
         Begin Table = "DimRosterClient"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 171
               Right = 339
            End
            DisplayFlags = 280
            TopColumn = 5
         End
         Begin Table = "DimSeasons"
            Begin Extent = 
               Top = 6
               Left = 377
               Bottom = 136
               Right = 552
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "DimGroup"
            Begin Extent = 
               Top = 6
               Left = 590
               Bottom = 136
               Right = 771
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
         Column = 2730
         Alias = 6960
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
', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'v_ClientsWithAccountNumber';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'v_ClientsWithAccountNumber';

