-- EJERCICIO 2 DE SELECT's
-- Northwind

/*
   Recuperar de la tabla Products,
   el nombre, el precio unitario y el 
   precio unitario incrementado en un 10%
   de los productos cuyo nombre comience
   por los caracteres "QU"
*/
SELECT ProductName,UnitPrice, UnitPrice * 1.1
FROM Products
WHERE ProductName LIKE 'QU%'
/*
   Recuperar los datos del pedido con c�digo 10250.
   Visualizar el c�digo del producto, su precio,
   la cantidad y el importe sin aplicar el descuento
*/
SELECT
FROM CUSTOMERS
WHERE



/*
   Recuperar los datos del pedido con c�digo 10250.
   Visualizar el c�digo del producto, su precio,
   la cantidad y el importe APLICANDO el descuento
*/

