$svcName = "Genapi.NotaPlusToCNKAudit"
$services = Get-WmiObject win32_service | Where-Object { $_.PathName -like "*$svcName*" -and $_.StartName -like "*LocalService" }

foreach ($svc in $services) 
{
Write-Output "$($svc.DisplayName),$($svc.State),$($svc.PathName),$($svc.StartName)"
  }
if (($services | Measure-Object).Count -le 0) 
{
	Write-host "Couldn't find any Genapi.NotaPlusToCNKAudit services with StartName like *LocalService" -f Red
}
