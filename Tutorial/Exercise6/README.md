# Exercise 6

The output from R script in usql can be returned as a data frame (default) or as a character matrix. The R Reducer in U-SQL provides an option (rReturnType) to pass “charactermatrix” instead of “dataframe” as the returned object from R. The charactermatrix returns all the screen output from the R session. It is useful when we want to say return the model summary etc.

When rReturnType is charactermatrix we need to make sure of two things
1) The R script commands should be separated by comma
2) Output Column count must be three. The first column being the partition key column, the second column is the RowId column of type int and the third column ROutput is the R script output.


In `usqlscriptEx6a.usql` we demonstrate that whatever gets printed on the screen is returned as output from R script in the column ROutput.  

In `usqlscriptEx6b.usql` we will output the model summary

