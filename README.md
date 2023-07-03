# Global-Renewable-Energy-Investmtnt-Analysis

This repository contains all the necessary files and scripts used in our comprehensive analysis of renewable energy trends across the globe. The project involves data preprocessing, database design, data loading, and complex SQL queries to answer key research questions.

## Repository Structure

- `EER Diagram`: This directory contains the Entity-Relationship (ER) diagram for our database design, both as a `.mwb` file and an image.
- `Raw Data`: This directory contains the main raw data Excel file with multiple sheets.
- `Preprocessed Data`: This directory contains the selected sheet from the raw data Excel file, saved as a `.csv` file, which was used for preprocessing.
- `Preprocessing Script`: This directory contains a Jupyter notebook file with the preprocessing script.
- `Postprocessed Data`: This directory contains all individual extracted datasets from the preprocessed `.csv` file.
- `SQL Files`: This directory contains three SQL files - one for creating the database schema, one for loading the data into the database, and one for executing the queries.
- `Query Outputs`: This directory contains the outputs of the queries as `.csv` files.

## Project Overview

The aim of this project was to analyze renewable energy trends across different countries, categories, and sources. We started with a raw Excel data file, preprocessed the data using Python, and loaded the data into a MySQL database. Our database design, which adheres to the principles of normalization up to the third normal form (3NF), facilitated complex SQL queries that spanned multiple tables.
