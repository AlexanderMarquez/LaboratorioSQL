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
