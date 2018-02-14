/***************************************************

USE Northwind
GO

SET NOCOUNT ON
GO


/******************************************************************************
 1. SUBCONSULTA MATRICIAL COMO TABLA DERIVADA
	Recuperamos el nombre del producto y de la categor�a de aquellos productos
	cuya categor�a est� entre 1 y 5 y cuyo nombre empieza por 'M'
******************************************************************************/
SELECT CategoryName, ProductName
FROM Products P
	JOIN (
			SELECT CategoryID, CategoryName
			FROM Categories
			WHERE CategoryID BETWEEN 1 AND 5
		) AS C
		ON C.CategoryID = P.CategoryID
WHERE ProductName LIKE 'M%'



/******************************************************************************
 2. SUBCONSULTA MATRICIAL UTILIZANDO EL OPERADOR UNION
	Mostramos si tenemos registradas ventas de bebidas
******************************************************************************/
SELECT 'Hemos vendido bebidas'
AS [Ventas de bebidas]
WHERE EXISTS(
		SELECT *
		FROM [Order details] O
			JOIN Products P
				ON O.ProductID = P.ProductID
		WHERE P.CategoryID = 1
	)

UNION

SELECT 'No hemos vendido bebidas'
WHERE NOT EXISTS(
		SELECT *
		FROM [Order details] O
			JOIN Products P
				ON O.ProductID = P.ProductID
		WHERE P.CategoryID = 1
	)