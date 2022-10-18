param(
    [string]
    $Resourcegroupname
)
$WorkSpace = Get-AzResource -ResourceGroupName $Resourcegroupname -Resourcetype Microsoft.Purview/accounts
$WorkSpacename = $WorkSpace.Name
$token = (Get-AzAccessToken -Resource "https://purview.azure.net").Token
$headers = @{ Authorization = "Bearer $token" }

$uri = "https://"+$WorkSpacename+".purview.azure.com/policystore/dataPolicies/DataPolicy?api-version=2022-02-01-preview"
$res = Invoke-RestMethod -Method GET -ContentType "application/json" -Uri $uri -Headers $headers

foreach($i in $res)
{
    foreach($j in $i){

        if($j.name -like "DataPolicy")
        {
            $DataPolicyname = $j.name
        }
    }
}

if($DataPolicyname){
    Write-Host "Data Policy created successfully"
}
else{
    Write-Host "Data Policy not created"
}
