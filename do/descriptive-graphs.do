******************************* DATA LOADING ***********************************
// Removes all data in memory
clear all
// Clears the console of any text display
cls

// This is a string with the path directory to the project files
local project_dir "C:\Users\tonym\Documents\GitHub\example-project\"

// Sets the working directory (where STATA is looking for files)
cd `project_dir'

// Loads the data that was cleaned with the example code
use "data\cleaned\example-cleaned.dta"

******************************* EXAMPLE ****************************************
// Creates a histogram of the income variable
histogram Income, frequency

// What's wrong with this picture?

******************************* TASK *******************************************

**Task: Load the data you cleaned and recreate the histogram above. What is the difference with this graph?

