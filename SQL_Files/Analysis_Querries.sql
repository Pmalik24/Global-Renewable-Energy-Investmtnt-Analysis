use renewables;
show tables;

-- QUERY 1
-- How do renewable energy investments differ between countries?
-- We can check which country had the biggest percentage renewable investment in 2021, which was the final year of data collection
SELECT country_name, percentage FROM renewable_investments
    INNER JOIN countries ON (countries.country_id = renewable_investments.country_id)
    INNER JOIN categories ON (categories.category_id = renewable_investments.category_id)
WHERE year = 2021 AND category_name = 'Renewables'
ORDER BY percentage DESC
LIMIT 5;

-- QUERY 2
-- The query reveals that Somalia is number 1 with 95.4% renewable energy.
-- However, since that number seems so high, as do the other four top-renewable countries,
-- we can also check the data source to see why that might be the case.
SELECT country_name, percentage, source_name FROM renewable_investments
    INNER JOIN countries ON (countries.country_id = renewable_investments.country_id)
    INNER JOIN categories ON (categories.category_id = renewable_investments.category_id)
    INNER JOIN sources ON (sources.source_id = renewable_investments.source_id)
WHERE year = 2021 AND category_name = 'Renewables'
ORDER BY percentage DESC
LIMIT 5;
-- The source is the 2022 Energy Balances document from the UN Statistics Division.
-- This document indicates that since Somalia does not have a national power grid,
-- a lot of local power is fueled by petrochemical generators.
-- This means that, while Somalia reports 95.4% renewable usage, this number
-- only reflects officially sanctioned national measurements from centralized power projects.

-- QUERY 3
-- We can get more robust data by looking at the percent change.
-- First, let's check the smallest year.
SELECT year FROM renewable_investments GROUP BY year ORDER BY year LIMIT 1; 
-- The earliest data is from 1990. Since 2021 is still mid-collection, the latest complete data is from 2020.
-- Let's track which country changed the most from 1990 to 2020.
SELECT q1.country_name AS country_name, percent_1990, percent_2020, ROUND((percent_2020 - percent_1990), 2) AS `change` FROM 
    (
        SELECT country_name, percentage AS percent_1990 FROM renewable_investments
            INNER JOIN countries ON (countries.country_id = renewable_investments.country_id)
            INNER JOIN categories ON (categories.category_id = renewable_investments.category_id)
        WHERE category_name = 'Renewables' AND year = 1990
    ) AS q1 INNER JOIN (
        SELECT country_name, percentage AS percent_2020 FROM renewable_investments
            INNER JOIN countries ON (countries.country_id = renewable_investments.country_id)
            INNER JOIN categories ON (categories.category_id = renewable_investments.category_id)
        WHERE category_name = 'Renewables' AND year = 2020
    ) AS q2 ON (q1.country_name = q2.country_name)
ORDER BY `change` DESC
LIMIT 10;
-- The biggest change is in Estonia, which shifted from just 3.5% renewables in 1990 to approximately 40% in 2020.
-- Great job, Estonia!

-- QUERY 4
-- We can also ask what kinds of energies are invested in most.
-- First, let's see which type had the greatest average percentage investment in 2020.
SELECT category_name, ROUND(AVG(percentage), 2) AS average_percentage FROM renewable_investments
    INNER JOIN categories ON (categories.category_id = renewable_investments.category_id)
WHERE year = 2020 AND category_name != 'Renewables'
GROUP BY category_name
ORDER BY average_percentage DESC;

-- QUERY 5
-- Wow! Solid biofuels seem to be skyrocketing in popularity. What's going on there?
-- Let's find which countries are using lots of solid biofuels.
SELECT country_name, percentage FROM renewable_investments
    INNER JOIN countries ON (countries.country_id = renewable_investments.country_id)
    INNER JOIN categories ON (categories.category_id = renewable_investments.category_id)
WHERE category_name = 'Solid biofuels' AND year = 2020
ORDER BY percentage DESC
LIMIT 40;
-- Back to Somalia again, as well as some of the other high-renewable countries.
-- It seems as though, in countries which do not have stable centralized power grids,
-- solid biofuel projects are the main source of renewable energy.
-- Since these projects are entering an effectively empty market,
-- they comprise a big percentage of the country's documented energy use.
-- This indicates that there's a lot of UN-documented solid biofuel projects
-- happening in Central, Eastern, and Western Africa to supplement their electrical grids.

