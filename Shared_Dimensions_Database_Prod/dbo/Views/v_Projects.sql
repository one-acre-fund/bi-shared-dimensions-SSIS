create view v_Projects as

select p.*, c.CountryName, c.CountryCode
from DimProjects p
left join DimCountry c on c.CountryId = p.CountryId