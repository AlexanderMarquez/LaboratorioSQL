SELECT * FROM Libro


SELECT Libro.tituloLibro,Autor.apeAutor,Autor.nomAutor
FROM Libro
INNER JOIN Autor
ON Libro.Autor_idAutor = Autor.idAutor 
GO

/* En vista listar la cantidad de libros por genero */
 SELECT Genero.nomGenero AS Genero , COUNT(Libro.Genero_idGenero) AS total
 FROM Libro
 INNER JOIN Genero
 ON Libro.Genero_idGenero = Genero.idGenero
 GROUP BY Genero.nomGenero
 GO

SELECT Libro.Pais_idPais as libros , COUNT(Libro.cantLibro) AS total
FROM Libro
INNER JOIN Genero
ON Libro.Genero_idGenero = Genero.idGenero
GROUP BY Genero.nomGenero
GO

SELECT  * FROM Bibliotecario

SELECT Prestamos.fecsalPrestamo, 
CONCAT(Bibliotecario.apeBibliotecario, ',' , Bibliotecario.nomBibliotecario) AS 'Bibliotecario', Cliente.idCliente
FROM Prestamos
INNER JOIN Bibliotecario
ON Prestamos.Bibliotecario_idBibliotecario = Bibliotecario.idBibliotecario
INNER JOIN Detalle_Prestamo
ON Prestamos.idPrestamo = Detalle_Prestamo.idDetPrest
INNER JOIN Libro
ON Detalle_Prestamo.Libro_idLibro = Libro.idLibro
INNER JOIN Cliente
ON Prestamos.Cliente_idCliente = Cliente.idCliente


SELECT Prestamos.fecsalPrestamo, Bibliotecario.nomBibliotecario, Libro.tituloLibro , Cliente.nomCliente
FROM Prestamos
INNER JOIN Bibliotecario
ON Prestamos.Bibliotecario_idBibliotecario = Bibliotecario.idBibliotecario
INNER JOIN Detalle_Prestamo
ON Prestamos.idPrestamo = Detalle_Prestamo.Prestamos_idPrestamo
INNER JOIN Libro
ON Detalle_Prestamo.Libro_idLibro = Libro.idLibro
INNER JOIN Cliente
ON Prestamos.Cliente_idCliente = Cliente.idCliente