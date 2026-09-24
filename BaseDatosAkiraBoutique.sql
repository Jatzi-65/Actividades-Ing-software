USE [AkirasBoutiques];
GO


IF OBJECT_ID('dbo.sucursal', 'U') IS NOT NULL 
    DROP TABLE dbo.sucursal;
GO

CREATE TABLE [dbo].[sucursal](
    [id_sucursal] [int] NOT NULL,
    [nombre] [varchar](100) NOT NULL,
    [direccion] [varchar](200) NOT NULL,
    [telefono] [varchar](20) NOT NULL,
    [ciudad] [varchar](100) NOT NULL,
    [estado] [varchar](100) NOT NULL,
    [id_encargado] [int] NULL, 
    CONSTRAINT [PK_sucursal] PRIMARY KEY CLUSTERED ([id_sucursal] ASC)
);
GO


IF OBJECT_ID('dbo.empleado', 'U') IS NOT NULL 
    DROP TABLE dbo.empleado;
GO

CREATE TABLE [dbo].[empleado](
    [id_empleado] [int] NOT NULL,
    [nombre] [varchar](100) NOT NULL,
    [apellido] [varchar](100) NOT NULL,
    [direccion] [varchar](200) NOT NULL,
    [telefono] [varchar](20) NOT NULL,
    [edad] [int] NOT NULL,
    [id_sucursal] [int] NOT NULL,
    [email] [varchar](100) NOT NULL,
    [contrasena] [varchar](100) NOT NULL,
    CONSTRAINT [PK_empleado] PRIMARY KEY CLUSTERED ([id_empleado] ASC)
);
GO



INSERT INTO [dbo].[sucursal] ([id_sucursal], [nombre], [direccion], [telefono], [ciudad], [estado], [id_encargado]) 
VALUES 
(1, 'Akira’s Boutique: Las Mercedes', 'Calle Roble #507 Fracc. Las Mercedes', '4447831225', 'San Luis Potosí', 'San Luis Potosí', NULL),
(2, 'Akira’s Boutique: Obraje', 'Calle Dr. Jesús Díaz de León #438 col. Obraje', '4493780921', 'Aguascalientes', 'Aguascalientes', NULL),
(3, 'Akira’s Boutique: Galerías Mazatlán', 'Av. de la Marina #6204, Marina, local 35', '6692932059', 'Mazatlán', 'Sinaloa', NULL),
(4, 'Akira’s Boutique: Zapopan', 'Av. Manuel J. Clouthier 525 col. Benito Juárez', '3337841230', 'Zapopan', 'Jalisco', NULL),
(5, 'Akira´s Boutique: Melchor', 'Av. Melchor Ocampo #2528 Zona Centro', '6143906721', 'Chihuahua', 'Chihuahua', NULL),
(6, 'Akira’s Boutique: Constitución', 'Calle Constitución #106 Zona Centro', '6181962954', 'Durango', 'Durango', NULL),
(7, 'Akira’s Boutique: Centro', 'Av. Hidalgo #338 Zacatecas Centro', '4929301250', 'Zacatecas', 'Zacatecas', NULL);
GO


INSERT INTO [dbo].[empleado] ([id_empleado], [nombre], [apellido], [direccion], [telefono], [edad], [id_sucursal], [email], [contrasena]) 
VALUES 
-- Sucursal 1: Las Mercedes (San Luis Potosí)
(1, 'Sonia Alejandra', 'Fernández Moreno', 'Calle Roble #507 Fracc. Las Mercedes', '4447831225', 34, 1, 'sonia.fernandez@akira.com', 'Pass1234!'),
(2, 'Carlos Eduardo', 'Ramírez López', 'Av. Carranza #1200 Col. Tequis', '4448123456', 28, 1, 'carlos.ramirez@akira.com', 'Pass1234!'),
(3, 'Ana Sofía', 'Martínez Ruiz', 'Calle Los Pinos #302 Col. Tangamanga', '4448234567', 25, 1, 'ana.martinez@akira.com', 'Pass1234!'),
(4, 'Luis Fernando', 'Gómez Cruz', 'Calle Naranjos #105 Col. Moderna', '4448345678', 30, 1, 'luis.gomez@akira.com', 'Pass1234!'),
(5, 'Valeria Isabel', 'Torres Morales', 'Av. Universidad #450 Centro', '4448456789', 22, 1, 'valeria.torres@akira.com', 'Pass1234!'),
(6, 'Jorge Alberto', 'Hernández Silva', 'Calle Nube #88 Fracc. El Saucito', '4448567890', 29, 1, 'jorge.hernandez@akira.com', 'Pass1234!'),

