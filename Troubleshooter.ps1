#requires -Version 5.1
<# Created by Dewald Pretorius #>
param([string]$OutputPath)
if(-not $OutputPath){$OutputPath="$([Environment]::GetFolderPath('Desktop'))\ToDo_Reports"};New-Item $OutputPath -ItemType Directory -Force|Out-Null
$app=Get-AppxPackage '*Todos*','*ToDo*' -ErrorAction SilentlyContinue;$targets='to-do.office.com','login.microsoftonline.com','graph.microsoft.com';$net=foreach($t in $targets){[pscustomobject]@{Target=$t;HTTPS443=(Test-NetConnection $t -Port 443 -InformationLevel Quiet -WarningAction SilentlyContinue)}}
@('MICROSOFT TO DO SYNC TROUBLESHOOTER','Created by Dewald Pretorius',"Generated: $(Get-Date)",($app|Select-Object Name,Version,Status,InstallLocation|Format-List|Out-String -Width 220),($net|Format-Table -AutoSize|Out-String -Width 220),'Guidance: verify account, list ownership, Outlook Tasks integration, reminders, shared-list permissions, app package state, and service connectivity.')|Set-Content (Join-Path $OutputPath 'Report.txt') -Encoding UTF8