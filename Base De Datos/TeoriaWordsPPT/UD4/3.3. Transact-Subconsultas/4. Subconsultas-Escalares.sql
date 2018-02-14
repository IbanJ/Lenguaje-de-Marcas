/***************************************************

USE Northwind
GO

SET NOCOUNT ON
GO
-- En este ejemplo combinamos los valores devueltos por dos subconsultas
-- para obtener el precio medio
SELECT (
		(
			SELECT MIN(Unitprice)
			FROM Products
		) +
		(
			SELECT MAX(Unitprice)
			FROM Products
		)
	)/2 as NuevoPrecio


-- Esta consulta no es pr�ctica, pero muestra otras opciones 
-- posibles en el dise�o de las subconsultas
SELECT 1, 2
	, (
		SELECT 3
	)
GO


-- Esta consulta usa dos subconsultas para recuperar una sola fila 
-- con los precios unitarios promedio y m�ximo
SELECT (
		SELECT AVG(Unitprice)
		FROM Products
	) as PrecioMedio
	, (
		SELECT MAX(Unitprice)
		FROM Products
	) as PrecioMaximo
GO


-- Compara el precio unitario de cada producto
-- con el precio medio, producido por una subconsulta
SELECT ProductName, UnitPrice
	, (
		SELECT AVG(Unitprice)
		FROM Products
	) as PrecioMedio
FROM Products
WHERE CategoryID = 2
GO

-- Compara el precio unitario de cada producto
-- con el precio medio, producido por una subconsulta
SELECT ProductName, UnitPrice
	, (
		SELECT AVG(Unitprice)
		FROM Products
	) as PrecioMedio,
	unitprice-(select avg(unitprice)
	             FROM Products) as diferencia
FROM Products
WHERE CategoryID = 2
GO


-- Actualiza el precio unitario del producto 11 con un valor  
-- un 20% m�s alto que el precio unitario m�ximo.
UPDATE Products
SET UnitPrice = (
		SELECT MAX(Unitprice)
		FROM Northwind..Products
	) * 1.2
WHERE ProductID = 11



-- Muestra el producto con el precio unitario m�ximo
SELECT ProductName, UnitPrice
FROM Products P
WHERE Unitprice = (
		SELECT Max(UnitPrice) MPrice
		FROM Products
	)


-- Recuperamos las Categor�as cuyo precio medio sea mayor
-- que el precio medio general
SELECT CategoryID, AVG(UnitPrice) AS 'Precio Medio'
FROM Products P
GROUP BY CategoryID
HAVING AVG(UnitPrice) > (
		SELECT AVG(UnitPrice) MPrice
		FROM Products
	)