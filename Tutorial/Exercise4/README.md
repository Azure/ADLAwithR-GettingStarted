# Exercise 4

In this exercise we will create a zip file using checkpoint package locally. We will upload this zip file along with myiris_wheader.csv to /TutorialMaterial  in Data lake store and deploy it usql script.

More on checkpoint package :-

"*The goal of checkpoint is to solve the problem of package
reproducibility in R. Specifically, checkpoint allows you to install packages
as they existed on CRAN on a specific snapshot date as if you had a CRAN time
machine. To achieve reproducibility, the checkpoint() function installs the
packages required or called by your project and scripts to a local library
exactly as they existed at the specified point in time. Only those packages
are available to your project, thereby avoiding any package updates that came
later and may have altered your results. In this way, anyone using checkpoint's
checkpoint() can ensure the reproducibility of your scripts or projects at any
time*"

Source: https://cran.r-project.org/web/packages/checkpoint/checkpoint.pdf 


The zip file dplyrWithDependencies.zip containing dplyr and all the dependent packages was created using the R script 'R_local_CreateCheckpointForDplyr.R'. Run this script locally in your development environment and upload the zip file created to /TutorialMaterial.


In usqlscriptEx4a.usql, we will look at the available packages before and after deploying dplyrWithDependencies.zip to convince ourselves that the required packages are available in ADLA R environment.

In usqlscriptEx4b.usql we will deploy dplyrWithDependencies.zip and use dplyr in the R script.
