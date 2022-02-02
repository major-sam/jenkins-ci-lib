$BakQuery = @'
BACKUP DATABASE [BaltBetM] 
  TO  DISK = N'\\server\tcbuild$\Testers\DB\_jenkins\\BaltbetM.bak'
  WITH NOFORMAT, INIT,
  NAME = N'BaltBetM-jenkins job backup',
  SKIP, NOREWIND, NOUNLOAD,  STATS = 10
GO
BACKUP DATABASE [BaltBetWeb] 
  TO  DISK = N'\\server\tcbuild$\Testers\DB\_jenkins\\BaltbetWeb.bak'
  WITH NOFORMAT, INIT,
  NAME = N'BaltBetWeb-jenkins job backup',
  SKIP, NOREWIND, NOUNLOAD,  STATS = 10
GO
'@
Invoke-Sqlcmd -Verbose -ServerInstance $env:COMPUTERNAME -Query $BakQuery
