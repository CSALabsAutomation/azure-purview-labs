$WorkSpace = Get-AzResource -ResourceGroupName az-purview-labs -Resourcetype Microsoft.Purview/accounts
$WorkSpacename = $WorkSpace.Name
$TakeEndpoint = 'https://'+$WorkSpacename+'.purview.azure.com'
$DataSourcevalidate = Get-AzPurviewClassificationRule -Endpoint $TakeEndpoint -Name 'twitter_handle'
if ($DataSourcevalidate)
{
    Write-Host "Classification Rule is created"
}
else
{
    Write-Host "Classification Rule is not created"
}

$DataSource = Get-AzPurviewDataSource -Endpoint $TakeEndpoint
foreach($Sourceh in $DataSource)
{
    if($Sourceh.Name -like "AzureDataLakeStorage*")
    {
        $Sourceadls = $Sourceh.Name
    }
}
$SourceAdlscans = Get-AzPurviewScan -Endpoint $TakeEndpoint -DataSourceName $Sourceadls
foreach($Scan in $SourceAdlscans)
{
    if($Scan.scanRulesetName -like "twitter*")
    {
        $TwitterScanRuleset = $Scan.Name
    }
}
$SourceAdlscan = Get-AzPurviewScan -Endpoint $TakeEndpoint -DataSourceName $Sourceadls -Name $TwitterScanRuleset
if($SourceAdlscan){
    Write-Host "Twitter Scan Rule Set is created"
}
else{
    Write-Host "Twitter Scan Rule Set is not created"
}