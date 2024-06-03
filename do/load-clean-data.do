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

//Example 1. Identify and drop any observation where Age is greater or equaled to 31.
drop if Age >= 31

//Example 2. Identify and drop any observation where the person's income is negative (debt payment exceeds income)
drop if Income == -1

//Example 3. Create a new variable "male" that is equaled to 1 if sex is "M" and equaled to 0 if sex is "F." Calculate the ratio of male students.
gen male = 1 if Sex == "M"
replace male = 0 if Sex == "F"

mean(male)

//Example 4. Calculate the average income for men.
mean(Income) if Sex == "M"

//Example 5. Count the number of foreign borns.
count if ForeignBorn == "Yes"

//Example 6. Merge Medical Data. Count number of pre-existing conditions for females
//Load Excel medical data
import excel using "data\Medical History Data", firstrow clear
//Save medical data as STATA data file
save "temp\medical_data.dta", replace

//Load Excel survey data
import excel "data\Survey Data.xlsx", sheet("Sheet1") firstrow clear
//Merge survey data using the unique variable Name with the STATA medical data file - do not generate the merge column
merge 1:1 Name using "temp\medical_data.dta", nogen

//Counts the number of individuals with pre-existing conditions and Female
count if PreexistingCondition == "Yes" & Sex == "F"

//Example 7. Create new variable "private_income" by adding income with stock gains.
gen private_income = Income + StocksGains

****************************** TASKS *******************************************
// Loads the Excel data - first sheet - sets firstrow as variable names - clears any existing data before loading
import excel "data\Survey Data.xlsx", sheet("Sheet1") firstrow clear

** Reloaded the data. Now try to do the following tasks!
** Use the examples above as a guide.
** Look at the readme file for a codebook to help you understand the data.

** Task 0: Calculate the average income. What is wrong with this number?


** Task 1: Drop any observations with missing data for income. Drop any observation where age is less than 21 and any observation where the individual is foreign born.


** Task 2a: Create a new variable "female" that is equaled to 1 if sex is "F" and equaled to 0 if sex is "M." Calculate the ratio of female students. 


** Task 2b: Create a new variable "mortgaged_cleaned" that has the annual mortgage payment. Any renter should be recorded as having 0 mortgage.


** Task 2c: Create a new variable "ever_married" that has is equaled to 1 for currently married, divorced, and widowed and 0 if never married. Calculate the ratio of married individuals. 


** Task 2d: Create a new variable "criminal" that has 1 if there is a felony record and 0 otherwise. Calculate the ratio of criminals.


** Task 2e: Create a new variable "veteran" that is equaled to 1 if individual has ever served in the military but otherwise equaled to 0.


** Task 3: Count the number of renters. Count the number of married individuals. Browse to find "Waldo" and let me know if he is married.


** Task 4: Calculate the average stocks returns for men and for women separately.


** Task 5: Merge the employment data. Create a new variable "total_income" that is the sum of income, stocks gains, and worker's compensation.


** Task 6: Create a new variable "degree_type" that has 3 categories: SSHA, Engineering, and Natural Science with the number 1, 2, and 3 representing the categories. Use the "Degree" variable to decide how to assign the values 1, 2, and 3. Assign labels to the "degree_type" categories.


** Bonus Task: Run a regression: income on age. What do you see?

