$WorkSpace = Get-AzResource -ResourceGroupName az-lab-purview -Resourcetype Microsoft.Purview/accounts
$WorkSpacename = $WorkSpace.Name
$TakeEndpoint = 'https://'+$WorkSpacename+'.purview.azure.com'
$DataSource = Get-AzPurviewDataSource -Endpoint $TakeEndpoint

foreach($Sourcesq in $DataSource)
{
    if($Sourcesq.Name -like "AzureSqlDatabase*")
    {
        $Sourcesql = $Sourcesq.Name
    }
}
$DataSourceValidate = Get-AzPurviewDataSource -Endpoint $TakeEndpoint -Name $Sourcesql
if($DataSourceValidate){
    Write-Host "SQL DB is Registered"
}
else{
    Write-Host "SQL DB is not Registered"
}
$SourceSqlscan = Get-AzPurviewScan -Endpoint $TakeEndpoint -DataSourceName $Sourcesql
if($SourceSqlscan){
    Write-Host "SQL DB Scan is succeeded"
}
else{
    Write-Host "SQL DB Scan is not succeeded"
}

foreach($Sourceh in $DataSource)
{
    if($Sourceh.Name -like "AzureDataLakeStorage*")
    {
        $Sourceadls = $Sourceh.Name
    }
}
$DataSourceValidate = Get-AzPurviewDataSource -Endpoint $TakeEndpoint -Name $Sourceadls
if($DataSourceValidate){
    Write-Host "ADLS Gen2 is Registered"
}
else{
    Write-Host "ADLS Gen2 is not Registered"
}
$SourceAdlscans = Get-AzPurviewScan -Endpoint $TakeEndpoint -DataSourceName $Sourceadls
foreach($Scan in $SourceAdlscans)
{
    if($Scan.scanRulesetName -like "AdlsGen2")
    {
        $AdlsScan = $Scan.Name
    }
}
$SourceAdlscan = Get-AzPurviewScan -Endpoint $TakeEndpoint -DataSourceName $Sourceadls -Name $AdlsScan
if($SourceAdlscan){
    Write-Host "ADLS Gen2 Scan is succeeded"
}
else{
    Write-Host "ADLS Gen2 Scan is not succeeded"
}
