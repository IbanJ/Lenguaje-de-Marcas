/***************************************************
GO

CREATE PROC dbo.coger_empleado
   @empleadoid INT
AS
BEGIN
	IF NOT EXISTS (SELECT * FROM Employees WHERE employeeid = @empleadoid)
		RETURN -1
	ELSE
		SELECT * FROM Employees WHERE employeeid = @empleadoid

	RETURN
END

/***************************************************
EXEC @existe_empleado = coger_empleado 5
SELECT @existe_empleado
GO