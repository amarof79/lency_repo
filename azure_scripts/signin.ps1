
function InstallModules{
    param([String[]]$names)
    $DebugPreference = 'Continue'
    $getAzModules = (Get-Module).Name
    foreach ($module in $names){
        if ($module -notin $getAzModules){
            Write-Host "Installing and importing $module module" -ForegroundColor Yellow
            Install-Module $module -AllowClobber -Repository PSGallery -Force
            Import-Module $module -ErrorAction SilentlyContinue
        }
        else{
            Write-Host "The $module module is already installed" -ForegroundColor Green
        }
    }
}
InstallModules -names "Az"

# New-AzResourceGroup -Name "testing-resource-group-123" -Tag "testing" -Location "eastus"
$account_name = "testrg2acc2"
$account_key = "Kknhm690Wcrx+qJi3V8ENyl9BTxo4TVYqixPK3rgjvwMqcUAE3RUJA7a009ESaNQc92W5BZzpy7x+AStPBYKIA=="

$context = New-AzStorageContext -StorageAccountName $account_name -StorageAccountKey $account_key

try {
    Get-AzStorageBlob -Container "testing" -Blob "urmom.txt" -Context $context
} catch {

    New-AzStorageContainer -Name "testing" -Context $context
    Set-AzStorageBlobContent -Name "urmom.txt" -Container "testing" -File "./azure_scripts/urmom.txt"

}


