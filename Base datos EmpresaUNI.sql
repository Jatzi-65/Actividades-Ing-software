CREATE DATABASE EmpresaUNI;
GO

USE EmpresaUNI;
GO

CREATE TABLE Centro_Trabajo (
Numero_Centro VARCHAR(10) PRIMARY KEY,
Nombre_Centro VARCHAR(100) NOT NULL,
Ciudad VARCHAR(50) NOT NULL
);

CREATE TABLE Empleado (
    Numero_Empleado INT IDENTITY(1,1) PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL,
    Apellido_Paterno VARCHAR(50) NOT NULL,
    Apellido_Materno VARCHAR(50) NOT NULL,
    Fecha_Nacimiento DATE NOT NULL,
    RFC VARCHAR(13) NOT NULL,
    Puesto VARCHAR(50) NOT NULL,
    Descripcion_Puesto VARCHAR(150),
    Directivo_Bandera BIT NOT NULL,
    Numero_Centro VARCHAR(10) NOT NULL, 
    CONSTRAINT FK_Empleado_Centro FOREIGN KEY (Numero_Centro) REFERENCES Centro_Trabajo(Numero_Centro)
);

CREATE TABLE Directivo (
    Numero_Empleado INT PRIMARY KEY,
    Centro_Supervisado VARCHAR(10) NOT NULL,
    Prestacion_Combustible BIT NOT NULL,
    CONSTRAINT FK_Directivo_Empleado FOREIGN KEY (Numero_Empleado) REFERENCES Empleado(Numero_Empleado),
    CONSTRAINT FK_Directivo_Centro FOREIGN KEY (Centro_Supervisado) REFERENCES Centro_Trabajo(Numero_Centro)
);

INSERT INTO Centro_Trabajo (Numero_Centro, Nombre_Centro, Ciudad)
VALUES 
('000201', 'Tiendas Ángel Flores Ropa', 'Culiacán'),
('000202', 'Tiendas Ángel Flores Muebles', 'Culiacán'),
('000203', 'Tiendas Ángel Flores Cajas', 'Culiacán'),
('049001', 'La Primavera Ropa', 'Culiacán'),
('049002', 'La Primavera Muebles', 'Culiacán'),
('049003', 'La Primavera Cajas', 'Culiacán');
GO

INSERT INTO Empleado (Nombre, Apellido_Paterno, Apellido_Materno, Fecha_Nacimiento, RFC, Puesto, Descripcion_Puesto, Directivo_Bandera, Numero_Centro)
VALUES 
('Jesus', 'Vega', 'Castro', '1988-03-26', 'VECJ880326XXX', 'Vendedor', 'Venta en piso', 0, '000201'),
('Jose', 'Perez', 'Lopez', '1980-01-01', 'PELJ800101XXX', 'Gerente', 'Gerencia de sucursal', 1, '049001'),
('Maria', 'Gomez', 'Ruiz', '1992-05-14', 'GORM920514XXX', 'Cajera', 'Cobro de mercancía', 0, '000203'),
('Carlos', 'Lara', 'Diaz', '1985-11-20', 'LADC851120XXX', 'Supervisor', 'Supervisión de muebles', 1, '049002'),
('Ana', 'Rios', 'Soto', '1995-08-08', 'RISA950808XXX', 'Auxiliar', 'Auxiliar de cajas', 0, '049003');
GO

INSERT INTO Directivo (Numero_Empleado, Centro_Supervisado, Prestacion_Combustible)
VALUES 
(2, '049001', 1), 
(4, '049002', 0);
GO

SELECT * FROM Centro_Trabajo;

SELECT * FROM Empleado;

SELECT * FROM Directivo;
