# Azure Data Lake Analytics with R Tutorial Using Azure CLI   

There are multiple ways to manage Azure Data Lake Analytics viz. Azure Portal, Azure Power Shell, Visual Studio and Azure CLI. In this tutorial we will use Azure CLI to various tasks such as managing and submitting jobs. You can download it from [here](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli). To install the CLI on Windows and use it in the Windows command-line, download and run the [MSI](https://aka.ms/InstallAzureCliWindows).  

For a detailed syntax help with Azure CLI command please see the resources below:-  
[Manage Azure Data Lake Analytics using Azure Command-line Interface (CLI)](https://docs.microsoft.com/en-us/azure/data-lake-analytics/data-lake-analytics-manage-use-cli)  
[Get started with Azure Data Lake Analytics using Azure CLI 2.0](https://docs.microsoft.com/en-us/azure/data-lake-analytics/data-lake-analytics-get-started-cli2)  
[Get started with Azure Data Lake Store using Azure CLI 2.0](https://docs.microsoft.com/en-us/azure/data-lake-store/data-lake-store-get-started-cli-2.0)   
[Commands to manage Data Lake Analytics accounts, jobs, and catalogs](https://docs.microsoft.com/en-us/cli/azure/dla).     
[Commands to manage Data Lake Store accounts, and filesystems](https://docs.microsoft.com/en-us/cli/azure/dls)  
[Manage Subscriptions](https://docs.microsoft.com/en-us/cli/azure/account)  
[Manage resource groups](https://docs.microsoft.com/en-us/cli/azure/group)  

Note: Prerequisite for this tutorial is that you have an [Azure subscription](https://azure.microsoft.com/en-us/free/). 

#### To use Jupyter notebook to do this tutorial please find the [notebook here](https://github.com/Azure/ADLAwithR-GettingStarted/blob/master/Azure%20CLI/Tutorial_with_Jupyter_Notebook.ipynb). We will use the az cli commands you will see below from inside a Jupyter notebook.


Log into your Azure subscription  
`az login`

Once you log in, the window lists all the Azure subscriptions that are associated with your account. Use the following command to use a specific subscription.  
`az account set --subscription "My subscription"`  

Confirm that you are in the correct subscription  
`az account show`  

To list of all resource groups in your subscription type   
`az group list` 

You will need to select from this list or create a new resource group for creating new Data Lake Store account or Data Lake Analytics account. Each Data Lake Analytics account has an Azure Data Lake Store account dependency. This account is referred as the default Data Lake Store account. You can create the Data Lake Store account beforehand or when you create your Data Lake Analytics account. The default Data Lake Store account is used to store job metadata and job audit logs. After you have created an Analytics account, you can add additional Data Lake Storage accounts and/or Azure Storage account.       

To create a new resource group:  
`az group create --location --name`  
For e.g.  
`az group create --name shaheenrg --location "Central US"`

If you don't already have one create a new Data Lake Store account:  
`az dls account create --account "<Data Lake Store Account Name>" --resource-group "<Resource Group Name>"`  
For e.g.  
`az dls account create --account "shaheenadls" --resource-group "shaheenrg"`

If you don't already have one create a Data Lake Analytics account:  
`az dla account create --account "<Data Lake Analytics Account Name>" --resource-group "<Resource Group Name>" --location "<Azure location>" --default-data-lake-store "<Default Data Lake Store Account Name>"`  
For e.g.  
`az dla account create --account "shaheenadla" --resource-group "shaheenrg" --location "Central US" --default-data-lake-store "shaheenadls"`  

After creating an account, you can use the following commands to list the accounts and show account details:  
`az dla account list`  
`az dla account show --account "<Data Lake Analytics Account Name>"`


Now that we are set with a *Data Lake Analytics account* and a *Data Lake Store* we can start submitting jobs. First we will create a folder called "**TutorialMaterial**" in the home folder of your Data Lake Store and upload some files.

`az dls fs create --account <Data Lake Store Account Name> --path /TutorialMaterial --folder`

Next we will upload myiris.csv, myiris_wheader.csv and other files as required for the Exercise to this folder.      
`az dls fs upload --account <Data Lake Store Account Name> --source-path "PathTo\myiris.csv" --destination-path "/TutorialMaterial"`

For e.g.   
`az dls fs upload --account shaheenadls --source-path "C:\Users\shaheen\Documents\Tutorial\Exercise1\myiris.csv" --destination-path "/TutorialMaterial"`

Use the following command to list the files in the folder *TutorialMaterial* that we created above in your Data Lake Store account.  
`az dls fs list --account <Data Lake Store Account Name> --path /TutorialMaterial`

To submit jobs use the following syntax:-   
`az dla job submit --account "<Data Lake Analytics Account Name>" --job-name "<Job Name>" --script "<Script Path and Name>"`  
  
For e.g.   
`az dla job submit --account "shaheenadla" --job-name "myadlajobex1" --script @"C:\Users\shaheen\Documents\Tutorial\Exercise1\usqlscriptEx1.usql"`  
"`

To list jobs  
`az dla job list --account "<Data Lake Analytics Account Name>"`     
 
For e.g.  
`az dla job list --account shaheenadla | grep -e 'name' -e 'result' -e 'jobId'` 


To Cancel job   
`az dla job cancel --account "<Data Lake Analytics Account Name>" --job-identity "<Job Id>"  `  

After a job is completed, you can use the following commands to preview and download the output files:    
   
`az dls fs preview --account "<Data Lake Store Account Name>" --path "/PathTo/outputfile.csv"`      

For e.g.    
`az dls fs preview --account "shaheenadls" --path "/TutorialMaterial/outex1.txt"`  

`az dls fs preview --account "shaheenadls" --path "/TutorialMaterial/outex1.txt" --length 1000 --offset 0`    

To download the file to your local machine use:    
`az dls fs download --account "<Data Lake Store Account Name>" --source-path "/PathTo/outputfile.csv" --destintion-path "<Destination Path and File Name>"`    
For e.g.    
`az dls fs download --account "shaheenadls" --source-path "/TutorialMaterial/outex1.txt" --destination-path "C:\Users\shaheen\Documents\Tutorial\Exercise1"`    

Once you have completed the tutorial and have no further need for the Data Lake Analytics Account and Data Lake Store created for the purpose please **delete** these resources in your subscription.  

To delete Azure Data Lake Analytics account    
`az dla account delete --account "<Data Lake Analytics Account Name>"`  

To delete Azure Data Lake Store     
`az dls account delete --account "<Data Lake Store>"`  

Or you can delete the resource group which will delete all the resources in that resource group (press y when prompted).    
`az group delete --name "<Resource Group Name>"`    



