/* Poner en uso la Base de Datos */
USE AdventureWorks2016
GO

/* Listado de Esquemas Pertenecientes a esta Base de Datos */
SELECT Name
FROM sys.schemas
GO

/* Ver tablas de base de datos en uso*/
SELECT name
FROM sys.tables
GO

/* Ver estructura de una tabla especifica */
EXEC sp_help 'HumanResources.Employee'
GO

/* Ver listado de departamnetos de la empresa */
SELECT *
FROM HumanResources.Department
GO

/* Visualizar solo los departamentos que pertenecen al grupo Sales and Marketing */
SELECT *
FROM HumanResources.Department
WHERE GroupName like 'Sales and Marketing'
GO

/* Ver listado de todos los empleados cuyo estado civil es casado */
SELECT BusinessEntityID as 'Codigo de Empleado',
    HumanResources.Employee.MaritalStatus as 'Estado Civil'
FROM HumanResources.Employee
WHERE MaritalStatus like 'M'
GO

/* Ver listado el código de las órdenes de ventas y sus respectivo mes del año 2013 */
SELECT SalesOrderID as 'Código de Orden ' ,
    DATENAME (MONTH, OrderDate) as 'Mes',
    YEAR(OrderDate) as 'Año'
FROM Sales.SalesOrderHeader
WHERE YEAR(OrderDate) like '2013'
GO

/* Visualizar la cantidad de órdenes de venta del año 2013 */
SELECT YEAR (Sales.SalesOrderHeader.OrderDate) as 'Año',
    COUNT(Sales.SalesOrderHeader.SalesOrderID) as 'Cantidad'
FROM Sales.SalesOrderHeader
WHERE YEAR(OrderDate) = 2011
GROUP BY YEAR(Sales.SalesOrderHeader.OrderDate)
GO

/* Visualizar la cantidad de ventas por mes del año 2011 */
SELECT YEAR(Sales.SalesOrderHeader.OrderDate) as 'Año',
    DATENAME(MONTH, Sales.SalesOrderHeader.OrderDate) as 'Mes',
    COUNT(Sales.SalesOrderHeader.SalesOrderID) as 'Cantidad'
FROM Sales.SalesOrderHeader
WHERE YEAR(OrderDate) = 2011
GROUP BY YEAR(Sales.SalesOrderHeader.OrderDate),
DATENAME(MONTH, Sales.SalesOrderHeader.OrderDate)

/* Cantidad de empleados por Cargo de mayor a menor */
SELECT COUNT(HumanResources.Employee.BusinessEntityID) AS 'Total',
    HumanResources.Employee.JobTitle AS 'Cargo'
FROM HumanResources.Employee
GROUP BY HumanResources.Employee.JobTitle
ORDER BY COUNT(HumanResources.Employee.BusinessEntityID) DESC

/* Listado de Empleado nombre, apellidos y departamento */
SELECT Person.FirstName as Nombre, Person.LastName as Apellido, HumanResources.Department.Name as Departamento
FROM HumanResources.EmployeeDepartmentHistory
    INNER JOIN Person.Person
    ON EmployeeDepartmentHistory.BusinessEntityID = Person.BusinessEntityID
    INNER JOIN HumanResources.Department
    ON HumanResources.EmployeeDepartmentHistory.DepartmentID = HumanResources.Department.DepartmentID

/* Muestrame la cantidad de empleados por departamento */
SELECT COUNT(HumanResources.EmployeeDepartmentHistory.BusinessEntityID) as 'Total',
    HumanResources.Department.Name AS Departamento
FROM HumanResources.EmployeeDepartmentHistory
    INNER JOIN Person.Person
    ON HumanResources.EmployeeDepartmentHistory.BusinessEntityID = Person.BusinessEntityID
    INNER JOIN HumanResources.Department
    ON HumanResources.EmployeeDepartmentHistory.DepartmentID = HumanResources.Department.DepartmentID
GROUP BY HumanResources.Department.Name

/* Muestrame la cantidad de empleados por estado civil en cada departamento */
SELECT HumanResources.Department.Name as 'Departamento',
    HumanResources.Employee.MaritalStatus as 'Estado Civil',
    COUNT(HumanResources.Employee.BusinessEntityID) as 'Cantidad'
FROM HumanResources.Employee
    INNER JOIN HumanResources.EmployeeDepartmentHistory
    ON HumanResources.Employee.BusinessEntityID = HumanResources.EmployeeDepartmentHistory.BusinessEntityID
    INNER JOIN HumanResources.Department
    ON HumanResources.EmployeeDepartmentHistory.DepartmentID = HumanResources.Department.DepartmentID
GROUP BY HumanResources.Employee.MaritalStatus, HumanResources.EmployeeDepartmentHistory.DepartmentID, HumanResources.Department.Name

/* Muestrame el nombre, apellido, departamento, estado civil del empleado */

SELECT Person.FirstName as Nombre, Person.LastName as Apellido,
    HumanResources.Department.Name as Departamento, HumanResources.Employee.MaritalStatus as 'Estado Civil'
FROM HumanResources.EmployeeDepartmentHistory
    INNER JOIN Person.Person
    ON EmployeeDepartmentHistory.BusinessEntityID = Person.BusinessEntityID
    INNER JOIN HumanResources.Department
    ON HumanResources.EmployeeDepartmentHistory.DepartmentID = HumanResources.Department.DepartmentID
    INNER JOIN HumanResources.Employee
    ON HumanResources.EmployeeDepartmentHistory.BusinessEntityID = HumanResources.Employee.BusinessEntityID
GO

/* Muestrame el listado de clientes que hicieron su orden de compra en los meses de noviembre y diciembre del año 2012 */
SELECT Sales.SalesOrderHeader.OrderDate, YEAR(OrderDate) AS 'Año' ,
    MONTH (OrderDate) AS 'Mes'
FROM sales.SalesOrderHeader
WHERE Year(OrderDate) = 2012 AND (MONTH(OrderDate)BETWEEN 11 AND 12)

SELECT *
From Sales.SalesOrderHeader
SELECT *
FROM Sales.Customer
WHERE CustomerID = 29825
SELECT *
FROM Person.Person
WHERE Person.BusinessEntityID = 3412


/* Muestrame la cantidad de ordenes de pedido atendidos por cada medio de envio */
SELECT Purchasing.ShipMethod.Name AS 'Medio de envio',
COUNT(Purchasing.ShipMethod.Name) AS 'Cantidad'
FROM Sales.SalesOrderHeader
INNER JOIN Purchasing.ShipMethodID
ON Sales.SalesOrderHeader.ShipMethodID = Purchasing.ShipMethod.ShipMethodID
GROUP BY Purchasing.ShipMethod.Name


SELECT * FROM Purchasing.ShipMethod

/* Mostrar la cantidad de ventas realizadas de acuerdo a el pais */
SELECT Sales.SalesTerritory.CountryRegionCode AS 'Pais',
COUNT (Sales.SalesOrderHeader.TerritoryID) AS 'Total'
FROM Sales.SalesOrderHeader
INNER JOIN Sales.SalesTerritory
ON Sales.SalesOrderHeader.TerritoryID = Sales.SalesTerritory.TerritoryID
GROUP BY Sales.SalesTerritory.CountryRegionCode
ORDER BY Sales.SalesTerritory.CountryRegionCode