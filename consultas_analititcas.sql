CREATE TABLE Categoria (
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    nombre VARCHAR(255) NOT NULL
);

CREATE TABLE Producto (
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    nombre VARCHAR(255) NOT NULL,
    marca VARCHAR(255) NOT NULL,
    categoria_id INTEGER REFERENCES Categoria(id),
    precio_unitario DECIMAL(10, 2) NOT NULL
);

CREATE TABLE Sucursal (
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    nombre VARCHAR(255) NOT NULL,
    direccion VARCHAR(255) NOT NULL
);

CREATE TABLE Stock (
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    sucursal_id INTEGER REFERENCES Sucursal(id),
    producto_id INTEGER REFERENCES Producto(id),
    cantidad INTEGER NOT NULL,
    CONSTRAINT unique_stock UNIQUE (sucursal_id, producto_id)
);

CREATE TABLE Cliente (
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    nombre VARCHAR(255) NOT NULL,
    telefono VARCHAR(15) NOT NULL
);

CREATE TABLE Orden (
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    cliente_id INTEGER REFERENCES Cliente(id),
    sucursal_id INTEGER REFERENCES Sucursal(id),
    fecha DATE NOT NULL,
    total DECIMAL(10, 2) NOT NULL
);

CREATE TABLE Item (
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    orden_id INTEGER REFERENCES Orden(id),
    producto_id INTEGER REFERENCES Producto(id),
    cantidad INTEGER NOT NULL,
    monto_venta DECIMAL(10, 2) NOT NULL
);


INSERT into Categoria(nombre) values
('Electrónicos')
,('Ropa')
,('Hogar')
,('Deportes')
,('Juguetes');

insert into Producto( nombre,marca, categoria_id, precio_unitario) values ( 'Televisor','Sony',	1,	1000)
,('Laptop','HP',	1,	800)
,('Camisa','Zara',	2,	50)
,('Pantalón',"Levi's",	2,	70)
,('Sartén','T-fal',	3,	30)
,('Toalla','Cannon',	3,	20)
,('Pelota','Nike',	4,	15)
,('Raqueta','Wilson',	4,	50)
,('Muñeca','Barbie',	5,	25)
,('Carro',	'Hot Wheels',	5,	10);

INSERT INTO Sucursal (nombre, direccion) values ('Sucursal A',	'Calle 1')
,('Sucursal B',	'Calle 2')
,('Sucursal C',	'Calle 3');

INSERT into Cliente (nombre, telefono) values ('Juan',	'1234567890')
,('María',	'0987654321')
,('Pedro',	'5555555555');

INSERT INTO Orden (cliente_id, sucursal_id, fecha, total) values (1,	3,	'2023-06-12',	575)
,(2,	1,	'2023-06-12',	705)
,(3,	3,	'2023-06-12',	9000)
,(2,	3,	'2023-06-12',	10400)
,(3,	3,	'2023-06-12',	85)
,(1,	1,	'2023-06-12',	830)
,(1,	1,	'2023-06-12',	490)
,(3,	3,	'2023-06-12',	16100)
,(3,	2,	'2023-06-12',	680)
,(2,	1,	'2023-06-12',	7525)
,(2,	3,	'2023-06-12',	725)
,(3,	1,	'2023-06-12',	11430)
,(3,	3,	'2023-06-12',	4900)
,(3,	3,	'2023-06-12',	5490)
,(1,	1,	'2023-06-12',	420);

INSERT into Stock (sucursal_id, producto_id, cantidad) values (1,	1,	65)
,(1,	2,	71)
,(1,	3,	8)
,(1,	4,	42)
,(1,	5,	61)
,(1,	6,	14)
,(1,	7,	70)
,(1,	8,	66)
,(1,	9,	13)
,(1,	10,	68)
,(2,	1,	14)
,(2,	2,	67)
,(2,	3,	74)
,(2,	4,	32)
,(2,	5,	75)
,(2,	6,	37)
,(2,	7,	14)
,(2,	8,	42)
,(2,	9,	51)
,(2,	10,	41)
,(3,	1,	59)
,(3,	2,	98)
,(3,	3,	52)
,(3,	4,	85)
,(3,	5,	31)
,(3,	6,	17)
,(3,	7,	13)
,(3,	8,	18)
,(3,	9,	76)
,(3,	10,	1);

INSERT INTO Item(orden_id, producto_id, cantidad, monto_venta) values (1,	9,	7,	175)
,(1,	8,	8,	400)
,(2,	9,	3,	75)
,(2,	5,	9,	270)
,(2,	5,	10,	300)
,(2,	6,	3,	60)
,(3,	1,	9,	9000)
,(4,	1,	4,	4000)
,(4,	2,	8,	6400)
,(5,	6,	2,	40)
,(5,	7,	3,	45)
,(6,	4,	9,	630)
,(6,	9,	4,	100)
,(6,	3,	2,	100)
,(7,	5,	8,	240)
,(7,	9,	6,	150)
,(7,	8,	2,	100)
,(8,	1,	6,	6000)
,(8,	1,	10,	10000)
,(8,	3,	2,	100)
,(9,	8,	9,	450)
,(9,	3,	3,	150)
,(9,	7,	2,	30)
,(9,	10,	5,	50)
,(10,	9,	9,	225)
,(10,	1,	7,	7000)
,(10,	3,	6,	300)
,(11,	7,	5,	75)
,(11,	9,	8,	200)
,(11,	3,	9,	450)
,(12,	2,	7,	5600)
,(12,	1,	5,	5000)
,(12,	6,	9,	180)
,(12,	8,	9,	450)
,(12,	8,	4,	200)
,(13,	9,	4,	100)
,(13,	2,	6,	4800)
,(14,	1,	5,	5000)
,(14,	4,	7,	490)
,(15,	9,	6,	150)
,(15,	5,	9,	270);
   

'Obtener el precio mínimo, precio máximo y precio promedio de todos los productos'
SELECT nombre, min(precio_unitario) as precio_minimo from Producto p 

'precio máximo'
SELECT nombre, max(precio_unitario) as precio_maximo from Producto p 

'precio promedio'
SELECT AVG(precio_unitario) as promedio_precios from Producto p 

'Calcular la cantidad total de productos en stock por sucursal'
SELECT s.nombre, sum(sto.cantidad) as catidad_total_productos from stock sto 
join Producto p on sto.producto_id = p.id 
join Sucursal s on sto.sucursal_id = s.id 
GROUP by s.nombre 

'Obtener el total de ventas por cliente.'
SELECT c.nombre, sum(o.total) as total_gasto_cliente from Orden o 
join Cliente c on o.cliente_id = c.id group by c.nombre 