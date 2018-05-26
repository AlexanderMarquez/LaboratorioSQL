CREATE DATABASE HospitalHHH;
GO
/*Necesito vizualizar el listado de base de datos*/
SELECT database_id, name 
FROM sys.databases
GO

USE HospitalHHH;
GO

/* vER LISTADO DE TABLAS DE UNA BASE DE DATOS*/
USE AdventureVG_copy
SELECT name FROM sys.tables;

USE AdventureVG_copy
SELECT name FROM sys.views;
GO

/* visualizar la informacion detallada de una base de datos */
EXEC sp_helpdb AdventureVG_copy;

/* Utilizando snippets */
-- Create a new database called 'ColegioMG'
-- Connect to the 'master' database to run this snippet
USE master
GO
-- Create the new database if it does not exist already
IF NOT EXISTS (
    SELECT name
        FROM sys.databases
        WHERE name = N'ColegioMG'
)
CREATE DATABASE ColegioMG
GO

/* Eliminar una BD*/
DROP DATABASE HospitalHHH;
GO

/* Eliminar base de datos Adventure Works*/
DROP DATABASE AdventureVG_copy;
GO