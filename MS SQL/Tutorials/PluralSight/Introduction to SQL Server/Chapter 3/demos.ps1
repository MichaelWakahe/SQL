# This script should be run as administrator when using the "choco install" commands.

# Installing Tools
# https://github.com/microsoft/go-sqlcmd
#choco install sqlcmd -y
# https://learn.microsoft.com/en-us/sql/ssms/download-sql-server-management-studio-ssms
#choco install sql-server-management-studio -y
# https://learn.microsoft.com/en-us/sql/azure-data-studio/download-azure-data-studio
#choco install azure-data-studio -y

# SQLCMD
# We could spin up a SQL Container using this (requires a container runtime):
# sqlcmd create mssql --using https://aka.ms/AdventureWorksLT.bak
#sqlcmd -Q "SELECT @@version"
#sqlcmd -S localhost -Q "SELECT @@version"

# Import the AdventureWorks sample database
# https://github.com/microsoft/sql-server-samples/releases/tag/adventureworks
Invoke-WebRequest -o C:\temp\AdventureWorks2022.bak https://github.com/Microsoft/sql-server-samples/releases/download/adventureworks/AdventureWorks2022.bak
$RestoreCMD = "RESTORE DATABASE AdventureWorks2022 FROM  DISK = N'C:\temp\AdventureWorks2022.bak' " `
            + " WITH MOVE 'AdventureWorks2022' TO 'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\AdventureWorks2022.mdf', " `
            + " MOVE 'AdventureWorks2022_Log' TO 'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\AdventureWorks2022_Log.ldf'"
sqlcmd -Q $RestoreCMD

# ADS
#Start-process "C:\Program Files\Azure Data Studio\azuredatastudio.exe"

# SSMS
#Start-Process "C:\Program Files (x86)\Microsoft SQL Server Management Studio 19\Common7\IDE\Ssms.exe"