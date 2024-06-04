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
histogram Income, frequency title("Example: Income Histogram")

// Saves the histogram
graph export "graphs\example\example income histogram.png", as(png) name("Graph") replace

// What's wrong with this picture?


// Creates a pie graph of the Married variable categories
graph pie, over(Married) title("Example: Marriage Pie")

// Saves the pie graph
graph export "graphs\example\example marriage pie graph.png", as(png) name("Graph") replace

// What's wrong with this picture?


// Creates a graph with a line of best fit between age and income
twoway (scatter Income Age) (lfit Income Age), title("Example: Age on Income")


// Saves the graph
graph export "graphs\example\example age-income graph.png", as(png) name("Graph") replace

// What's wrong with this picture?


******************************* TASK *******************************************
**Task: Load the data you had cleaned yourself from load-clean-data.do


**Task: STATA will not save files into a folder that does not exist. Create a new folder called "final" in the "~GitHub\example-project\graphs" folder.


**Task: Recreate the histogram above. What is the difference with this graph? Save this graph as "income histogram.png" in the "final" subfolder. Be sure to change the title to an appropriate name.


**Task: Recreate the pie graph above. What is the difference with this graph? Save this graph as "marriage pie graph.png" in the "final" subfolder. Be sure to change the title to an appropriate name.

