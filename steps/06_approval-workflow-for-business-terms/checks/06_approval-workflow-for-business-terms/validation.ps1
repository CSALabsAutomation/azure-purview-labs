param(
    [string]
    $Resourcegroupname
)

$WorkSpace = Get-AzResource -ResourceGroupName $Resourcegroupname -Resourcetype Microsoft.Purview/accounts
$WorkSpacename = $WorkSpace.Name

$guid = New-Guid

$token = (Get-AzAccessToken -Resource "https://purview.azure.net").Token
$headers = @{ Authorization = "Bearer $token"; 'x-ms-client-request-id' = $guid}

$uri = "https://"+$WorkSpacename+".purview.azure.com/workflow/definitions?api-version=2021-03-01"
$res = Invoke-RestMethod -Method Get -ContentType "application/json" -Uri $uri -Headers $headers

Write-Host $res.value

foreach($j in $res.value)
    {
        if($j.workflowName -like "Create glossary term")
        {
            $workflowName = $j.workflowName
        }
        
    }

if($workflowName)
{
    Write-Host "Create glossary term workflow is created"
}
else
{
    Write-Host "Create glossary term workflow is not created"
}
