# Excercise 1

In this exercise, we will read a csv file with headers using usql, pass the file to R scipt inside usql. Within the R script we will add a new column containing the number of columns in the input form USQL and notice the value. We will pass the results back to usql and save it with headers as csv file.

We uploaded the csv file myiris_wheader.csv to the folder TutorialMaterial that we created earlier in Data lake store.

USQL uses schema on read paradigm, hence the headers will need to be skipped. We will do this by using 'skipFirstNRows' in the EXTRACT statement.
In this example we will embed the R code in the U-SQL script. (In [Example 2](../Example2/) we will keep the same R code in a separate file and reference it in the U-SQL script). We can inline the R code our U-SQL script by using the command parameter of the Extension.R.Reducer. We declare the R script as a string variable and pass it as a parameter to the Reducer.

Notice the use of dedicated named data frames called inputFromUSQL and outputToUSQLrespectively to pass data between U-SQL and R. Input and output DataFrame identifier names are fixed (that is, users cannot change these predefined names of input and output DataFrame identifiers).

More on REDUCE in [Example 4](../Example4/)
Finally save the output to a csv file with and without headers.

