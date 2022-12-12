--SQL
USE master;
GO
IF DB_ID (N'Supermercado') IS NOT NULL
DROP DATABASE Supermercado;
GO
CREATE DATABASE Supermercado
ON
(NAME = Supermercado_dat,
FILENAME = 'C:\BD\Supermercado.mdf',
SIZE = 10,
MAXSIZE = 50,
FILEGROWTH = 5)
LOG ON 
(NAME = Supermercado_log,
FILENAME = 'C:\BD\Supermercado.ldf',
SIZE = 5MB,
MAXSIZE = 25MB,
FILEGROWTH = 5MB);

GO
USE Supermercado;
GO

--Tablas--

CREATE TABLE BODEGA
(
idBodega int identity (1,1),
numero int not null,
total int not null,
estatus bit default 1 not null,
);
GO

CREATE TABLE CAJA
(
idCaja int identity (1,1),
numero int not null,
persona varchar (50) not null,
computadora varchar (50) not null,
idSucursal int not null,
estatus bit default 1 not null,
);
GO

CREATE TABLE CAPACITACION
(
idCapacitacion int identity (1,1),
nombre varchar (50) not null,
tipo varchar (50) not null,
numero int not null,
estatus bit default 1 not null,
);
GO

CREATE TABLE CLIENTE
(
idCliente int identity (1,1),
nombre varchar (50) not null,
apellidopaterno varchar (50) not null,
apellidomaterno varchar (50) not null,
telefono int not null,
idMembresia int not null,
idTarjetaPunto int not null,
estatus bit default 1 not null,
);
GO

CREATE TABLE COMPRA
(
idCompra int identity (1,1),
cantidad int not null,
fecha datetime not null,
idFacturaCliente int not null,
idProducto int not null,
estatus bit default 1 not null,
);
GO

CREATE TABLE COMPROBANTE
(
idComprobante int identity (1,1),
fecha datetime not null,
cantidad int not null,
productos varchar (50) not null,
idCompra int not null,
estatus bit default 1 not null,
);
GO

CREATE TABLE CONTADOR
(
idContador int identity (1,1),
nombre varchar (50) not null,
apellidopaterno varchar (50) not null,
apellidomaterno varchar (50) not null,
calle varchar (50) not null,
numero int not null,
ciudad varchar (50) not null,
telefono int not null,
estatus bit default 1 not null,
);
GO

CREATE TABLE CONTRATO
(
idContrato int identity (1,1),
numero int not null,
fecha datetime not null,
nombre varchar (50) not null,
servicios varchar (50) not null,
estatus bit default 1 not null,
);
GO

CREATE TABLE CONVENIO
(
idConvenio int identity (1,1),
fecha datetime not null,
cantidad int not null,
idCliente int not null,
estatus bit default 1 not null,
);
GO

CREATE TABLE COTIZACION
(
idCotizacion int identity (1,1),
cantidad int not null,
producto varchar (50) not null,
estatus bit default 1 not null,
);
GO

CREATE TABLE CREDITO
(
idCredito int identity (1,1),
creditodisponible int not null,
creditodebe int not null,
fecha datetime not null,
estatus bit default 1 not null,
);
GO

CREATE TABLE DELIVERY
(
idDelivery int identity (1,1),
cantidad int not null,
producto varchar (50) not null,
direccion varchar (50) not null,
horasalida datetime not null,
horallegada datetime not null,
idSucursal int not null,
estatus bit default 1 not null,
);
GO

CREATE TABLE DEPARTAMENTO
(
idDepartamento int identity (1,1),
nombre varchar (50) not null,
categoria varchar (50) not null,
idSucursal int not null,
estatus bit default 1 not null,
);
GO

CREATE TABLE DEVOLUCION
(
idDevolucion int identity (1,1),
producto varchar (50) not null,
cantidad int not null,
cantidadmonetaria int not null,
fecha datetime not null,
idCliente int not null,
estatus bit default 1 not null,
);
GO

CREATE TABLE DEVOLUCIONPROVEEDOR
(
idDevolucionproveedor int identity (1,1),
producto varchar (50) not null,
cantidad int not null,
cantidadmonetaria int not null,
fecha datetime not null,
idProveedor int not null,
estatus bit default 1 not null,
);
GO

CREATE TABLE EMPLEADO
(
idEmpleado int identity (1,1),
nombre varchar (50) not null,
apellidopaterno varchar (50) not null,
apellidomaterno varchar (50) not null,
curp varchar (50) not null,
telefono int not null,
calle varchar (50) not null,
numero int not null,
colonia varchar (50) not null,
ciudad varchar (50) not null,
estatus bit default 1 not null,
);
GO

CREATE TABLE EMPRESA
(
idEmpresa int identity (1,1),
nombre varchar (50) not null,
telefono int not null,
calle varchar (50) not null,
estado varchar (50) not null,
numero int not null,
colonia varchar (50) not null,
ciudad varchar (50) not null,
estatus bit default 1 not null,
);
GO

CREATE TABLE ENVIO
(
idEnvio int identity (1,1),
nombre varchar (50) not null,
apellidopaterno varchar (50) not null,
apellidomaterno varchar (50) not null,
calle varchar (50) not null,
estado varchar (50) not null,
numero int not null,
colonia varchar (50) not null,
ciudad varchar (50) not null,
cantidad int not null,
categoria varchar (50) not null,
fecha datetime not null,
estatus bit default 1 not null,
);
GO

CREATE TABLE EQUIPOINFORMATICO
(
idEquipoinformatico int identity (1,1),
tipo varchar (50) not null,
cantidad int not null,
total int not null,
idSucursal int not null,
estatus bit default 1 not null,
);
GO

CREATE TABLE ESTACIONAMIENTO
(
idEstacionamiento int identity (1,1),
lugar int not null,
tipo varchar (50) not null,
idSucursal int not null,
estatus bit default 1 not null,
);
GO

CREATE TABLE FACTURACLIENTE
(
idFacturacliente int identity (1,1),
fecha datetime not null,
remitente varchar (50) not null,
cantidad int not null,
idCliente int not null,
idContador int not null,
estatus bit default 1 not null,
);
GO

CREATE TABLE FACTURAPROVEEDOR
(
idFacturaproveedor int identity (1,1),
fecha datetime not null,
remitente varchar (50) not null,
cantidad int not null,
idContador int not null,
estatus bit default 1 not null,
);
GO

CREATE TABLE HORARIOTRABAJADOR
(
idHorariotrabajador int identity (1,1),
entrada datetime not null,
salida datetime not null,
idEmpleado int not null,
estatus bit default 1 not null,
);
GO


CREATE TABLE INVENTARIO
(
idInventario int identity (1,1),
nombre varchar (50) not null,
tipo varchar (50) not null,
fecha datetime not null,
estatus bit default 1 not null,
);
GO

CREATE TABLE MANTENIMIENTO
(
idMantenimiento int identity (1,1),
persona varchar (50) not null,
tipo varchar (50) not null,
fecha datetime not null,
idSucursal int not null,
estatus bit default 1 not null,
);
GO

CREATE TABLE MARCA
(
idMarca int identity (1,1),
nombre varchar (50) not null,
ciudad varchar (50) not null,
estatus bit default 1 not null,
);
GO

CREATE TABLE MARKETING
(
idMarketing int identity (1,1),
tipo varchar (50) not null,
lugar varchar (50) not null,
idSucursal int not null,
estatus bit default 1 not null,
);
GO

CREATE TABLE MATERIAPRIMA
(
idMateriaprima int identity (1,1),
material varchar (50) not null,
nombre varchar (50) not null,
cantidad int not null,
idProducto int not null,
estatus bit default 1 not null,
);
GO

CREATE TABLE MEMBRESIA
(
idMembresia int identity (1,1),
nombre varchar (50) not null,
apellidopaterno varchar (50) not null,
apellidomaterno varchar (50) not null,
calle varchar (50) not null,
colonia varchar (50) not null,
ciudad varchar (50) not null,
numero int not null,
idSucursal int not null,
estatus bit default 1 not null,
);
GO

CREATE TABLE METODOPAGO
(
idMetodopago int identity (1,1),
tipo varchar (50) not null,
idCliente int not null,
estatus bit default 1 not null,
);
GO

CREATE TABLE MOBILIARIO
(
idMobiliario int identity (1,1),
nombre varchar (50) not null,
cantidad int not null,
categoria varchar (50) not null,
idSucursal int not null,
estatus bit default 1 not null,
);
GO

CREATE TABLE NOMINA
(
idNomina int identity (1,1),
fecha datetime not null,
persona varchar (50) not null,
cantidad varchar (50) not null,
idContador int not null,
estatus bit default 1 not null,
);
GO

CREATE TABLE OFERTA
(
idOferta int identity (1,1),
producto varchar (50) not null,
precio varchar (50) not null,
precioanterior varchar (50) not null,
estatus bit default 1 not null,
);
GO

CREATE TABLE PAGOSERVICIO
(
idPagoservicio int identity (1,1),
cantidad int not null,
servicio varchar (50) not null,
fecha datetime not null,
idSucursal int not null,
estatus bit default 1 not null,
);
GO

CREATE TABLE PAQUETE 
(
idPaquete int identity (1,1),
numero int not null,
peso varchar (50) not null,
remitente varchar (50) not null,
destinatario varchar (50) not null,
idEnvio int not null,
idPedidoLinea int not null,
estatus bit default 1 not null,
);
GO

CREATE TABLE PASILLO
(
idPasillo int identity (1,1),
cantidad int not null,
numero int not null,
tipo varchar (50) not null,
idSucursal int not null,
estatus bit default 1 not null,
);
GO

CREATE TABLE PEDIDOLINEA
(
idPedidoLinea int identity (1,1),
fecha datetime not null,
cantidad varchar (50) not null,
producto varchar (50) not null,
total int not null,
estatus bit default 1 not null,
);
GO

CREATE TABLE PRESTACION
(
idPrestacion int identity (1,1),
tipo varchar (50) not null,
idEmpleado int not null,
estatus bit default 1 not null,
);
GO

CREATE TABLE PRODUCCION
(
idProduccion int identity (1,1),
fecha datetime not null,
total int not null,
idMarca int not null,
estatus bit default 1 not null,
);
GO

CREATE TABLE PRODUCTO
(
idProducto int identity (1,1),
nombre varchar (50) not null,
cantidad int not null,
categoria varchar (50) not null,
idBodega int not null,
idDevolucion int not null,
idProduccion int not null,
estatus bit default 1 not null,
);
GO

CREATE TABLE PROVEEDOR
(
idProveedor int identity (1,1),
nombre varchar (50) not null,
apellidopaterno varchar (50) not null,
apellidomaterno varchar (50) not null,
calle varchar (50) not null,
numero int not null,
ciudad varchar (50) not null,
telefono int not null,
idRepresentante int not null,
estatus bit default 1 not null,
);
GO

CREATE TABLE PUESTO
(
idPuesto int identity (1,1),
tipopuesto varchar (50) not null,
idEmpleado int not null,
estatus bit default 1 not null,
);
GO

CREATE TABLE QUEJA
(
idQueja int identity (1,1),
tipoqueja varchar (50) not null,
fecha datetime not null,
estatus bit default 1 not null,
);
GO

CREATE TABLE REPRESENTANTE 
(
idRepresentante int identity (1,1),
nombre varchar (50) not null,
apellidopaterno varchar (50) not null,
apellidomaterno varchar (50) not null,
telefono int not null,
empresa varchar (50) not null,
idEmpresa int not null,
estatus bit default 1 not null,
);
GO

CREATE TABLE RESTAURANTE 
(
idRestaurante int identity (1,1),
mesas int not null,
sillas int not null,
comida varchar (50) not null,
idSucursal int not null,
estatus bit default 1 not null,
);
GO

CREATE TABLE SUCURSAL
(
idSucursal int identity (1,1),
nombre varchar (50) not null,
telefono int not null,
calle varchar (50) not null,
estado varchar (50) not null,
numero int not null,
colonia varchar (50) not null,
ciudad varchar (50) not null,
estatus bit default 1 not null,
);
GO

CREATE TABLE TARJETAPUNTO
(
idTarjetapunto int identity (1,1),
puntos int not null,
beneficios varchar (50) not null,
idSucursal int not null,
estatus bit default 1 not null,
);
GO

CREATE TABLE TRANSPORTE
(
idTransporte int identity (1,1),
marca varchar (50) not null,
tipo varchar (50) not null,
estatus bit default 1 not null,
);
GO

CREATE TABLE VENTA 
(
idVenta int identity (1,1),
fecha datetime not null,
cantidad varchar (50) not null,
estatus bit default 1 not null,
);
GO

CREATE TABLE VIGILANCIA
(
idVigilancia int identity (1,1),
caseta int not null,
total int not null,
idSucursal int not null,
estatus bit default 1 not null,
);
GO

CREATE TABLE BodegaInventario
(
	idBodegaInventario int identity (1,1),
	idBodega int NOT NULL,
	idInventario int not null,
	fechainventario datetime not null,
	estatus bit default 1 not null
);
GO

CREATE TABLE ClienteCompra
(
	idClienteCompra int identity (1,1),
	idCliente int NOT NULL,
	idCompra int not null,
	fechacompra datetime not null,
	estatus bit default 1 not null
);
GO

CREATE TABLE ClienteCotizacion
(
	idClienteCotizacion int identity (1,1),
	idCliente int NOT NULL,
	idCotizacion int not null,
	estatus bit default 1 not null
);
GO

CREATE TABLE ClienteCredito
(
	idClienteCredito int identity (1,1),
	idCliente int NOT NULL,
	idCredito int not null,
	fechacredito datetime not null,
	estatus bit default 1 not null
);
GO

CREATE TABLE ClienteQueja
(
	idClienteQueja int identity (1,1),
	idCliente int NOT NULL,
	idQueja int not null,
	fechaqueja datetime not null,
	estatus bit default 1 not null
);
GO

CREATE TABLE EmpleadoCapacitacion
(
	idEmpleadoCapacitacion int identity (1,1),
	idEmpleado int NOT NULL,
	idCapacitacion int not null,
	estatus bit default 1 not null
);
GO

CREATE TABLE EmpleadoContrato
(
	idEmpleadoContrato int identity (1,1),
	idEmpleado int NOT NULL,
	idContrato int not null,
	fechacontrato datetime not null,
	estatus bit default 1 not null
);
GO

CREATE TABLE EmpleadoPrestacion
(
	idEmpleadoPrestacion int identity (1,1),
	idEmpleado int NOT NULL,
	idPrestacion int not null,
	estatus bit default 1 not null
);
GO

CREATE TABLE ProductoEnvio
(
	idProductoEnvio int identity (1,1),
	idProducto int NOT NULL,
	idEnvio int not null,
	fechaenvio datetime not null,
	estatus bit default 1 not null
);
GO

CREATE TABLE ProductoOferta
(
	idProductoOferta int identity (1,1),
	idProducto int NOT NULL,
	idOferta int not null,
	fechaoferta datetime not null,
	estatus bit default 1 not null
);
GO

CREATE TABLE ProductoPedidoLinea
(
	idProductoPedidoLinea int identity (1,1),
	idProducto int NOT NULL,
	idPedidoLinea int not null,
	fechapedidolinea datetime not null,
	estatus bit default 1 not null
);
GO

CREATE TABLE ProductoVenta
(
	idProductoVenta int identity (1,1),
	idProducto int NOT NULL,
	idVenta int not null,
	fechaventa datetime not null,
	estatus bit default 1 not null
);
GO

CREATE TABLE SucursalEmpleado
(
	idSucursalEmpleado int identity (1,1),
	idSucursal int NOT NULL,
	idEmpleado int not null,
	estatus bit default 1 not null
);
GO

CREATE TABLE TransportePaquete
(
	idTransportePaquete int identity (1,1),
	idTransporte int NOT NULL,
	idPaquete int not null,
	estatus bit default 1 not null
);
GO




