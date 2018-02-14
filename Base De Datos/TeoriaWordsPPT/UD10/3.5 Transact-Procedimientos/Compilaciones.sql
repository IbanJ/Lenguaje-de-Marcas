/***************************************************
	GO

	CREATE PROC dbo.CogerEmpleadosPais
		@country NVARCHAR(30)
	WITH RECOMPILE
	AS
		SELECT    employeeid,lastname,firstname
		FROM    Employees
		WHERE    country = @country


--   2.- Usar la opci�n WITH RECOMPILE al ejecutar el procedimiento almacenado.
--       De esta forma, SQL Server genera un nuevo plan de ejecuci�n con la primera
--       llamada y ser� usado por las siguientes llamadas.
	USE Northwind
	GO
	EXEC CogerEmpleadosPais 'USA' WITH RECOMPILE
	GO

--   3.- Usar el procedimiento almacenado de sistema sp_recompile.
--       Puede recibir como argumento:
--			- Un procedimiento almacenado.
--			- Una tabla.
--			- Una vista.
--			- O un trigger.
--		 Si le damos como argumento un procedimiento almacenado o un disparador, el objeto
--		 se recompilar� en la pr�xima ejecuci�n.
--		 Si le damos como argumento una tabla o una vista, todos los procedimientos
--		 que hagan referencia a la tabla o a la vista se recompilar�n en la pr�xima
--		 ejecuci�n. Este es el mejor m�todo para recompilar todos los procedimientos 
--		 que hagan referencia a una tabla o vista particular.

	GO
	sp_recompile 'Employees'
	GO
