# Purpose: This script will install the libraries that are used in your R codes under the .checkpoint folder in your project folder,
#               zip these libraries, so that this zip file can be deployed as a resource and used in the USQL script.
#
# Uses the checkpoint library on your machine to install your desired packages and all the required dependencies.
# checkpoint: Part of the Reproducible R Toolkit from Microsoft
# https://mran.microsoft.com/documents/rro/reproducibility/
# See checkpoint documentation for more information: 
# https://github.com/RevolutionAnalytics/checkpoint
# https://cran.r-project.org/web/packages/checkpoint/checkpoint.pdf
# How checkpoint works
# Creates a snapshot folder to install packages. 
# This library folder .checkpoint is located at checkpoint_project_folder_YYYY-MM-DD in your working directory
# When you create a checkpoint, the checkpoint() function performs the following:
# Scans your project folder for all packages used. Specifically, it searches for all instances of library() and require() in your code.
# Installs these packages from the MRAN snapshot into your snapshot folder using install.packages()
# Sets options for your CRAN mirror to point to a MRAN snapshot, i.e. modify options(repos)
# This means the remainder of your script will run with the packages from a specific date.

# R.utils is needed for zip(). Rtools should be installed on your machine.
if (require(R.utils)==FALSE)
{
  install.packages('R.utils')
  require(R.utils)
}

# checkpoint is needed for checkpoint()
if (require(checkpoint)==FALSE)
{
  install.packages('checkpoint')
  require(checkpoint)
}

#checkpointDate = Sys.Date()
checkpointDate = "2017-08-23" ## or any date in YYYY-MM-DD format after 2014-09-17
#zipfilename       = "packagesusedwithdependencies"
zipfilename       = 'dplyrWithDependencies'

getwd()
project_folder <- paste0(getwd(),"/checkpoint_project_folder_", Sys.Date())  #"~/checkpoint_project_folder_YYYY-MM-DD"

# Create a project folder/directory to work in. This is where the R codes will be.
dir.create(project_folder, recursive = TRUE)
setwd(project_folder)

# Write dummy R code file to project_folder that uses the desired library/libraries
cat("library(dplyr)", sep="\n", file="dummyRcode.R")  #created the R file with library(dplyr)
#cat("library(dplyr) \n library(caret)", sep="\n", file="dummyRcode.R")

# Create a folder .checkpoint in project_folder
dir.create('.checkpoint')  

# Create a checkpoint by specifying a snapshot date
checkpoint(snapshotDate=checkpointDate, checkpointLocation = project_folder) 

# The location where the libraries are installed
# librariesPath = paste0(project_folder, "/.checkpoint/", checkpointDate, "/lib/x86_64-w64-mingw32/3.3.3")
librariesPath = paste0(project_folder, "/.checkpoint/", checkpointDate, "/lib/",version$platform,"/",version$major,".",version$minor)
librariesPath    #"~/checkpoint_project_folder_2017-07-19/.checkpoint/2017-04-24/lib/x86_64-w64-mingw32/3.2.2"

# zip the libraries
setwd(librariesPath)
list.files(path=".")

unlink('src', recursive=TRUE)  #delete folder src as it is not needed

zip(zipfile=zipfilename, files=list.files(path="."))  
# Upload the zip file created to Data Lake Store in correct location to deploy in usql script

