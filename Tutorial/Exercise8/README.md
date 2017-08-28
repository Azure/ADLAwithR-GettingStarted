# Exercise 8
In the earlier examples the input from usql was a single data frame stored in inputFromUSQL. In this example we will pass two inputs from usql and store it in two data frames - rightFromUSQL and leftFromUSQL. This ability to use R scripts as combiners(two inputs) is targeted for scoring scenario. You can now train using the reducer and score test/validation data using the generated models with the combiner. 

In `usqlscriptEx8a.usql' we send two inputs to the R script - the trained model and the data to score.

https://msdn.microsoft.com/en-us/library/azure/mt621339.aspx


