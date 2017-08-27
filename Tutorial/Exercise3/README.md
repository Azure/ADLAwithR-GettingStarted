# Exercise 3

In this exercise I will demonstrate how to check the R environment in ADLA. The idea is to ensure that the environment we develop our codes locally in is the same at the one available in ADLA. The R extension supports a set of R packages by default. For additional packages, we need to upload it as a zip file, declare it as RESOURCE in U-SQL and then install in our R script.




In usqlscriptEx3a.usql we will create a file 'outex3a.txt' that will contain all the information about the R environment in ADLA
We created some dummy data to pass to the R script. The output dataframe from the R script contains the packages available, the version of the packages and the R version available in ADLA in various columns.

In usqlscriptEx3b.usql, we will install the magrittr package and load it. For this purpose we will deploy a zip file [magrittr_1.5.zip](https://cran.r-project.org/web/packages/magrittr/index.html). Please upload this to the folder /TutorialMaterial. In the output file 'outex3b.txt' please check to convince yourself that the package is available now. Also look at 'outex3a.txt' again to convince yourself that it was not present before.


 

