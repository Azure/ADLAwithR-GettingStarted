# Getting Started with using ADLA with R - A Tutorial  

Welcome to ***Getting Started with using ADLA with R*** tutorial! This tutorial is in the form of short exercises to help Data Scientists get started with using Azure Data Lake Analytics (ADLA) with R for Data Science work. In the [**tutorial**](/Tutorial/) folder above you will find a set of exercises with usql and R scripts with description of the exercise. In the [advanced](/Tutorial/Advanced/) folder under tutorial you will find some more complex examples. Below you will find a brief review of ADLA and USQL. I will also outline steps for deploying R code and to get started using Azure CLI.

# Prerequisites for [Tutorial](/Tutorial/)
Before you begin this tutorial, you must have the following items:  
- An Azure subscription. See [Get Azure free trial](https://azure.microsoft.com/en-us/free/).  
- Azure CLI 2.0. See Install and configure [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli).  
- Azure Data Lake Analytics Account and Data Lake Store in your subscription.
- Working knowledge of [R](https://cran.r-project.org/doc/manuals/R-intro.html). 

## ADLA review
Azure Data Lake Analytics is the first cloud on-demand analytics job service designed to make big data analytics easy. It has the capability to conduct data processing, advanced analytics, and machine learning modeling with high scalability in a cost-effective way. Using U-SQL, R, Python and .NET, it allows users to run massively parallel data transformation and processing over petabytes of data. A job in ADLA is submitted using a USQL script. 

## USQL review
U-SQL is the new big data query language of the Azure Data Lake Analytics service from Microsoft. It combines a familiar SQL-like declarative language with the extensibility and programmability provided by C# types and the C# expression language. It includes big data processing concepts such as “schema on reads”, custom processors and reducers on top of a scale-out runtime that can handle any size data. It also provides the ability to query and combine data from a variety of data sources, including Azure Data Lake Storage, Azure Blob Storage, and Azure SQL DB, Azure SQL Data Warehouse, and SQL Server instances running in Azure VMs.

## Deploying R Code
R Extensions for U-SQL enable developers to perform massively parallel execution of R code for end to end data science scenarios covering: merging various data files, massively parallel feature engineering, partitioned data model building, scoring and post deployment. In order to deploy R code in we need to install the usqlext in our azure data lake analytics account and within the usql script use the REFERENCE ASSEMBLY statement to enable R extensions for the U-SQL Script. More sample codes for using R can also be found in the following folder in your Data Lake Store:<your_account_address>/usqlext/samples/R.

## [Azure Data Lake Analytics with R Tutorial Using Azure CLI](/Azure%20CLI/)  
You need a Data Lake Analytics account before you can run any jobs. If you don't have one please follow the instructions [here](/Azure%20CLI/) to create one (this is assuming you satisfy the prequisite of having an [azure subsciption](https://azure.microsoft.com/en-us/free/)). You will also need to [enable](https://blogs.msdn.microsoft.com/tsmatsuz/2017/06/08/azure-data-lake-r-extension/) “U-SQL Advanced Analytics”, which includes the package for the R extension. In this tutorial we will be using Azure CLI to perform the following tasks: Upload data to Data Lake Store,
Submit Data Lake Analytics jobs and Retrieve job results. In the [Azure CLI folder](/Azure%20CLI/) above you can find the commands to manage Data Lake Analytics accounts, jobs etc.

## [Additional Resources](/Azure%20CLI/Additional%20Resources.md/)



**For Questions, comments and feedback please visit the tutorial page at [Cortana Intelligence Gallery](https://gallery.cortanaintelligence.com/Tutorial/Getting-Started-with-using-Azure-Data-Lake-Analytics-with-R-A-Tutorial) and use the comment section at the bottom.**
