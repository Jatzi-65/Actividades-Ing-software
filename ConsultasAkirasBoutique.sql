USE [AkirasBoutiques];
GO

ALTER TABLE dbo.cliente ALTER COLUMN nombre varchar(100) NOT NULL;
ALTER TABLE dbo.cliente ALTER COLUMN apellido varchar(100) NOT NULL;
ALTER TABLE dbo.cliente ALTER COLUMN direccion varchar(200) NOT NULL;
ALTER TABLE dbo.cliente ALTER COLUMN email varchar(100) NOT NULL;

ALTER TABLE dbo.categoria ALTER COLUMN nombre varchar(100) NOT NULL;
ALTER TABLE dbo.categoria ALTER COLUMN descripcion varchar(MAX) NOT NULL;

ALTER TABLE dbo.producto ALTER COLUMN nombre varchar(100) NOT NULL;
GO


SELECT DISTINCT 
    C.id_cliente, 
    C.nombre, 
    C.apellido, 
    C.email, 
    C.telefono
FROM dbo.cliente C
INNER JOIN dbo.factura F ON C.id_cliente = F.id_cliente
WHERE YEAR(F.fecha) = 2021;
GO

SELECT DISTINCT 
    C.id_cliente, 
    C.nombre, 
    C.apellido, 
    C.email, 
    C.telefono
FROM dbo.cliente C
INNER JOIN dbo.factura F ON C.id_cliente = F.id_cliente
WHERE YEAR(F.fecha) = 2022;
GO

SELECT DISTINCT 
    C.id_cliente, 
    C.nombre, 
    C.apellido, 
    C.email, 
    F.fecha AS FechaCompra
FROM dbo.cliente C
INNER JOIN dbo.factura F ON C.id_cliente = F.id_cliente
WHERE YEAR(F.fecha) = 2021 AND MONTH(F.fecha) = 12;
GO

SELECT 
    C.nombre + ' ' + C.apellido AS Cliente,
    F.id_factura,
    F.fecha AS FechaCompra,
    P.nombre AS Producto,
    D.cantidad AS CantidadComprada,
    D.precio AS PrecioTotalDetalle
FROM dbo.cliente C
INNER JOIN dbo.factura F ON C.id_cliente = F.id_cliente
INNER JOIN dbo.detalle D ON F.id_detalle = D.id_detalle
INNER JOIN dbo.producto P ON D.id_producto = P.id_producto
WHERE (C.nombre LIKE '%Valentina Anastasia%' AND C.apellido LIKE '%Huerta Corral%')
   OR (C.nombre LIKE '%Zayra Manuela%' AND C.apellido LIKE '%Gómez López%')
   OR (C.nombre LIKE '%Dante Eduardo%' AND C.apellido LIKE '%Dolores Meza%')
   OR (C.nombre LIKE '%Ana Maribel%' AND C.apellido LIKE '%Cedillo Núñez%')
   OR (C.nombre LIKE '%Rodrigo Ismael%' AND C.apellido LIKE '%Silva Ugarte%')
ORDER BY C.nombre;
GO

SELECT TOP 1 
    P.id_producto, 
    P.nombre AS Producto, 
    SUM(D.cantidad) AS TotalUnidadesVendidas
FROM dbo.producto P
INNER JOIN dbo.detalle D ON P.id_producto = D.id_producto
GROUP BY P.id_producto, P.nombre
ORDER BY TotalUnidadesVendidas DESC;
GO

SELECT TOP 1 
    id_producto, 
    nombre AS Producto, 
    stock AS CantidadEnStock
FROM dbo.producto
ORDER BY stock DESC;
GO

SELECT 
    F.id_factura,
    F.fecha AS FechaFactura,
    C.nombre + ' ' + C.apellido AS Cliente,
    P.nombre AS Producto,
    D.cantidad,
    D.precio
FROM dbo.factura F
INNER JOIN dbo.cliente C ON F.id_cliente = C.id_cliente
INNER JOIN dbo.detalle D ON F.id_detalle = D.id_detalle
INNER JOIN dbo.producto P ON D.id_producto = P.id_producto
ORDER BY F.fecha ASC;
GO

SELECT 
    id_cliente, 
    nombre, 
    apellido, 
    email, 
    telefono
FROM dbo.cliente
ORDER BY nombre ASC, apellido ASC;
GO

SELECT 
    Cat.nombre AS Categoria,
    P.id_producto,
    P.nombre AS Producto,
    P.precio,
    P.stock
FROM dbo.producto P
INNER JOIN dbo.categoria Cat ON P.id_categoria = Cat.id_categoria
WHERE Cat.nombre IN ('Falda', 'Pantalón', 'Chamarra', 'Zapato', 'Accesorios')
ORDER BY Cat.nombre, P.nombre;
GO

SELECT 
    S.id_sucursal,
    S.nombre AS Sucursal,
    S.ciudad,
    E.nombre + ' ' + E.apellido AS Encargado,
    E.email AS EmailEncargado,
    E.telefono AS TelefonoEncargado
FROM dbo.sucursal S
INNER JOIN dbo.empleado E ON S.id_encargado = E.id_empleado;
GO

SELECT 
    E.id_empleado,
    E.nombre + ' ' + E.apellido AS Empleado,
    E.edad,
    E.email,
    E.telefono,
    S.nombre AS Sucursal
FROM dbo.empleado E
INNER JOIN dbo.sucursal S ON E.id_sucursal = S.id_sucursal
WHERE S.nombre LIKE '%Constitución%';
GO

SELECT 
    id_cliente,
    nombre,
    apellido,
    fec_nac AS FechaNacimiento,
    DATEDIFF(YEAR, fec_nac, GETDATE()) - 
        CASE WHEN DATEADD(YEAR, DATEDIFF(YEAR, fec_nac, GETDATE()), fec_nac) > GETDATE() THEN 1 ELSE 0 END AS Edad
FROM dbo.cliente
WHERE (DATEDIFF(YEAR, fec_nac, GETDATE()) - 
        CASE WHEN DATEADD(YEAR, DATEDIFF(YEAR, fec_nac, GETDATE()), fec_nac) > GETDATE() THEN 1 ELSE 0 END) > 30
ORDER BY Edad DESC;
GO