# COVID-19 Exploratory Data Analysis Project

## Covid 19 Dashboard

Explore the interactive dashboard showcasing the findings of this analysis: [Dashboard Link](https://public.tableau.com/app/profile/seenivasan.m/viz/CovidDashboard_17751449825890/Dashboard1)

## Project Overview

This project involves the exploratory data analysis (EDA) of COVID-19 data, using SQL, Excel, and Tableau. The goal was to analyze extensive datasets from multiple countries, clean and prepare the data, and create a comprehensive dashboard to summarize key insights.

## Tools and Technologies Used

- **SQL:** Microsoft SQL Server for querying and initial data analysis.
- **Excel:** For data cleaning and preparation.
- **Tableau:** For data visualization and dashboard creation.

## Data Exploration and Findings

Data was imported from the `[CovidDeaths]` table, which includes information on total cases, new cases, total deaths, and population by location and date.

### 2. Analysis of Total Deaths vs. Total Cases in India

To understand the likelihood of dying from COVID-19 in India, we calculated the death percentage.

(![death percentage](https://github.com/user-attachments/assets/9169e911-2370-4406-886a-7a12a75a5978)
)
- By analyzing the death percentage in India, we can assess how the severity of COVID-19 in terms of mortality compares to other regions. This metric is crucial for understanding the impact of the virus on the population.
### 3. Analysis of Total Cases vs. Population

Examined the percentage of the population infected by COVID-19 in India.

![infected population percentage](https://github.com/user-attachments/assets/c4cb752c-9588-4075-8f99-04414b02a5eb)
- This helps to gauge the extent of COVID-19 spread within the Indian population. A higher percentage indicates a significant impact, which can be used to evaluate the effectiveness of public health measures.
### 4. Countries with Highest Infection Rates

Identified countries with the highest infection rates relative to their populations.

![Countries with highest infection rate](https://github.com/user-attachments/assets/7c34a0c1-4075-4444-a99c-80b075b57e34)
- This analysis highlights which countries experienced the highest levels of COVID-19 infections. It provides insights into which countries were most affected and can help in comparing the effectiveness of different countries' responses.
### 5. Countries with Highest Death Counts

Found the countries with the highest total death counts.

![Countries with highest death count per population](https://github.com/user-attachments/assets/c4e41873-baee-4e33-a502-af811c7ae180)
- This provides an understanding of the absolute impact of COVID-19 on different countries. High death counts might reflect the severity of the pandemic in these regions or could indicate challenges in healthcare infrastructure.
### 6. Death Counts by Continent

Analyzed continents with the highest total death counts.

![Continents with highest death count](https://github.com/user-attachments/assets/6d607898-781d-47f5-adf3-6b714916a11d)
- This highlights regional disparities in COVID-19's impact. It helps to understand which continents have been hardest hit and can provide a basis for targeted support and intervention strategies.
### 7. Global COVID-19 Metrics

Summarized global COVID-19 metrics, including total cases, total deaths, and death percentage.

![Global numbers](https://github.com/user-attachments/assets/0866f8bb-d66d-4b58-8b13-908fe0a5556d)
- This global overview provides a macro perspective on the pandemic's impact, helping to understand overall trends and evaluate the global response to the pandemic.
### 8. Population vs. Vaccination Coverage

We looked at the correlation between total population and vaccination numbers.

![Population vs vaccination](https://github.com/user-attachments/assets/6e971982-2f3c-4048-b576-69d52a757d09)
- This helps assess how vaccination efforts are progressing relative to the size of the population. Understanding vaccination coverage is crucial for evaluating progress towards achieving herd immunity.
### 9. Rolling Vaccination Coverage

We used a Common Table Expression (CTE) to calculate rolling vaccination coverage over time.

![cte rolling](https://github.com/user-attachments/assets/aec63277-4d0c-46b1-b3bf-d7824d8a0d66)
- This dynamic measure shows how vaccination coverage evolves, providing insights into the pace of vaccination campaigns and their impact on population coverage.
### 10. Temporary Tables for Vaccination Analysis

We created temporary tables to analyze and store vaccination coverage data.

![temp table](https://github.com/user-attachments/assets/ae8446fb-47e7-4ecc-8044-80b50aca732f)
-  This approach allowed for complex queries and analyses to be performed efficiently, enabling deeper insights into vaccination trends and their effects on population health.

## Key Insights
![Dashboard](https://github.com/user-attachments/assets/d7b42698-5088-42f2-9074-4a219490a82b)
- **Trends Over Time:** Identified significant waves of infections and variations in severity over time.
- **Geographical Distribution:** Highlighted hotspots and regions with different infection and death rates.
- **Comparative Analysis:** Compared the effectiveness of responses across countries and correlated vaccination rates with infection rates.


## Conclusion 
This project provides an in-depth exploratory data analysis of COVID-19 using SQL, Excel, and Tableau. The analysis offers valuable insights into global and regional impacts, including infection rates, mortality, and vaccination coverage. Key findings are visualized through an interactive Tableau dashboard, which highlights trends, regional variations, and the progress of vaccination efforts. The dashboard serves as a comprehensive tool for understanding the pandemic's effects and supporting informed public health decisions.

For an interactive exploration of the data, visit the COVID-19 Dashboard.
