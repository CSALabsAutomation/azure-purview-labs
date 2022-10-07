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

Write-Host "R file upload script started"
$uri = "https://github.com/CSALabsAutomation/azure-purview-labs/tree/main/environments/env1/Artifacts/Twitter";
$bacpacFileName = "import-terms-sample.csv";
$storageaccountkey = Get-AzStorageAccountKey -ResourceGroupName $Resourcegroupname -Name $RawDataLakeAccountName;
New-Item -Path 'C:\tempGitFiles' -ItemType Directory
$dir = 'C:\tempGitFiles'
Set-Location $dir
$ctx = New-AzStorageContext -StorageAccountName $RawDataLakeAccountName -StorageAccountKey $storageaccountkey.Value[0]
$files = 'twitter_handles.csv',
          'twitter_handles.parquet';
          foreach ($file in $files)
{
   Write-Host "Downloading $file"
   Write-Host $dlUrl
    Write-Host $dlPath
   $dlUrl = "$($uri)/$file"
   $dlPath = "$($dir)/$file"
   Invoke-WebRequest -Uri $dlUrl -OutFile $dlPath
}
Get-ChildItem -File -Recurse | Set-AzStorageBlobContent -Container "raw" -Blob '' -Context $ctx
