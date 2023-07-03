# Global-Renewable-Energy-Investmtnt-Analysis

This repository contains all the necessary files and scripts used in my comprehensive analysis of renewable energy trends across the globe. The project involves data preprocessing, database design, data loading, and complex SQL queries to answer key research questions.

## Repository Structure

- `EER_Diagram`: This directory contains the Entity-Relationship (ER) diagram for my database design, both as a `.mwb` file and an image.
- `Raw_Data`: This directory contains the main raw data Excel file with multiple sheets and an extracted sheet as a `.csv` file which was used for preprocessing.
- `Preprocessed_Data`: This directory contains all the preprocessed sets that were extracted from the preprocessing `.csv` file. 
- `Preprocessing_script`: Jupyter notebook containing the preprocessing script.
- `SQL_Files`: This directory contains three SQL files - one for creating the database schema, one for loading the data into the database, and one for executing the queries.
- `Query Outputs`: This directory contains the outputs of the queries as `.csv` files.
- `Other_Datasets_Organized`: This directory contains the preprocessed versions of other data sets from the `Other_Sets` directory which could be used for further analysis
- `Other_Sets`: This directory contains other data sets that could be used for further analysis. 

## Project Overview

The objective of this project was to conduct a comprehensive analysis of global renewable energy trends. The focus was on understanding the patterns and shifts in renewable energy investments across various countries, categories, and sources. 

The project commenced with a raw Excel data file that contained a wealth of information. This data was meticulously preprocessed using Python, transforming it into a format suitable for in-depth analysis. The preprocessing stage involved data cleaning, normalization, and extraction of relevant features. This stage was critical in ensuring the quality and reliability of my subsequent analysis.

Once the data was preprocessed, it was loaded into a MySQL database. The database was structured around five main entities: countries, sources, categories, renewable investments, and energy consumption. These entities were chosen based on the nature of our data and the questions I aimed to answer through my analysis.

The database design strictly adheres to the principles of normalization, specifically up to the third normal form (3NF), to ensure data integrity and efficiency. This design facilitated complex SQL queries that spanned multiple tables, providing me with the flexibility to explore various aspects of our data. 

The project culminated in a series of complex SQL queries that yielded valuable insights into renewable energy trends. The results of these queries were exported as CSV files for further analysis and visualization.

In addition to the main analysis, this repository also contains other datasets that could be used for further analysis. These datasets have been preprocessed and organized for easy integration into future research.

This project is a testament to the power of careful data management and insightful analysis. It provides a robust foundation for understanding global renewable energy trends and serves as a springboard for future research in this area.

## Key Findings

The analysis yielded several key insights into global renewable energy trends:

1. **Countries with Highest Renewable Energy Investments**: The analysis revealed that Somalia, Uganda, Liberia, and the Central African Republic were among the countries with the highest percentage of renewable energy investments in 2021.

2. **Renewable Energy Sources**: Solid biofuels emerged as the most popular source of renewable energy, followed by modern renewables and hydro energy.

3. **Energy Consumption Trends**: I found significant increases in renewable energy consumption in several countries. For instance, Somalia and Estonia showed remarkable growth in renewable energy consumption between 1990 and 2020.

4. **Investment in Different Categories**: The analysis showed that the majority of renewable energy investments were directed towards heating and electricity generation.

5. **Global Renewable Energy Trends**: Globally, there was a significant increase in the percentage of renewable energy investments from 1990 to 2020.

These findings provide valuable insights into the current state of renewable energy investments and consumption across the globe. They highlight the countries leading the way in renewable energy investments and the most popular sources of renewable energy.

## Future Work

While our analysis has provided valuable insights into global renewable energy trends, there is still much more that can be explored. Here are some potential directions for future work:

1. **Incorporating Additional Datasets**: Our analysis could be enriched by incorporating additional datasets. For instance, data on government policies and regulations related to renewable energy could provide insights into the impact of policy on renewable energy investments and consumption. Similarly, data on economic indicators such as GDP could allow us to explore the relationship between a country's economic status and its renewable energy trends.

2. **Expanding Temporal Scope**: Our current analysis covers the period from 1990 to 2020. Expanding this to include more recent data could provide more up-to-date insights into renewable energy trends.

3. **Regional Analysis**: While our current analysis focuses on individual countries, future work could explore renewable energy trends at a regional level. This could reveal patterns and trends that are not apparent at the country level.

4. **Predictive Modeling**: Building predictive models could provide forecasts of future renewable energy trends. This could be particularly valuable for policymakers and investors.

5. **Impact Analysis**: Future work could also explore the impact of renewable energy investments and consumption on various outcomes, such as carbon emissions, economic growth, and job creation.

6. **Integration with Interactive Visualization Tools**: To make the findings more accessible to a non-technical audience, future work could involve integrating the analysis with interactive visualization tools. This would allow users to explore the data and findings in a more intuitive and engaging way.

These are just a few possibilities. The field of renewable energy is rapidly evolving, and there are countless questions and avenues to explore. We look forward to continuing to delve into this important topic in our future work.

