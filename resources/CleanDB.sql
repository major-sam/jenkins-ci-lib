EXEC sp_MSforeachdb
  'IF DB_ID(''?'') > 4
  BEGIN
    print ''remove db ?''
    EXEC (''ALTER DATABASE [?] SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE [?];
    '' )
  END'
