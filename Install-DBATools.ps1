# Check to see if NuGet is present, if not install, if incorrect version then upgrade.
$MinNuGetVersion = [Version]"2.8.5.201"
$NuGet = Get-PackageProvider -ListAvailable | Where-Object Name -EQ "NuGet"
$DBATools = Get-InstalledModule | Where-Object Name -EQ "DBATools"

if(!$NuGet) {

    Write-Host "NuGet not installed, installing."
    Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force
}
elseif ($NuGet.Version -LT $MinNuGetVersion) {

    Write-Host "Nuget installed, incorrect version, upgrading."
    Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force
}

# Now install DBATools PowerShell Module.
if(!$DBATools) {
    Write-Host "Installing DBATools."
    Install-Module -Name DBAtools -Scope AllUsers -Force
}
