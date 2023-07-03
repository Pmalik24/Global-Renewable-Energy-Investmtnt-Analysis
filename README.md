# Global-Renewable-Energy-Investmtnt-Analysis

This repository contains all the necessary files and scripts used in our comprehensive analysis of renewable energy trends across the globe. The project involves data preprocessing, database design, data loading, and complex SQL queries to answer key research questions.

## Repository Structure

- `EER_Diagram`: This directory contains the Entity-Relationship (ER) diagram for our database design, both as a `.mwb` file and an image.
- `Raw_Data`: This directory contains the main raw data Excel file with multiple sheets and an extracted sheet as a `.csv` file which was used for preprocessing.
- `Preprocessed_Data`: This directory contains all the preprocessed sets that were extracted from the preprocessing `.csv` file. 
- `Preprocessing_script`: Jupyter notebook containing the preprocessing script.
- `SQL_Files`: This directory contains three SQL files - one for creating the database schema, one for loading the data into the database, and one for executing the queries.
- `Query Outputs`: This directory contains the outputs of the queries as `.csv` files.
- `Other_Datasets_Organized`: This directory contains the preprocessed versions of other data sets from the `Other_Sets` directory which could be used for further analysis
- `Other_Sets`: This directory contains other data sets that could be used for further analysis. 

## Project Overview

The objective of this project was to conduct a comprehensive analysis of global renewable energy trends. The focus was on understanding the patterns and shifts in renewable energy investments across various countries, categories, and sources. 

The project commenced with a raw Excel data file that contained a wealth of information. This data was meticulously preprocessed using Python, transforming it into a format suitable for in-depth analysis. The preprocessing stage involved data cleaning, normalization, and extraction of relevant features. This stage was critical in ensuring the quality and reliability of our subsequent analysis.

Once the data was preprocessed, it was loaded into a MySQL database. The design of the database was a crucial aspect of the project, as it provided the foundation for our data storage, retrieval, and analysis. Our database was structured around five main entities: countries, sources, categories, renewable investments, and energy consumption. These entities were chosen based on the nature of our data and the questions we aimed to answer through our analysis.

Our database design strictly adheres to the principles of normalization, specifically up to the third normal form (3NF), to ensure data integrity and efficiency. This design facilitated complex SQL queries that spanned multiple tables, providing us with the flexibility to explore various aspects of our data. 

The project culminated in a series of complex SQL queries that yielded valuable insights into renewable energy trends. The results of these queries were exported as CSV files for further analysis and visualization.

In addition to the main analysis, this repository also contains other datasets that could be used for further analysis. These datasets have been preprocessed and organized for easy integration into future research.

This project is a testament to the power of careful data management and insightful analysis. It provides a robust foundation for understanding global renewable energy trends and serves as a springboard for future research in this area.