--LLAVES PRIMARIAS
ALTER TABLE Bodega ADD CONSTRAINT PK_Bodega PRIMARY KEY (idBodega)
ALTER TABLE Caja ADD CONSTRAINT PK_Caja PRIMARY KEY (idCaja)
ALTER TABLE Capacitacion ADD CONSTRAINT PK_Capacitacion PRIMARY KEY (idCapacitacion)
ALTER TABLE Cliente ADD CONSTRAINT PK_Cliente PRIMARY KEY (idCliente)
ALTER TABLE Compra ADD CONSTRAINT PK_Compra PRIMARY KEY (idCompra)
ALTER TABLE Comprobante ADD CONSTRAINT PK_Comprobante PRIMARY KEY (idComprobante)
ALTER TABLE Contador ADD CONSTRAINT PK_Contador PRIMARY KEY (idContador)
ALTER TABLE Contrato ADD CONSTRAINT PK_Contrato PRIMARY KEY (idContrato)
ALTER TABLE Convenio ADD CONSTRAINT PK_Convenio PRIMARY KEY (idConvenio)
ALTER TABLE Cotizacion ADD CONSTRAINT PK_Cotizacion PRIMARY KEY (idCotizacion)
ALTER TABLE Credito ADD CONSTRAINT PK_Credito PRIMARY KEY (idCredito)
ALTER TABLE Delivery ADD CONSTRAINT PK_Delivery PRIMARY KEY (idDelivery)
ALTER TABLE Departamento ADD CONSTRAINT PK_Departamento PRIMARY KEY (idDepartamento)
ALTER TABLE Devolucion ADD CONSTRAINT PK_Devolucion PRIMARY KEY (idDevolucion)
ALTER TABLE Devolucionproveedor ADD CONSTRAINT PK_Devolucionproveedor PRIMARY KEY (idDevolucionproveedor)
ALTER TABLE Empleado ADD CONSTRAINT PK_Empleado PRIMARY KEY (idEmpleado)
ALTER TABLE Empresa ADD CONSTRAINT PK_Empresa PRIMARY KEY (idEmpresa)
ALTER TABLE Envio ADD CONSTRAINT PK_Envio PRIMARY KEY (idEnvio)
ALTER TABLE Equipoinformatico ADD CONSTRAINT PK_Equipoinformatico PRIMARY KEY (idEquipoinformatico)
ALTER TABLE Estacionamiento ADD CONSTRAINT PK_Estacionamiento PRIMARY KEY (idEstacionamiento)
ALTER TABLE Facturacliente ADD CONSTRAINT PK_Facturacliente PRIMARY KEY (idFacturacliente)
ALTER TABLE Facturaproveedor ADD CONSTRAINT PK_Facturaproveedor PRIMARY KEY (idFacturaproveedor)
ALTER TABLE Horariotrabajador ADD CONSTRAINT PK_Horariotrabajador PRIMARY KEY (idHorariotrabajador)
ALTER TABLE Inventario ADD CONSTRAINT PK_Inventario PRIMARY KEY (idInventario)
ALTER TABLE Mantenimiento ADD CONSTRAINT PK_Mantenimiento PRIMARY KEY (idMantenimiento)
ALTER TABLE Marca ADD CONSTRAINT PK_Marca PRIMARY KEY (idMarca)
ALTER TABLE Marketing ADD CONSTRAINT PK_Marketing PRIMARY KEY (idMarketing)
ALTER TABLE Materiaprima ADD CONSTRAINT PK_Materiaprima PRIMARY KEY (idMateriaprima)
ALTER TABLE Membresia ADD CONSTRAINT PK_Membresia PRIMARY KEY (idMembresia)
ALTER TABLE Metodopago ADD CONSTRAINT PK_Metodopago PRIMARY KEY (idMetodopago)
ALTER TABLE Mobiliario ADD CONSTRAINT PK_Mobiliario PRIMARY KEY (idMobiliario)
ALTER TABLE Nomina ADD CONSTRAINT PK_Nomina PRIMARY KEY (idNomina)
ALTER TABLE Oferta ADD CONSTRAINT PK_Oferta PRIMARY KEY (idOferta)
ALTER TABLE Pagoservicio ADD CONSTRAINT PK_Pagoservicio PRIMARY KEY (idPagoservicio)
ALTER TABLE Paquete ADD CONSTRAINT PK_Paquete PRIMARY KEY (idPaquete)
ALTER TABLE Pasillo ADD CONSTRAINT PK_Pasillo PRIMARY KEY (idPasillo)
ALTER TABLE PedidoLinea ADD CONSTRAINT PK_PedidoLinea PRIMARY KEY (idPedidoLinea)
ALTER TABLE Prestacion ADD CONSTRAINT PK_Prestacion PRIMARY KEY (idPrestacion)
ALTER TABLE Produccion ADD CONSTRAINT PK_Produccion PRIMARY KEY (idProduccion)
ALTER TABLE Producto ADD CONSTRAINT PK_Producto PRIMARY KEY (idProducto)
ALTER TABLE Proveedor ADD CONSTRAINT PK_Proveedor PRIMARY KEY (idProveedor)
ALTER TABLE Puesto ADD CONSTRAINT PK_Puesto PRIMARY KEY (idPuesto)
ALTER TABLE Queja ADD CONSTRAINT PK_Queja PRIMARY KEY (idQueja)
ALTER TABLE Representante ADD CONSTRAINT PK_Representante PRIMARY KEY (idRepresentante)
ALTER TABLE Sucursal ADD CONSTRAINT PK_Sucursal PRIMARY KEY (idSucursal)
ALTER TABLE Tarjetapunto ADD CONSTRAINT PK_Tarjetapunto PRIMARY KEY (idTarjetapunto)
ALTER TABLE Transporte ADD CONSTRAINT PK_Transporte PRIMARY KEY (idTransporte)
ALTER TABLE Venta ADD CONSTRAINT PK_Venta PRIMARY KEY (idVenta)
ALTER TABLE Vigilancia ADD CONSTRAINT PK_Vigilancia PRIMARY KEY (idVigilancia)
ALTER TABLE BodegaInventario ADD CONSTRAINT PK_BodegaInventario PRIMARY KEY (idBodegaInventario)
ALTER TABLE ClienteCompra ADD CONSTRAINT PK_ClienteCompra PRIMARY KEY (idClienteCompra)
ALTER TABLE ClienteCotizacion ADD CONSTRAINT PK_ClienteCotizacion PRIMARY KEY (idClienteCotizacion)
ALTER TABLE ClienteCredito ADD CONSTRAINT PK_ClienteCredito PRIMARY KEY (idClienteCredito)
ALTER TABLE ClienteQueja ADD CONSTRAINT PK_ClienteQueja PRIMARY KEY (idClienteQueja)
ALTER TABLE EmpleadoCapacitacion ADD CONSTRAINT PK_EmpleadoCapacitacion PRIMARY KEY (idEmpleadoCapacitacion)
ALTER TABLE EmpleadoContrato ADD CONSTRAINT PK_EmpleadoContrato PRIMARY KEY (idEmpleadoContrato)
ALTER TABLE EmpleadoPrestacion ADD CONSTRAINT PK_EmpleadoPrestacion PRIMARY KEY (idEmpleadoPrestacion)
ALTER TABLE ProductoEnvio ADD CONSTRAINT PK_ProductoEnvio PRIMARY KEY (idProductoEnvio)
ALTER TABLE ProductoOferta ADD CONSTRAINT PK_ProductoOferta PRIMARY KEY (idProductoOferta)
ALTER TABLE ProductoPedidoLinea ADD CONSTRAINT PK_ProductoPedidoLinea PRIMARY KEY (idProductoPedidoLinea)
ALTER TABLE ProductoVenta ADD CONSTRAINT PK_ProductoVenta PRIMARY KEY (idProductoVenta)
ALTER TABLE SucursalEmpleado ADD CONSTRAINT PK_SucursalEmpleado PRIMARY KEY (idSucursalEmpleado)
ALTER TABLE TransportePaquete ADD CONSTRAINT PK_TransportePaquete PRIMARY KEY (idTransportePaquete)



--LLAVES FORANEAS

--Caja
ALTER TABLE Caja ADD CONSTRAINT FK_CajaSucursal FOREIGN KEY (idSucursal) REFERENCES
Sucursal(idSucursal)

--Cliente
ALTER TABLE Cliente ADD CONSTRAINT FK_ClienteMembresia FOREIGN KEY (idMembresia) REFERENCES
Membresia(idMembresia)
ALTER TABLE Cliente ADD CONSTRAINT FK_ClienteTarjetaPunto FOREIGN KEY (idTarjetaPunto) REFERENCES
TarjetaPunto(idTarjetaPunto)

--Compra
ALTER TABLE Compra ADD CONSTRAINT FK_CompraFacturaCliente FOREIGN KEY (idFacturaCliente) REFERENCES
FacturaCliente(idFacturaCliente)
ALTER TABLE Compra ADD CONSTRAINT FK_CompraProducto FOREIGN KEY (idProducto) REFERENCES
Producto(idProducto)

--Delivery
ALTER TABLE Delivery ADD CONSTRAINT FK_DeliverySucursal FOREIGN KEY (idSucursal) REFERENCES
Sucursal(idSucursal)

--Departamento
ALTER TABLE Departamento ADD CONSTRAINT FK_DepartamentoSucursal FOREIGN KEY (idSucursal) REFERENCES
Sucursal(idSucursal)

--Devolucion
ALTER TABLE Devolucion ADD CONSTRAINT FK_DevolucionCliente FOREIGN KEY (idCliente) REFERENCES
Cliente(idCliente)

--Devolucionproveedor
ALTER TABLE DevolucionProveedor ADD CONSTRAINT FK_DDevolucionProveedorProveedor FOREIGN KEY (idProveedor) REFERENCES
Proveedor(idProveedor)

--Equipo Informatico
ALTER TABLE EquipoInformatico ADD CONSTRAINT FK_EquipoInformaticoSucursal FOREIGN KEY (idSucursal) REFERENCES
Sucursal(idSucursal)

--FacturaCliente
ALTER TABLE FacturaCliente ADD CONSTRAINT FK_FacturaClienteCliente FOREIGN KEY (idCliente) REFERENCES
Cliente(idCliente)
ALTER TABLE FacturaCliente ADD CONSTRAINT FK_FacturaClienteContador FOREIGN KEY (idContador) REFERENCES
Contador(idContador)

--FacturaProveedor
ALTER TABLE FacturaProveedor ADD CONSTRAINT FK_FacturaProveedorContador FOREIGN KEY (idContador) REFERENCES
Contador(idContador)

--HorarioTrabajador
ALTER TABLE HorarioTrabajador ADD CONSTRAINT FK_HorarioTrabajadorEmpleado FOREIGN KEY (idEmpleado) REFERENCES
Empleado(idEmpleado)

--Mantenimiento
ALTER TABLE Mantenimiento ADD CONSTRAINT FK_MantenimientoSucursal FOREIGN KEY (idSucursal) REFERENCES
Sucursal(idSucursal)

--Marketing
ALTER TABLE Marketing ADD CONSTRAINT FK_MarketingSucursal FOREIGN KEY (idSucursal) REFERENCES
Sucursal(idSucursal)

--Materiaprima
ALTER TABLE MateriaPrima ADD CONSTRAINT FK_MateriaPrimaProducto FOREIGN KEY (idProducto) REFERENCES
Producto(idProducto)

--Membresias
ALTER TABLE Membresia ADD CONSTRAINT FK_MembresiaSucursal FOREIGN KEY (idSucursal) REFERENCES
Sucursal(idSucursal)


--Mobiliario
ALTER TABLE Mobiliario ADD CONSTRAINT FK_MobiliarioSucursal FOREIGN KEY (idSucursal) REFERENCES
Sucursal(idSucursal)

--Nomina
ALTER TABLE Nomina ADD CONSTRAINT FK_NominaContador FOREIGN KEY (idContador) REFERENCES
Contador(idContador)

--PagoServicio
ALTER TABLE PagoServicio ADD CONSTRAINT FK_PagoServicioSucursal FOREIGN KEY (idSucursal) REFERENCES
Sucursal(idSucursal)

--Paquete
ALTER TABLE Paquete ADD CONSTRAINT FK_PaqueteEnvio FOREIGN KEY (idEnvio) REFERENCES
Envio(idEnvio)
ALTER TABLE Paquete ADD CONSTRAINT FK_PaquetePedidoLinea FOREIGN KEY (idPedidoLinea) REFERENCES
PedidoLinea(idPedidoLinea)

--Pasillo
ALTER TABLE Pasillo ADD CONSTRAINT FK_PasilloSucursal FOREIGN KEY (idSucursal) REFERENCES
Sucursal(idSucursal)


--Produccion
ALTER TABLE Produccion ADD CONSTRAINT FK_ProduccionMarca FOREIGN KEY (idMarca) REFERENCES
Marca(idMarca)

--Producto
ALTER TABLE Producto ADD CONSTRAINT FK_ProductoBodega FOREIGN KEY (idBodega) REFERENCES
Bodega(idBodega)
ALTER TABLE Producto ADD CONSTRAINT FK_ProductoDevolucion FOREIGN KEY (idDevolucion) REFERENCES
Devolucion(idDevolucion)
ALTER TABLE Producto ADD CONSTRAINT FK_ProductoProduccion FOREIGN KEY (idProduccion) REFERENCES
Produccion(idProduccion)

--Tarjetapunto
ALTER TABLE TarjetaPunto ADD CONSTRAINT FK_TarjetaProductoSucursal FOREIGN KEY (idSucursal) REFERENCES
Sucursal(idSucursal)

--Vigilancia
ALTER TABLE Vigilancia ADD CONSTRAINT FK_VigilanciaSucursal FOREIGN KEY (idSucursal) REFERENCES
Sucursal(idSucursal)


---BODEGAInventario

ALTER TABLE BodegaInventario ADD CONSTRAINT FK_BodegaInventarioBodega FOREIGN KEY (idBodega) REFERENCES
Bodega (idBodega)
ALTER TABLE BodegaInventario ADD CONSTRAINT FK_BodegaInventarioInventario FOREIGN KEY (idInventario) REFERENCES
Inventario (idInventario)

--ClienteCompra
ALTER TABLE ClienteCompra ADD CONSTRAINT FK_ClienteCompraCliente FOREIGN KEY (idCliente) REFERENCES
Cliente (idCliente)
ALTER TABLE ClienteCompra ADD CONSTRAINT FK_ClienteCompraCompra FOREIGN KEY (idCompra) REFERENCES
Compra (idCompra)

--ClienteCotizacion
ALTER TABLE ClienteCotizacion ADD CONSTRAINT FK_ClienteCotizacionCliente FOREIGN KEY (idCliente) REFERENCES
Cliente (idCliente)
ALTER TABLE ClienteCotizacion ADD CONSTRAINT FK_ClienteCotizacionCotizacion FOREIGN KEY (idCotizacion) REFERENCES
Cotizacion (idCotizacion)

--ClienteCredito
ALTER TABLE ClienteCredito ADD CONSTRAINT FK_ClienteCreditoCliente FOREIGN KEY (idCliente) REFERENCES
Cliente (idCliente)
ALTER TABLE ClienteCredito ADD CONSTRAINT FK_ClienteCreditoCredito FOREIGN KEY (idCredito) REFERENCES
Credito (idCredito)

--ClienteQueja
ALTER TABLE ClienteQueja ADD CONSTRAINT FK_ClienteQuejaCliente FOREIGN KEY (idCliente) REFERENCES
Cliente (idCliente)
ALTER TABLE ClienteQueja ADD CONSTRAINT FK_ClienteQuejaQueja FOREIGN KEY (idQueja) REFERENCES
Queja (idQueja)

--EmpleadoCapacitacion
ALTER TABLE EmpleadoCapacitacion ADD CONSTRAINT FK_EmpleadoCapacitacionEmpleado FOREIGN KEY (idEmpleado) REFERENCES
Empleado (idEmpleado)
ALTER TABLE EmpleadoCapacitacion ADD CONSTRAINT FK_EmpleadoCapacitacionCapacitacion FOREIGN KEY (idCapacitacion) REFERENCES
Capacitacion (idCapacitacion)

--EmpleadoContrato
ALTER TABLE EmpleadoContrato ADD CONSTRAINT FK_EmpleadoContratoEmpleado FOREIGN KEY (idEmpleado) REFERENCES
Empleado (idEmpleado)
ALTER TABLE EmpleadoContrato ADD CONSTRAINT FK_EmpleadoContratoContrato FOREIGN KEY (idContrato) REFERENCES
Contrato (idContrato)
--ProductoEnvio
ALTER TABLE ProductoEnvio ADD CONSTRAINT FK_ProductoEnvioProducto FOREIGN KEY (idProducto) REFERENCES
Producto (idProducto)
ALTER TABLE ProductoEnvio ADD CONSTRAINT FK_ProductoEnvioEnvio FOREIGN KEY (idEnvio) REFERENCES
Envio (idEnvio)
--ProductoOferta
ALTER TABLE ProductoOferta ADD CONSTRAINT FK_ProductoOfertaProducto FOREIGN KEY (idProducto) REFERENCES
Producto (idProducto)
ALTER TABLE ProductoOferta ADD CONSTRAINT FK_ProductoOfertaOferta FOREIGN KEY (idOferta) REFERENCES
Oferta (idOferta)
--ProductoPedidoLinea
ALTER TABLE ProductoPedidoLinea ADD CONSTRAINT FK_ProductoPedidoLineaProducto FOREIGN KEY (idProducto) REFERENCES
Producto (idProducto)
ALTER TABLE ProductoPedidoLinea ADD CONSTRAINT FK_ProductoPedidoLineaPedidoLinea FOREIGN KEY (idPedidoLinea) REFERENCES
Producto (idProducto)
--ProductoVenta
ALTER TABLE ProductoVenta ADD CONSTRAINT FK_ProductoVentaProducto FOREIGN KEY (idProducto) REFERENCES
Producto (idProducto)
ALTER TABLE ProductoVenta ADD CONSTRAINT FK_ProductoVentaVenta FOREIGN KEY (idVenta) REFERENCES
Venta (idVenta)
--SucursalEmpleado
ALTER TABLE SucursalEmpleado ADD CONSTRAINT FK_SucursalEmpleadoSucursal FOREIGN KEY (idSucursal) REFERENCES
Sucursal (idSucursal)
ALTER TABLE SucursalEmpleado ADD CONSTRAINT FK_SucursalEmpleadoEmpleado FOREIGN KEY (idEmpleado) REFERENCES
Empleado (idEmpleado)
--TransportePaquete
ALTER TABLE TransportePaquete ADD CONSTRAINT FK_TransportePaqueteTransporte FOREIGN KEY (idTransporte) REFERENCES
Transporte (idTransporte)
ALTER TABLE TransportePaquete ADD CONSTRAINT FK_TransportePaquetePaquete FOREIGN KEY (idPaquete) REFERENCES
Paquete (idPaquete)


--Puesto
ALTER TABLE Puesto ADD CONSTRAINT PuestoEmpleado FOREIGN KEY (idEmpleado) REFERENCES
Empleado(idEmpleado)

--Restaurante
ALTER TABLE Restaurante ADD CONSTRAINT RestauranteSucursal FOREIGN KEY (idSucursal) REFERENCES
Sucursal(idSucursal)

--Representante
ALTER TABLE Proveedor ADD CONSTRAINT ProveedorRepresentante FOREIGN KEY (idRepresentante) REFERENCES
Representante(idRepresentante)


--Prestacion
ALTER TABLE Prestacion ADD CONSTRAINT PrestacionEmpleado FOREIGN KEY (idEmpleado) REFERENCES
Empleado(idEmpleado)

--MetodoPago
ALTER TABLE MetodoPago ADD CONSTRAINT MetodoPagoCliente FOREIGN KEY (idCliente) REFERENCES
Cliente(idCliente)

--EmpleadoPrestacion
ALTER TABLE EmpleadoPrestacion ADD CONSTRAINT EmpleadoPrestacionEmpleado FOREIGN KEY (idEmpleado) REFERENCES
Empleado(idEmpleado)
ALTER TABLE EmpleadoPrestacion ADD CONSTRAINT EmpleadoPrestacionPrestacion FOREIGN KEY (idPrestacion) REFERENCES
Prestacion(idPrestacion)

--Estacionamiento
ALTER TABLE Estacionamiento ADD CONSTRAINT EstacionamientoSucursal  FOREIGN KEY (idSucursal) REFERENCES
Sucursal(idSucursal)
--Convenio
ALTER TABLE Convenio ADD CONSTRAINT ConvenioCliente FOREIGN KEY (idCliente) REFERENCES
Cliente(idCliente)

--Empresa
ALTER TABLE Representante ADD CONSTRAINT RepresentanteEmpresa FOREIGN KEY (idEmpresa) REFERENCES
Empresa(idEmpresa)

--Comprobante
ALTER TABLE Comprobante ADD CONSTRAINT ComprobanteCompra FOREIGN KEY (idCompra) REFERENCES
Compra(idCompra)



