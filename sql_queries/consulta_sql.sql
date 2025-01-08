create database salesdatalarge;
use salesdatalarge;
show tables;
describe salesdatalarge;
rename table salesdatalarge
to salesdata;
describe salesdata;

select * from salesdata;

alter table salesdata
add ID int not null;

alter table salesdata 
modify ID int not null auto_increment primary key;

alter table salesdata modify orderid varchar(255) not null;

alter table salesdata modify category varchar(255) not null;

alter table salesdata modify region varchar(255) not null;

alter table salesdata modify product varchar(255) not null;

alter table salesdata modify quantity int not null;

alter table salesdata modify price decimal(10,2) not null;

alter table salesdata modify totalsales decimal(10,2) not null;

alter table salesdata modify orderdate date not null;

select  count(*) as duplicado from salesdata 
group by orderid
having count(*) >1;

rename table salesdata to orders;

select * from orders;

create table regions(
reguionid int auto_increment primary key,
region varchar(255)
);

create table categorys(
categoryid int auto_increment primary key,
category varchar(255)
);

create table products(
productid int auto_increment primary key,
product varchar(255)
);

INSERT INTO Regions (Region)
SELECT DISTINCT Region FROM Orders;

select * from regions;

insert into categorys (category)
select distinct category from orders;

select * from categorys;

INSERT INTO Products (Product)
SELECT DISTINCT Product FROM Orders;

select * from products;

select count(*) total  from products;

ALTER TABLE Orders ADD COLUMN RegionID INT;
ALTER TABLE Orders ADD COLUMN CategoryID INT;
ALTER TABLE Orders ADD COLUMN ProductID INT;

SET SQL_SAFE_UPDATES = 0;

UPDATE Orders
JOIN Regions ON Orders.Region = Regions.Region
SET Orders.RegionID = Regions.RegionID;

UPDATE Orders
JOIN Categorys ON Orders.Category = Categorys.Category
SET Orders.CategoryID = Categorys.CategoryID;

UPDATE Orders
JOIN Products ON Orders.Product = Products.Product
SET Orders.ProductID = Products.ProductID;

SET SQL_SAFE_UPDATES = 1;

ALTER TABLE Orders DROP COLUMN Product;

ALTER TABLE Orders DROP COLUMN Category;

ALTER TABLE Orders DROP COLUMN Region;

select * from orders;

select product, price, category, region
from orders o
inner join products p on o.productid = p.productid
inner join categorys c on o.categoryid = c.categoryid
inner join regions r on o.Regionid = r.regionid;

SELECT * FROM products;

SELECT product, SUM(quantity) AS total
FROM orders o
INNER JOIN products p ON o.productid = p.productid 
GROUP BY product
ORDER BY total DESC
LIMIT 5;

SELECT p.product, SUM(quantity) as cantidad, SUM(totalsales) as suma_total
FROM orders o
INNER JOIN products p ON o.productid = p.productid
GROUP BY p.product
ORDER BY suma_total desc
LIMIT 10;

SELECT r.region, SUM(totalsales)AS vanta_total
FROM orders o
INNER JOIN regions r on o.regionid = r.regionid
GROUP BY r.region
ORDER BY vanta_total;

SELECT c.category, SUM(quantity) as cantidad, SUM(totalsales) AS venta_total
FROM orders o
INNER JOIN categorys c on o.categoryid = c.categoryid
GROUP BY c.category
ORDER BY venta_total;

SELECT p.product, r.region, SUM(totalsales) as venta_total
FROM orders o 
INNER JOIN regions r on o.regionid = r.regionid
INNER JOIN products p on o.productid = p.productid
GROUP BY  p.product, r.region
ORDER BY r.region, venta_total desc;
 
SELECT p.product, r.region, SUM(totalsales) as venta_total
FROM orders o 
INNER JOIN regions r on o.regionid = r.regionid
INNER JOIN products p on o.productid = p.productid
GROUP BY  r.region, p.product
ORDER BY p.product, venta_total desc;
 
SELECT product, SUM(totalsales) venta_total
FROM orders o
INNER JOIN products p on o.productid = p.productid
INNER JOIN regions r on o.regionid = r.regionid
WHERE region = "East"
GROUP BY product
ORDER BY venta_total desc 
LIMIT 3;

SELECT product, SUM(quantity) venta_total
FROM orders o
INNER JOIN products p on o.productid = p.productid
INNER JOIN regions r on o.regionid = r.regionid
WHERE region = "East"
GROUP BY product
ORDER BY venta_total desc 
LIMIT 3;


SELECT product, SUM(quantity) venta_total
FROM orders o
INNER JOIN products p on o.productid = p.productid
INNER JOIN regions r on o.regionid = r.regionid
WHERE region = "north"
GROUP BY product
ORDER BY venta_total desc 
LIMIT 3;


SELECT product, SUM(totalsales) venta_total
FROM orders o
INNER JOIN products p on o.productid = p.productid
INNER JOIN regions r on o.regionid = r.regionid
WHERE region = "north"
GROUP BY product
ORDER BY venta_total desc 
LIMIT 3;



SELECT product, SUM(totalsales) venta_total
FROM orders o
INNER JOIN products p on o.productid = p.productid
INNER JOIN regions r on o.regionid = r.regionid
WHERE region = "south"
GROUP BY product
ORDER BY venta_total desc 
LIMIT 3;


SELECT product, SUM(quantity) venta_total
FROM orders o
INNER JOIN products p on o.productid = p.productid
INNER JOIN regions r on o.regionid = r.regionid
WHERE region = "south"
GROUP BY product
ORDER BY venta_total desc 
LIMIT 3;


SELECT product, SUM(quantity) venta_total
FROM orders o
INNER JOIN products p on o.productid = p.productid
INNER JOIN regions r on o.regionid = r.regionid
WHERE region = "west"
GROUP BY product
ORDER BY venta_total desc 
LIMIT 3;

SELECT product, SUM(totalsales) venta_total
FROM orders o
INNER JOIN products p on o.productid = p.productid
INNER JOIN regions r on o.regionid = r.regionid
WHERE region = "west"
GROUP BY product
ORDER BY venta_total desc 
LIMIT 3;

SELECT category, SUM(quantity) AS cantidad
FROM orders o 
INNER JOIN categorys c on o.categoryid = c.categoryid
GROUP BY category
ORDER BY cantidad desc;


SELECT product, region, SUM(totalsales) AS total_v
FROM orders o
INNER JOIN products p ON o.productid = p.productid
INNER JOIN regions r ON o.regionid = r.regionid
GROUP BY product, region
ORDER BY total_v DESC
LIMIT 1;

SELECT product, region, SUM(quantity) AS total_v
FROM orders o
INNER JOIN products p ON o.productid = p.productid
INNER JOIN regions r ON o.regionid = r.regionid
GROUP BY product, region
ORDER BY total_v DESC
LIMIT 1;