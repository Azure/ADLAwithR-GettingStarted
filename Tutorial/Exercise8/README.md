# Exercise 8
In the earlier examples the input from usql was a single data frame stored in inputFromUSQL. In this example we will pass two inputs from usql and store it in two data frames - rightFromUSQL and leftFromUSQL. This ability to use R scripts as combiners(two inputs) is targeted for scoring scenario. You can now train using the reducer and score test/validation data using the generated models with the combiner. 

Combine 
rightFromUSQL$MPar, leftFromUSQL

What is being passed to the R script?  2 datasets as 2 dataframes?
what are the columns in the two dfs? names of these cols?
why can't read the rest csvs from the forst R script..and do the needed?

using COMBINE and Extension.R.Combiner

USING new Extension.R.Combiner(scriptFile:"RinUSQL_PredictLinearModelwithRawModelUsingCombiner_asDF.R", stringsAsFactors:false);

READONLY Par
 (must for charactermatrix?)                
USING new Extension.R.Combiner(scriptFile:"RinUSQL_PredictLinearModelwithRawModelUsingCombiner_asCM.R", stringsAsFactors:false, rReturnType:"charactermatrix");

https://msdn.microsoft.com/en-us/library/azure/mt621339.aspx