--INDICES
CREATE INDEX IX_Bodega ON Bodega(idBodega)
CREATE INDEX IX_Caja ON Caja(idCaja)
CREATE INDEX IX_Capacitacion ON Capacitacion(idCapacitacion)
CREATE INDEX IX_Cliente ON Cliente(idCliente)
CREATE INDEX IX_Compra ON Compra(idCompra)
CREATE INDEX IX_Comprobante ON Comprobante(idComprobante)
CREATE INDEX IX_Contador ON Contador(idContador)
CREATE INDEX IX_Contrato ON Contrato(idContrato)
CREATE INDEX IX_Convenio ON Convenio(idConvenio)
CREATE INDEX IX_Cotizacion ON Cotizacion(idCotizacion)
CREATE INDEX IX_Credito ON Credito(idCredito)
CREATE INDEX IX_Delivery ON Delivery(idDelivery)
CREATE INDEX IX_Departamento ON Departamento(idDepartamento)
CREATE INDEX IX_Devolucion ON Devolucion(idDevolucion)
CREATE INDEX IX_Devolucionproveedor ON Devolucionproveedor(idDevolucionproveedor)
CREATE INDEX IX_Empleado ON Empleado(idEmpleado)
CREATE INDEX IX_Empresa ON Empresa(idEmpresa)
CREATE INDEX IX_Envio ON Envio(idEnvio)
CREATE INDEX IX_Equipoinformatico ON Equipoinformatico(idEquipoinformatico)
CREATE INDEX IX_Facturacliente ON Facturacliente(idFacturaCliente)
CREATE INDEX IX_Facturaproveedor ON Facturaproveedor(idFacturaproveedor)
CREATE INDEX IX_Horariotrabajador ON Horariotrabajador (idHorariotrabajador)
CREATE INDEX IX_Inventario ON Inventario(idInventario)
CREATE INDEX IX_Mantenimiento ON Mantenimiento(idMantenimiento)
CREATE INDEX IX_Marca ON Marca(idMarca)
CREATE INDEX IX_Marketing ON Marketing(idMarketing)
CREATE INDEX IX_Materiaprima ON Materiaprima(idMateriaprima)
CREATE INDEX IX_Membresia ON Membresia(idMembresia)
CREATE INDEX IX_Metodopago ON Metodopago(idMetodopago)
CREATE INDEX IX_Mobiliario ON Mobiliario(idMobiliario)
CREATE INDEX IX_Nomina ON Nomina(idNomina)
CREATE INDEX IX_Oferta ON Oferta(idOferta)
CREATE INDEX IX_Pagoservicio ON Pagoservicio(idPagoservicio)
CREATE INDEX IX_Paquete ON Paquete(idPaquete)
CREATE INDEX IX_Pasillo ON Pasillo(idPasillo)
CREATE INDEX IX_Pedidolinea ON Pedidolinea(idPedidoLinea)
CREATE INDEX IX_Prestacion ON Prestacion(idPrestacion)
CREATE INDEX IX_Produccion ON Produccion(idProduccion)
CREATE INDEX IX_Producto ON Producto(idProducto)
CREATE INDEX IX_Proveedor ON Proveedor(idProveedor)
CREATE INDEX IX_Puesto ON Puesto(idPuesto)
CREATE INDEX IX_Queja ON Queja(idQueja)
CREATE INDEX IX_Representante ON Representante(idRepresentante)
CREATE INDEX IX_Restaurante ON Restaurante(idRestaurante)
CREATE INDEX IX_Sucursal ON Sucursal(idSucursal)
CREATE INDEX IX_Tarjetapunto ON Tarjetapunto(idTarjetapunto)
CREATE INDEX IX_Transporte ON Transporte(idTransporte)
CREATE INDEX IX_Venta ON Venta(idVenta)
CREATE INDEX IX_Vigilancia ON Vigilancia(idVigilancia)
CREATE INDEX IX_BodegaInventario ON BodegaInventario(idBodegaInventario)
CREATE INDEX IX_ClienteCompra ON ClienteCompra(idClienteCompra)
CREATE INDEX IX_ClienteCotizacion ON ClienteCotizacion(idClienteCotizacion)
CREATE INDEX IX_ClienteCredito ON ClienteCredito(idClienteCredito)
CREATE INDEX IX_ClienteQueja ON ClienteQueja(idClienteQueja)
CREATE INDEX IX_EmpleadoCapacitacion ON EmpleadoCapacitacion(idEmpleadoCapacitacion)
CREATE INDEX IX_EmpleadoPrestacion ON EmpleadoPrestacion(idEmpleadoPrestacion)
CREATE INDEX IX_ProductoEnvio ON ProductoEnvio(idProductoEnvio)
CREATE INDEX IX_ProductoOferta ON ProductoOferta(idProductoOferta)
CREATE INDEX IX_ProductoPedidoLinea ON ProductoPedidoLinea(idProductoPedidoLinea)
CREATE INDEX IX_ProductoVenta ON ProductoVenta(idProductoVenta)
CREATE INDEX IX_SucursalEmpleado ON SucursalEmpleado(idSucursalEmpleado)
CREATE INDEX IX_TransportePaquete ON TransportePaquete(idTransportePaquete) 




--Bodega
INSERT INTO Bodega(numero, total) values (1, 1)
GO
INSERT INTO Bodega(numero, total) values (2, 2)
GO
INSERT INTO Bodega(numero, total) values (3, 3)
GO
INSERT INTO Bodega(numero, total) values (4, 4)
GO
INSERT INTO Bodega(numero, total) values (5, 5)
GO
INSERT INTO Bodega(numero, total) values (6, 6)
GO
INSERT INTO Bodega(numero, total) values (7, 7)
GO
INSERT INTO Bodega(numero, total) values (8, 8)
GO
INSERT INTO Bodega(numero, total) values (9, 9)
GO
INSERT INTO Bodega(numero, total) values (10, 10)
GO

--Capacitacion
INSERT INTO Capacitacion(nombre, tipo, numero) values ('Nombre1', 'Tipo1', 1)
GO
INSERT INTO Capacitacion(nombre, tipo, numero) values ('Nombre2', 'Tipo2', 2)
GO
INSERT INTO Capacitacion(nombre, tipo, numero) values ('Nombre3', 'Tipo3', 3)
GO
INSERT INTO Capacitacion(nombre, tipo, numero) values ('Nombre4', 'Tipo4', 4)
GO
INSERT INTO Capacitacion(nombre, tipo, numero) values ('Nombre5', 'Tipo5', 5)
GO
INSERT INTO Capacitacion(nombre, tipo, numero) values ('Nombre6', 'Tipo6', 6)
GO
INSERT INTO Capacitacion(nombre, tipo, numero) values ('Nombre7', 'Tipo7', 7)
GO
INSERT INTO Capacitacion(nombre, tipo, numero) values ('Nombre8', 'Tipo8', 8)
GO
INSERT INTO Capacitacion(nombre, tipo, numero) values ('Nombre9', 'Tipo9', 9)
GO
INSERT INTO Capacitacion(nombre, tipo, numero) values ('Nombre10', 'Tipo10', 10)
GO

--Comprobante
INSERT INTO Comprobante(fecha, cantidad, productos) values ('4/12/2022', 1, 'producto1')
GO
INSERT INTO Comprobante(fecha, cantidad, productos) values ('4/12/2022', 2, 'producto2')
GO
INSERT INTO Comprobante(fecha, cantidad, productos) values ('4/12/2022', 3, 'producto3')
GO
INSERT INTO Comprobante(fecha, cantidad, productos) values ('4/12/2022', 4, 'producto4')
GO
INSERT INTO Comprobante(fecha, cantidad, productos) values ('4/12/2022', 5, 'producto5')
GO
INSERT INTO Comprobante(fecha, cantidad, productos) values ('4/12/2022', 6, 'producto6')
GO
INSERT INTO Comprobante(fecha, cantidad, productos) values ('4/12/2022', 7, 'producto7')
GO
INSERT INTO Comprobante(fecha, cantidad, productos) values ('4/12/2022', 8, 'producto8')
GO
INSERT INTO Comprobante(fecha, cantidad, productos) values ('4/12/2022', 9, 'producto9')
GO
INSERT INTO Comprobante(fecha, cantidad, productos) values ('4/12/2022', 10, 'producto10')
GO

--Contador
INSERT INTO Contador(nombre, apellidopaterno, apellidomaterno, calle, numero, ciudad, telefono) values ('nombre1', 'apellidop1', 'apellidom1', 'calle1', 1, 'ciudad1', 1)
GO
INSERT INTO Contador(nombre, apellidopaterno, apellidomaterno, calle, numero, ciudad, telefono) values ('nombre2', 'apellidop2', 'apellidom2', 'calle2', 2,'ciudad2', 2)
GO
INSERT INTO Contador(nombre, apellidopaterno, apellidomaterno, calle, numero, ciudad, telefono) values ('nombre3', 'apellidop3', 'apellidom3', 'calle3', 3, 'ciudad3', 3)
GO
INSERT INTO Contador(nombre, apellidopaterno, apellidomaterno, calle, numero, ciudad, telefono) values ('nombre4', 'apellidop4', 'apellidom4', 'calle4', 4,'ciudad4', 4)
GO
INSERT INTO Contador(nombre, apellidopaterno, apellidomaterno, calle, numero, ciudad, telefono) values ('nombre5', 'apellidop5', 'apellidom5', 'calle5', 5, 'ciudad5', 5)
GO
INSERT INTO Contador(nombre, apellidopaterno, apellidomaterno, calle, numero, ciudad, telefono) values ('nombre6', 'apellidop6', 'apellidom6', 'calle6', 6, 'ciudad6', 6)
GO
INSERT INTO Contador(nombre, apellidopaterno, apellidomaterno, calle, numero, ciudad, telefono) values ('nombre7', 'apellidop7', 'apellidom7', 'calle7', 7, 'ciudad7', 7)
GO
INSERT INTO Contador(nombre, apellidopaterno, apellidomaterno, calle, numero, ciudad, telefono) values ('nombre8', 'apellidop8', 'apellidom8', 'calle8', 8, 'ciudad8', 8)
GO
INSERT INTO Contador(nombre, apellidopaterno, apellidomaterno, calle, numero, ciudad, telefono) values ('nombre9', 'apellidop9', 'apellidom9', 'calle9', 9, 'ciudad9',9)
GO
INSERT INTO Contador(nombre, apellidopaterno, apellidomaterno, calle, numero, ciudad, telefono) values ('nombre10', 'apellidop10', 'apellidom10', 'calle10', 10,'ciudad10', 10)
GO

--Contrato
INSERT INTO Contrato(numero, fecha, nombre, servicios) values (1, '4/12/2022', 'nombre1', 'servicios1')
GO
INSERT INTO Contrato(numero, fecha, nombre, servicios) values (2, '4/12/2022', 'nombre2', 'servicios2')
GO
INSERT INTO Contrato(numero, fecha, nombre, servicios) values (3, '4/12/2022', 'nombre3', 'servicios3')
GO
INSERT INTO Contrato(numero, fecha, nombre, servicios) values (4, '4/12/2022', 'nombre4', 'servicios4')
GO
INSERT INTO Contrato(numero, fecha, nombre, servicios) values (5, '4/12/2022', 'nombre5', 'servicios5')
GO
INSERT INTO Contrato(numero, fecha, nombre, servicios) values (6, '4/12/2022', 'nombre6', 'servicios6')
GO
INSERT INTO Contrato(numero, fecha, nombre, servicios) values (7, '4/12/2022', 'nombre7', 'servicios7')
GO
INSERT INTO Contrato(numero, fecha, nombre, servicios) values (8, '4/12/2022', 'nombre8', 'servicios8')
GO
INSERT INTO Contrato(numero, fecha, nombre, servicios) values (9, '4/12/2022', 'nombre9', 'servicios9')
GO
INSERT INTO Contrato(numero, fecha, nombre, servicios) values (10, '4/12/2022', 'nombre10', 'servicios10')
GO

--Convenio
INSERT INTO Convenio(fecha, cantidad) values ('4/12/2022', 1)
GO
INSERT INTO Convenio(fecha, cantidad) values ('4/12/2022', 2)
GO
INSERT INTO Convenio(fecha, cantidad) values ('4/12/2022', 3)
GO
INSERT INTO Convenio(fecha, cantidad) values ('4/12/2022', 4)
GO
INSERT INTO Convenio(fecha, cantidad) values ('4/12/2022', 5)
GO
INSERT INTO Convenio(fecha, cantidad) values ('4/12/2022', 6)
GO
INSERT INTO Convenio(fecha, cantidad) values ('4/12/2022', 7)
GO
INSERT INTO Convenio(fecha, cantidad) values ('4/12/2022', 8)
GO
INSERT INTO Convenio(fecha, cantidad) values ('4/12/2022', 9)
GO
INSERT INTO Convenio(fecha, cantidad) values ('4/12/2022', 10)
GO

--Cotizacion
INSERT INTO Cotizacion(cantidad, producto) values (1, 'producto1')
GO
INSERT INTO Cotizacion(cantidad, producto) values (2, 'producto2')
GO
INSERT INTO Cotizacion(cantidad, producto) values (3, 'producto3')
GO
INSERT INTO Cotizacion(cantidad, producto) values (4, 'producto4')
GO
INSERT INTO Cotizacion(cantidad, producto) values (5, 'producto5')
GO
INSERT INTO Cotizacion(cantidad, producto) values (6, 'producto6')
GO
INSERT INTO Cotizacion(cantidad, producto) values (7, 'producto7')
GO
INSERT INTO Cotizacion(cantidad, producto) values (8, 'producto8')
GO
INSERT INTO Cotizacion(cantidad, producto) values (9, 'producto9')
GO
INSERT INTO Cotizacion(cantidad, producto) values (10, 'producto10')
GO


--Credito
INSERT INTO Credito(creditoDisponible, creditoDebe, fecha) values (1, 1, '4/12/2022')
GO
INSERT INTO Credito(creditoDisponible, creditoDebe, fecha) values (2, 2, '4/12/2022')
GO
INSERT INTO Credito(creditoDisponible, creditoDebe, fecha) values (3, 3, '4/12/2022')
GO
INSERT INTO Credito(creditoDisponible, creditoDebe, fecha) values (4, 4, '4/12/2022')
GO
INSERT INTO Credito(creditoDisponible, creditoDebe, fecha) values (5, 5, '4/12/2022')
GO
INSERT INTO Credito(creditoDisponible, creditoDebe, fecha) values (6, 6, '4/12/2022')
GO
INSERT INTO Credito(creditoDisponible, creditoDebe, fecha) values (7, 7, '4/12/2022')
GO
INSERT INTO Credito(creditoDisponible, creditoDebe, fecha) values (8, 8, '4/12/2022')
GO
INSERT INTO Credito(creditoDisponible, creditoDebe, fecha) values (9, 9, '4/12/2022')
GO
INSERT INTO Credito(creditoDisponible, creditoDebe, fecha) values (10, 10, '4/12/2022')
GO

--Empleado
INSERT INTO Empleado(nombre, apellidopaterno, apellidomaterno, curp, telefono, calle, numero, colonia, ciudad) values('nombre1', 'apellidopaterno1', 'apellidomaterno1', 'curp1', 1, 'calle1', 1, 'colonia1', 'ciudad1')
GO
INSERT INTO Empleado(nombre, apellidopaterno, apellidomaterno, curp, telefono, calle, numero, colonia, ciudad) values('nombre2', 'apellidopaterno2', 'apellidomaterno2', 'curp2', 2, 'calle1', 2, 'colonia2', 'ciudad2')
GO
INSERT INTO Empleado(nombre, apellidopaterno, apellidomaterno, curp, telefono, calle, numero, colonia, ciudad) values('nombre3', 'apellidopaterno3', 'apellidomaterno3', 'curp3', 3, 'calle1', 3, 'colonia3', 'ciudad3')
GO
INSERT INTO Empleado(nombre, apellidopaterno, apellidomaterno, curp, telefono, calle, numero, colonia, ciudad) values('nombre4', 'apellidopaterno4', 'apellidomaterno4', 'curp4', 4, 'calle1', 4, 'colonia4', 'ciudad4')
GO
INSERT INTO Empleado(nombre, apellidopaterno, apellidomaterno, curp, telefono, calle, numero, colonia, ciudad) values('nombre5', 'apellidopaterno5', 'apellidomaterno5', 'curp5', 5, 'calle1', 5, 'colonia5', 'ciudad5')
GO
INSERT INTO Empleado(nombre, apellidopaterno, apellidomaterno, curp, telefono, calle, numero, colonia, ciudad) values('nombre6', 'apellidopaterno6', 'apellidomaterno6', 'curp6', 6, 'calle1', 6, 'colonia6', 'ciudad6')
GO
INSERT INTO Empleado(nombre, apellidopaterno, apellidomaterno, curp, telefono, calle, numero, colonia, ciudad) values('nombre7', 'apellidopaterno7', 'apellidomaterno7', 'curp7', 7, 'calle1', 7, 'colonia7', 'ciudad7')
GO
INSERT INTO Empleado(nombre, apellidopaterno, apellidomaterno, curp, telefono, calle, numero, colonia, ciudad) values('nombre8', 'apellidopaterno8', 'apellidomaterno8', 'curp8', 8, 'calle1', 8, 'colonia8', 'ciudad8')
GO
INSERT INTO Empleado(nombre, apellidopaterno, apellidomaterno, curp, telefono, calle, numero, colonia, ciudad) values('nombre8', 'apellidopaterno9', 'apellidomaterno9', 'curp9', 9, 'calle1', 9, 'colonia9', 'ciudad9')
GO
INSERT INTO Empleado(nombre, apellidopaterno, apellidomaterno, curp, telefono, calle, numero, colonia, ciudad) values('nombre10', 'apellidopaterno10', 'apellidomaterno10', 'curp10', 10, 'calle1', 10, 'colonia10', 'ciudad10')
GO

--Empresa
INSERT INTO Empresa(nombre, telefono, calle, estado, numero, colonia, ciudad) values('nombre1', 1, 'calle1', 'estado1', 1, 'colonia1', 'ciudad1')
GO
INSERT INTO Empresa(nombre, telefono, calle, estado, numero, colonia, ciudad) values('nombre2', 2, 'calle2', 'estado2', 2, 'colonia2', 'ciudad2')
GO
INSERT INTO Empresa(nombre, telefono, calle, estado, numero, colonia, ciudad) values('nombre3', 3, 'calle3', 'estado3', 3, 'colonia3', 'ciudad3')
GO
INSERT INTO Empresa(nombre, telefono, calle, estado, numero, colonia, ciudad) values('nombre4', 4, 'calle4', 'estado4', 4, 'colonia4', 'ciudad4')
GO
INSERT INTO Empresa(nombre, telefono, calle, estado, numero, colonia, ciudad) values('nombre5', 5, 'calle5', 'estado5', 5, 'colonia5', 'ciudad5')
GO
INSERT INTO Empresa(nombre, telefono, calle, estado, numero, colonia, ciudad) values('nombre6', 6, 'calle6', 'estado6', 6, 'colonia6', 'ciudad6')
GO
INSERT INTO Empresa(nombre, telefono, calle, estado, numero, colonia, ciudad) values('nombre7', 7, 'calle7', 'estado7', 7, 'colonia7', 'ciudad7')
GO
INSERT INTO Empresa(nombre, telefono, calle, estado, numero, colonia, ciudad) values('nombre8', 8, 'calle8', 'estado8', 8, 'colonia8', 'ciudad8')
GO
INSERT INTO Empresa(nombre, telefono, calle, estado, numero, colonia, ciudad) values('nombre9', 9, 'calle9', 'estado9', 9, 'colonia9', 'ciudad9')
GO
INSERT INTO Empresa(nombre, telefono, calle, estado, numero, colonia, ciudad) values('nombre10', 10, 'calle10', 'estado10', 10, 'colonia10', 'ciudad10')
GO

