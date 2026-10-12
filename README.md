# SportsNET

A group project: an online sports-store built with ASP.NET Web Forms and a WCF service backed by SQL Server.

## Structure

- `SportsNET_WebApplication/` – ASP.NET Web Forms front end (customer shop, cart, checkout, admin pages, reports)
- `Sportsnet_Service/` – WCF service (`Service1.svc`) with LINQ to SQL data layer
- `Group_Database.sql` – database creation and seed script
- `AlterCart.sql`, `Sportsnet_Service/AddTempUser.sql` – schema updates

## Getting started

1. Install Visual Studio with the ASP.NET workload (.NET Framework 4.7.2) and SQL Server LocalDB.
2. Run `Group_Database.sql` to create the `DBSportsNET` database, then `AlterCart.sql` and `AddTempUser.sql`.
3. Open `Sportsnet_Service/Sportsnet_Service.sln` and `SportsNET_WebApplication` in Visual Studio, restore NuGet packages, and run the service first, then the web app.
4. Update the connection string in `Sportsnet_Service/Web.config` if you are not using LocalDB.

## Authors
- RC Rikhotso
- N Mosima
- M Mokoena
- MC Ramaliba


