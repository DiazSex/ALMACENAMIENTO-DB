CREATE DATABASE ALMACENAMIENTO;
USE ALMACENAMIENTO;

-- Tabla de Clientes
CREATE TABLE Clientes (
    ClienteID INT PRIMARY KEY,
    Nombre VARCHAR(255),
    Contacto VARCHAR(255),
    CorreoElectronico VARCHAR(255)
    -- Otros campos relevantes
);
-- Tabla de Productos
CREATE TABLE Productos (
    ID_Producto INT PRIMARY KEY AUTO_INCREMENT,
    NombreProducto VARCHAR(255) NOT NULL,
    Tipo_Producto VARCHAR(50) NOT NULL,
    Descripcion TEXT,
    Precio_Unitario DECIMAL(10, 2) NOT NULL,
    Proveedor VARCHAR(255) -- Agregar columna para el proveedor
);
-- Tabla de Servicios
CREATE TABLE Servicios (
    ID_Servicio INT PRIMARY KEY AUTO_INCREMENT,
    NombreServicio VARCHAR(255) NOT NULL,
    Descripcion TEXT,
    Tarifa_Hora DECIMAL(10, 2) NOT NULL
);
-- Tabla de Proyectos
CREATE TABLE Proyectos (
    ProyectoID INT PRIMARY KEY,
    ClienteID INT,
    NombreProyecto VARCHAR(255),
    FechaInicio DATE,
    FechaFinalizacion DATE,
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID)
    -- Otros campos relevantes
);
-- Tabla de Ventas
CREATE TABLE Ventas (
    VentaID INT PRIMARY KEY,
    ClienteID INT,
    FechaVenta DATE,
    TotalVenta DECIMAL(10, 2),
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID)
    -- Otros campos relevantes
);
-- Tabla de Detalle de Ventas
CREATE TABLE DetalleVentas (
    DetalleVentaID INT PRIMARY KEY,
    VentaID INT,
    ProductoID INT,
    CantidadVendida INT,
    PrecioUnitario DECIMAL(10, 2),
    Subtotal DECIMAL(10, 2),
    FOREIGN KEY (VentaID) REFERENCES Ventas(VentaID),
    FOREIGN KEY (ProductoID) REFERENCES Productos(ID_Producto)
    -- Otros campos relevantes
);
-- Tabla de Inventario
CREATE TABLE Inventario (
    ProductoID INT PRIMARY KEY,
    NombreProducto VARCHAR(255),
    CantidadStock INT,
    Proveedor VARCHAR(255)
    -- Otros campos relevantes
);
-- Tabla de Órdenes de Trabajo
CREATE TABLE OrdenesTrabajo (
    OrdenID INT PRIMARY KEY,
    ProyectoID INT,
    FechaCreacion DATE,
    TecnicoAsignado VARCHAR(255),
    HorasTrabajadas INT,
    MaterialesUtilizados VARCHAR(255),
    FOREIGN KEY (ProyectoID) REFERENCES Proyectos(ProyectoID)
    -- Otros campos relevantes
);
-- Tabla de Mantenimiento Preventivo
CREATE TABLE MantenimientoPreventivo (
    MantenimientoID INT PRIMARY KEY,
    ProyectoID INT,
    FechaProgramacion DATE,
    ActividadesRealizadas TEXT,
    Observaciones TEXT,
    FOREIGN KEY (ProyectoID) REFERENCES Proyectos(ProyectoID)
    -- Otros campos relevantes
);
-- Tabla de Documentos
CREATE TABLE Documentos (
    DocumentoID INT PRIMARY KEY,
    ProyectoID INT,
    NombreDocumento VARCHAR(255),
    TipoDocumento VARCHAR(255),
    RutaArchivo VARCHAR(255),
    FOREIGN KEY (ProyectoID) REFERENCES Proyectos(ProyectoID)
    -- Otros campos relevantes
);
-- Tabla de Facturas
CREATE TABLE Facturas (
    FacturaID INT PRIMARY KEY,
    ProyectoID INT,
    FechaEmision DATE NOT NULL,
    CantidadTotal DECIMAL(10, 2),
    FOREIGN KEY (ProyectoID) REFERENCES Proyectos(ProyectoID)
    -- Otros campos relevantes
);
-- Tabla de Pagos
CREATE TABLE Pagos (
    PagoID INT PRIMARY KEY,
    FacturaID INT,
    FechaPago DATE,
    MontoPagado DECIMAL(10, 2),
    FOREIGN KEY (FacturaID) REFERENCES Facturas(FacturaID)
    -- Otros campos relevantes
);
-- Tabla de Garantías
CREATE TABLE Garantias (
    GarantiaID INT PRIMARY KEY,
    ProyectoID INT,
    FechaInicio DATE,
    FechaFinalizacion DATE,
    DescripcionGarantia TEXT,
    FOREIGN KEY (ProyectoID) REFERENCES Proyectos(ProyectoID)
    -- Otros campos relevantes
);