--Envio
INSERT INTO Envio(nombre, apellidopaterno, apellidomaterno, calle, estado, numero, colonia, ciudad, cantidad, categoria, fecha) values ('nombre1', 'apellidopaterno1', 'apellidomaterno1', 'calle1', 'estado1', 1, 'colonia1', 'ciudad1', 1, 'categoria1', '4/12/2022')
GO
INSERT INTO Envio(nombre, apellidopaterno, apellidomaterno, calle, estado, numero, colonia, ciudad, cantidad, categoria, fecha) values ('nombre2', 'apellidopaterno2', 'apellidomaterno2', 'calle2', 'estado2', 2, 'colonia2', 'ciudad2', 2, 'categoria2', '4/12/2022')
GO
INSERT INTO Envio(nombre, apellidopaterno, apellidomaterno, calle, estado, numero, colonia, ciudad, cantidad, categoria, fecha) values ('nombre3', 'apellidopaterno3', 'apellidomaterno3', 'calle3', 'estado3', 3, 'colonia3', 'ciudad3', 3, 'categoria3', '4/12/2022')
GO
INSERT INTO Envio(nombre, apellidopaterno, apellidomaterno, calle, estado, numero, colonia, ciudad, cantidad, categoria, fecha) values ('nombre4', 'apellidopaterno4', 'apellidomaterno4', 'calle4', 'estado4', 4, 'colonia4', 'ciudad4', 4, 'categoria4', '4/12/2022')
GO
INSERT INTO Envio(nombre, apellidopaterno, apellidomaterno, calle, estado, numero, colonia, ciudad, cantidad, categoria, fecha) values ('nombre5', 'apellidopaterno5', 'apellidomaterno5', 'calle5', 'estado5', 5, 'colonia5', 'ciudad5', 5, 'categoria5', '4/12/2022')
GO
INSERT INTO Envio(nombre, apellidopaterno, apellidomaterno, calle, estado, numero, colonia, ciudad, cantidad, categoria, fecha) values ('nombre6', 'apellidopaterno6', 'apellidomaterno6', 'calle6', 'estado6', 6, 'colonia6', 'ciudad6', 6, 'categoria6', '4/12/2022')
GO
INSERT INTO Envio(nombre, apellidopaterno, apellidomaterno, calle, estado, numero, colonia, ciudad, cantidad, categoria, fecha) values ('nombre7', 'apellidopaterno7', 'apellidomaterno7', 'calle7', 'estado7', 7, 'colonia7', 'ciudad7', 7, 'categoria7', '4/12/2022')
GO
INSERT INTO Envio(nombre, apellidopaterno, apellidomaterno, calle, estado, numero, colonia, ciudad, cantidad, categoria, fecha) values ('nombre8', 'apellidopaterno8', 'apellidomaterno8', 'calle8', 'estado8', 8, 'colonia8', 'ciudad8', 8, 'categoria8', '4/12/2022')
GO
INSERT INTO Envio(nombre, apellidopaterno, apellidomaterno, calle, estado, numero, colonia, ciudad, cantidad, categoria, fecha) values ('nombre9', 'apellidopaterno9', 'apellidomaterno9', 'calle9', 'estado9', 9, 'colonia9', 'ciudad9', 9, 'categoria9', '4/12/2022')
GO
INSERT INTO Envio(nombre, apellidopaterno, apellidomaterno, calle, estado, numero, colonia, ciudad, cantidad, categoria, fecha) values ('nombre10', 'apellidopaterno10', 'apellidomaterno10', 'calle10', 'estado10', 10, 'colonia10', 'ciudad10', 10, 'categoria10', '4/12/2022')
GO


--Estacionamiento
INSERT INTO Estacionamiento(lugar, tipo) values (1, 'tipo1')
GO
INSERT INTO Estacionamiento(lugar, tipo) values (2, 'tipo2')
GO
INSERT INTO Estacionamiento(lugar, tipo) values (3, 'tipo3')
GO
INSERT INTO Estacionamiento(lugar, tipo) values (4, 'tipo4')
GO
INSERT INTO Estacionamiento(lugar, tipo) values (5, 'tipo5')
GO
INSERT INTO Estacionamiento(lugar, tipo) values (6, 'tipo6')
GO
INSERT INTO Estacionamiento(lugar, tipo) values (7, 'tipo7')
GO
INSERT INTO Estacionamiento(lugar, tipo) values (8, 'tipo8')
GO
INSERT INTO Estacionamiento(lugar, tipo) values (9, 'tipo9')
GO
INSERT INTO Estacionamiento(lugar, tipo) values (10, 'tipo10')
GO

--Inventario
INSERT INTO Inventario(nombre, tipo, fecha) values ('nombre1', 'tipo1', '4/12/2022')
GO
INSERT INTO Inventario(nombre, tipo, fecha) values ('nombre2', 'tipo2', '4/12/2022')
GO
INSERT INTO Inventario(nombre, tipo, fecha) values ('nombre3', 'tipo3', '4/12/2022')
GO
INSERT INTO Inventario(nombre, tipo, fecha) values ('nombre4', 'tipo4', '4/12/2022')
GO
INSERT INTO Inventario(nombre, tipo, fecha) values ('nombre5', 'tipo5', '4/12/2022')
GO
INSERT INTO Inventario(nombre, tipo, fecha) values ('nombre6', 'tipo6', '4/12/2022')
GO
INSERT INTO Inventario(nombre, tipo, fecha) values ('nombre7', 'tipo7', '4/12/2022')
GO
INSERT INTO Inventario(nombre, tipo, fecha) values ('nombre8', 'tipo8', '4/12/2022')
GO
INSERT INTO Inventario(nombre, tipo, fecha) values ('nombre9', 'tipo9', '4/12/2022')
GO
INSERT INTO Inventario(nombre, tipo, fecha) values ('nombre10', 'tipo10', '4/12/2022')
GO

--Marca
INSERT INTO Marca(nombre, ciudad) values ('nombre1', 'ciudad1')
GO
INSERT INTO Marca(nombre, ciudad) values ('nombre2', 'ciudad2')
GO
INSERT INTO Marca(nombre, ciudad) values ('nombre3', 'ciudad3')
GO
INSERT INTO Marca(nombre, ciudad) values ('nombre4', 'ciudad4')
GO
INSERT INTO Marca(nombre, ciudad) values ('nombre5', 'ciudad5')
GO
INSERT INTO Marca(nombre, ciudad) values ('nombre6', 'ciudad6')
GO
INSERT INTO Marca(nombre, ciudad) values ('nombre7', 'ciudad7')
GO
INSERT INTO Marca(nombre, ciudad) values ('nombre8', 'ciudad8')
GO
INSERT INTO Marca(nombre, ciudad) values ('nombre9', 'ciudad9')
GO
INSERT INTO Marca(nombre, ciudad) values ('nombre10', 'ciudad10')
GO

--Oferta
INSERT INTO Oferta(producto, precio, precioanterior) values ('producto1', 'precio1', 'precioanterior1')
GO
INSERT INTO Oferta(producto, precio, precioanterior) values ('producto2', 'precio2', 'precioanterior2')
GO
INSERT INTO Oferta(producto, precio, precioanterior) values ('producto3', 'precio3', 'precioanterior3')
GO
INSERT INTO Oferta(producto, precio, precioanterior) values ('producto4', 'precio4', 'precioanterior4')
GO
INSERT INTO Oferta(producto, precio, precioanterior) values ('producto5', 'precio5', 'precioanterior5')
GO
INSERT INTO Oferta(producto, precio, precioanterior) values ('producto6', 'precio6', 'precioanterior6')
GO
INSERT INTO Oferta(producto, precio, precioanterior) values ('producto7', 'precio7', 'precioanterior7')
GO
INSERT INTO Oferta(producto, precio, precioanterior) values ('producto8', 'precio8', 'precioanterior8')
GO
INSERT INTO Oferta(producto, precio, precioanterior) values ('producto9', 'precio9', 'precioanterior9')
GO
INSERT INTO Oferta(producto, precio, precioanterior) values ('producto10', 'precio10', 'precioanterior10')
GO

--PedidoLinea
INSERT INTO PedidoLinea(fecha, cantidad, producto, total) values ('4/12/2022', 1, 'producto1', '1')
GO
INSERT INTO PedidoLinea(fecha, cantidad, producto, total) values ('4/12/2022', 2, 'producto2', '2')
GO
INSERT INTO PedidoLinea(fecha, cantidad, producto, total) values ('4/12/2022', 3, 'producto3', '3')
GO
INSERT INTO PedidoLinea(fecha, cantidad, producto, total) values ('4/12/2022', 4, 'producto4', '4')
GO
INSERT INTO PedidoLinea(fecha, cantidad, producto, total) values ('4/12/2022', 5, 'producto5', '5')
GO
INSERT INTO PedidoLinea(fecha, cantidad, producto, total) values ('4/12/2022', 6, 'producto6', '6')
GO
INSERT INTO PedidoLinea(fecha, cantidad, producto, total) values ('4/12/2022', 7, 'producto7', '7')
GO
INSERT INTO PedidoLinea(fecha, cantidad, producto, total) values ('4/12/2022', 8, 'producto8', '8')
GO
INSERT INTO PedidoLinea(fecha, cantidad, producto, total) values ('4/12/2022', 9, 'producto9', '9')
GO
INSERT INTO PedidoLinea(fecha, cantidad, producto, total) values ('4/12/2022', 10, 'producto10', '10')
GO

--Prestacion
INSERT INTO Prestacion(tipo) values ('tipo1')
GO
INSERT INTO Prestacion(tipo) values ('tipo2')
GO
INSERT INTO Prestacion(tipo) values ('tipo3')
GO
INSERT INTO Prestacion(tipo) values ('tipo4')
GO
INSERT INTO Prestacion(tipo) values ('tipo5')
GO
INSERT INTO Prestacion(tipo) values ('tipo6')
GO
INSERT INTO Prestacion(tipo) values ('tipo7')
GO
INSERT INTO Prestacion(tipo) values ('tipo8')
GO
INSERT INTO Prestacion(tipo) values ('tipo9')
GO
INSERT INTO Prestacion(tipo) values ('tipo10')
GO

--Proveedor
INSERT INTO Proveedor(nombre, apellidopaterno, apellidomaterno, calle, numero, ciudad, telefono) values ('nombre1' , 'apellidopaterno1', 'apellidomaterno1', 'calle1', 1, 'ciudad1', 1)
GO
INSERT INTO Proveedor(nombre, apellidopaterno, apellidomaterno, calle, numero, ciudad, telefono) values ('nombre2' , 'apellidopaterno2', 'apellidomaterno2', 'calle2', 2, 'ciudad2', 2)
GO
INSERT INTO Proveedor(nombre, apellidopaterno, apellidomaterno, calle, numero, ciudad, telefono) values ('nombre3' , 'apellidopaterno3', 'apellidomaterno3', 'calle3', 3, 'ciudad3', 3)
GO
INSERT INTO Proveedor(nombre, apellidopaterno, apellidomaterno, calle, numero, ciudad, telefono) values ('nombre4' , 'apellidopaterno4', 'apellidomaterno4', 'calle4', 4, 'ciudad4', 4)
GO
INSERT INTO Proveedor(nombre, apellidopaterno, apellidomaterno, calle, numero, ciudad, telefono) values ('nombre5' , 'apellidopaterno5', 'apellidomaterno5', 'calle5', 5, 'ciudad5', 5)
GO
INSERT INTO Proveedor(nombre, apellidopaterno, apellidomaterno, calle, numero, ciudad, telefono) values ('nombre6' , 'apellidopaterno6', 'apellidomaterno6', 'calle6', 6, 'ciudad6', 6)
GO
INSERT INTO Proveedor(nombre, apellidopaterno, apellidomaterno, calle, numero, ciudad, telefono) values ('nombre7' , 'apellidopaterno7', 'apellidomaterno7', 'calle7', 7, 'ciudad7', 7)
GO
INSERT INTO Proveedor(nombre, apellidopaterno, apellidomaterno, calle, numero, ciudad, telefono) values ('nombre8' , 'apellidopaterno8', 'apellidomaterno8', 'calle8', 8, 'ciudad8', 8)
GO
INSERT INTO Proveedor(nombre, apellidopaterno, apellidomaterno, calle, numero, ciudad, telefono) values ('nombre9' , 'apellidopaterno9', 'apellidomaterno9', 'calle1', 9, 'ciudad1', 9)
GO
INSERT INTO Proveedor(nombre, apellidopaterno, apellidomaterno, calle, numero, ciudad, telefono) values ('nombre10' , 'apellidopaterno10', 'apellidomaterno10', 'calle10', 10, 'ciudad1', 10)
GO

--Queja
INSERT INTO Queja(tipoqueja, fecha) values ('tipoqueja1', '4/12/2022')
GO
INSERT INTO Queja(tipoqueja, fecha) values ('tipoqueja2', '4/12/2022')
GO
INSERT INTO Queja(tipoqueja, fecha) values ('tipoqueja3', '4/12/2022')
GO
INSERT INTO Queja(tipoqueja, fecha) values ('tipoqueja4', '4/12/2022')
GO
INSERT INTO Queja(tipoqueja, fecha) values ('tipoqueja5', '4/12/2022')
GO
INSERT INTO Queja(tipoqueja, fecha) values ('tipoqueja6', '4/12/2022')
GO
INSERT INTO Queja(tipoqueja, fecha) values ('tipoqueja7', '4/12/2022')
GO
INSERT INTO Queja(tipoqueja, fecha) values ('tipoqueja8', '4/12/2022')
GO
INSERT INTO Queja(tipoqueja, fecha) values ('tipoqueja9', '4/12/2022')
GO
INSERT INTO Queja(tipoqueja, fecha) values ('tipoqueja10', '4/12/2022')
GO

--Representante 
INSERT INTO Representante(nombre, apellidopaterno, apellidomaterno, telefono, empresa) values ('nombre1', 'apellidopaterno1', 'apellidomaterno1', 1, 'empresa1')
GO
INSERT INTO Representante(nombre, apellidopaterno, apellidomaterno, telefono, empresa) values ('nombre2', 'apellidopaterno2', 'apellidomaterno2', 2, 'empresa2')
GO
INSERT INTO Representante(nombre, apellidopaterno, apellidomaterno, telefono, empresa) values ('nombre3', 'apellidopaterno3', 'apellidomaterno3', 3, 'empresa3')
GO
INSERT INTO Representante(nombre, apellidopaterno, apellidomaterno, telefono, empresa) values ('nombre4', 'apellidopaterno4', 'apellidomaterno4', 4, 'empresa4')
GO
INSERT INTO Representante(nombre, apellidopaterno, apellidomaterno, telefono, empresa) values ('nombre5', 'apellidopaterno5', 'apellidomaterno5', 5, 'empresa5')
GO
INSERT INTO Representante(nombre, apellidopaterno, apellidomaterno, telefono, empresa) values ('nombre6', 'apellidopaterno6', 'apellidomaterno6', 6, 'empresa6')
GO
INSERT INTO Representante(nombre, apellidopaterno, apellidomaterno, telefono, empresa) values ('nombre7', 'apellidopaterno7', 'apellidomaterno7', 7, 'empresa7')
GO
INSERT INTO Representante(nombre, apellidopaterno, apellidomaterno, telefono, empresa) values ('nombre8', 'apellidopaterno8', 'apellidomaterno8', 8, 'empresa8')
GO
INSERT INTO Representante(nombre, apellidopaterno, apellidomaterno, telefono, empresa) values ('nombre9', 'apellidopaterno9', 'apellidomaterno9', 9, 'empresa9')
GO
INSERT INTO Representante(nombre, apellidopaterno, apellidomaterno, telefono, empresa) values ('nombre10', 'apellidopaterno10', 'apellidomaterno10', 10, 'empresa10')
GO

--Restaurante 
INSERT INTO Restaurante(mesas, sillas, comida) values (1, 1, 'comida1')
GO
INSERT INTO Restaurante(mesas, sillas, comida) values (2, 2, 'comida2')
GO
INSERT INTO Restaurante(mesas, sillas, comida) values (3, 3, 'comida3')
GO
INSERT INTO Restaurante(mesas, sillas, comida) values (4, 4, 'comida4')
GO
INSERT INTO Restaurante(mesas, sillas, comida) values (5, 5, 'comida5')
GO
INSERT INTO Restaurante(mesas, sillas, comida) values (6, 6, 'comida6')
GO
INSERT INTO Restaurante(mesas, sillas, comida) values (7, 7, 'comida7')
GO
INSERT INTO Restaurante(mesas, sillas, comida) values (8, 8, 'comida8')
GO
INSERT INTO Restaurante(mesas, sillas, comida) values (9, 9, 'comida9')
GO
INSERT INTO Restaurante(mesas, sillas, comida) values (10, 10, 'comida10')
GO

--Sucursal
INSERT INTO Sucursal(nombre, telefono, calle, estado, numero, colonia, ciudad) values ('nombre1', 1, 'calle1', 'estado1', 1, 'colonia1', 'ciudad1')
GO
INSERT INTO Sucursal(nombre, telefono, calle, estado, numero, colonia, ciudad) values ('nombre2', 2, 'calle2', 'estado2', 2, 'colonia2', 'ciudad2')
GO
INSERT INTO Sucursal(nombre, telefono, calle, estado, numero, colonia, ciudad) values ('nombre3', 3, 'calle3', 'estado3', 3, 'colonia3', 'ciudad3')
GO
INSERT INTO Sucursal(nombre, telefono, calle, estado, numero, colonia, ciudad) values ('nombre4', 4, 'calle4', 'estado4', 4, 'colonia4', 'ciudad4')
GO
INSERT INTO Sucursal(nombre, telefono, calle, estado, numero, colonia, ciudad) values ('nombre5', 5, 'calle5', 'estado5', 5, 'colonia5', 'ciudad5')
GO
INSERT INTO Sucursal(nombre, telefono, calle, estado, numero, colonia, ciudad) values ('nombre6', 6, 'calle6', 'estado6', 6, 'colonia6', 'ciudad6')
GO
INSERT INTO Sucursal(nombre, telefono, calle, estado, numero, colonia, ciudad) values ('nombre7', 7, 'calle7', 'estado7', 7, 'colonia7', 'ciudad7')
GO
INSERT INTO Sucursal(nombre, telefono, calle, estado, numero, colonia, ciudad) values ('nombre8', 8, 'calle8', 'estado8', 8, 'colonia8', 'ciudad8')
GO
INSERT INTO Sucursal(nombre, telefono, calle, estado, numero, colonia, ciudad) values ('nombre9', 9, 'calle9', 'estado9', 9, 'colonia9', 'ciudad9')
GO
INSERT INTO Sucursal(nombre, telefono, calle, estado, numero, colonia, ciudad) values ('nombre10', 10, 'calle10', 'estado10', 10, 'colonia10', 'ciudad10')
GO

--Transporte
INSERT INTO Transporte(marca, tipo) values ('marca1', 'tipo1')
GO
INSERT INTO Transporte(marca, tipo) values ('marca2', 'tipo2')
GO
INSERT INTO Transporte(marca, tipo) values ('marca3', 'tipo3')
GO
INSERT INTO Transporte(marca, tipo) values ('marca4', 'tipo4')
GO
INSERT INTO Transporte(marca, tipo) values ('marca5', 'tipo5')
GO
INSERT INTO Transporte(marca, tipo) values ('marca6', 'tipo6')
GO
INSERT INTO Transporte(marca, tipo) values ('marca7', 'tipo7')
GO
INSERT INTO Transporte(marca, tipo) values ('marca8', 'tipo8')
GO
INSERT INTO Transporte(marca, tipo) values ('marca9', 'tipo9')
GO
INSERT INTO Transporte(marca, tipo) values ('marca10', 'tipo10')
GO

--Venta
INSERT INTO Venta(fecha, cantidad) values ('4/12/2022', 'cantidad1')
GO
INSERT INTO Venta(fecha, cantidad) values ('4/12/2022', 'cantidad2')
GO
INSERT INTO Venta(fecha, cantidad) values ('4/12/2022', 'cantidad3')
GO
INSERT INTO Venta(fecha, cantidad) values ('4/12/2022', 'cantidad4')
GO
INSERT INTO Venta(fecha, cantidad) values ('4/12/2022', 'cantidad5')
GO
INSERT INTO Venta(fecha, cantidad) values ('4/12/2022', 'cantidad6')
GO
INSERT INTO Venta(fecha, cantidad) values ('4/12/2022', 'cantidad7')
GO
INSERT INTO Venta(fecha, cantidad) values ('4/12/2022', 'cantidad8')
GO
INSERT INTO Venta(fecha, cantidad) values ('4/12/2022', 'cantidad9')
GO
INSERT INTO Venta(fecha, cantidad) values ('4/12/2022', 'cantidad10')
GO





