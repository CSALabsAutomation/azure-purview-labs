param(
    [string]
    $Resourcegroupname
    $Subscriptionid
)
$WorkSpace = Get-AzResource -ResourceGroupName $Resourcegroupname -Resourcetype Microsoft.DataFactory/factories
$WorkSpacename = $WorkSpace.Name
$token = (Get-AzAccessToken -Resource "https://management.azure.com").Token
$headers = @{ Authorization = "Bearer $token" }

$uri = "https://management.azure.com/subscriptions/"+$Subscriptionid+"/resourceGroups/"+$Resourcegroupname+"/providers/Microsoft.DataFactory/factories/"+$WorkSpacename+"/pipelines/?api-version=2018-06-01"
$res =Invoke-RestMethod -Method Get -ContentType "application/json" -Uri $uri -Headers $headers

foreach($i in $res.value)
{
    foreach($j in $i){

        if($j.name -like "CopyPipeline_as6")
        {
            $pipeline = $j.name
        }
    }
}

if($pipeline){
    Write-Host "Pipeline created successfully"
}
else{
    Write-Host "Pipeline not created"
}
