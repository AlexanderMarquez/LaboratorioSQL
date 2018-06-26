use dbLibrary
GO

/* visualizar las tablas de la base de datos activa */
EXEC sp_tables
GO

/* crear un Store procedure que permita listar los registros de la tabla genero*/
CREATE PROCEDURE sp_listGen
    AS
        BEGIN
        SELECT * FROM Genero
    END
GO

/* ejecutar store procedure de listado de genero*/
EXEC sp_listGen
GO

/*CREAR UN SP QUE PERMITA LISTAR LOS REGISTROS DE LA TABLA CLIENTE*/
CREATE PROCEDURE sp_cliente
    AS
        BEGIN
        SELECT * FROM Cliente
    END
GO


/* ejecutar store procedure de listado de cliente*/
EXEC sp_cliente
GO

/* Crear un sp que permita listar los clientes ordenados por la columna sexo de forma ascendente */
CREATE PROCEDURE sp_listclientesexo
    AS
        BEGIN
            SELECT * FROM Cliente
            ORDER BY Cliente.sexoCliente ASC
        END
GO

/* ejecutar store procedure de listado de ClienteSexo*/
EXEC sp_listclientesexo
GO


/*Modificar el sp anterior de tal forma que permita mostrar el listado de clientes de acuerdo a la letra del sexo
modificado*/
ALTER PROCEDURE sp_listclientesexo
    @sexo VARCHAR(1)
AS
        BEGIN
            SELECT Cliente * FROM Cliente
            ORDER BY Cliente.sexoCliente ASC
        END
GO

/*Agregar el genero  comediA */
EXEC sp_AddGen @cogigo = 5 , @nombre = 'comedia'

/* Verificamos que se haya agregado el registro*/ 
select * FROM Genero
GO

/*Agregar los generos infantil , obra literaria y drama*/
EXEC sp_AddGen @codigo = 6 , @nombre = 'infantil'
EXEC sp_AddGen @codigo = 7 , @nombre = 'Obra literaria'
EXEC sp_AddGen @codigo = 8 , @nombre = 'drama'
GO

/*Eñlaborar un sp que permita validar el codigo de genero antes de ingresar un registro*/
CREATE PROCEDURE sp_ValidadReg
    @codigo VARCHAR (4),
    @nombre VARCHAR (MAX)
AS
    BEGIN
        IF(SELECT Genero.idGenero FROM genero WHERE Genero.idGenero = @codigo) IS NOT NULL
            SELECT 'No puedo ingresar el registro por que el codigo ya existe wey!' AS 'Resultado'
        INSERT INTO Genero
            (idGenero, nomGenero)
        VALUES
            (@codigo, @nombre);
        SELECT * FROM Genero ORDER BY idGenero
    END
GO

SELECT Genero.idGenero FROM Genero
SELECT * FROM Genero
/*Validar el ingreso de genero con el codigo 2*/
EXEC sp_ValidadReg @codigo = 2, @nombre = 'series'
EXEC sp_ValidadReg @codigo = 9, @nombre = 'series'
GO