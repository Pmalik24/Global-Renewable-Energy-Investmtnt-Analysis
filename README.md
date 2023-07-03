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

The aim of this project was to analyze renewable energy trends across different countries, categories, and sources. We started with a raw Excel data file, preprocessed the data using Python, and loaded the data into a MySQL database. Our database design, which adheres to the principles of normalization up to the third normal form (3NF), facilitated complex SQL queries that spanned multiple tables.
