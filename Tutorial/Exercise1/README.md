# Excercise 1

In this exercise, we will read a csv file with headers using usql and pass the file to the R scipt inside usql. Within the R script we will add a new column containing the number of columns in the input form USQL and notice the value. We will pass the results back to usql and save it with headers as csv file.

We uploaded the csv file myiris_wheader.csv to the folder TutorialMaterial that we created earlier in Data lake store.

USQL uses schema on read paradigm, hence the headers will need to be skipped. We will do this by using 'skipFirstNRows' in the EXTRACT statement.  
In this example we will embed the R code in the U-SQL script. (In [Exercise 2](../Exercise2/) we will keep the same R code in a separate file and reference it in the U-SQL script). We can inline the R code our U-SQL script by using the command parameter of the Extension.R.Reducer. We declare the R script as a string variable and pass it as a parameter to the Reducer.

Notice the use of dedicated named data frames called inputFromUSQL and outputToUSQL respectively to pass data between U-SQL and R. We use inputFromUSQL for retrieving the input data in our R script and outputToUSQL as returned result to U-SQL. These input and output DataFrame identifier names are fixed (that is, users cannot change these predefined names of input and output DataFrame identifiers). More on REDUCE in [Exercise 5](../Exercise5/). However please note the pseudo partition. We did not need partitioning, but we had to specify the pseudo partition (same partition for all rows).

Finally we will save the output to a csv file with and without headers.
