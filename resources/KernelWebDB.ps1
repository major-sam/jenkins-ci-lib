[System.Reflection.Assembly]::LoadWithPartialName("Microsoft.SqlServer.SMO") | Out-Null
$MSSQLDataPath =  (Invoke-Sqlcmd -query "select SERVERPROPERTY('InstanceDefaultDataPath') as 'd'").d
write-output "mssql data:" $MSSQLDataPath
$RelocateFile = @() 
$BackupFile = "\\server\tcbuild$\Testers\DB\BaltBetWeb.bak"
$dbRelocateFiles = @(
	@{
		SourceName = "BaltBetWeb"
		FileName = "BaltBetWeb_data.mdf"
	}
	@{
		SourceName = "Files"
		FileName = "Files_data"
	}
	@{
		SourceName = "BaltBetWeb_log"
		FileName = "BaltBetWeb_data.ldf"
	}
)
$dbname ="BaltBetWeb_data"
foreach ($dbFile in $dbRelocateFiles) {
	$RelocateFile += New-Object Microsoft.SqlServer.Management.Smo.RelocateFile($dbFile.SourceName, ("{0}\{1}" -f $MSSQLDataPath, $dbFile.FileName))
}
Restore-SqlDatabase -Verbose -ServerInstance $env:COMPUTERNAME -Database $dbName -BackupFile $BackupFile -RelocateFile $RelocateFile -ReplaceDatabase
