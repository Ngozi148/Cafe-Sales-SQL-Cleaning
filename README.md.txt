CAFE SALES DATA CLEANING AND TRANSFORMATION

   PROJECT OVERVIEW

In this project, I performed a deep-clean of a "dirty" café sales dataset using MYSQL Workbench. I focused on improving data quality by addressing inconsistencies n formatting, handling missing information, and validating the dataset's unique records.


  MY DATA CLEANING WORKFLOW

1. Handling Duplicates

Initial Investigation: My first step was to check for duplicate records using 'ROW_NUMBER()' and 'CTE' logic.
Observation: The check returned 0 duplicate rows, confirming that every transaction in this specific dataset was unique and ready for further processing.
Post-Cleaning Re-Verification: Crucially after performing the 'TRIM()' and standardization functions, I ran a secondary duplicate check.
Reasoning: I did this to ensure that removing trailing whitespaces didn't reveal "hidden" duplicates that were previously masked by inconsistent spacing. This double validation step ensured 100% accuracy.


2. Data Standardization and Trimming

Trimming: Used the trim 'TRIM()' function to remove accidental white spaces from text columns(Item, Payment Method, Location, etc.) to prevent errors in grouping.

3. Handling Missing and Inconsistent Values

Blank Space Conversion: I identified "blank" text entries and converted them into proper "NULL" values. This is to ensure that mathematical functions (like averages) skip empty cells correctly.

Standardizing "Unknowns": I found various "Unknown" labels in the dataset and standardized them to "Not Specified". This ensures that when I run a report, all missing information is grouped under one clean label rather than being scattered. 
       By fixing these gaps, I ensured that every row has a clear status, making the data "clean" for visualization in Tableau or Excel.


4. Schema and Format Optimization

Date Conversion: Converted the 'Transaction Date' column from a string to a proper 'DATE' format.

Fixed Data Types: Used 'ALTER TABLE' to modify the 'Total Spent' and 'Price Per Unit' columns to 'DECIMAL(10,2)' for financial precision.


TOOLS USED
Database: MYSQL Workbench
Language: SQL

![Clean Data]
(Cafe%20Sales%20Screenshot.png)
