--Caja
INSERT INTO Caja(numero, persona, computadora, idSucursal, estatus) values (1, 'Persona1', 'Computadora1', '1', '1')
GO
INSERT INTO Caja(numero, persona, computadora, idSucursal, estatus) values (2, 'Persona2', 'Computadora2', '2', '1')
GO
INSERT INTO Caja(numero, persona, computadora, idSucursal, estatus) values (3, 'Persona3', 'Computadora3', '3', '1')
GO
INSERT INTO Caja(numero, persona, computadora, idSucursal, estatus) values (4, 'Persona4', 'Computadora4', '4', '1')
GO
INSERT INTO Caja(numero, persona, computadora, idSucursal, estatus) values (5, 'Persona5', 'Computadora5', '5', '1')
GO
INSERT INTO Caja(numero, persona, computadora, idSucursal, estatus) values (6, 'Persona6', 'Computadora6', '6', '1')
GO
INSERT INTO Caja(numero, persona, computadora, idSucursal, estatus) values (7, 'Persona7', 'Computadora7', '7', '1')
GO
INSERT INTO Caja(numero, persona, computadora, idSucursal, estatus) values (8, 'Persona8', 'Computadora8', '8', '1')
GO
INSERT INTO Caja(numero, persona, computadora, idSucursal, estatus) values (9, 'Persona9', 'Computadora9', '9', '1')
GO
INSERT INTO Caja(numero, persona, computadora, idSucursal, estatus) values (10, 'Persona10', 'Computadora10', '10', '1')
GO
--Membresia
INSERT INTO Membresia(nombre, apellidopaterno, apellidomaterno, calle, colonia, ciudad, numero, idSucursal, estatus) values ('nombre1', 'apellidopaterno1', 'apellidomaterno1', 'calle1', 'colonia1', 'ciudad1', 1, '1', '1')
GO
INSERT INTO Membresia(nombre, apellidopaterno, apellidomaterno, calle, colonia, ciudad, numero, idSucursal, estatus) values ('nombre2', 'apellidopaterno2', 'apellidomaterno2', 'calle2', 'colonia2', 'ciudad2', 2, '2', '1')
GO
INSERT INTO Membresia(nombre, apellidopaterno, apellidomaterno, calle, colonia, ciudad, numero, idSucursal, estatus) values ('nombre3', 'apellidopaterno3', 'apellidomaterno3', 'calle3', 'colonia3', 'ciudad3', 3, '3', '1')
GO
INSERT INTO Membresia(nombre, apellidopaterno, apellidomaterno, calle, colonia, ciudad, numero, idSucursal, estatus) values ('nombre4', 'apellidopaterno4', 'apellidomaterno4', 'calle4', 'colonia4', 'ciudad4', 4, '4', '1')
GO
INSERT INTO Membresia(nombre, apellidopaterno, apellidomaterno, calle, colonia, ciudad, numero, idSucursal, estatus) values ('nombre5', 'apellidopaterno5', 'apellidomaterno5', 'calle5', 'colonia5', 'ciudad5', 5, '5', '1')
GO
INSERT INTO Membresia(nombre, apellidopaterno, apellidomaterno, calle, colonia, ciudad, numero, idSucursal, estatus) values ('nombre6', 'apellidopaterno6', 'apellidomaterno6', 'calle6', 'colonia6', 'ciudad6', 6, '6', '1')
GO
INSERT INTO Membresia(nombre, apellidopaterno, apellidomaterno, calle, colonia, ciudad, numero, idSucursal, estatus) values ('nombre7', 'apellidopaterno7', 'apellidomaterno7', 'calle7', 'colonia7', 'ciudad7', 7, '7', '1')
GO
INSERT INTO Membresia(nombre, apellidopaterno, apellidomaterno, calle, colonia, ciudad, numero, idSucursal, estatus) values ('nombre8', 'apellidopaterno8', 'apellidomaterno8', 'calle8', 'colonia8', 'ciudad8', 8, '8', '1')
GO
INSERT INTO Membresia(nombre, apellidopaterno, apellidomaterno, calle, colonia, ciudad, numero, idSucursal, estatus) values ('nombre9', 'apellidopaterno9', 'apellidomaterno9', 'calle9', 'colonia9', 'ciudad9', 9, '9', '1')
GO
INSERT INTO Membresia(nombre, apellidopaterno, apellidomaterno, calle, colonia, ciudad, numero, idSucursal, estatus) values ('nombre10', 'apellidopaterno10', 'apellidomaterno10', 'calle10', 'colonia10', 'ciudad10', 10, '10', '1')
GO

--TarjetaPuto
INSERT INTO TarjetaPunto(puntos, beneficios, idSucursal, estatus) values (1, 'beneficio1', '1', '1')
GO
INSERT INTO TarjetaPunto(puntos, beneficios, idSucursal, estatus) values (2, 'beneficio2', '2', '1')
GO
INSERT INTO TarjetaPunto(puntos, beneficios, idSucursal, estatus) values (3, 'beneficio3', '3', '1')
GO
INSERT INTO TarjetaPunto(puntos, beneficios, idSucursal, estatus) values (4, 'beneficio4', '4', '1')
GO
INSERT INTO TarjetaPunto(puntos, beneficios, idSucursal, estatus) values (5, 'beneficio5', '5', '1')
GO
INSERT INTO TarjetaPunto(puntos, beneficios, idSucursal, estatus) values (6, 'beneficio6', '6', '1')
GO
INSERT INTO TarjetaPunto(puntos, beneficios, idSucursal, estatus) values (7, 'beneficio7', '7', '1')
GO
INSERT INTO TarjetaPunto(puntos, beneficios, idSucursal, estatus) values (8, 'beneficio8', '8', '1')
GO
INSERT INTO TarjetaPunto(puntos, beneficios, idSucursal, estatus) values (9, 'beneficio9', '9', '1')
GO
INSERT INTO TarjetaPunto(puntos, beneficios, idSucursal, estatus) values (10, 'beneficio10', '10', '1')
GO

--Cliente
INSERT INTO Cliente(nombre, apellidopaterno, apellidomaterno, telefono, idMembresia, idTarjetaPunto, estatus) values ('nombre1', 'apellidopaterno1', 'apellidomaterno1', 1, '1', '1', '1')
GO
INSERT INTO Cliente(nombre, apellidopaterno, apellidomaterno, telefono, idMembresia, idTarjetaPunto, estatus) values ('nombre2', 'apellidopaterno2', 'apellidomaterno2', 2, '2', '2', '1')
GO
INSERT INTO Cliente(nombre, apellidopaterno, apellidomaterno, telefono, idMembresia, idTarjetaPunto, estatus) values ('nombre3', 'apellidopaterno3', 'apellidomaterno3', 3, '3', '3', '1')
GO
INSERT INTO Cliente(nombre, apellidopaterno, apellidomaterno, telefono, idMembresia, idTarjetaPunto, estatus) values ('nombre4', 'apellidopaterno4', 'apellidomaterno4', 4, '4', '4', '1')
GO
INSERT INTO Cliente(nombre, apellidopaterno, apellidomaterno, telefono, idMembresia, idTarjetaPunto, estatus) values ('nombre5', 'apellidopaterno5', 'apellidomaterno5', 5, '5', '5', '1')
GO
INSERT INTO Cliente(nombre, apellidopaterno, apellidomaterno, telefono, idMembresia, idTarjetaPunto, estatus) values ('nombre6', 'apellidopaterno6', 'apellidomaterno6', 6, '6', '6', '1')
GO
INSERT INTO Cliente(nombre, apellidopaterno, apellidomaterno, telefono, idMembresia, idTarjetaPunto, estatus) values ('nombre7', 'apellidopaterno6', 'apellidomaterno7', 7, '7', '7', '1')
GO
INSERT INTO Cliente(nombre, apellidopaterno, apellidomaterno, telefono, idMembresia, idTarjetaPunto, estatus) values ('nombre8', 'apellidopaterno7', 'apellidomaterno8', 8, '8', '8', '1')
GO
INSERT INTO Cliente(nombre, apellidopaterno, apellidomaterno, telefono, idMembresia, idTarjetaPunto, estatus) values ('nombre9', 'apellidopaterno8', 'apellidomaterno9', 9, '9', '9', '1')
GO
INSERT INTO Cliente(nombre, apellidopaterno, apellidomaterno, telefono, idMembresia, idTarjetaPunto, estatus) values ('nombre10', 'apellidopaterno9', 'apellidomaterno10', 10, '10', '10', '1')
GO

--FacturaCliente
INSERT INTO FacturaCliente(fecha, remitente, cantidad, idCliente, idContador, estatus) values (4/12/2022, 'remitenete1', 1, '1', '1', '1')
GO
INSERT INTO FacturaCliente(fecha, remitente, cantidad, idCliente, idContador, estatus) values (4/12/2022, 'remitenete2', 2, '2', '2', '1')
GO
INSERT INTO FacturaCliente(fecha, remitente, cantidad, idCliente, idContador, estatus) values (4/12/2022, 'remitenete3', 3, '3', '3', '1')
GO
INSERT INTO FacturaCliente(fecha, remitente, cantidad, idCliente, idContador, estatus) values (4/12/2022, 'remitenete4', 4, '4', '4', '1')
GO
INSERT INTO FacturaCliente(fecha, remitente, cantidad, idCliente, idContador, estatus) values (4/12/2022, 'remitenete5', 5, '5', '5', '1')
GO
INSERT INTO FacturaCliente(fecha, remitente, cantidad, idCliente, idContador, estatus) values (4/12/2022, 'remitenete6', 6, '6', '6', '1')
GO
INSERT INTO FacturaCliente(fecha, remitente, cantidad, idCliente, idContador, estatus) values (4/12/2022, 'remitenete7', 7, '7', '7', '1')
GO
INSERT INTO FacturaCliente(fecha, remitente, cantidad, idCliente, idContador, estatus) values (4/12/2022, 'remitenete8', 8, '8', '8', '1')
GO
INSERT INTO FacturaCliente(fecha, remitente, cantidad, idCliente, idContador, estatus) values (4/12/2022, 'remitenete9', 9, '9', '9', '1')
GO
INSERT INTO FacturaCliente(fecha, remitente, cantidad, idCliente, idContador, estatus) values (4/12/2022, 'remitenete10', 10, '10', '10', '1')
GO

--Devolucion
INSERT INTO Devolucion(producto, cantidad, cantidadmonetaria, fecha, idCliente, estatus) values ('producto1', 1, 1,'4/12/2022', '1', '1')
GO
INSERT INTO Devolucion(producto, cantidad, cantidadmonetaria, fecha, idCliente, estatus) values ('producto2', 2, 2,'4/12/2022', '2', '1')
GO
INSERT INTO Devolucion(producto, cantidad, cantidadmonetaria, fecha, idCliente, estatus) values ('producto3', 3, 3,'4/12/2022', '3', '1')
GO
INSERT INTO Devolucion(producto, cantidad, cantidadmonetaria, fecha, idCliente, estatus) values ('producto4', 4, 4,'4/12/2022', '4', '1')
GO
INSERT INTO Devolucion(producto, cantidad, cantidadmonetaria, fecha,  idCliente, estatus) values ('producto5', 5, 5,'4/12/2022', '5', '1')
GO
INSERT INTO Devolucion(producto, cantidad, cantidadmonetaria, fecha,  idCliente, estatus) values ('producto6', 6, 6,'4/12/2022', '6', '1')
GO
INSERT INTO Devolucion(producto, cantidad, cantidadmonetaria, fecha,  idCliente, estatus) values ('producto7', 7, 7,'4/12/2022', '7', '1')
GO
INSERT INTO Devolucion(producto, cantidad, cantidadmonetaria, fecha,  idCliente, estatus) values ('producto8', 8, 8,'4/12/2022', '8', '1')
GO
INSERT INTO Devolucion(producto, cantidad, cantidadmonetaria, fecha,  idCliente, estatus) values ('producto9', 9, 9,'4/12/2022', '9', '1')
GO
INSERT INTO Devolucion(producto, cantidad, cantidadmonetaria, fecha,  idCliente, estatus) values ('producto10', 10, 10,'4/12/2022', '10', '1')
GO

--Produccion
INSERT INTO Produccion (fecha, total, idMarca, estatus) values ('4/12/2022', 1, '1', '1')
GO
INSERT INTO Produccion (fecha, total, idMarca, estatus) values ('4/12/2022', 2, '2', '1')
GO
INSERT INTO Produccion (fecha, total, idMarca, estatus) values ('4/12/2022', 3, '3', '1')
GO
INSERT INTO Produccion (fecha, total, idMarca, estatus) values ('4/12/2022', 4, '4', '1')
GO
INSERT INTO Produccion (fecha, total, idMarca, estatus) values ('4/12/2022', 5, '5', '1')
GO
INSERT INTO Produccion (fecha, total, idMarca, estatus) values ('4/12/2022', 6, '6', '1')
GO
INSERT INTO Produccion (fecha, total, idMarca, estatus) values ('4/12/2022', 7, '7', '1')
GO
INSERT INTO Produccion (fecha, total, idMarca, estatus) values ('4/12/2022', 8, '8', '1')
GO
INSERT INTO Produccion (fecha, total, idMarca, estatus) values ('4/12/2022', 9, '9', '1')
GO
INSERT INTO Produccion (fecha, total, idMarca, estatus) values ('4/12/2022', 10, '10', '1')
GO


--Producto
INSERT INTO Producto(nombre, cantidad, categoria, idBodega, idDevolucion, idProduccion, estatus) values ('nombre1', 1, 'categoria1', '1', '1', '1', '1')
GO
INSERT INTO Producto(nombre, cantidad, categoria, idBodega, idDevolucion, idProduccion, estatus) values ('nombre2', 2, 'categoria2', '2', '2', '2', '1')
GO
INSERT INTO Producto(nombre, cantidad, categoria, idBodega, idDevolucion, idProduccion, estatus) values ('nombre3', 3, 'categoria3', '3', '3', '3', '1')
GO
INSERT INTO Producto(nombre, cantidad, categoria, idBodega, idDevolucion, idProduccion, estatus) values ('nombre4', 4, 'categoria4', '4', '4', '4', '1')
GO
INSERT INTO Producto(nombre, cantidad, categoria, idBodega, idDevolucion, idProduccion, estatus) values ('nombre5', 5, 'categoria5', '5', '5', '5', '1')
GO
INSERT INTO Producto(nombre, cantidad, categoria, idBodega, idDevolucion, idProduccion, estatus) values ('nombre6', 6, 'categoria6', '6', '6', '6', '1')
GO
INSERT INTO Producto(nombre, cantidad, categoria, idBodega, idDevolucion, idProduccion, estatus) values ('nombre7', 7, 'categoria7', '7', '7', '7', '1')
GO
INSERT INTO Producto(nombre, cantidad, categoria, idBodega, idDevolucion, idProduccion, estatus) values ('nombre8', 8, 'categoria8', '8', '8', '8', '1')
GO
INSERT INTO Producto(nombre, cantidad, categoria, idBodega, idDevolucion, idProduccion, estatus) values ('nombre9', 9, 'categoria9', '9', '9', '9', '1')
GO
INSERT INTO Producto(nombre, cantidad, categoria, idBodega, idDevolucion, idProduccion, estatus) values ('nombre10', 10, 'categoria10', '10', '10', '10', '1')
GO

--Compra
INSERT INTO Compra(cantidad, fecha, idFacturaCliente, idProducto, estatus) values (1, '4/12/2022', '1', '1', '1')
GO
INSERT INTO Compra(cantidad, fecha, idFacturaCliente, idProducto, estatus) values (1, '4/12/2022', '2', '2', '1')
GO
INSERT INTO Compra(cantidad, fecha, idFacturaCliente, idProducto, estatus) values (1, '4/12/2022', '3', '3', '1')
GO
INSERT INTO Compra(cantidad, fecha, idFacturaCliente, idProducto, estatus) values (1, '4/12/2022', '4', '4', '1')
GO
INSERT INTO Compra(cantidad, fecha, idFacturaCliente, idProducto, estatus) values (1, '4/12/2022', '5', '5', '1')
GO
INSERT INTO Compra(cantidad, fecha, idFacturaCliente, idProducto, estatus) values (1, '4/12/2022', '6', '6', '1')
GO
INSERT INTO Compra(cantidad, fecha, idFacturaCliente, idProducto, estatus) values (1, '4/12/2022', '7', '7', '1')
GO
INSERT INTO Compra(cantidad, fecha, idFacturaCliente, idProducto, estatus) values (1, '4/12/2022', '8', '8', '1')
GO
INSERT INTO Compra(cantidad, fecha, idFacturaCliente, idProducto, estatus) values (1, '4/12/2022', '9', '9', '1')
GO
INSERT INTO Compra(cantidad, fecha, idFacturaCliente, idProducto, estatus) values (1, '4/12/2022', '10', '10', '1')
GO



--Delivery
INSERT INTO Delivery(cantidad, producto, direccion, horasalida, horallegada, idSucursal, estatus) values (1, 'producto1', 'direccion1', '7:00', '7:00', '1', '1')
GO
INSERT INTO Delivery(cantidad, producto, direccion, horasalida, horallegada, idSucursal, estatus) values (1, 'producto2', 'direccion2', '7:00', '7:00', '2 ', '1')
GO
INSERT INTO Delivery(cantidad, producto, direccion, horasalida, horallegada, idSucursal, estatus) values (1, 'producto3', 'direccion3', '7:00', '7:00', '3', '1')
GO
INSERT INTO Delivery(cantidad, producto, direccion, horasalida, horallegada, idSucursal, estatus) values (1, 'producto4', 'direccion4', '7:00', '7:00', '4', '1')
GO
INSERT INTO Delivery(cantidad, producto, direccion, horasalida, horallegada, idSucursal, estatus) values (1, 'producto5', 'direccion5', '7:00', '7:00', '5', '1')
GO
INSERT INTO Delivery(cantidad, producto, direccion, horasalida, horallegada,idSucursal, estatus) values (1, 'producto6', 'direccion6', '7:00', '7:00', '6', '1')
GO
INSERT INTO Delivery(cantidad, producto, direccion, horasalida, horallegada, idSucursal, estatus) values (1, 'producto7', 'direccion7', '7:00', '7:00', '7', '1')
GO
INSERT INTO Delivery(cantidad, producto, direccion, horasalida, horallegada, idSucursal, estatus) values (1, 'producto8', 'direccion8', '7:00', '7:00', '8', '1')
GO
INSERT INTO Delivery(cantidad, producto, direccion, horasalida, horallegada, idSucursal, estatus) values (1, 'producto9', 'direccion9', '7:00', '7:00', '9', '1')
GO
INSERT INTO Delivery(cantidad, producto, direccion, horasalida, horallegada, idSucursal, estatus) values (1, 'producto10', 'direccion10', '7:00', '7:00', '10', '1')
GO

--Departamento
INSERT INTO Departamento(nombre, categoria, idSucursal, estatus) values ('nombre1', 'categoria1', '1', '1')
GO
INSERT INTO Departamento(nombre, categoria, idSucursal, estatus) values ('nombre2', 'categoria2', '2', '1')
GO
INSERT INTO Departamento(nombre, categoria, idSucursal, estatus) values ('nombre3', 'categoria3', '3', '1')
GO
INSERT INTO Departamento(nombre, categoria, idSucursal, estatus) values ('nombre4', 'categoria4', '4', '1')
GO
INSERT INTO Departamento(nombre, categoria, idSucursal, estatus) values ('nombre5', 'categoria5', '5', '1')
GO
INSERT INTO Departamento(nombre, categoria, idSucursal, estatus) values ('nombre6', 'categoria6', '6', '1')
GO
INSERT INTO Departamento(nombre, categoria, idSucursal, estatus) values ('nombre7', 'categoria7', '7', '1')
GO
INSERT INTO Departamento(nombre, categoria, idSucursal, estatus) values ('nombre8', 'categoria8', '8', '1')
GO
INSERT INTO Departamento(nombre, categoria, idSucursal, estatus) values ('nombre9', 'categoria9', '9', '1')
GO
INSERT INTO Departamento(nombre, categoria, idSucursal, estatus) values ('nombre10', 'categoria10', '10', '1')
GO



