/***************************************************
GO

-- Funci�n ClientesDelPais
PRINT CHAR(10) 
	+ 'Uso de ClientesDelPais(''Mexico'')' 
	+ CHAR(10)
SELECT CustomerID, CompanyName, City
FROM dbo.ClientesDelPais('Mexico')

-- Funci�n ClientesDeUsa
PRINT CHAR(10) + 'Uso de ClientesDeUsa()' + CHAR(10)
SELECT CustomerID, CompanyName, City
FROM dbo.ClientesDeUsa()

-- Funci�n ClientesDelPais con el operador IN
PRINT CHAR(10)
	+ 'Uso ClientesDelPais(''Mexico'') con el operador IN'
	+ CHAR(10)
SELECT OrderID
	, CONVERT(varchar(10), OrderDate, 120) AS FechaDePedido
FROM Orders
WHERE CustomerID IN
	(
	SELECT CustomerID
	FROM dbo.ClientesDelPais('Mexico')
	)

-- Funci�n PedidosPorImporte
PRINT CHAR(10)
	+ 'Combinaci�n de PedidosPorImporte con Customers'
	+ CHAR(10)
SELECT CompanyName
	, OrderID
	, ImporteTotal
	, CONVERT(varchar(10), OrderDate, 120) AS FechaDePedido
FROM dbo.PedidosPorImporte(10000) AS OBV
	JOIN Customers C
		ON OBV.CustomerID = C.CustomerID

-- Funci�n DiezPedidosMasImportantes
PRINT CHAR(10)
	+ 'Combinaci�n de los 10 mejores pedidos con la tabla Customers'
	+ CHAR(10)
SELECT CompanyName
	, OrderID
	, ImporteTotal
	, CONVERT(varchar(10), OrderDate, 120) AS FechaDePedido
FROM dbo.DiezPedidosMasImportantes() AS OBV
JOIN Customers C
	ON OBV.CustomerID = C.CustomerID