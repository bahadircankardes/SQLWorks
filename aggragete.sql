--Aggragete Fonsksiyonlar(Toplam fonksiyonlari, gruplama fonksiyonlari, sayma fonksiyonlari, )

-- Sayma : Count ()

select COUNT (*) from orders

--1997 yilinda Almanya Kac adet siparis vermistir.

select COUNT(*) from orders where ship_country = 'Germany' and date_part('year', order_date)= 1997;
select count(first_name) from employees;
select region from employees;
select count (region) from employees; -- count 'null ' olanlari saymaz
-- employees tablosundaregion alanı 'null' olan kayitlari bulunuz
select count(*) from employees where region is null;

select * from employees;
select count(country) from employees;
--Tekil kayit
select count(distinct country) from employees; -- tablodaki tekil kayitlari bulmaya yarar

--Sum Toplama
--product_id si 1 olan yani cay olan urun kac adet satilmistir
select * from order_details;

select sum(quantity) from order_details where product_id = 1 limit 100;

-- cay dan elde edilen ciro nedir.
select sum (quantity * unit_price* (1-discount)) İndirimliCiro, 
       sum (quantity * unit_price) ToplamCiro 
from order_details where product_id = 1;

-- Tarih alanlari icin sum
select * from employees;
select sum(date_part('year', birth_date))/count(*) from employees;
select avg (date_part('year', birth_date)) from employees;

--caylarin ortalama siparis adetleri
select avg (quantity) from order_details where product_id =1;

--************Yuvarlama************

select ROUND (234.111,-1);--230
select ROUND (234.999,-1);--230
select ROUND (235.111,-1);--240

select ROUND (234.111,0);--234
select ROUND (234.111,1);--234.1

select ROUND (234.111,0);--234
select ROUND (239.111,0);--239
select ROUND (235.111,0);--235

select ROUND (234.111,1);--234.1
select ROUND (239.111,2);--239.11
select ROUND (235.111,1);--235.1

--yukarı yuvarlama
select ceiling(234.111);
select ceiling(9.5);

--asagı yuvarlama
select floor(234.111);
select floor(9.99); 

--****** Max, Min ***********
select * from products
select MAX(unit_price), min (unit_price) from products;
select min(unit_price) from products;
select min(birth_date) from employees;
select max(birth_date) from employees;
select min(first_name) from employees;
select max(first_name) from employees;
--max ve min  olmasaydi en pahali urunu nasıl bulurdum.
select * from products ORDER BY unit_price DESC;
select * from products ORDER BY unit_price DESC limit 1;

select * from products order by unit_price ASC limit 1;

---******* Group By kullanimi*********
--Kac farkli ülke var

select count(distinct country) from employees;

-- bu ülkelerden kac adet var
select country, count (country) from employees group by country

-- ulkelere gore musterı sayisi dagilimi nedir

select country, count (country) from customers group by country order by count desc;

-- 1997 yilinda hangi ulke kac adet siparis vermistir.

select ship_country, count(ship_country) from orders where date_part('year', order_date) = 1997 group by ship_country order by count desc; 

-- 1997 yilindaki siparislerin aylara gore dağılımı

select date_part('month', order_date) Ay, count(*) Adet  
from orders 
where date_part('year', order_date) = 1997 group by (date_part('month', order_date))
order by Ay;

-- 1997 yilinda en az siparis alan elemanlar kimlerdir
select * from orders;
select employee_id, count(date_part('year', order_date)) 
from orders where date_part('year', order_date) = 1997 
group by employee_id order by count desc;

-- 1997 yilinda kargo firmalarının tasidiği siparis sayisi nedir
select * from shippers;

select ship_via, Count(date_part('year', order_date)) from orders where date_part('year', order_date) = 1997 group by ship_via; 

-- kargo firmalarının yıllara gore tasıdıkları sıparıs dagılımı nedir

select ship_via as Kargo_id, date_part('year', order_date) as Yıl, Count(date_part('year', order_date)) as Siparis 
from orders group by ship_via, date_part('year', order_date);

--hangi kategoride kac adet urun var
select category_id, units_in_stock from products;

select category_id, sum(units_in_stock) from products group by category_id order by category_id;

-- toplamda en fazla siparis alan ilk uc elemana odul verılecektır bunlar kımlerdır

select employee_id, count(order_date) as siparis from orders group by employee_id order by siparis desc limit 3;

-- en az siparis veren ilk uc musterı kimlerdir, Daha fazla uzerıne dusun, ındırım yapin

select customer_id, Count(order_date) from orders group by customer_id order by count asc limit 3 ;










