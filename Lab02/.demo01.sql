use AdventureWorks2016;

select ModifiedDate, City from Person.Address
WHERE YEAR (ModifiedDate)= '2014' and 
MONTH(ModifiedDate)= '01' AND
City = 'Beaverton'

select * from person.Address where AddressLine2  like 'B%'
select * from person.Person where LastName = 'miller' not = 'title'

select * from HumanResources.Employee where not gender = 'f';

select * FROM HumanResources.Employee where not gender = 'M';

select BusinessEntityID,firstName, LastName from Person.Person where  FirstName in ('Michael')
GO

select  * from HumanResources.Employee where BusinessEntityID >= '10' and BusinessEntityID <= '40'
go

select BusinessEntityID, JobTitle from HumanResources.Employee where BusinessEntityID >='10'
and BusinessEntityID <= '40' or JobTitle like 'v%'
go