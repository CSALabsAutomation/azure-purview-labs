param(
    [string]
    $Resourcegroupname
    $Subscriptionid
)
$WorkSpace = Get-AzResource -ResourceGroupName $Resourcegroupname -Resourcetype Microsoft.DataFactory/factories
$WorkSpacename = $WorkSpace.Name

$token = (Get-AzAccessToken -Resource "https://purview.azure.net").Token
$headers = @{ Authorization = "Bearer $token" }
$body = "{
  keywords: null,  
  filter: {
    or: [
      {
        assetType: ""Azure Data Factory""
      }
    ]
  }
}"
$uri = "https://"+$WorkSpacename+".purview.azure.com/catalog/api/search/query?api-version=2022-03-01-preview&$select=id"
$res = Invoke-RestMethod -Method Post -ContentType "application/json" -Uri $uri -Headers $headers -Body $body

foreach($i in $res.value)
{
    foreach($j in $i)
    {
        if($j.name -like "Copy_as6")
        {
            $name = $j.name
        }
        
    }
}

if($name)
{
    Write-Host "Pipeline activity ran successfully"
}
else
{
    Write-Host "Pipeline activity doesn't exist"
}

