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
import excel "data\raw\Survey Data.xlsx", sheet("Sheet1") firstrow clear

***************************** EXAMPLES *****************************************
//Example 1. Merge Medical Data
//Load Excel medical data
import excel using "data\raw\Medical History Data", firstrow clear
//Save medical data as STATA data file
save "temp\medical_data.dta", replace

//Load Excel survey data
import excel "data\raw\Survey Data.xlsx", sheet("Sheet1") firstrow clear
//Merge survey data using the unique variable Name with the STATA medical data file - do not generate the merge column
merge 1:1 Name using "temp\medical_data.dta", nogen


//Example 2. Identify and drop any observation where Age is greater or equaled to 40.
drop if Age >= 40


//Example 3. Identify and drop any observation where the person's income is negative (debt payment exceeds income)
drop if Income == -1


//Example 4. Create a new variable "male" that is equaled to 1 if sex is "M" and equaled to 0 if sex is "F." Calculate the ratio of male students.
gen male = 1 if Sex == "M"
replace male = 0 if Sex == "F"

mean(male)


//Example 5. Calculate the average income for men.
mean(Income) if Sex == "M"


//Example 6. Count the number of people who are not foreign borns and the number of individuals with pre-existing conditions and are female
count if ForeignBorn != "Yes"
count if PreexistingCondition == "Yes" & Sex == "F"


//Example 7. Create new variable "private_income" by adding income with stock gains. Assign a label to the variable "private_income"
gen private_income = Income + StocksGains
label variable private_income "work and investment income" 


//Example 8: Create labels for the majors
label define major_label 1 "engineering" 2 "chemistry" 3 "biology" 4 "physics" 5 "math" 10 "literature" 11 "psychology" 12 "sociology" 13 "poli sci" 14 "philosophy" 20 "business" 21 "economics" 22 "finance" 30 "comp sci"
label values Degree major_label

//Example 9. Saving the data to a STATA data file and replace the file if it already exists
save "data\cleaned\example-cleaned.dta", replace


