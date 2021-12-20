
$patchedVersion = [Version]"1.1.20.3"

$check_service = Get-CimInstance Win32_Service -Filter "Name = 'ImControllerservice'" -Property PathName

If($check_service -ne $null)
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
Else
	{
		write-output "Service not exists"
		EXIT 0
	}	