--DevolucionProveedor
INSERT INTO DevolucionProveedor(producto, cantidad, cantidadmonetaria, fecha, idProveedor, estatus) values ('producto1', 1, 1, '4/12/2022', '1', '1')
GO
INSERT INTO DevolucionProveedor(producto, cantidad, cantidadmonetaria, fecha,  idProveedor, estatus) values ('producto2', 2, 2, '4/12/2022', '2', '1')
GO
INSERT INTO DevolucionProveedor(producto, cantidad, cantidadmonetaria, fecha,  idProveedor, estatus) values ('producto3', 3, 3, '4/12/2022', '3', '1')
GO
INSERT INTO DevolucionProveedor(producto, cantidad, cantidadmonetaria, fecha,  idProveedor, estatus) values ('producto4', 4, 4, '4/12/2022', '4', '1')
GO
INSERT INTO DevolucionProveedor(producto, cantidad, cantidadmonetaria, fecha,  idProveedor, estatus) values ('producto5', 5, 5, '4/12/2022', '5', '1')
GO
INSERT INTO DevolucionProveedor(producto, cantidad, cantidadmonetaria, fecha,  idProveedor, estatus) values ('producto6', 6, 6, '4/12/2022', '6', '1')
GO
INSERT INTO DevolucionProveedor(producto, cantidad, cantidadmonetaria, fecha,  idProveedor, estatus) values ('producto7', 7, 7, '4/12/2022', '7', '1')
GO
INSERT INTO DevolucionProveedor(producto, cantidad, cantidadmonetaria, fecha,  idProveedor, estatus) values ('producto8', 8, 8, '4/12/2022', '8', '1')
GO
INSERT INTO DevolucionProveedor(producto, cantidad, cantidadmonetaria, fecha,  idProveedor, estatus) values ('producto9', 9, 9, '4/12/2022', '9', '1')
GO
INSERT INTO DevolucionProveedor(producto, cantidad, cantidadmonetaria, fecha,  idProveedor, estatus) values ('producto10', 10, 10, '4/12/2022', '10', '1')
GO


--EquipoInformatico
INSERT INTO EQUIPOINFORMATICO(tipo, cantidad, total, idSucursal, estatus) values ('tipo1', 1, 1, '1', '1')
GO
INSERT INTO EQUIPOINFORMATICO(tipo, cantidad, total, idSucursal, estatus) values ('tipo1', 2, 2, '2', '1')
GO
INSERT INTO EQUIPOINFORMATICO(tipo, cantidad, total, idSucursal, estatus) values ('tipo1', 3, 3, '3', '1')
GO
INSERT INTO EQUIPOINFORMATICO(tipo, cantidad, total, idSucursal, estatus) values ('tipo1', 4, 4, '4', '1')
GO
INSERT INTO EQUIPOINFORMATICO(tipo, cantidad, total, idSucursal, estatus) values ('tipo1', 5, 5, '5', '1')
GO
INSERT INTO EQUIPOINFORMATICO(tipo, cantidad, total, idSucursal, estatus) values ('tipo1', 6, 6, '6', '1')
GO
INSERT INTO EQUIPOINFORMATICO(tipo, cantidad, total, idSucursal, estatus) values ('tipo1', 7, 7, '7', '1')
GO
INSERT INTO EQUIPOINFORMATICO(tipo, cantidad, total, idSucursal, estatus) values ('tipo1', 8, 8, '8', '1')
GO
INSERT INTO EQUIPOINFORMATICO(tipo, cantidad, total, idSucursal, estatus) values ('tipo1', 9, 9, '9', '1')
GO
INSERT INTO EQUIPOINFORMATICO(tipo, cantidad, total, idSucursal, estatus) values ('tipo1', 10, 10, '10', '1')
GO




--FacturaProveedor
INSERT INTO FacturaProveedor(fecha, remitente, cantidad, idContador, estatus) values (4/12/2022, 'remitenete1', 1, '1', '1')
GO
INSERT INTO FacturaProveedor(fecha, remitente, cantidad, idContador, estatus) values (4/12/2022, 'remitenete2', 2, '2', '1')
GO
INSERT INTO FacturaProveedor(fecha, remitente, cantidad, idContador, estatus) values (4/12/2022, 'remitenete3', 3, '3', '1')
GO
INSERT INTO FacturaProveedor(fecha, remitente, cantidad, idContador, estatus) values (4/12/2022, 'remitenete4', 4, '4', '1')
GO
INSERT INTO FacturaProveedor(fecha, remitente, cantidad, idContador, estatus) values (4/12/2022, 'remitenete5', 5, '5', '1')
GO
INSERT INTO FacturaProveedor(fecha, remitente, cantidad, idContador, estatus) values (4/12/2022, 'remitenete6', 6, '6', '1')
GO
INSERT INTO FacturaProveedor(fecha, remitente, cantidad, idContador, estatus) values (4/12/2022, 'remitenete7', 7, '7', '1')
GO
INSERT INTO FacturaProveedor(fecha, remitente, cantidad, idContador, estatus) values (4/12/2022, 'remitenete8', 8, '8', '1')
GO
INSERT INTO FacturaProveedor(fecha, remitente, cantidad, idContador, estatus) values (4/12/2022, 'remitenete9', 9, '9', '1')
GO
INSERT INTO FacturaProveedor(fecha, remitente, cantidad, idContador, estatus) values (4/12/2022, 'remitenete10', 10, '10', '1')
GO

--HorarioTrabajador
INSERT INTO HorarioTrabajador(entrada, salida, idEmpleado, estatus) values ('7:00', '7:00', '1', '1')
GO
INSERT INTO HorarioTrabajador(entrada, salida, idEmpleado, estatus) values ('7:00', '7:00', '2', '1')
GO
INSERT INTO HorarioTrabajador(entrada, salida, idEmpleado, estatus) values ('7:00', '7:00', '3', '1')
GO
INSERT INTO HorarioTrabajador(entrada, salida, idEmpleado, estatus) values ('7:00', '7:00', '4', '1')
GO
INSERT INTO HorarioTrabajador(entrada, salida, idEmpleado, estatus) values ('7:00', '7:00', '5', '1')
GO
INSERT INTO HorarioTrabajador(entrada, salida, idEmpleado, estatus) values ('7:00', '7:00', '6', '1')
GO
INSERT INTO HorarioTrabajador(entrada, salida, idEmpleado, estatus) values ('7:00', '7:00', '7', '1')
GO
INSERT INTO HorarioTrabajador(entrada, salida, idEmpleado, estatus) values ('7:00', '7:00', '8', '1')
GO
INSERT INTO HorarioTrabajador(entrada, salida, idEmpleado, estatus) values ('7:00', '7:00', '9', '1')
GO
INSERT INTO HorarioTrabajador(entrada, salida, idEmpleado, estatus) values ('7:00', '7:00', '10', '1')
GO



--Mantenimiento
INSERT INTO Mantenimiento(persona, tipo, fecha, idSucursal, estatus) values ('persona1', 'tipo1', '4/12/2022', '1', '1')
GO
INSERT INTO Mantenimiento(persona, tipo, fecha, idSucursal, estatus) values ('persona2', 'tipo2', '4/12/2022', '2', '1')
GO
INSERT INTO Mantenimiento(persona, tipo, fecha, idSucursal, estatus) values ('persona3', 'tipo3', '4/12/2022', '3', '1')
GO
INSERT INTO Mantenimiento(persona, tipo, fecha, idSucursal, estatus) values ('persona4', 'tipo4', '4/12/2022', '4', '1')
GO
INSERT INTO Mantenimiento(persona, tipo, fecha, idSucursal, estatus) values ('persona5', 'tipo5', '4/12/2022', '5', '1')
GO
INSERT INTO Mantenimiento(persona, tipo, fecha, idSucursal, estatus) values ('persona6', 'tipo6', '4/12/2022', '6', '1')
GO
INSERT INTO Mantenimiento(persona, tipo, fecha, idSucursal, estatus) values ('persona7', 'tipo7', '4/12/2022', '7', '1')
GO
INSERT INTO Mantenimiento(persona, tipo, fecha, idSucursal, estatus) values ('persona8', 'tipo8', '4/12/2022', '8', '1')
GO
INSERT INTO Mantenimiento(persona, tipo, fecha, idSucursal, estatus) values ('persona9', 'tipo9', '4/12/2022', '9', '1')
GO
INSERT INTO Mantenimiento(persona, tipo, fecha, idSucursal, estatus) values ('persona10', 'tipo10', '4/12/2022', '10', '1')
GO


--Marketing
INSERT INTO Marketing(tipo, lugar, idSucursal, estatus) values ('tipo1', 'lugar1', '1', '1')
GO
INSERT INTO Marketing(tipo, lugar, idSucursal, estatus) values ('tipo2', 'lugar2', '2', '1')
GO
INSERT INTO Marketing(tipo, lugar, idSucursal, estatus) values ('tipo3', 'lugar3', '3', '1')
GO
INSERT INTO Marketing(tipo, lugar, idSucursal, estatus) values ('tipo4', 'lugar4', '4', '1')
GO
INSERT INTO Marketing(tipo, lugar, idSucursal, estatus) values ('tipo5', 'lugar5', '5', '1')
GO
INSERT INTO Marketing(tipo, lugar, idSucursal, estatus) values ('tipo6', 'lugar6', '6', '1')
GO
INSERT INTO Marketing(tipo, lugar, idSucursal, estatus) values ('tipo7', 'lugar7', '7', '1')
GO
INSERT INTO Marketing(tipo, lugar, idSucursal, estatus) values ('tipo8', 'lugar8', '8', '1')
GO
INSERT INTO Marketing(tipo, lugar, idSucursal, estatus) values ('tipo9', 'lugar9', '9', '1')
GO
INSERT INTO Marketing(tipo, lugar, idSucursal, estatus) values ('tipo10', 'lugar10', '10', '1')
GO

--MateriaPrima
INSERT INTO MateriaPrima(material, nombre, cantidad, idProducto, estatus) values ('material1', 'nombre1', 1, '1', '1')
GO
INSERT INTO MateriaPrima(material, nombre, cantidad, idProducto, estatus) values ('material2', 'nombre2', 2, '2', '1')
GO
INSERT INTO MateriaPrima(material, nombre, cantidad, idProducto, estatus) values ('material3', 'nombre3', 3, '3', '1')
GO
INSERT INTO MateriaPrima(material, nombre, cantidad, idProducto, estatus) values ('material4', 'nombre4', 4, '4', '1')
GO
INSERT INTO MateriaPrima(material, nombre, cantidad, idProducto, estatus) values ('material5', 'nombre5', 5, '5', '1')
GO
INSERT INTO MateriaPrima(material, nombre, cantidad, idProducto, estatus) values ('material6', 'nombre6', 6, '6', '1')
GO
INSERT INTO MateriaPrima(material, nombre, cantidad, idProducto, estatus) values ('material7', 'nombre7', 7, '7', '1')
GO
INSERT INTO MateriaPrima(material, nombre, cantidad, idProducto, estatus) values ('material8', 'nombre8', 8, '8', '1')
GO
INSERT INTO MateriaPrima(material, nombre, cantidad, idProducto, estatus) values ('material9', 'nombre9', 9, '9', '1')
GO
INSERT INTO MateriaPrima(material, nombre, cantidad, idProducto, estatus) values ('material10', 'nombre10', 10, '10', '1')
GO



--MetodoPago
INSERT INTO MetodoPago(tipo, idCliente, estatus) values ('tipo1', '1', '1')
GO
INSERT INTO MetodoPago(tipo, idCliente, estatus) values ('tipo2', '2', '1')
GO
INSERT INTO MetodoPago(tipo, idCliente, estatus) values ('tipo3', '3', '1')
GO
INSERT INTO MetodoPago(tipo, idCliente, estatus) values ('tipo4', '4', '1')
GO
INSERT INTO MetodoPago(tipo, idCliente, estatus) values ('tipo5', '5', '1')
GO
INSERT INTO MetodoPago(tipo, idCliente, estatus) values ('tipo6', '6', '1')
GO
INSERT INTO MetodoPago(tipo, idCliente, estatus) values ('tipo7', '7', '1')
GO
INSERT INTO MetodoPago(tipo, idCliente, estatus) values ('tipo8', '8', '1')
GO
INSERT INTO MetodoPago(tipo, idCliente, estatus) values ('tipo9', '9', '1')
GO
INSERT INTO MetodoPago(tipo, idCliente, estatus) values ('tipo10', '10', '1')
GO

--Mobiliario
INSERT INTO Mobiliario(nombre, cantidad, categoria, idSucursal, estatus) values ('nombre1', 1, 'categoria1', '1', '1')
GO
INSERT INTO Mobiliario(nombre, cantidad, categoria, idSucursal, estatus) values ('nombre2', 2, 'categoria2', '2', '1')
GO
INSERT INTO Mobiliario(nombre, cantidad, categoria, idSucursal, estatus) values ('nombre3', 3, 'categoria3', '3', '1')
GO
INSERT INTO Mobiliario(nombre, cantidad, categoria, idSucursal, estatus) values ('nombre4', 4, 'categoria4', '4', '1')
GO
INSERT INTO Mobiliario(nombre, cantidad, categoria, idSucursal, estatus) values ('nombre5', 5, 'categoria5', '5', '1')
GO
INSERT INTO Mobiliario(nombre, cantidad, categoria, idSucursal, estatus) values ('nombre6', 6, 'categoria6', '6', '1')
GO
INSERT INTO Mobiliario(nombre, cantidad, categoria, idSucursal, estatus) values ('nombre7', 7, 'categoria7', '7', '1')
GO
INSERT INTO Mobiliario(nombre, cantidad, categoria, idSucursal, estatus) values ('nombre8', 8, 'categoria8', '8', '1')
GO
INSERT INTO Mobiliario(nombre, cantidad, categoria, idSucursal, estatus) values ('nombre9', 9, 'categoria9', '9', '1')
GO
INSERT INTO Mobiliario(nombre, cantidad, categoria, idSucursal, estatus) values ('nombre10', 10, 'categoria10', '10', '1')
GO

--Nomina
INSERT INTO Nomina(fecha, persona, cantidad, idContador, estatus) values ('4/12/2022', 'persona1', 'cantidad1', '1', '1')
GO
INSERT INTO Nomina(fecha, persona, cantidad, idContador, estatus) values ('4/12/2022', 'persona2', 'cantidad2', '2', '1')
GO
INSERT INTO Nomina(fecha, persona, cantidad, idContador, estatus) values ('4/12/2022', 'persona3', 'cantidad3', '3', '1')
GO
INSERT INTO Nomina(fecha, persona, cantidad, idContador, estatus) values ('4/12/2022', 'persona4', 'cantidad4', '4', '1')
GO
INSERT INTO Nomina(fecha, persona, cantidad, idContador, estatus) values ('4/12/2022', 'persona5', 'cantidad5', '5', '1')
GO
INSERT INTO Nomina(fecha, persona, cantidad, idContador, estatus) values ('4/12/2022', 'persona6', 'cantidad6', '6', '1')
GO
INSERT INTO Nomina(fecha, persona, cantidad, idContador, estatus) values ('4/12/2022', 'persona7', 'cantidad7', '7', '1')
GO
INSERT INTO Nomina(fecha, persona, cantidad, idContador, estatus) values ('4/12/2022', 'persona8', 'cantidad8', '8', '1')
GO
INSERT INTO Nomina(fecha, persona, cantidad, idContador, estatus) values ('4/12/2022', 'persona9', 'cantidad9', '9', '1')
GO
INSERT INTO Nomina(fecha, persona, cantidad, idContador, estatus) values ('4/12/2022', 'persona10', 'cantidad10', '10', '1')
GO


--PagoServicio
INSERT INTO PagoServicio(cantidad, servicio, fecha, idSucursal, estatus) values (1, 'servicio1', '4/12/2022', '1', '1')
GO
INSERT INTO PagoServicio(cantidad, servicio, fecha, idSucursal, estatus) values (2, 'servicio2', '4/12/2022', '2', '1')
GO
INSERT INTO PagoServicio(cantidad, servicio, fecha, idSucursal, estatus) values (3, 'servicio3', '4/12/2022', '3', '1')
GO
INSERT INTO PagoServicio(cantidad, servicio, fecha, idSucursal, estatus) values (4, 'servicio4', '4/12/2022', '4', '1')
GO
INSERT INTO PagoServicio(cantidad, servicio, fecha, idSucursal, estatus) values (5, 'servicio5', '4/12/2022', '5', '1')
GO
INSERT INTO PagoServicio(cantidad, servicio, fecha, idSucursal, estatus) values (6, 'servicio6', '4/12/2022', '6', '1')
GO
INSERT INTO PagoServicio(cantidad, servicio, fecha, idSucursal, estatus) values (7, 'servicio7', '4/12/2022', '7', '1')
GO
INSERT INTO PagoServicio(cantidad, servicio, fecha, idSucursal, estatus) values (8, 'servicio8', '4/12/2022', '8', '1')
GO
INSERT INTO PagoServicio(cantidad, servicio, fecha, idSucursal, estatus) values (9, 'servicio9', '4/12/2022', '9', '1')
GO
INSERT INTO PagoServicio(cantidad, servicio, fecha, idSucursal, estatus) values (10, 'servicio10', '4/12/2022', '10', '1')
GO

--Paquete
INSERT INTO Paquete(numero, peso, remitente, destinatario, idEnvio, idPedidoLinea, estatus) values (1, 'peso1', 'remitente1', 'destinatario1', '1', '1', '1')
GO
INSERT INTO Paquete(numero, peso, remitente, destinatario, idEnvio, idPedidoLinea, estatus) values (2, 'peso2', 'remitente2', 'destinatario2', '2', '2', '1')
GO
INSERT INTO Paquete(numero, peso, remitente, destinatario, idEnvio, idPedidoLinea, estatus) values (3, 'peso3', 'remitente3', 'destinatario3', '3', '3', '1')
GO
INSERT INTO Paquete(numero, peso, remitente, destinatario, idEnvio, idPedidoLinea, estatus) values (4, 'peso4', 'remitente4', 'destinatario4', '4', '4', '1')
GO
INSERT INTO Paquete(numero, peso, remitente, destinatario, idEnvio, idPedidoLinea, estatus) values (5, 'peso5', 'remitente5', 'destinatario5', '5', '5', '1')
GO
INSERT INTO Paquete(numero, peso, remitente, destinatario, idEnvio, idPedidoLinea, estatus) values (6, 'peso6', 'remitente6', 'destinatario6', '6', '6', '1')
GO
INSERT INTO Paquete(numero, peso, remitente, destinatario, idEnvio, idPedidoLinea, estatus) values (7, 'peso7', 'remitente7', 'destinatario7', '7', '7', '1')
GO
INSERT INTO Paquete(numero, peso, remitente, destinatario, idEnvio, idPedidoLinea, estatus) values (8, 'peso8', 'remitente8', 'destinatario8', '8', '8', '1')
GO
INSERT INTO Paquete(numero, peso, remitente, destinatario, idEnvio, idPedidoLinea, estatus) values (9, 'peso9', 'remitente9', 'destinatario9', '9', '9', '1')
GO
INSERT INTO Paquete(numero, peso, remitente, destinatario, idEnvio, idPedidoLinea, estatus) values (10, 'peso10', 'remitente10', 'destinatario10', '10', '10', '1')
GO

