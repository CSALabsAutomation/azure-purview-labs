$WorkSpace = Get-AzResource -ResourceGroupName az-purview-labs -Resourcetype Microsoft.Purview/accounts
$WorkSpacename = $WorkSpace.Name

$token = (Get-AzAccessToken -Resource "https://purview.azure.net").Token

$headers = @{ Authorization = "Bearer $token" }

$uri1 = "https://"+$WorkSpacename+".purview.azure.com/catalog/api/atlas/v2/glossary"

$uri2 = "https://"+$WorkSpacename+".purview.azure.com/catalog/api/types/termtemplatedef/name/Contoso Template?api-version=2022-03-01-preview"


$res1 = Invoke-RestMethod -Method Get -ContentType "application/json" -Uri $uri1 -Headers $headers

$res2 = Invoke-RestMethod -Method Get -ContentType "application/json" -Uri $uri2 -Headers $headers

foreach($i in $res1.terms)
{
    foreach($j in $i)
    {
        if($j.displayText -like "Contoso Parent")
        {
            $term = $j.displayText
        }
    }
}

if($term){
    Write-Host "Contoso Parent term is created"
}
else{
    Write-Host "Contoso Parent term is not created"
}


foreach($i in $res1.terms)
{
    foreach($j in $i)
    {
        if($j.displayText -like "Contoso Parent_Contoso Child")
        {
            $term = $j.displayText
        }
    }
}

if($term){
    Write-Host "Contoso Child term is created"
}
else{
    Write-Host "Contoso Child term is not created"
}

if($res2){
    Write-Host "Contoso Template is created"
}
else{
    Write-Host "Contoso Template is not created"
}


