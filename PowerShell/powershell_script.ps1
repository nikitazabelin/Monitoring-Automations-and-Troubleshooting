#to place log file in common location in any environment we will create $path
$path = [Environment]::GetFolderPath(&quot;Desktop&quot;)

# we will create log file on the Desktop
# or script will place output in already existing DiskSpaceAlarm.json file

$logFile = &quot;$path\DiskSpaceAlarm.json&quot;
while ($true) {
$date = Get-Date -Format &quot;HH:mm:ss dd-MM-yyyy&quot;
$drive = Get-WmiObject -Class Win32_LogicalDisk
$freeSpacePercentage = ($drive.FreeSpace / $drive.Size) * 100

# creating a check if any drive has less than 10% free disk space
$lowDiskSpaceDrives = $drive | Where-Object {$freeSpacePercentage -lt 10}

#we are using $LogData as an output of the script
if ($lowDiskSpaceDrives) {
$logData = @{
DateTime = $date
Disk = $lowDiskSpaceDrives.DeviceID
AvailableSpace = $freeSpacePercentage
}

#creating Json Array
#we can also create regular log or txt file and pass it with Add-Content

ConvertTo-Json $logData &gt;&gt; $logFile
}
Start-Sleep 300}