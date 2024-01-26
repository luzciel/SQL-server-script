USE Concesionario;
GO

-- Obtener las 3 marcas más solicitadas, y la cantidad de solicitudes de cada una, ordenadas descendentemente
CREATE PROCEDURE ObtenerMarcasMasSolicitadas
AS
BEGIN
    PRINT 'Ejecutando el procedimiento ObtenerMarcasMasSolicitadas...';
    SELECT TOP 3
        ma.nombre AS Marca,
        COUNT(s.modelo_id) AS CantidadSolicitudes
    FROM MarcaAuto ma
    LEFT JOIN ModeloAuto m ON ma.marca_id = m.marca_id
    LEFT JOIN Solicitudes s ON m.modelo_id = s.modelo_id
    GROUP BY ma.nombre
    ORDER BY CantidadSolicitudes DESC;
END;
GO

-- Obtener solicitudes del mes actual
CREATE PROCEDURE ObtenerSolicitudesMesActual
AS
BEGIN
    PRINT 'Ejecutando el procedimiento ObtenerSolicitudesMesActual...';
    SELECT *
    FROM Solicitudes
    WHERE FORMAT(GETDATE(), 'MMMM yyyy') = FORMAT(fecha_venta, 'MMMM yyyy');
END;
GO

-- Obtener el vendedor que menos solicitudes haya generado en los últimos 30 días:
CREATE PROCEDURE ObtenerVendedorMenosSolicitudesUltimos30Dias
AS
BEGIN
    PRINT 'Ejecutando el procedimiento ObtenerVendedorMenosSolicitudesUltimos30Dias...';
    SELECT TOP 1
        v.nombre AS Vendedor,
        COUNT(s.vendedor_id) AS CantidadSolicitudes
    FROM Vendedor v
    LEFT JOIN Solicitudes s ON v.vendedor_id = s.vendedor_id
    WHERE fecha_venta >= DATEADD(day, -30, GETDATE())
    GROUP BY v.nombre
    ORDER BY CantidadSolicitudes ASC;
END;
GO

-- Obtener modelos que no tengan solicitudes:
CREATE PROCEDURE ObtenerModelosSinSolicitudes
AS
BEGIN
    PRINT 'Ejecutando el procedimiento ObtenerModelosSinSolicitudes...';
    SELECT m.*
    FROM ModeloAuto m
    LEFT JOIN Solicitudes s ON m.modelo_id = s.modelo_id
    WHERE s.modelo_id IS NULL;
END;
GO

-- Obtener 3 meses con más dinero en ventas:
CREATE PROCEDURE ObtenerTresMesesMasVentas
AS
BEGIN
    PRINT 'Ejecutando el procedimiento ObtenerTresMesesMasVentas...';
    SELECT TOP 3
        FORMAT(fecha_venta, 'MMMM yyyy') AS Mes,
        SUM(monto) AS TotalVentas
    FROM Solicitudes
    GROUP BY FORMAT(fecha_venta, 'MMMM yyyy')
    ORDER BY TotalVentas DESC;
END;
GO
