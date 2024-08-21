/*
select * from customers
select * from shippers
select * from employees
select * from categories
*/

select customer_id, company_name, contact_name from Customers

select Company_name as Sirket_Adi, Address adres, city sehir from Customers

select * from Customers where Country = 'Germany'
--Berlin sehrindeki müsterilerin listesi
select *
from customers
where Country = 'Germany' and city = 'Berlin'
--urunler tablosuna göz atalım
select * from products;
select * from suppliers;
select * from Categories;

--1 numaralı kategoryie ait urunlerin listesi
select * from products where category_id = 1;

-- siparisler tablosuna goz atalım

select * from orders