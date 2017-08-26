# Exercise 2

Same as [Exercise 1](../Excercise1/) but instead of inline R code, the R code is in a separate file and referenced in the U-SQL script. We will deploy R script as resource as  
DEPLOY RESOURCE @"/TutorialMaterial/rscriptEx2.R";
The R script should be uploaded to the folder /TutorialMaterial along with 'myiris.csv'.


