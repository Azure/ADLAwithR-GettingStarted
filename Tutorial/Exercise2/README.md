# Exercise 2

Same as [Exercise 1](../Exercise1/) but instead of inline R code, the R code `rscriptEx2.R` is in a separate file and referenced in the U-SQL script. 

In `usqlscriptEx2.R` we will deploy R script as a resource as  
DEPLOY RESOURCE @"/TutorialMaterial/rscriptEx2.R";
The R script should be uploaded to the folder /TutorialMaterial along with 'myiris.csv'.


