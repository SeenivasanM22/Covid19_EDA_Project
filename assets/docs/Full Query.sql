select *
from PortfolioProject..CovidDeaths
where continent is not null
order by 3,4

-- select *
--from PortfolioProject..CovidVaccination
--order by 3,4

--Select the data we are going to be using

select location, date, total_cases, new_cases, total_deaths, population 
from PortfolioProject..CovidDeaths
where continent is not null
order by 1,2

-- Looking at Total cases vs Total Deaths
-- Shows likelihood of dying if you contract covid in your country

select location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as DeathPercentage 
from PortfolioProject..CovidDeaths
where location like '%India%'
and continent is not null
order by 1,2

-- Looking at Total Cases vs Population
-- Shows what percentage of population  got covid

select location, date, total_cases, population, (total_cases/population)*100 as InfectedPopulationPercent 
from PortfolioProject..CovidDeaths
--where location like '%India%'
order by 1,2

-- Looking At Contries With Higest Infection rate Compared to Population

select location, population, MAX(total_cases) as highestInfection, MAX((total_cases/population))*100 as InfectedPopulationPercent
from PortfolioProject..CovidDeaths
--where location like '%India%'
group by location, population
order by InfectedPopulationPercent desc

-- showing Countries with highest death count per population

select location, MAX(cast(total_deaths as int)) as TotalDeathCount
from PortfolioProject..CovidDeaths
--where location like '%India%'
where continent is not null
group by location
order by TotalDeathCount desc

-- Let's break things down by continent

-- Showing continet with heighest death count by  popullation

select continent, MAX(cast(total_deaths as int)) as TotalDeathCount
from PortfolioProject..CovidDeaths
--where location like '%India%'
where continent is not null
group by continent
order by TotalDeathCount desc

-- Global Numbers

select date, sum(new_cases) as total_cases, sum(cast(new_deaths as int)) as total_deaths
, sum(cast(new_deaths as int))/sum(new_cases)*100 as DeathPercentage 
from PortfolioProject..CovidDeaths
--where location like '%India%'
where continent is not null
Group by date
order by 1,2

--
select sum(new_cases) as total_cases, sum(cast(new_deaths as int)) as total_deaths
, sum(cast(new_deaths as int))/sum(new_cases)*100 as DeathPercentage 
from PortfolioProject..CovidDeaths
--where location like '%India%'
where continent is not null
--Group by date
order by 1,2

-- Looking at Total Population vs vaccinations

select dea.continent , dea . location, dea . date, dea . population, vac . new_vaccinations
, sum(convert(int, vac. new_vaccinations)) over (partition by dea. location order by dea. location, dea. date) 
  as RollingPeopleVacinated
--, (RollingPeopleVacinated / population)*100
from PortfolioProject ..CovidDeaths dea
join PortfolioProject ..CovidVaccination vac
	on dea. location = vac. location
	and dea. date = vac. date
where dea. continent is not null
Order by 2,3

--USE CTE

with PopvsVac (continent, Location, Date, Population, New_vaccination, RollingPeopleVacinated )
as
(
select dea.continent , dea . location, dea . date, dea . population, vac . new_vaccinations
, sum(convert(int, vac. new_vaccinations)) over (partition by dea. location order by dea. location, dea. date) 
  as RollingPeopleVacinated
--, (RollingPeopleVacinated / population)*100
from PortfolioProject ..CovidDeaths dea
join PortfolioProject ..CovidVaccination vac
	on dea. location = vac. location
	and dea. date = vac. date
where dea. continent is not null
--Order by 2,3
)
Select *,  (RollingPeopleVacinated / Population )*100
from  PopvsVac

--Temp Table

Drop Table if exists #PercentPopulationVaccinated

Create Table #PercentPopulationVaccinated
(
continent nvarchar (255),
Location Nvarchar (255),
Date datetime,
Population Numeric,
New_vaccination numeric,
RollingPeopleVacinated numeric
)

insert into #PercentPopulationVaccinated
select dea.continent , dea . location, dea . date, dea . population, vac . new_vaccinations
, sum(convert(int, vac. new_vaccinations)) over (partition by dea. location order by dea. location, dea. date) 
  as RollingPeopleVacinated
--, (RollingPeopleVacinated / population)*100
from PortfolioProject ..CovidDeaths dea
join PortfolioProject ..CovidVaccination vac
	on dea. location = vac. location
	and dea. date = vac. date
--where dea. continent is not null
--Order by 2,3

Select *,  (RollingPeopleVacinated / Population )*100
from #PercentPopulationVaccinated

--Creating View to store Data for later visualization

Drop Table if Exits PercentPopulationVaccinated

Create View PercentPopulationVaccinated as
select dea.continent , dea . location, dea . date, dea . population, vac . new_vaccinations
, sum(convert(int, vac. new_vaccinations)) over (partition by dea. location order by dea. location, dea. date) 
  as RollingPeopleVacinated
--, (RollingPeopleVacinated / population)*100
from PortfolioProject ..CovidDeaths dea
join PortfolioProject ..CovidVaccination vac
	on dea. location = vac. location
	and dea. date = vac. date
where dea. continent is not null
--Order by 2,3

select *
from PercentPopulationVaccinated

