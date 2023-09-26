
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


#create usersss
$passwordProfile = New-Object -TypeName Microsoft.Open.AzureAD.Model.passwordProfile
$passwordProfile.Password = "Scheisse7916!!"
New-AzureADUser - DisplayName "New user" -PasswordProfile -UserPrincipalName "NewUser@gmail.com"