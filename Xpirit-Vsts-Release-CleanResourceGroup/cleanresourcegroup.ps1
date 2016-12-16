Trace-VstsEnteringInvocation $MyInvocation

# Initialize Azure.
Import-Module $PSScriptRoot\ps_modules\VstsAzureHelpers_
Initialize-Azure
$path = $MyInvocation.MyCommand.Path -replace "cleanresourcegroup.ps1",""
$templateFile = [System.IO.Path]::Combine($path,"empty.json")
$rgName = Get-VstsInput -Name resourceGroupName -Require

New-AzureRMResourceGroupDeployment -Name "empty-resourcegroup" -ResourceGroupName $rgName  -Mode "Complete" -TemplateFile $templateFile -force

Write-Host "End of Task Clean Resource Group" 


#thanks to Pascal Naber for this idea to use a empty deployment template!