--Pasillo
INSERT INTO Pasillo(cantidad, numero, tipo, idSucursal, estatus) values (1, 1, 'tipo1', '1', '1')
GO
INSERT INTO Pasillo(cantidad, numero, tipo, idSucursal, estatus) values (2, 2, 'tipo2', '2', '1')
GO
INSERT INTO Pasillo(cantidad, numero, tipo, idSucursal, estatus) values (3, 3, 'tipo3', '3', '1')
GO
INSERT INTO Pasillo(cantidad, numero, tipo, idSucursal, estatus) values (4, 4, 'tipo4', '4', '1')
GO
INSERT INTO Pasillo(cantidad, numero, tipo, idSucursal, estatus) values (5, 5, 'tipo5', '5', '1')
GO
INSERT INTO Pasillo(cantidad, numero, tipo, idSucursal, estatus) values (6, 6, 'tipo6', '6', '1')
GO
INSERT INTO Pasillo(cantidad, numero, tipo, idSucursal, estatus) values (7, 7, 'tipo7', '7', '1')
GO
INSERT INTO Pasillo(cantidad, numero, tipo, idSucursal, estatus) values (8, 8, 'tipo8', '8', '1')
GO
INSERT INTO Pasillo(cantidad, numero, tipo, idSucursal, estatus) values (9, 9, 'tipo9', '9', '1')
GO
INSERT INTO Pasillo(cantidad, numero, tipo, idSucursal, estatus) values (10, 10, 'tipo10', '10', '1')
GO






--Puesto
INSERT INTO Puesto(tipopuesto, idEmpleado, estatus) values ('tipopuesto1', '1', '1')
GO
INSERT INTO Puesto(tipopuesto, idEmpleado, estatus) values ('tipopuesto2', '2', '1')
GO
INSERT INTO Puesto(tipopuesto, idEmpleado, estatus) values ('tipopuesto3', '3', '1')
GO
INSERT INTO Puesto(tipopuesto, idEmpleado, estatus) values ('tipopuesto4', '4', '1')
GO
INSERT INTO Puesto(tipopuesto, idEmpleado, estatus) values ('tipopuesto5', '5', '1')
GO
INSERT INTO Puesto(tipopuesto, idEmpleado, estatus) values ('tipopuesto6', '6', '1')
GO
INSERT INTO Puesto(tipopuesto, idEmpleado, estatus) values ('tipopuesto7', '7', '1')
GO
INSERT INTO Puesto(tipopuesto, idEmpleado, estatus) values ('tipopuesto8', '8', '1')
GO
INSERT INTO Puesto(tipopuesto, idEmpleado, estatus) values ('tipopuesto9', '9', '1')
GO
INSERT INTO Puesto(tipopuesto, idEmpleado, estatus) values ('tipopuesto10', '10', '1')
GO




--Vigilancia
INSERT INTO Vigilancia(caseta, total, idSucursal, estatus) values (1, 1, '1', '1')
GO
INSERT INTO Vigilancia(caseta, total, idSucursal, estatus) values (2, 2, '2', '1')
GO
INSERT INTO Vigilancia(caseta, total, idSucursal, estatus) values (3, 3, '3', '1')
GO
INSERT INTO Vigilancia(caseta, total, idSucursal, estatus) values (4, 4, '4', '1')
GO
INSERT INTO Vigilancia(caseta, total, idSucursal, estatus) values (5, 5, '5', '1')
GO
INSERT INTO Vigilancia(caseta, total, idSucursal, estatus) values (6, 6, '6', '1')
GO
INSERT INTO Vigilancia(caseta, total, idSucursal, estatus) values (7, 7, '7', '1')
GO
INSERT INTO Vigilancia(caseta, total, idSucursal, estatus) values (8, 8, '8', '1')
GO
INSERT INTO Vigilancia(caseta, total, idSucursal, estatus) values (9, 9, '9', '1')
GO
INSERT INTO Vigilancia(caseta, total, idSucursal, estatus) values (10, 10, '10', '1')
GO

--BodegaInventario
INSERT INTO BodegaInventario(idBodega, idInventario, fechainventario, estatus) values ('1', '1', '4/12/2022', '1')
GO
INSERT INTO BodegaInventario(idBodega, idInventario, fechainventario, estatus) values ('2', '2', '4/12/2022', '1')
GO
INSERT INTO BodegaInventario(idBodega, idInventario, fechainventario, estatus) values ('3', '3', '4/12/2022', '1')
GO
INSERT INTO BodegaInventario(idBodega, idInventario, fechainventario, estatus) values ('4', '4', '4/12/2022', '1')
GO
INSERT INTO BodegaInventario(idBodega, idInventario, fechainventario, estatus) values ('5', '5', '4/12/2022', '1')
GO
INSERT INTO BodegaInventario(idBodega, idInventario, fechainventario, estatus) values ('6', '6', '4/12/2022', '1')
GO
INSERT INTO BodegaInventario(idBodega, idInventario, fechainventario, estatus) values ('7', '7', '4/12/2022', '1')
GO
INSERT INTO BodegaInventario(idBodega, idInventario, fechainventario, estatus) values ('8', '8', '4/12/2022', '1')
GO
INSERT INTO BodegaInventario(idBodega, idInventario, fechainventario, estatus) values ('9', '9', '4/12/2022', '1')
GO
INSERT INTO BodegaInventario(idBodega, idInventario, fechainventario, estatus) values ('10', '10', '4/12/2022', '1')
GO

--ClienteCompra
INSERT INTO ClienteCompra(idCliente, idCompra, fechacompra, estatus) values ('1', '1', '4/12/2022', '1')
GO
INSERT INTO ClienteCompra(idCliente, idCompra, fechacompra, estatus) values ('2', '2', '4/12/2022', '1')
GO
INSERT INTO ClienteCompra(idCliente, idCompra, fechacompra, estatus) values ('3', '3', '4/12/2022', '1')
GO
INSERT INTO ClienteCompra(idCliente, idCompra, fechacompra, estatus) values ('4', '4', '4/12/2022', '1')
GO
INSERT INTO ClienteCompra(idCliente, idCompra, fechacompra, estatus) values ('5', '5', '4/12/2022', '1')
GO
INSERT INTO ClienteCompra(idCliente, idCompra, fechacompra, estatus) values ('6', '6', '4/12/2022', '1')
GO
INSERT INTO ClienteCompra(idCliente, idCompra, fechacompra, estatus) values ('7', '7', '4/12/2022', '1')
GO
INSERT INTO ClienteCompra(idCliente, idCompra, fechacompra, estatus) values ('8', '8', '4/12/2022', '1')
GO
INSERT INTO ClienteCompra(idCliente, idCompra, fechacompra, estatus) values ('9', '9', '4/12/2022', '1')
GO
INSERT INTO ClienteCompra(idCliente, idCompra, fechacompra, estatus) values ('10', '10', '4/12/2022', '1')
GO


--ClienteCotizacion
INSERT INTO ClienteCotizacion(idCliente, idCotizacion, estatus) values ('1', '1', '1')
GO
INSERT INTO ClienteCotizacion(idCliente, idCotizacion, estatus) values ('2', '2', '1')
GO
INSERT INTO ClienteCotizacion(idCliente, idCotizacion, estatus) values ('3', '3', '1')
GO
INSERT INTO ClienteCotizacion(idCliente, idCotizacion, estatus) values ('4', '4', '1')
GO
INSERT INTO ClienteCotizacion(idCliente, idCotizacion, estatus) values ('5', '5', '1')
GO
INSERT INTO ClienteCotizacion(idCliente, idCotizacion, estatus) values ('6', '6', '1')
GO
INSERT INTO ClienteCotizacion(idCliente, idCotizacion, estatus) values ('7', '7', '1')
GO
INSERT INTO ClienteCotizacion(idCliente, idCotizacion, estatus) values ('8', '8', '1')
GO
INSERT INTO ClienteCotizacion(idCliente, idCotizacion, estatus) values ('9', '9', '1')
GO
INSERT INTO ClienteCotizacion(idCliente, idCotizacion, estatus) values ('10', '10', '1')
GO

--ClienteCredito
INSERT INTO ClienteCredito(idCliente, idCredito, fechacredito, estatus) values ('1', '1', '4/12/2022', '1')
GO
INSERT INTO ClienteCredito(idCliente, idCredito, fechacredito, estatus) values ('2', '2', '4/12/2022', '1')
GO
INSERT INTO ClienteCredito(idCliente, idCredito, fechacredito, estatus) values ('3', '3', '4/12/2022', '1')
GO
INSERT INTO ClienteCredito(idCliente, idCredito, fechacredito, estatus) values ('4', '4', '4/12/2022', '1')
GO
INSERT INTO ClienteCredito(idCliente, idCredito, fechacredito, estatus) values ('5', '5', '4/12/2022', '1')
GO
INSERT INTO ClienteCredito(idCliente, idCredito, fechacredito, estatus) values ('6', '6', '4/12/2022', '1')
GO
INSERT INTO ClienteCredito(idCliente, idCredito, fechacredito, estatus) values ('7', '7', '4/12/2022', '1')
GO
INSERT INTO ClienteCredito(idCliente, idCredito, fechacredito, estatus) values ('8', '8', '4/12/2022', '1')
GO
INSERT INTO ClienteCredito(idCliente, idCredito, fechacredito, estatus) values ('9', '9', '4/12/2022', '1')
GO
INSERT INTO ClienteCredito(idCliente, idCredito, fechacredito, estatus) values ('10', '10', '4/12/2022', '1')
GO

--ClienteQueja
INSERT INTO ClienteQueja(idCliente, idQueja, fechaqueja, estatus) values ('1', '1', '4/12/2022', '1')
GO
INSERT INTO ClienteQueja(idCliente, idQueja, fechaqueja, estatus) values ('2', '2', '4/12/2022', '1')
GO
INSERT INTO ClienteQueja(idCliente, idQueja, fechaqueja, estatus) values ('3', '3', '4/12/2022', '1')
GO
INSERT INTO ClienteQueja(idCliente, idQueja, fechaqueja, estatus) values ('4', '4', '4/12/2022', '1')
GO
INSERT INTO ClienteQueja(idCliente, idQueja, fechaqueja, estatus) values ('5', '5', '4/12/2022', '1')
GO
INSERT INTO ClienteQueja(idCliente, idQueja, fechaqueja, estatus) values ('6', '6', '4/12/2022', '1')
GO
INSERT INTO ClienteQueja(idCliente, idQueja, fechaqueja, estatus) values ('7', '7', '4/12/2022', '1')
GO
INSERT INTO ClienteQueja(idCliente, idQueja, fechaqueja, estatus) values ('8', '8', '4/12/2022', '1')
GO
INSERT INTO ClienteQueja(idCliente, idQueja, fechaqueja, estatus) values ('9', '9', '4/12/2022', '1')
GO
INSERT INTO ClienteQueja(idCliente, idQueja, fechaqueja, estatus) values ('10', '10', '4/12/2022', '1')
GO

--EmpleadoCapacitacion
INSERT INTO EmpleadoCapacitacion(idEmpleado, idCapacitacion, estatus) values ('1', '1', '1')
GO
INSERT INTO EmpleadoCapacitacion(idEmpleado, idCapacitacion, estatus) values ('2', '2', '1')
GO
INSERT INTO EmpleadoCapacitacion(idEmpleado, idCapacitacion, estatus) values ('3', '3', '1')
GO
INSERT INTO EmpleadoCapacitacion(idEmpleado, idCapacitacion, estatus) values ('4', '4', '1')
GO
INSERT INTO EmpleadoCapacitacion(idEmpleado, idCapacitacion, estatus) values ('5', '5', '1')
GO
INSERT INTO EmpleadoCapacitacion(idEmpleado, idCapacitacion, estatus) values ('6', '6', '1')
GO
INSERT INTO EmpleadoCapacitacion(idEmpleado, idCapacitacion, estatus) values ('7', '7', '1')
GO
INSERT INTO EmpleadoCapacitacion(idEmpleado, idCapacitacion, estatus) values ('8', '8', '1')
GO
INSERT INTO EmpleadoCapacitacion(idEmpleado, idCapacitacion, estatus) values ('9', '9', '1')
GO
INSERT INTO EmpleadoCapacitacion(idEmpleado, idCapacitacion, estatus) values ('10', '10', '1')
GO

--EmpleadoContrato
INSERT INTO EmpleadoContrato(idEmpleado, idContrato, fechacontrato, estatus) values ('1', '1', '4/12/2022', '1')
GO
INSERT INTO EmpleadoContrato(idEmpleado, idContrato, fechacontrato, estatus) values ('2', '2', '4/12/2022', '1')
GO
INSERT INTO EmpleadoContrato(idEmpleado, idContrato, fechacontrato, estatus) values ('3', '3', '4/12/2022', '1')
GO
INSERT INTO EmpleadoContrato(idEmpleado, idContrato, fechacontrato, estatus) values ('4', '4', '4/12/2022', '1')
GO
INSERT INTO EmpleadoContrato(idEmpleado, idContrato, fechacontrato, estatus) values ('5', '5', '4/12/2022', '1')
GO
INSERT INTO EmpleadoContrato(idEmpleado, idContrato, fechacontrato, estatus) values ('6', '6', '4/12/2022', '1')
GO
INSERT INTO EmpleadoContrato(idEmpleado, idContrato, fechacontrato, estatus) values ('7', '7', '4/12/2022', '1')
GO
INSERT INTO EmpleadoContrato(idEmpleado, idContrato, fechacontrato, estatus) values ('8', '8', '4/12/2022', '1')
GO
INSERT INTO EmpleadoContrato(idEmpleado, idContrato, fechacontrato, estatus) values ('9', '9', '4/12/2022', '1')
GO
INSERT INTO EmpleadoContrato(idEmpleado, idContrato, fechacontrato, estatus) values ('10', '10', '4/12/2022', '1')
GO

--EmpleadoPrestacion
INSERT INTO EmpleadoPrestacion(idEmpleado, idPrestacion, estatus) values ('1', '1', '1')
GO
INSERT INTO EmpleadoPrestacion(idEmpleado, idPrestacion, estatus) values ('2', '2', '1')
GO
INSERT INTO EmpleadoPrestacion(idEmpleado, idPrestacion, estatus) values ('3', '3', '1')
GO
INSERT INTO EmpleadoPrestacion(idEmpleado, idPrestacion, estatus) values ('4', '4', '1')
GO
INSERT INTO EmpleadoPrestacion(idEmpleado, idPrestacion, estatus) values ('5', '5', '1')
GO
INSERT INTO EmpleadoPrestacion(idEmpleado, idPrestacion, estatus) values ('6', '6', '1')
GO
INSERT INTO EmpleadoPrestacion(idEmpleado, idPrestacion, estatus) values ('7', '7', '1')
GO
INSERT INTO EmpleadoPrestacion(idEmpleado, idPrestacion, estatus) values ('8', '8', '1')
GO
INSERT INTO EmpleadoPrestacion(idEmpleado, idPrestacion, estatus) values ('9', '9', '1')
GO
INSERT INTO EmpleadoPrestacion(idEmpleado, idPrestacion, estatus) values ('10', '10', '1')
GO

--ProductoEnvio
INSERT INTO ProductoEnvio(idProducto, idEnvio, fechaenvio, estatus) values ('1', '1', '4/12/2022', '1')
GO
INSERT INTO ProductoEnvio(idProducto, idEnvio, fechaenvio, estatus) values ('2', '2', '4/12/2022', '1')
GO
INSERT INTO ProductoEnvio(idProducto, idEnvio, fechaenvio,estatus) values ('3', '3', '4/12/2022', '1')
GO
INSERT INTO ProductoEnvio(idProducto, idEnvio, fechaenvio, estatus) values ('4', '4', '4/12/2022', '1')
GO
INSERT INTO ProductoEnvio(idProducto, idEnvio, fechaenvio, estatus) values ('5', '5', '4/12/2022', '1')
GO
INSERT INTO ProductoEnvio(idProducto, idEnvio, fechaenvio, estatus) values ('6', '6', '4/12/2022', '1')
GO
INSERT INTO ProductoEnvio(idProducto, idEnvio, fechaenvio, estatus) values ('7', '7', '4/12/2022', '1')
GO
INSERT INTO ProductoEnvio(idProducto, idEnvio, fechaenvio, estatus) values ('8', '8', '4/12/2022', '1')
GO
INSERT INTO ProductoEnvio(idProducto, idEnvio, fechaenvio, estatus) values ('9', '9', '4/12/2022', '1')
GO
INSERT INTO ProductoEnvio(idProducto, idEnvio, fechaenvio, estatus) values ('10', '10', '4/12/2022', '1')
GO

--ProductoOferta
INSERT INTO ProductoOferta(idProducto, idOferta, fechaoferta, estatus) values ('1', '1', '4/12/2022', '1')
GO
INSERT INTO ProductoOferta(idProducto, idOferta, fechaoferta, estatus) values ('2', '2', '4/12/2022', '1')
GO
INSERT INTO ProductoOferta(idProducto, idOferta, fechaoferta, estatus) values ('3', '3', '4/12/2022', '1')
GO
INSERT INTO ProductoOferta(idProducto, idOferta, fechaoferta, estatus) values ('4', '4', '4/12/2022', '1')
GO
INSERT INTO ProductoOferta(idProducto, idOferta, fechaoferta, estatus) values ('5', '5', '4/12/2022', '1')
GO
INSERT INTO ProductoOferta(idProducto, idOferta, fechaoferta, estatus) values ('6', '6', '4/12/2022', '1')
GO
INSERT INTO ProductoOferta(idProducto, idOferta, fechaoferta, estatus) values ('7', '7', '4/12/2022', '1')
GO
INSERT INTO ProductoOferta(idProducto, idOferta, fechaoferta, estatus) values ('8', '8', '4/12/2022', '1')
GO
INSERT INTO ProductoOferta(idProducto, idOferta, fechaoferta, estatus) values ('9', '9', '4/12/2022', '1')
GO
INSERT INTO ProductoOferta(idProducto, idOferta, fechaoferta, estatus) values ('10', '10', '4/12/2022', '1')
GO

