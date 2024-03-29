USE [master]
GO
CREATE LOGIN [Visitor] WITH PASSWORD=N'Visitor' MUST_CHANGE, DEFAULT_DATABASE=[master], CHECK_EXPIRATION=ON, CHECK_POLICY=ON
GO
USE [HomeShareDB]
GO
CREATE USER [Visitor] FOR LOGIN [Visitor]
GO
ALTER ROLE [db_datareader] ADD MEMBER [Visitor]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [Visitor]
GO
USE [master]
GO
CREATE LOGIN [Administrator] WITH PASSWORD=N'Administrator' MUST_CHANGE, DEFAULT_DATABASE=[master], CHECK_EXPIRATION=ON, CHECK_POLICY=ON
GO
USE [HomeShareDB]
GO
CREATE USER [Administrator] FOR LOGIN [Administrator]
GO
USE [HomeShareDB]
GO
ALTER ROLE [db_owner] ADD MEMBER [Administrator]
GO
