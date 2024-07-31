-- World Population Data Analysis

--1. Comprehensive Data Retrieval
-- Problem Statement: Explore the entire dataset to establish a baseline understanding of global population metrics, including variations in density, fertility rates, and age demographics.

SELECT * FROM world_population;


-- 2. Identifying Demographic Giants
-- Problem Statement: Examine the demographic characteristics of the top 10 most populous countries to assess their roles in global economic, social, and environmental contexts.

SELECT country, population
FROM world_population
ORDER BY population DESC
LIMIT 10;


-- 3. Analyzing High-Density Regions
-- Problem Statement**: Investigate the implications of high population density in the top 10 densest countries, focusing on urban planning, resource management, and potential stress on infrastructure.

SELECT country, population_density
FROM world_population
ORDER BY population_density DESC
LIMIT 10;


-- 4. Detecting Population Decline Trends
-- Problem Statement: Identify and analyze countries with a negative population growth rate to understand potential underlying factors such as economic challenges, aging populations, or emigration trends.

SELECT country, yearly_change
FROM world_population
WHERE yearly_change < 0;


-- 5. Fertility Rate Comparison Across Continents
-- Problem Statement: Compare the average fertility rates across different continents to explore regional differences in reproductive behavior, cultural influences, and implications for future population growth.

SELECT continent, AVG(fertility_rate) AS avg_fertility_rate
FROM world_population
GROUP BY continent;


-- 6. Quantifying Global Population Size
-- Problem Statement: Calculate the total global population from the dataset to assess the distribution of human resources and the potential for growth or decline.

SELECT SUM(population) AS total_population
FROM world_population;


-- 7. Urbanization and Its Global Impact
-- Problem Statement: Examine the countries with the highest percentages of urban populations to evaluate urbanization trends and their impact on economic development, housing, and public services.

SELECT country, urban_population
FROM world_population
ORDER BY urban_population DESC;


-- 8. Geopolitical and Economic Analysis of Large Land Areas
-- Problem Statement: List and analyze the countries with the largest land areas to explore their geopolitical significance, resource distribution, and challenges in governance and infrastructure development.

SELECT country, area
FROM world_population
ORDER BY area DESC
LIMIT 10;


-- 9. Correlation Between Fertility Rates and Median Age
-- Problem Statement: Investigate the relationship between fertility rates and median age across countries, considering socio-economic factors such as education, healthcare access, and women's empowerment.

SELECT
  CASE
    WHEN fertility_rate > (SELECT AVG(fertility_rate) FROM world_population) THEN 'Above Average'
    ELSE 'Below Average'
  END AS fertility_rate_category,
  AVG(median_age) AS avg_median_age
FROM world_population
GROUP BY fertility_rate_category;


-- 10. Migration Patterns and Socioeconomic Implications
-- Problem Statement: Analyze the net migration rates of countries to understand global migration trends and their implications for labor markets, cultural diversity, and economic stability.

SELECT country, migrants
FROM world_population
ORDER BY migrants DESC
LIMIT 10;


-- 11. Impact of Low Fertility Rates
-- Problem Statement: Identify countries with the lowest fertility rates and discuss the potential long-term socio-economic challenges they may face, such as workforce shortages and aging populations.

SELECT country, fertility_rate
FROM world_population
ORDER BY fertility_rate ASC
LIMIT 10;


-- 12. Assessment of Positive Population Growth
-- Problem Statement: Evaluate the total population increase in countries with positive growth rates, focusing on economic opportunities, challenges in resource allocation, and environmental sustainability.

SELECT SUM(net_change) AS total_positive_growth
FROM world_population
WHERE yearly_change > 0;


-- 13. Global Population Contribution Analysis
-- Problem Statement: Identify the countries contributing most to the global population and analyze their socio-economic and environmental impacts, considering their roles in international policy and trade.

SELECT country, world_share
FROM world_population
ORDER BY world_share DESC;


-- 14. Dynamics of Rapid Population Change
-- Problem Statement: Examine the top 5 countries with the highest yearly population change rates to understand the factors driving rapid demographic shifts, including migration, fertility, and mortality rates.

SELECT country, yearly_change
FROM world_population
ORDER BY yearly_change DESC
LIMIT 5;


-- 15. Demographic Structure and Population Distribution
-- Problem Statement: Group countries by median age and analyze the population distribution within these age categories to understand demographic structures, potential future workforce composition, and healthcare needs.

SELECT
  CASE
    WHEN median_age < 20 THEN 'Below 20'
    WHEN median_age BETWEEN 20 AND 39 THEN '20-39'
    WHEN median_age BETWEEN 40 AND 59 THEN '40-59'
    ELSE '60 and above'
  END AS age_group,
  SUM(population) AS total_population
FROM world_population
GROUP BY age_group;


-- 16. Evaluation of Aging Populations
-- Problem Statement: Identify countries with a median age above a certain threshold and discuss the challenges associated with aging populations, including healthcare demands, pension system sustainability, and potential impacts on economic productivity.

SELECT country, median_age
FROM world_population
WHERE median_age > 40
ORDER BY median_age DESC;


-- 17. Socioeconomic Impacts of High Urbanization Rates
-- Problem Statement: Analyze the socioeconomic implications of high urbanization rates in various countries, including the pressures on housing markets, transportation systems, and urban infrastructure development.

SELECT country, urban_population
FROM world_population
ORDER BY urban_population DESC
LIMIT 10;


-- 18. Rural vs. Urban Population Dynamics
-- Problem Statement: Investigate the dynamics between rural and urban populations, identifying trends in urbanization and potential rural depopulation. Discuss the socio-economic consequences and the need for balanced regional development policies.

SELECT country, 
       urban_population AS urban_population_percentage,
       (100 - urban_population) AS rural_population_percentage
FROM world_population
ORDER BY urban_population_percentage DESC;

