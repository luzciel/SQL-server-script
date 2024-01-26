CREATE DATABASE Concesionario;
GO

USE Concesionario;
GO

CREATE TABLE Vendedor (
    vendedor_id INT PRIMARY KEY,
    nombre VARCHAR(50)
);

INSERT INTO Vendedor (vendedor_id, nombre) VALUES
(1, 'Juan'),
(2, 'Maria'),
(3, 'Pedro'),
(4, 'Ana'),
(5, 'Carlos'),
(6, 'Isabel'),
(7, 'Luis'),
(8, 'Eva'),
(9, 'Hugo'),
(10, 'Laura'),
(11, 'Miguel'),
(12, 'Sofía'),
(13, 'Javier');

CREATE TABLE MarcaAuto (
    marca_id INT PRIMARY KEY,
    nombre VARCHAR(50)
);

INSERT INTO MarcaAuto (marca_id, nombre) VALUES
(1, 'Toyota'),
(2, 'Ford'),
(3, 'Honda'),
(4, 'Chevrolet'),
(5, 'Nissan'),
(6, 'Volkswagen'),
(7, 'BMW'),
(8, 'Mercedes-Benz'),
(9, 'Audi'),
(10, 'Hyundai'),
(11, 'Kia'),
(12, 'Mazda'),
(13, 'Subaru');

CREATE TABLE ModeloAuto (
    modelo_id INT PRIMARY KEY,
    nombre VARCHAR(50),
    marca_id INT FOREIGN KEY REFERENCES MarcaAuto(marca_id)
);

INSERT INTO ModeloAuto (modelo_id, nombre, marca_id) VALUES
(1, 'Corolla', 1),
(2, 'Fiesta', 2),
(3, 'Civic', 3),
(4, 'Cruze', 4),
(5, 'Altima', 5),
(6, 'Golf', 6),
(7, '3 Series', 7),
(8, 'C-Class', 8),
(9, 'A4', 9),
(10, 'Elantra', 10),
(11, 'Sportage', 11),
(12, 'CX-5', 12),
(13, 'Impreza', 13),
(14, 'Malibu', 4),
(15, 'Murano', 5);

CREATE TABLE Solicitudes (
    venta_id INT PRIMARY KEY,
    vendedor_id INT FOREIGN KEY REFERENCES Vendedor(vendedor_id),
    modelo_id INT FOREIGN KEY REFERENCES ModeloAuto(modelo_id),
    monto FLOAT,
    fecha_venta DATE
);

INSERT INTO Solicitudes (venta_id, vendedor_id, modelo_id, monto, fecha_venta) VALUES
(1, 1, 1, 15000000, '2022-11-01'),
(2, 2, 2, 13000000, '2022-11-15'),
(3, 3, 3, 12000000, '2022-12-05'),
(4, 4, 4, 14000000, '2022-12-12'),
(5, 5, 5, 1550000, '2023-01-02'),
(6, 6, 6, 11800000, '2023-01-20'),
(7, 7, 7, 31500000, '2023-02-10'),
(8, 8, 8, 14200000, '2023-02-25'),
(9, 9, 9, 31200000, '2023-02-28'),
(10, 10, 10, 21800000, '2023-02-15'),
(11, 11, 11, 13100000, '2023-03-20'),
(12, 12, 12, 21900000, '2023-03-25'),
(13, 13, 13, 21600000, '2023-03-29'),
(14, 1, 1, 12000000, '2023-04-02'),
(15, 2, 2, 15000000, '2023-04-22'),
(16, 3, 3, 18000000, '2023-04-25'),
(17, 4, 4, 20000000, '2023-05-01'),
(18, 5, 5, 22000000, '2023-05-10'),
(19, 6, 6, 25000000, '2023-05-12'),
(20, 7, 7, 28000000, '2023-06-05'),
(21, 8, 8, 30000000, '2023-06-08'),
(22, 9, 9, 32000000, '2023-06-15'),
(23, 10, 10, 35000000, '2023-07-02'),
(24, 11, 11, 38000000, '2023-07-05'),
(25, 12, 12, 40000000, '2023-07-12'),
(26, 13, 13, 42000000, '2023-08-01'),
(27, 1, 1, 45000000, '2023-08-10'),
(28, 2, 2, 48000000, '2023-08-15'),
(29, 3, 3, 50000000, '2023-09-02'),
(30, 4, 4, 52000000, '2023-09-05'),
(31, 5, 5, 55000000, '2023-09-10'),
(32, 6, 6, 58000000, '2023-09-15'),
(33, 7, 7, 60000000, '2023-10-01'),
(34, 8, 8, 62000000, '2023-10-10'),
(35, 9, 9, 65000000, '2023-10-15'),
(36, 10, 10, 68000000, '2023-11-02'),
(37, 11, 11, 70000000, '2023-11-05'),
(38, 12, 12, 72000000, '2023-11-10'),
(39, 13, 13, 75000000, '2023-12-01'),
(40, 5, 5, 78000000, '2023-12-10'),
(41, 2, 2, 80000000, '2023-12-15'),
(42, 4, 4, 10000000, '2024-01-15'),
(43, 5, 5, 20000000, '2024-01-20');