-- Sucursal 2: Obraje (Aguascalientes)
(7, 'Fernando', 'Calderón Ayala', 'Calle Dr. Jesús Díaz de León #438 col. Obraje', '4493780921', 38, 2, 'fernando.calderon@akira.com', 'Pass1234!'),
(8, 'Mariana', 'Rocha Castillo', 'Av. Convención Sur #210 Col. Jardines', '4499123456', 26, 2, 'mariana.rocha@akira.com', 'Pass1234!'),
(9, 'Ricardo Antonio', 'Mendoza Gutiérrez', 'Calle Nieto #504 Zona Centro', '4499234567', 31, 2, 'ricardo.mendoza@akira.com', 'Pass1234!'),
(10, 'Claudia Patricia', 'Vargas Ortiz', 'Calle Galeana #112 Col. Obraje', '4499345678', 27, 2, 'claudia.vargas@akira.com', 'Pass1234!'),
(11, 'Gustavo Adolfo', 'Reyes Castro', 'Av. Las Américas #802 Col. Elena', '4499456789', 33, 2, 'gustavo.reyes@akira.com', 'Pass1234!'),
(12, 'Paola Andrea', 'Navarro Delgado', 'Calle Zaragoza #310 Centro', '4499567890', 24, 2, 'paola.navarro@akira.com', 'Pass1234!'),

-- Sucursal 3: Galerías Mazatlán (Sinaloa)
(13, 'Daniela Fernanda', 'Díaz Ordaz', 'Av. de la Marina #6204, Marina', '6692932059', 32, 3, 'daniela.diaz@akira.com', 'Pass1234!'),
(14, 'José Luis', 'Medina Flores', 'Av. Sabalo Cerritos #102', '6699123456', 29, 3, 'jose.medina@akira.com', 'Pass1234!'),
(15, 'Gabriela Elizabeth', 'Ramos Vega', 'Calle Del Mar #405 Col. Ferrocarrilera', '6699234567', 23, 3, 'gabriela.ramos@akira.com', 'Pass1234!'),
(16, 'Héctor Hugo', 'Guerrero Santos', 'Av. Camarón Sábalo #550 Zona Dorada', '6699345678', 35, 3, 'hector.guerrero@akira.com', 'Pass1234!'),
(17, 'Carmen Julia', 'Aguilar Peña', 'Calle Venustiano Carranza #88 Centro', '6699456789', 28, 3, 'carmen.aguilar@akira.com', 'Pass1234!'),
(18, 'Roberto Carlos', 'Salazar Ríos', 'Av. Insurgentes #302 Col. Juárez', '6699567890', 26, 3, 'roberto.salazar@akira.com', 'Pass1234!'),

-- Sucursal 4: Zapopan (Jalisco)
(19, 'Mario Alberto', 'Jiménez Salcido', 'Av. Manuel J. Clouthier 525 col. Benito Juárez', '3337841230', 40, 4, 'mario.jimenez@akira.com', 'Pass1234!'),
(20, 'Sofía Alejandra', 'Peralta Domínguez', 'Av. Patria #1200 Col. Real de Acueducto', '3339123456', 27, 4, 'sofia.peralta@akira.com', 'Pass1234!'),
(21, 'Diego Armando', 'Villanueva Luna', 'Calle Santa Margarita #405 Col. Valle Real', '3339234567', 31, 4, 'diego.villanueva@akira.com', 'Pass1234!'),
(22, 'Brenda Karina', 'Estrada Serrano', 'Av. Guadalupe #890 Col. Chapalita', '3339345678', 25, 4, 'brenda.estrada@akira.com', 'Pass1234!'),
(23, 'Andrés Felipe', 'Moreno Ibarra', 'Calle Américas #310 Col. Country Club', '3339456789', 29, 4, 'andres.moreno@akira.com', 'Pass1234!'),
(24, 'Natalia María', 'Solís Lara', 'Av. Vallarta #5000 Col. Jardines Vallarta', '3339567890', 22, 4, 'natalia.solis@akira.com', 'Pass1234!'),

-- Sucursal 5: Melchor (Chihuahua)
(25, 'Yesenia Guadalupe', 'Campos Rojo', 'Av. Melchor Ocampo #2528 Zona Centro', '6143906721', 36, 5, 'yesenia.campos@akira.com', 'Pass1234!'),
(26, 'Francisco Javier', 'Orozco Márquez', 'Av. Universidad #1800 Col. San Felipe', '6149123456', 30, 5, 'francisco.orozco@akira.com', 'Pass1234!'),
(27, 'Mónica Beatriz', 'Fuentes Cabrera', 'Calle Aldama #502 Zona Centro', '6149234567', 28, 5, 'monica.fuentes@akira.com', 'Pass1234!'),
(28, 'Alejandro Daniel', 'Ponce Nuñez', 'Av. Tecnológico #3100 Col. Magisterial', '6149345678', 33, 5, 'alejandro.ponce@akira.com', 'Pass1234!'),
(29, 'Diana Laura', 'Cisneros Valenzuela', 'Calle Victoria #108 Centro', '6149456789', 24, 5, 'diana.cisneros@akira.com', 'Pass1234!'),
(30, 'Manuel Alejandro', 'Espinoza Rivas', 'Av. De las Industrias #4500', '6149567890', 27, 5, 'manuel.espinoza@akira.com', 'Pass1234!'),

