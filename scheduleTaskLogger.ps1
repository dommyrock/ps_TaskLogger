$password = Read-Host "Enter a Password" -AsSecureString
$user = whoami
$at = (Get-Date).AddMinutes(1).ToString("HH:mmtt")
$action = New-ScheduledTaskAction -Execute "Powershell.exe" -Argument 'C:\Users\dpolzer\me\logRunningProc.ps1'
$trigger= New-ScheduledTaskTrigger -Once -At $at -RepetitionInterval (New-TimeSpan -Minutes 1) -RepetitionDuration (New-TimeSpan -Days 30)
Register-ScheduledTask Task01 -Action $action -Trigger $trigger -User $user -Password $password