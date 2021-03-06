-- Creamos una cuenta de inicio de sesión
USE [master]
GO
CREATE LOGIN [jokin] WITH PASSWORD=N'jokin', DEFAULT_DATABASE=[AdventureWorks], 
CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF

GO
EXEC master..sp_addsrvrolemember @loginame = N'jokin', @rolename = N'dbcreator'
GO

-- Creamos un usuario en la base de datos Adventureworks
-- que está asociado a la cuenta de inicio de sesión jokin
USE [AdventureWorks]
GO
CREATE USER [jokin] FOR LOGIN [jokin]
GO
USE [AdventureWorks]
GO
EXEC sp_addrolemember N'db_datareader', N'jokin'
GO
