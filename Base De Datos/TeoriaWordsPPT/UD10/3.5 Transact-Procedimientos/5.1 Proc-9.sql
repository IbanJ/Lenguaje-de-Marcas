/***************************************************
GO

CREATE PROC dbo.cogerapellidoempleado_default
     @empapellido VARCHAR(40) = 'a'
AS
	SELECT *
	FROM Employees
	WHERE lastname LIKE '%' + @empapellido + '%'
GO
