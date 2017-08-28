# Azure CLI

There are multiple ways to manage Azure Data Lake Analytics viz. Azure Portal, Azure Power Shell, Visual Studio and Azure CLI. In this tutorial we will use Azure CLI to various tasks such as managing and submitting jobis.

For a detailed syntax help with Azure CLI command please see the resources below. 

[Manage Azure Data Lake Analytics using Azure Command-line Interface (CLI)](https://docs.microsoft.com/en-us/azure/data-lake-analytics/data-lake-analytics-manage-use-cli)  
[Get started with Azure Data Lake Analytics using Azure CLI 2.0](https://docs.microsoft.com/en-us/azure/data-lake-analytics/data-lake-analytics-get-started-cli2)  
[Get started with Azure Data Lake Store using Azure CLI 2.0](https://docs.microsoft.com/en-us/azure/data-lake-store/data-lake-store-get-started-cli-2.0)   
[Commands to manage Data Lake Analytics accounts, jobs, and catalogs](https://docs.microsoft.com/en-us/cli/azure/dla).   
[Commands to manage Data Lake Store accounts, and filesystems](https://docs.microsoft.com/en-us/cli/azure/dls)

**Note**: Prerequisite for this tutorial is that you have an [Azure subscription](https://azure.microsoft.com/en-us/free/). 

Log into your Azure subscription  
`az login`

Once you log in, the window lists all the Azure subscriptions that are associated with your account. Use the following command to use a specific subscription.  
`az account set --subscription "My subscription"`

To list of all resource groups in your subscription type (you will need to select from this list or create a new resource group for creating new Data Lake Store account or Data Lake Analytics account.  

`az group list` 

If you don't already have one create a new Data Lake Store account:  
`az dls account create --account "<Data Lake Store Account Name>" --resource-group "<Resource Group Name>"`

If you don't already have one create a Data Lake Analytics account:
`az dla account create --account "<Data Lake Analytics Account Name>" --resource-group "<Resource Group Name>" --location "<Azure location>" --default-data-lake-store "<Default Data Lake Store Account Name>"`


After creating an account, you can use the following commands to list the accounts and show account details:  
`az dla account list`  
`az dla account show --account "<Data Lake Analytics Account Name>"`


Now that we are set with a *Data Lake Analytics account* and a *Data Lake Store* we can start submitting jobs. First we will crate a folder called "TutorialMaterial" in the home folder of your Data Lake Store and upload some files.

`az dls fs create --account <Data Lake Store Account Name> --path /TutorialMaterial --folder`

Next we will upload myiris.csv, myiris_wheader.csv and other files as required for the Exercise to this folder.  
`az dls fs upload --account <Data Lake Store Account Name> --source-path "PathTo\myiris.csv" --destination-path "/TutorialMaterial"`

e.g. `az dls fs upload --account shaheenadls --source-path "C:\Users\shaheen\Documents\TutorialMaterial\myiris.csv" --destination-path "/TutorialMaterial"`

Use the following command to list the files in a Data Lake Store account.  
`az dls fs list --account <Data Lake Store Account Name> --path /TutorialMaterial`

To submit jobs use the following syntax:-   
`az dla job submit --account "<Data Lake Analytics Account Name>" --job-name "<Job Name>" --script "<Script Path and Name>"`  

az dla job submit --account "myadlaaccount" --job-name "myadlajob" --script @"C:\DLA\myscript.txt"  

e.g. `az dla job submit --account "shaheenadla" --job-name "myadlajob1" --script @"C:\Users\shaheen\Documents\Conferences\TutorialMaterial\Exercise1\usqlscriptEx1.usql"`  
"`

To list jobs
az dla job list --account "<Data Lake Analytics Account Name>"  
az dla job show --account "<Data Lake Analytics Account Name>" --job-identity "<Job Id>"  


To Cancel job  
az dla job cancel --account "<Data Lake Analytics Account Name>" --job-identity "<Job Id>"  

After a job is completed, you can use the following commands to list the output files, and download the files:  
az dls fs list --account "<Data Lake Store Account Name>" --source-path "/Output" --destination-path "<Destintion>"  

az dls fs preview --account "<Data Lake Store Account Name>" --path "/TutorialMaterial/SearchLog-from-Data-Lake.csv"  

az dls fs preview --account "<Data Lake Store Account Name>" --path "/Output/SearchLog-from-Data-Lake.csv" --length 128 --offset 0  

az dls fs download --account "<Data Lake Store Account Name>" --source-path "/Output/SearchLog-from-Data-Lake.csv" --destintion-path "<Destination Path and File Name>"  



===============