--ProductoPedidoLinea
INSERT INTO ProductoPedidoLinea(idProducto, idPedidoLinea, fechapedidolinea, estatus) values ('1', '1', '4/12/2022', '1')
GO
INSERT INTO ProductoPedidoLinea(idProducto, idPedidoLinea, fechapedidolinea, estatus) values ('2', '2', '4/12/2022', '1')
GO
INSERT INTO ProductoPedidoLinea(idProducto, idPedidoLinea, fechapedidolinea, estatus) values ('3', '3', '4/12/2022', '1')
GO
INSERT INTO ProductoPedidoLinea(idProducto, idPedidoLinea, fechapedidolinea, estatus) values ('4', '4', '4/12/2022', '1')
GO
INSERT INTO ProductoPedidoLinea(idProducto, idPedidoLinea, fechapedidolinea, estatus) values ('5', '5', '4/12/2022', '1')
GO
INSERT INTO ProductoPedidoLinea(idProducto, idPedidoLinea, fechapedidolinea, estatus) values ('6', '6', '4/12/2022', '1')
GO
INSERT INTO ProductoPedidoLinea(idProducto, idPedidoLinea, fechapedidolinea, estatus) values ('7', '7', '4/12/2022', '1')
GO
INSERT INTO ProductoPedidoLinea(idProducto, idPedidoLinea, fechapedidolinea, estatus) values ('8', '8', '4/12/2022', '1')
GO
INSERT INTO ProductoPedidoLinea(idProducto, idPedidoLinea, fechapedidolinea, estatus) values ('9', '9', '4/12/2022', '1')
GO
INSERT INTO ProductoPedidoLinea(idProducto, idPedidoLinea, fechapedidolinea, estatus) values ('10', '10', '4/12/2022', '1')
GO

--ProductoVenta
INSERT INTO ProductoVenta(idProducto, idVenta, fechaventa, estatus) values ('1', '1', '4/12/2022', '1')
GO
INSERT INTO ProductoVenta(idProducto, idVenta, fechaventa, estatus) values ('2', '2', '4/12/2022', '1')
GO
INSERT INTO ProductoVenta(idProducto, idVenta, fechaventa, estatus) values ('3', '3', '4/12/2022', '1')
GO
INSERT INTO ProductoVenta(idProducto, idVenta, fechaventa, estatus) values ('4', '4', '4/12/2022', '1')
GO
INSERT INTO ProductoVenta(idProducto, idVenta, fechaventa, estatus) values ('5', '5', '4/12/2022', '1')
GO
INSERT INTO ProductoVenta(idProducto, idVenta, fechaventa, estatus) values ('6', '6', '4/12/2022', '1')
GO
INSERT INTO ProductoVenta(idProducto, idVenta, fechaventa, estatus) values ('7', '7', '4/12/2022', '1')
GO
INSERT INTO ProductoVenta(idProducto, idVenta, fechaventa, estatus) values ('8', '8', '4/12/2022', '1')
GO
INSERT INTO ProductoVenta(idProducto, idVenta, fechaventa, estatus) values ('9', '9', '4/12/2022', '1')
GO
INSERT INTO ProductoVenta(idProducto, idVenta, fechaventa, estatus) values ('10', '10', '4/12/2022', '1')
GO

--SucursalEmpleado
INSERT INTO SucursalEmpleado(idSucursal, idEmpleado, estatus) values ('1', '1', '1')
GO
INSERT INTO SucursalEmpleado(idSucursal, idEmpleado, estatus) values ('2', '2', '1')
GO
INSERT INTO SucursalEmpleado(idSucursal, idEmpleado, estatus) values ('3', '3', '1')
GO
INSERT INTO SucursalEmpleado(idSucursal, idEmpleado, estatus) values ('4', '4', '1')
GO
INSERT INTO SucursalEmpleado(idSucursal, idEmpleado, estatus) values ('5', '5', '1')
GO
INSERT INTO SucursalEmpleado(idSucursal, idEmpleado, estatus) values ('6', '6', '1')
GO
INSERT INTO SucursalEmpleado(idSucursal, idEmpleado, estatus) values ('7', '7', '1')
GO
INSERT INTO SucursalEmpleado(idSucursal, idEmpleado, estatus) values ('8', '8', '1')
GO
INSERT INTO SucursalEmpleado(idSucursal, idEmpleado, estatus) values ('9', '9', '1')
GO
INSERT INTO SucursalEmpleado(idSucursal, idEmpleado, estatus) values ('10', '10', '1')
GO

--TransportePaquete
INSERT INTO TransportePaquete(idTransporte, idPaquete, estatus) values ('1', '1', '1')
GO
INSERT INTO TransportePaquete(idTransporte, idPaquete, estatus) values ('2', '2', '1')
GO
INSERT INTO TransportePaquete(idTransporte, idPaquete, estatus) values ('3', '3', '1')
GO
INSERT INTO TransportePaquete(idTransporte, idPaquete, estatus) values ('4', '4', '1')
GO
INSERT INTO TransportePaquete(idTransporte, idPaquete, estatus) values ('5', '5', '1')
GO
INSERT INTO TransportePaquete(idTransporte, idPaquete, estatus) values ('6', '6', '1')
GO
INSERT INTO TransportePaquete(idTransporte, idPaquete, estatus) values ('7', '7', '1')
GO
INSERT INTO TransportePaquete(idTransporte, idPaquete, estatus) values ('8', '8', '1')
GO
INSERT INTO TransportePaquete(idTransporte, idPaquete, estatus) values ('9', '9', '1')
GO
INSERT INTO TransportePaquete(idTransporte, idPaquete, estatus) values ('10', '10', '1')
GO


--Bodega
SELECT *FROM BODEGA
UPDATE Bodega SET numero = '2' WHERE idBodega = 1
GO
SELECT *FROM Bodega
--DELETE FROM Bodega WHERE idBodega = 1
GO
SELECT *FROM Bodega

--Caja
SELECT *FROM CAJA
UPDATE CAJA SET computadora = 'computadora2' WHERE idCaja = 1
GO
SELECT *FROM Caja
DELETE FROM Caja WHERE idCaja = 1
GO
SELECT *FROM Caja

--Capacitacion
SELECT *FROM CAPACITACION
UPDATE Capacitacion SET nombre = 'nombre2' WHERE idCapacitacion = 1
GO
SELECT *FROM Capacitacion
--DELETE FROM Capacitacion WHERE idCapacitacion = 1
--GO
SELECT *FROM Capacitacion

--Cliente
SELECT *FROM CLIENTE
UPDATE Cliente SET apellidomaterno = 'apellidomaterno1' WHERE idCliente = 1
GO
SELECT *FROM Cliente
--DELETE FROM Cliente WHERE idCliente = 1
GO
SELECT *FROM Cliente

--Compra
SELECT *FROM COMPRA
UPDATE Compra SET cantidad = '2' WHERE idCompra = 1
GO
SELECT *FROM Compra
--DELETE FROM Compra WHERE idCompra = 1
--GO
SELECT *FROM Compra

--Comprobante
SELECT *FROM COMPROBANTE
UPDATE Comprobante SET cantidad = '2' WHERE idComprobante = 1
GO
SELECT *FROM Comprobante
DELETE FROM Comprobante WHERE idComprobante = 1
GO
SELECT *FROM Comprobante

--Contador
SELECT *FROM CONTADOR
UPDATE Contador SET apellidomaterno = 'apellidomaterno2' WHERE idContador = 1
GO
SELECT *FROM Contador
--DELETE FROM Contador WHERE idContador = 1
GO
SELECT *FROM Contador

--Contrato
SELECT *FROM CONTRATO
UPDATE Contrato SET nombre = 'nombre2' WHERE idContrato = 1
GO
SELECT *FROM Contrato
--DELETE FROM Contrato WHERE idContrato = 1
--GO
SELECT *FROM Contrato

--Convenio
SELECT *FROM CONVENIO
UPDATE Convenio SET cantidad = '2' WHERE idConvenio = 1
GO
SELECT *FROM Convenio
DELETE FROM Convenio WHERE idConvenio = 1
GO
SELECT *FROM Convenio

--Cotizacion
SELECT *FROM COTIZACION
UPDATE Cotizacion SET cantidad = '2' WHERE idCotizacion = 1
GO
SELECT *FROM Cotizacion
--DELETE FROM Cotizacion WHERE idCotizacion = 1
--GO
SELECT *FROM Cotizacion

--Credito
SELECT *FROM CREDITO
UPDATE Credito SET creditodebe = '2' WHERE idCredito = 1
GO
SELECT *FROM Credito
--DELETE FROM Credito WHERE idCredito = 1
GO
SELECT *FROM Credito

--Delivery
SELECT *FROM DELIVERY
UPDATE Delivery SET producto = 'producto2' WHERE idDelivery = 1
GO
SELECT *FROM Delivery
DELETE FROM Delivery WHERE idDelivery = 1
GO
SELECT *FROM Delivery

--Departamento
SELECT *FROM DEPARTAMENTO
UPDATE Departamento SET nombre = 'nombre2' WHERE idDepartamento = 1
GO
SELECT *FROM Departamento
DELETE FROM Departamento WHERE idDepartamento = 1
GO
SELECT *FROM Departamento

--Devolucion
SELECT *FROM DEVOLUCION
UPDATE Devolucion SET cantidad = '2' WHERE idDevolucion = 1
GO
SELECT *FROM Devolucion
--DELETE FROM Devolucion WHERE idDevolucion = 1
GO
SELECT *FROM Devolucion

--DevolucionProveedor
SELECT *FROM DEVOLUCIONPROVEEDOR
UPDATE DevolucionProveedor SET cantidad = '2' WHERE idDevolucionProveedor = 1
GO
SELECT *FROM DevolucionProveedor
DELETE FROM DevolucionProveedor WHERE idDevolucionProveedor = 1
GO
SELECT *FROM DevolucionProveedor

--Empleado
SELECT *FROM EMPLEADO
UPDATE Empleado SET apellidomaterno = 'apellidomaterno2' WHERE idEmpleado = 1
GO
SELECT *FROM Empleado
--DELETE FROM Empleado WHERE idEmpleado = 1
GO
SELECT *FROM Empleado

--Empresa
SELECT *FROM EMPRESA
UPDATE Empresa SET nombre = 'nombre2' WHERE idEmpresa = 1
GO
SELECT *FROM Empresa
DELETE FROM Empresa WHERE idEmpresa = 1
GO
SELECT *FROM Empresa

--Envio
SELECT *FROM ENVIO
UPDATE Envio SET apellidomaterno = 'apellidomaterno2' WHERE idEnvio = 1
GO
SELECT *FROM Envio
--DELETE FROM Envio WHERE idEnvio = 1
GO
SELECT *FROM Envio

--EquipoInformatico
SELECT *FROM EQUIPOINFORMATICO
UPDATE EquipoInformatico SET cantidad = '2' WHERE idEquipoInformatico = 1
GO
SELECT *FROM EquipoInformatico
DELETE FROM EquipoInformatico WHERE idEquipoinformatico = 1
GO
SELECT *FROM EquipoInformatico

--Estacionamiento
SELECT *FROM ESTACIONAMIENTO
UPDATE Estacionamiento SET lugar = '2' WHERE idEstacionamiento = 1
GO
SELECT *FROM Estacionamiento
DELETE FROM Estacionamiento WHERE idEstacionamiento = 1
GO
SELECT *FROM Estacionamiento

--FacturaCliente
SELECT *FROM FACTURACLIENTE
UPDATE FacturaCliente SET cantidad = '2' WHERE idFacturaCliente = 1
GO
SELECT *FROM FacturaCliente
--DELETE FROM FacturaCliente WHERE idFacturaCliente = 1
--GO
SELECT *FROM FacturaCliente

--FacturaProveedor
SELECT *FROM FACTURACLIENTE
UPDATE FacturaProveedor SET cantidad = '2' WHERE idFacturaProveedor = 1
GO
SELECT *FROM FacturaProveedor
DELETE FROM FacturaProveedor WHERE idFacturaProveedor = 1
GO
SELECT *FROM FacturaProveedor

--HorarioTrabajador
SELECT *FROM HORARIOTRABAJADOR
UPDATE HorarioTrabajador SET entrada = '2/12/2022' WHERE idHorarioTrabajador = 1
GO
SELECT *FROM HorarioTrabajador
DELETE FROM HorarioTrabajador WHERE idHorarioTrabajador = 1
GO
SELECT *FROM HorarioTrabajador


--Inventario
SELECT *FROM INVENTARIO
UPDATE Inventario SET nombre = 'nombre2' WHERE idInventario = 1
GO
SELECT *FROM Inventario 
--DELETE FROM Inventario WHERE idInventario = 1
GO
SELECT *FROM Inventario

--Mantenimiento
SELECT *FROM MANTENIMIENTO
UPDATE Mantenimiento SET fecha = '2/12/2022' WHERE idMantenimiento = 1
GO
SELECT *FROM Mantenimiento
DELETE FROM Mantenimiento WHERE idMantenimiento = 1
GO
SELECT *FROM Mantenimiento

--Marca
SELECT *FROM MARCA
UPDATE Marca SET ciudad = 'ciudad2' WHERE idMarca = 1
GO
SELECT *FROM Marca
--DELETE FROM Marca WHERE idMarca = 1
GO
SELECT *FROM Marca

--Marketing
SELECT *FROM MARKETING
UPDATE Marketing SET tipo = 'tipo2' WHERE idMarketing = 1
GO
SELECT *FROM Marketing 
DELETE FROM Marketing WHERE idMarketing = 1
GO
SELECT *FROM Marketing

--MateriaPrima
SELECT *FROM MATERIAPRIMA
UPDATE MateriaPrima SET nombre = 'nombre2' WHERE idMateriaPrima = 1
GO
SELECT *FROM MateriaPrima
DELETE FROM MateriaPrima WHERE idMateriaPrima = 1
GO
SELECT *FROM MateriaPrima

--Membresia
SELECT *FROM MEMBRESIA
UPDATE Membresia SET nombre = 'nombre2' WHERE idMembresia = 1
GO
SELECT *FROM Membresia
--DELETE FROM Membresia WHERE idMembresia = 1
GO
SELECT *FROM Membresia

--MetodoPago
SELECT *FROM METODOPAGO
UPDATE MetodoPago SET tipo = 'tipo2' WHERE idMetodopago = 1
GO
SELECT *FROM MetodoPago
DELETE FROM MetodoPago WHERE idMetodopago = 1
GO
SELECT *FROM MetodoPago

--Mobiliario
SELECT *FROM MOBILIARIO
UPDATE Mobiliario SET nombre = 'nombre2' WHERE idMobiliario = 1
GO
SELECT *FROM Mobiliario
DELETE FROM Mobiliario WHERE idMobiliario = 1
GO
SELECT *FROM Mobiliario

--Nomina
SELECT *FROM NOMINA
UPDATE Nomina SET persona = 'persona2' WHERE idNomina = 1
GO
SELECT *FROM Nomina
DELETE FROM Nomina WHERE idNomina = 1
GO
SELECT *FROM Nomina

--Oferta
SELECT *FROM OFERTA
UPDATE Oferta SET producto = 'producto2' WHERE idOferta = 1
GO
SELECT *FROM Oferta
--DELETE FROM Oferta WHERE idOferta = 1
--GO
SELECT *FROM Oferta

--PagoServicio
SELECT *FROM PAGOSERVICIO
UPDATE PagoServicio SET servicio = 'servicio2' WHERE idPagoservicio = 1
GO
SELECT *FROM PagoServicio
DELETE FROM PagoServicio WHERE idPagoServicio = 1
GO
SELECT *FROM PagoServicio

--Paquete
SELECT *FROM Paquete
UPDATE Paquete SET remitente = 'remitente2' WHERE idPaquete = 1
GO
SELECT *FROM Paquete
--DELETE FROM Paquete WHERE idPaquete = 1
--GO
SELECT *FROM Paquete

--Pasillo
SELECT *FROM PASILLO
UPDATE Pasillo SET tipo = 'tipo2' WHERE idPasillo = 1
GO
SELECT *FROM Pasillo
DELETE FROM Pasillo WHERE idPasillo = 1
GO
SELECT *FROM Pasillo

--PedidoLinea
SELECT *FROM PEDIDOLINEA
UPDATE PedidoLinea SET fecha = '2/12/2022' WHERE idPedidoLinea = 1
GO
SELECT *FROM PedidoLinea
--DELETE FROM PedidoLinea WHERE idPedidoLinea = 1
--GO
SELECT *FROM PedidoLinea

--Prestacion
SELECT *FROM PRESTACION
UPDATE Prestacion SET tipo = 'tipo2' WHERE idPrestacion = 1
GO
SELECT *FROM Prestacion
DELETE FROM Prestacion WHERE idPrestacion = 1
GO
SELECT *FROM Prestacion

--Produccion
SELECT *FROM PRODUCCION
UPDATE Produccion SET fecha = '2/12/2022' WHERE idProduccion = 1
GO
SELECT *FROM Produccion 
--DELETE FROM Produccion WHERE idProduccion = 1
GO
SELECT *FROM Produccion

--Producto
SELECT *FROM PRODUCTO 
UPDATE Producto SET nombre = 'nombre2' WHERE idProducto = 1
GO
SELECT *FROM Producto
--DELETE FROM Producto WHERE idProducto = 1
--GO
SELECT *FROM Producto

--Proveedor
SELECT *FROM PROVEEDOR
UPDATE Proveedor SET apellidomaterno = 'apellidomaterno2' WHERE idProveedor = 1
GO
SELECT *FROM Proveedor
DELETE FROM Proveedor WHERE idProveedor = 1
GO
SELECT *FROM Proveedor

--Puesto
SELECT *FROM PUESTO
UPDATE Puesto SET tipopuesto = 'tipopuesto2' WHERE idPuesto = 1
GO
SELECT *FROM Puesto
DELETE FROM Puesto WHERE idPuesto = 1
GO
SELECT *FROM Puesto

--Queja
SELECT *FROM QUEJA
UPDATE Queja SET fecha = '2/12/2022' WHERE idQueja = 1
GO
SELECT *FROM Queja
--DELETE FROM Queja WHERE idQueja = 1
--GO
SELECT *FROM Queja

--Representante
SELECT *FROM REPRESENTANTE
UPDATE Representante SET apellidomaterno = 'apellidomaterno2' WHERE idRepresentante = 1
GO
SELECT *FROM Representante
DELETE FROM Representante WHERE idRepresentante = 1
GO
SELECT *FROM Representante

--Restaurante 
SELECT *FROM RESTAURANTE
UPDATE Restaurante SET comida = 'comida2' WHERE idRestaurante = 1
GO
SELECT *FROM Restaurante
DELETE FROM Restaurante WHERE idRestaurante = 1
GO
SELECT *FROM Restaurante

--Sucursal
SELECT *FROM SUCURSAL
UPDATE Sucursal SET nombre = 'nombre2' WHERE idSucursal = 1
GO
SELECT *FROM Sucursal
--DELETE FROM Sucursal WHERE idSucursal = 1
GO
SELECT *FROM Sucursal

--TarjetaPunto
SELECT *FROM TARJETAPUNTO
UPDATE TarjetaPunto SET beneficios = 'beneficios2' WHERE idTarjetapunto = 1
GO
SELECT *FROM TarjetaPunto
--DELETE FROM TarjetaPunto WHERE idTarjetaPunto = 1
GO
SELECT *FROM TarjetaPunto

--Transporte
SELECT *FROM Transporte
UPDATE Transporte SET marca = 'marca2' WHERE idTransporte = 1
GO
SELECT *FROM Transporte
--DELETE FROM Transporte WHERE idTransporte = 1
--GO
SELECT *FROM Transporte

--Venta
SELECT *FROM Venta
UPDATE Venta SET fecha = '2/12/2022' WHERE idVenta = 1
GO
SELECT *FROM Venta
--DELETE FROM Venta WHERE idVenta = 1
--GO
SELECT *FROM Venta

--Vigilancia
SELECT *FROM VIGILANCIA
UPDATE Vigilancia SET total = '2' WHERE idVigilancia = 1
GO
SELECT *FROM Vigilancia
DELETE FROM Vigilancia WHERE idVigilancia = 1
GO
SELECT *FROM Vigilancia