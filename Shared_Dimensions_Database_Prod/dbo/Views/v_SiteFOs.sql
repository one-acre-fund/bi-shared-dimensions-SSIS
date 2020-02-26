


CREATE VIEW [dbo].[v_SiteFOs]
AS
SELECT      dbo.DimSite.SiteID, dbo.DimSite.SiteName, dbo.DimSite.SiteProjectCode, dbo.DimSite.Coordinates, dbo.DimSite.CountryID, dbo.DimSite.CountryCode, dbo.DimSite.CountryName, dbo.DimSite.Program, dbo.DimSite.RegionID, dbo.DimSite.RegionName, dbo.DimSite.DistrictID, dbo.DimSite.DistrictName, dbo.DimSite.SectorID, dbo.DimSite.SectorName, dbo.DimSite.FirstSeason, 
                s1.SeasonName AS FirstSeasonName, dbo.DimSite.LastSeason, s2.SeasonName AS LastSeasonName, COALESCE (s2.OperationalYear, YEAR(GETDATE())) - s1.OperationalYear + 1 AS TotalOafSeasons, dbo.DimSite.Active,dbo.DimSite.FirstName,dbo.DimSite.LastName, e.StartDate,e.EndDate,
				DimSite.Latitude, DimSite.Longitude
FROM dbo.DimRosterEmployee e 
left join
dbo.DimSite on e.RosterDistrictID=dbo.DimSite.RosterDistrictID and e.RosterSiteID=dbo.DimSite.RosterSiteID
 LEFT OUTER JOIN
                dbo.DimSeasons AS s1 ON dbo.DimSite.FirstSeason = s1.SeasonID LEFT OUTER JOIN
                dbo.DimSeasons AS s2 ON dbo.DimSite.LastSeason = s2.SeasonID