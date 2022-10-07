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

Write-Host "file upload script completed"
$uri1 = "https://raw.githubusercontent.com/CSALabsAutomation/azure-purview-labs/main/environments/env1/Artifacts
Invoke-WebRequest -Uri $uri
Get-ChildItem -File -Recurse | Set-AzStorageBlobContent -Container "raw" -Context $ctx
