use AdventureWorks2016

select * from Person.Person 
CREATE VIEW vw_persona
AS
SELECT firstName, LastName
from Person.Person

SELECT * from vw_persona

CREATE VIEW vw_persona2
as 
SELECT FirstName, LastName
from Person.Person
where LastName like 'adams'
 
 SELECT * from vw_persona2

create VIEW vw_persona3
AS
SELECT
  concat(FirstName,', ',LastName) as Datos
from Person.Person
WHERE LastName Like 'adams'

select * from vw_persona3
