# README

docker run -e "ACCEPT_EULA=Y" -e "SA_PASSWORD=MyPassword#1" \
   -p 1433:1433 --name sql1 -h sql1 \
   mcr.microsoft.com/mssql/server:2019-latest
   
   
sqlcmd -S localhost -U SA -P "MyPassword#1"