-- Sucursal 6: Constitución (Durango)
(31, 'Tamara Alejandra', 'Bernal Ramos', 'Calle Constitución #106 Zona Centro', '6181962954', 35, 6, 'tamara.bernal@akira.com', 'Pass1234!'),
(32, 'David Esteban', 'Rangel Beltrán', 'Av. 20 de Noviembre #804 Centro', '6189123456', 32, 6, 'david.rangel@akira.com', 'Pass1234!'),
(33, 'Andrea Nicole', 'Paredes Cárdenas', 'Calle Negrete #305 Zona Centro', '6189234567', 23, 6, 'andrea.paredes@akira.com', 'Pass1234!'),
(34, 'Oscar Mauricio', 'León Rosales', 'Blvd. Dolores del Río #120 Col. Los Ángeles', '6189345678', 29, 6, 'oscar.leon@akira.com', 'Pass1234!'),
(35, 'Patricia Veronica', 'Meza Gallegos', 'Calle Hidalgo #412 Centro', '6189456789', 26, 6, 'patricia.meza@akira.com', 'Pass1234!'),
(36, 'Gabriel Isaac', 'Benítez Soto', 'Av. Francisco Villa #900 Col. Fandango', '6189567890', 31, 6, 'gabriel.benitez@akira.com', 'Pass1234!'),

-- Sucursal 7: Centro (Zacatecas)
(37, 'Samuel Enrique', 'Barrios Enciso', 'Av. Hidalgo #338 Zacatecas Centro', '4929301250', 37, 7, 'samuel.barrios@akira.com', 'Pass1234!'),
(38, 'Lorena Isabela', 'Franco Trejo', 'Calle Juárez #105 Centro Histórico', '4929123456', 28, 7, 'lorena.franco@akira.com', 'Pass1234!'),
(39, 'Victor Manuel', 'Saucedo Palacios', 'Av. Universidad #204 Col. Hidráulica', '4929234567', 30, 7, 'victor.saucedo@akira.com', 'Pass1234!'),
(40, 'Karen Yareli', 'Escobedo Ruiz', 'Calle Tacuba #302 Centro', '4929345678', 25, 7, 'karen.escobedo@akira.com', 'Pass1234!'),
(41, 'Julio César', 'Montiel Lara', 'Av. López Mateos #510 Col. Ejidal', '4929456789', 34, 7, 'julio.montiel@akira.com', 'Pass1234!'),
(42, 'Rosa María', 'Duarte Morales', 'Calle Guerrero #201 Centro', '4929567890', 22, 7, 'rosa.duarte@akira.com', 'Pass1234!');
GO


UPDATE sucursal SET id_encargado = 1 WHERE id_sucursal = 1;
UPDATE sucursal SET id_encargado = 7 WHERE id_sucursal = 2;
UPDATE sucursal SET id_encargado = 13 WHERE id_sucursal = 3;
UPDATE sucursal SET id_encargado = 19 WHERE id_sucursal = 4;
UPDATE sucursal SET id_encargado = 25 WHERE id_sucursal = 5;
UPDATE sucursal SET id_encargado = 31 WHERE id_sucursal = 6;
UPDATE sucursal SET id_encargado = 37 WHERE id_sucursal = 7;
GO


ALTER TABLE [dbo].[empleado] WITH CHECK 
ADD CONSTRAINT [FK_empleado_sucursal] FOREIGN KEY([id_sucursal])
REFERENCES [dbo].[sucursal] ([id_sucursal]);
GO

ALTER TABLE [dbo].[sucursal] WITH CHECK 
ADD CONSTRAINT [FK_sucursal_encargado] FOREIGN KEY([id_encargado])
REFERENCES [dbo].[empleado] ([id_empleado]);
GO

-- Consulta 1
    E.id_empleado,
    E.nombre + ' ' + E.apellido AS NombreEmpleado,
    E.email,
    E.telefono,
    S.nombre AS Sucursal,
    S.ciudad
FROM dbo.empleado E
INNER JOIN dbo.sucursal S ON E.id_sucursal = S.id_sucursal;

-- Consulta 2
SELECT 
    S.id_sucursal,
    S.nombre AS NombreSucursal,
    S.ciudad,
    S.estado,
    E.nombre + ' ' + E.apellido AS Encargado,
    E.email AS EmailEncargado,
    E.telefono AS TelefonoEncargado
FROM dbo.sucursal S
INNER JOIN dbo.empleado E ON S.id_encargado = E.id_empleado;

-- Consulta 3
SELECT 
    S.nombre AS Sucursal,
    S.ciudad,
    COUNT(E.id_empleado) AS TotalEmpleados
FROM dbo.sucursal S
LEFT JOIN dbo.empleado E ON S.id_sucursal = E.id_sucursal
GROUP BY S.nombre, S.ciudad;

--Consulta 4
SELECT 
    S.nombre AS Sucursal,
    AVG(E.edad) AS PromedioEdad
FROM dbo.sucursal S
INNER JOIN dbo.empleado E ON S.id_sucursal = E.id_sucursal
GROUP BY S.nombre;