-- Tabloya yeni bir kayit eklemek için Insert komutu kullanilir.
-- Kullanim sekli 
-- Insert into <tabloadi> (kolon1,kolon2,kolon3, ...vb) values (deger1, deger2, deger3, vb)
INSERT INTO shippers (shipper_id, company_name, phone) values (7, 'MNG Kargo', '444 0 334')
select * from shippers

select * from employees
select * from orders

-- Kendinizi Employee tablosuna kaydedin
insert into employees (employee_id, last_name, first_name) values (11, 'Kardes', 'BahadirCan')

-- 10 adet cay, 1 kg, mozarella peyniri, 5 adet Ikura siparisi alin. Musteriyi siz secin.
select * from products --Cay 1, Mozarella 72, Ikura 10 
select * from customers --ALFKI
select * from orders
order by order_id DESC --order_date, required_date

insert into orders (order_id, customer_id, employee_id, order_date, required_date, shipped_date, ship_via, ship_city, ship_country) 
values (11078, 'ALFKI', 10, '2024-08-25','2024-09-10', '2024-09-01', 3, 'Berlin', 'Germany')

--Elde edilen order_id ile Order_details tablosuna siparis edilen urunleri eklemem gerekir.ACCESS
select * from order_details
insert into order_details (order_id, product_id, unit_price, quantity, discount) 
values (11078, 1, 20, 20, 0) -- cay için kayıt
insert into order_details (order_id, product_id, unit_price, quantity, discount) 
values (11078, 72, 40, 2, 0) -- Mozarella için kayıt
insert into order_details (order_id, product_id, unit_price, quantity, discount) 
values (11078, 10, 40, 5, 0) -- Ikura için kayıt

select * from order_details where order_id = 11078

/*
Update : tablodaki verileri guncellemeye yarar.
update<tablo_ismi> set column1 = value1, column2 = value2 where <kosul>

*/

select *from shippers
update shippers set phone = '444 99 88' where shipper_id = 7
update shippers set company_name = 'Yurtici Krgo' where shipper_id = 7

select * from employees
update employees set birth_date = '2000.01.01' where employee_id = 11
update employees set birth_date = '2000/01/18' where employee_id = 11

update employees set birth_date = to_date ('2000.23.01' , 'yyyy.dd.mm') where employee_id = 1

-- money ve real veri tiplerinin update i
select * from order_details where order_id = 11078 and product_id = 10

update order_details set unit_price = 5.45, discount = 0.20, quantity = 4 
where order_id = 11078 and product_id = 10

--Primary Key alani update edilemez
select * from shippers

--Delete : tablodan kayit silmeye yarar.
delete from yedekorders where date_part('month', order_date) = 7

--Tabloyu yedekleme
select * into yedekproducts from products 
select * from yedekproducts

select * into yedekorders from orders where date_part('year', order_date) = 1996
select * from yedekorders