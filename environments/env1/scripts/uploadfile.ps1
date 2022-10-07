param(
[string] $ResourceGroupName,
[string] $RawDataLakeAccountName
)
Write-Host "file upload script started"
 if ((Get-Module -ListAvailable Az.Accounts) -eq $null)
	{
       Install-Module -Name Az.Accounts -Force
    }

$uri = "https://raw.githubusercontent.com/CSALabsAutomation/azure-purview-labs/main/environments/env1/Artifacts/import-terms-sample.csv";
$bacpacFileName = "import-terms-sample.csv";

$storageaccountkey = Get-AzStorageAccountKey -ResourceGroupName $Resourcegroupname -Name $RawDataLakeAccountName;

$ctx = New-AzStorageContext -StorageAccountName $RawDataLakeAccountName -StorageAccountKey $storageaccountkey.Value[0]

Invoke-WebRequest -Uri $uri -OutFile $bacpacFileName
Set-AzStorageBlobContent -File $bacpacFileName -Container "raw" -Blob 'import-terms-sample.csv' -Context $ctx


#############################

$uri = "https://raw.githubusercontent.com/CSALabsAutomation/azure-purview-labs/main/environments/env1/Artifacts/Twitter/twitter_handles.parquet";
$bacpacFileName = "twitter_handles.parquet";

$storageaccountkey = Get-AzStorageAccountKey -ResourceGroupName $Resourcegroupname -Name $RawDataLakeAccountName;

$ctx = New-AzStorageContext -StorageAccountName $RawDataLakeAccountName -StorageAccountKey $storageaccountkey.Value[0]

Invoke-WebRequest -Uri $uri -OutFile $bacpacFileName
Set-AzStorageBlobContent -File $bacpacFileName -Container "raw" -Blob 'Twitter/twitter_handles.parquet' -Context $ctx

#############################

$uri = "https://raw.githubusercontent.com/CSALabsAutomation/azure-purview-labs/main/environments/env1/Artifacts/Twitter/twitter_handles.csv";
$bacpacFileName = "twitter_handles.csv";

$storageaccountkey = Get-AzStorageAccountKey -ResourceGroupName $Resourcegroupname -Name $RawDataLakeAccountName;

$ctx = New-AzStorageContext -StorageAccountName $RawDataLakeAccountName -StorageAccountKey $storageaccountkey.Value[0]

Invoke-WebRequest -Uri $uri -OutFile $bacpacFileName
Set-AzStorageBlobContent -File $bacpacFileName -Container "raw" -Blob 'Twitter/twitter_handles.csv' -Context $ctx


Write-Host "file upload script completed"

