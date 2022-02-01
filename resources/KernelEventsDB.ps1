[System.Reflection.Assembly]::LoadWithPartialName("Microsoft.SqlServer.SMO") | Out-Null
$MSSQLDataPath =  (Invoke-Sqlcmd -query "select SERVERPROPERTY('InstanceDefaultDataPath') as 'd'").d
write-output "mssql data:" $MSSQLDataPath
$RelocateFile = @() 
$BackupFile = "\\server\tcbuild$\Testers\DB\BaltBetMEvents.bak"
$dbRelocateFiles = @(
	@{
		SourceName = "BaltBetM"
		FileName = "BaltBetM_events.mdf"
	}
	@{
		SourceName = "CoefFileGroup"
		FileName = "CoefFileGroup_events.mdf"
	}
	@{
		SourceName = "BaltBet"
		FileName = "BaltBet_events.ldf"
	}
)
$dbname ="BaltBetM_events"
foreach ($dbFile in $dbRelocateFiles) {
	$RelocateFile += New-Object Microsoft.SqlServer.Management.Smo.RelocateFile($dbFile.SourceName, ("{0}\{1}" -f $MSSQLDataPath, $dbFile.FileName))
}
Restore-SqlDatabase -Verbose -ServerInstance $env:COMPUTERNAME -Database $dbName -BackupFile $BackupFile -RelocateFile $RelocateFile -ReplaceDatabase
