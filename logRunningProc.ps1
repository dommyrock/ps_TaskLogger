$script = {
   Get-Process | Select-Object Id, Name, ProcessName, Company, Path, CPU, PagedMemorySize, PagedMemorySize64, PagedSystemMemorySize, PagedSystemMemorySize64, PeakPagedMemorySize, PeakPagedMemorySize64, PeakVirtualMemorySize, PeakVirtualMemorySize64 | Sort-Object -Property  CPU -Descending | Export-Excel -Path D:/Me/logs/$((Get-Date).ToString('MM_dd_yyyy_HH_mm')).xlsx -AutoSize -TableName Processes -WorksheetName Processes
}

if(Get-Module -ListAvailable -Name ImportExcel)
{
   Invoke-Command $script
}
else {
   # install module than run script
   Write-Host "Installing required 'ImportExcel' module ..."
   Install-Module ImportExcel -Scope CurrentUser
   Write-Host "Generating process log ..."
   Invoke-Command $script
}