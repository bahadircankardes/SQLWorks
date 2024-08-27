-- Alt Sorgu
-- hic siparis almamıs urun var mı?
select * from products;
select * from orders limit 10;
select * from order_details limit 10;
-- hic siparis almamıs urun var mı?

select * from products where product_id not in (select product_id from order_details);

--hic siparis vermemis musteri var mı?

select * from customers where customer_id not in (select customer_id from orders)

--Calışmadı sor
select o.order_id,
(select company_name from customers where customer_id = o.customer_id) Musteri,
(select first_name || ' ' || last_name from employees where empolee_id = o.employee_id) Calisan
from orders o
