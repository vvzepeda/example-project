******************************* DATA LOADING ***********************************
// Removes all data in memory
clear all
// Clears the console of any text display
cls

// This is a string with the path directory to the project files
local project_dir "C:\Users\tonym\Documents\GitHub\example-project\"

// Sets the working directory (where STATA is looking for files)
cd `project_dir'

// Loads the Excel data - first sheet - sets firstrow as variable names - clears any existing data before loading
import excel "data\Survey Data.xlsx", sheet("Sheet1") firstrow clear

***************************** EXAMPLES *****************************************

//T1. Identify and drop any observation where Age is greater or equaled to 31.
drop if Age >= 31

//T2. Identify and drop any observation where the person's income is negative (debt payment exceeds income)
drop if Income == -1

//T3. Create a new variable "male" that is equaled to 1 if sex is "M" and equaled to 0 if sex is "F." Calculate the ratio of male students.
gen male = 1 if Sex == "M"
replace male = 0 if Sex == "F"

mean(male)

//T4. Calculate the average income for men.
mean(Income) if Sex == "M"

//T5. Count the number of foreign borns.
count if ForeignBorn == "Yes"

****************************** TASKS *******************************************
// Loads the Excel data - first sheet - sets firstrow as variable names - clears any existing data before loading
import excel "data\Survey Data.xlsx", sheet("Sheet1") firstrow clear

** Reloaded the data. Now try to do the following tasks!
** Use the examples above as a guide.
** Look at the readme file for a codebook to help you understand the data.

** Task 0: Calculate the average income. What is wrong with this number?


** Task 1: Drop any observations with missing data for income. Drop any observation where age is less than 21 and any observation where the individual is foreign born.


** Task 2a: Create a new variable "female" that is equaled to 1 if sex is "F" and equaled to 0 if sex is "M." Calculate the ratio of female students. 


** Task 2b: Create a new variable "mortgaged_cleaned" that has the annual mortgage payment. Any renter should be recorded as having 0 mortgage. Create a new variable "ever_married" that has is equaled to 1 for currently married, divorced, and widowed and 0 if never married. Calculate the ratio of married individuals. 


** Task 2c: Create a new variable "criminal" that has 1 if there is a felony record and 0 otherwise. Calculate the ratio of criminals.


** Task 2d: Create a new variable "veteran" that is equaled to 1 if individual has ever served in the military but otherwise equaled to 0.


** Task 3: Count the number of renters. Count the number of married individuals. Browse to find "Waldo" and let me know if he is married.


** Task 4: Calculate the average stocks returns for men and for women separately.


** Task 5: Create a new variable "total_income" that is the sum of income and stocks gains.


** Task 6: Create a new variable "degree_type" that has 3 categories: SSHA, Engineering, and Natural Science with the number 1, 2, and 3 representing the categories. Use the "Degree" variable to decide how to assign the values 1, 2, and 3. Assign labels to the "degree_type" categories.


** Bonus Task: Run a regression: income on age. What do you see?

