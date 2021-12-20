
$patchedVersion = [Version]"1.1.20.3"

$check_service = Get-Service "ImControllerservice" -ea silentlycontinue

If($check_service -ne $null)
	{
		$Controller_Path = "C:\Windows\Lenovo\ImController\PluginHost\Lenovo.Modern.ImController.PluginHost.exe"
		If(test-path $Controller_Path)
			{
				[Version]$Get_Version = (get-item $Controller_Path | select *).VersionInfo.ProductVersion
				If($Get_Version -lt $patchedVersion)
					{
						write-output "Service installed and bad version ($Get_Version)"	  
						EXIT 1					
					}
				ElseIf($Get_Version -ge $patchedVersion)
					{
						write-output "Service installed but version OK ($Get_Version)"	  
						EXIT 0				
					}					
			}
	}
Else
	{
		write-output "Service not exists"
		EXIT 0
	}	