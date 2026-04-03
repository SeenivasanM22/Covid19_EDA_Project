
--Tableau Visualization specific queries to build a dashboard  

-- 1. 

Select SUM(new_cases) as total_cases, SUM(cast(new_deaths as int)) as total_deaths, SUM(cast(new_deaths as int))/SUM(New_Cases)*100 as DeathPercentage
From [covid19 project]..['CovidDeaths']
--Where location like '%india%'
where continent is not null 
--Group By date
order by 1,2



-- 2. 


Select location, SUM(cast(new_deaths as int)) as TotalDeathCount
From [covid19 project]..['CovidDeaths']
--Where location like '%india%'
Where continent is null 
and location not in ('World', 'European Union', 'International','Upper middle income','High income','Lower middle income', 'Low income')
Group by location
order by TotalDeathCount desc


-- 3.

Select Location, Population, MAX(total_cases) as HighestInfectionCount,  Max((total_cases/population))*100 as PercentPopulationInfected
From [covid19 project]..['CovidDeaths']
--Where location like '%india%'
Group by Location, Population
order by PercentPopulationInfected desc


-- 4.


Select Location, Population,date, MAX(total_cases) as HighestInfectionCount,  Max((total_cases/population))*100 as PercentPopulationInfected
From [covid19 project]..['CovidDeaths']
--Where location like '%india%'
Group by Location, Population, date
order by PercentPopulationInfected desc