-- QUERY 6
-- We can also track particular energy sector growth over time.
-- Let's say we want to see how the percentage of the USA's investment into hydro
-- has changed since 2000.
SELECT percent_1990, percent_2020, ROUND((percent_2020 - percent_1990), 2) AS `change` FROM 
    (
        SELECT countries.country_id, percentage AS percent_1990 FROM renewable_investments
            INNER JOIN countries ON (countries.country_id = renewable_investments.country_id)
            INNER JOIN categories ON (categories.category_id = renewable_investments.category_id)
        WHERE country_name LIKE 'United States of America' AND category_name = 'Renewables' AND year = 1990
    ) AS q1 INNER JOIN (
        SELECT countries.country_id, percentage AS percent_2020 FROM renewable_investments
            INNER JOIN countries ON (countries.country_id = renewable_investments.country_id)
            INNER JOIN categories ON (categories.category_id = renewable_investments.category_id)
        WHERE country_name LIKE 'United States of America' AND category_name = 'Renewables' AND year = 2020
    ) AS q2 on (q1.country_id = q2.country_id);
-- Hydro power in 2020 consumes 7% more of the sector than it did in 1990. Nice!

-- QUERY 7
-- Finally, we can also track changes in absolute energy usage over time. 
-- Let's stick with the Somalia example for now, and also add in Estonia for comparison.
-- Suppose we want to see how much more renewable energy they used in 2020 for heat
-- as compared to 1990.
SELECT q1.country_name, consumption_1990, consumption_2020, ROUND((consumption_2020 - consumption_1990), 2) AS `change` FROM 
    (
        SELECT countries.country_name, consumption AS consumption_1990 FROM energy_consumption
            INNER JOIN countries ON (countries.country_id = energy_consumption.country_id)
            INNER JOIN categories ON (categories.category_id = energy_consumption.category_id)
        WHERE (country_name LIKE 'Somalia' OR country_name LIKE 'Estonia') AND category_name = 'Consumption - Heat' AND year = 1990
    ) AS q1 INNER JOIN (
        SELECT countries.country_name, consumption AS consumption_2020 FROM energy_consumption
            INNER JOIN countries ON (countries.country_id = energy_consumption.country_id)
            INNER JOIN categories ON (categories.category_id = energy_consumption.category_id)
        WHERE (country_name LIKE 'Somalia' OR country_name LIKE 'Estonia') AND category_name = 'Consumption - Heat' AND year = 2020
    ) AS q2 on (q1.country_name = q2.country_name);
    
-- This indicates that Somalia used nearly 67 petajoules more renewable energy in 2020 than in 1990 for heating purposes,
-- while Estonia used 23.5 more petajoules. 

-- QUERY 8
-- We can also just check all measured uses of renewables to get a more accurate picture,
-- since they could be using different amounts in other areas as well.
-- We don't want to include 'Total Consumption' because that includes nonrenewables as well.
SELECT q1.country_name, consumption_1990, consumption_2020, ROUND((consumption_2020 - consumption_1990), 2) AS `change` FROM 
    (
        SELECT country_name, ROUND(SUM(consumption), 2) AS consumption_1990 FROM energy_consumption
            INNER JOIN countries ON (countries.country_id = energy_consumption.country_id)
            INNER JOIN categories ON (categories.category_id = energy_consumption.category_id)
        WHERE (country_name LIKE 'Somalia' OR country_name LIKE 'Estonia') AND category_name != 'Total Consumption' AND year = 1990
        GROUP BY country_name
    ) AS q1 INNER JOIN (
        SELECT country_name, ROUND(SUM(consumption), 2) AS consumption_2020 FROM energy_consumption
            INNER JOIN countries ON (countries.country_id = energy_consumption.country_id)
            INNER JOIN categories ON (categories.category_id = energy_consumption.category_id)
        WHERE (country_name LIKE 'Somalia' OR country_name LIKE 'Estonia') AND category_name != 'Total Consumption' AND year = 2020
        GROUP BY country_name
    ) AS q2 ON (q1.country_name = q2.country_name);
    
-- Seems like almost all of Somalia's 67 petajoule growth was in the heating sector,
-- while Estonia's was spread out across different types of energy.