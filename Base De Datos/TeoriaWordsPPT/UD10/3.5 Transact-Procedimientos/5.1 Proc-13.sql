/***************************************************
GO

-- Creamos el procedimiento
CREATE PROC dbo.CogerDireccionEmpleado
	@empleadoid INT,
	@empleadodireccion NVARCHAR(120) OUTPUT
AS
BEGIN
	SELECT @empleadodireccion = address + '. ' + city + '. ' + region + '. ' + 
		   postalcode + '. ' + country
	FROM Employees
	WHERE employeeid = @empleadoid
END

-- C�digo de prueba
DECLARE @direccion VARCHAR(120)
EXEC CogerDireccionEmpleado 3, @direccion
PRINT @direccion