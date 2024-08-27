select Orders.order_id, customers.company_name, Orders.order_date
from Orders
inner join customers on orders.customer_id = customers.customer_id;


select * from orders limit 10;
--********************

select o.order_id, c.company_name Musteri, (e.first_name || ' ' || e.last_name) Calisan,
o.order_date SiparisTarihi, s.company_name Kargo, o.ship_city sehir, o.ship_country

from orders o

inner join customers c on c.customer_id = o.customer_id
inner join employees e on e.employee_id = o.employee_id
inner join shippers s on s.shipper_id = o.ship_via

where o.ship_country ='UK'
order by o.order_date desc

-- kargo firmalarinin tasidigi urunlerın yillara gore dagilimi

select date_part('year', o.order_date) Yil, s.company_name, count(*) Adet
from orders o
inner join shippers s on s.shipper_id = o.ship_via
group by date_part('year', o.order_date), s.company_name
order by Adet

-- 

select * from orders o limit 3;
select * from order_details limit 5;

--her siparisin toplam tutari nedir?

select o.order_id,  c.company_name, sum(od.unit_price * od.quantity) ciro 

from orders o
inner join order_details od on od.order_id = o.order_id 
inner join customers c on c.customer_id = o.customer_id
group by o.order_id, c.company_name
order by o.order_id

-- 1997 yilindaki calısanların yaptigi ciro nedir?
select * from order_details limit 2;
select * from orders limit 3; --order_date lazım , empolyee_id lazim

select o.employee_id Id, (e.first_name || ' ' || e.last_name) Calisan, round(sum(od.unit_price * od.quantity)) ciro
from orders o
inner join order_details od on od.order_id = o.order_id
inner join employees e on e.employee_id = o.employee_id
where date_part(('year'),o.order_date) = 1997
group by o.employee_id, Calisan
order by ciro;

select * from employees

select * from employees limit 3;

select (e.first_name||' '||e.last_name) Calisan, count (o.order_id)
from orders o
right join employees e on e.employee_id = o.employee_id
group by Calisan

select p.product_name, count(od.order_id) siparis_sayisi
from products p
left join order_details od on od.product_id = p.product_id
group by p.product_name
having count(od.order_id) = 0

-- 1- 1997 yilinin aylara gore ciro dağılımı nedir? --orders-order_date-order_id, order_details-order id joinlenecek, 
select date_part('month', o.order_date) Ay, round(sum(od.unit_price * od.quantity )) Ciro
from orders o
inner join order_details od on od.order_id = o.order_id
where date_part('year', o.order_date) = 1997
group by date_part('month',o.order_date)

-- 2 -Almanya'nin yillara göre toplam cirosu nedir?
select * from orders limit 3
--orders-order_date, ship_country, order_id
--order_details-order_id, unit_price, quantity
select date_part('year', o.order_date) Yil, round(sum(od.unit_price * od.quantity )) Ciro
from orders o
inner join order_details od on od.order_id = o.order_id
where o.ship_country = 'Germany'
group by Yil

-- 3 -Kategorilerin ciroları nedir?
--categories-category_name, category_id
--products product_id, category_id
--orders-order_id, 
--order_details-order_id,product_id, unit_price, quantity
select p.category_id KategoriNo, c.category_name Kategori, round(sum(od.unit_price * od.quantity )) Ciro
from orders o
inner join order_details od on od.order_id = o.order_id
inner join products p on p.product_id = od.product_id
inner join categories c on c.category_id = p.category_id 
group by Kategori, KategoriNo
order by Ciro desc

-- 4-Geç teslim edilen siparislerin listesi ve buradaki ciro nedir?
    -- bir de buradaki siparisteki urunleri tedarik ettiğim firmalar hangileridir?
--order-order_id, required_date, ship_date
--order_details-order_id, unit_price, quantity ,product_id
--products- product_id, supplier_id
--suppliers- supplier_id, company_name
select o.order_id SiparisNo, round(sum (od.unit_price * od. quantity)) Ciro
from orders o
inner join order_details od on od.order_id = o.order_id
inner join products p on p.product_id = od.product_id
--inner join suppliers s on s.supplier_id = p.supplier_id
where o.required_date < o.shipped_date
group by SiparisNo
order by ciro desc

--order-order_id, required_date, ship_date
--order_details-order_id, unit_price, quantity ,product_id
--products- product_id, supplier_id
--suppliers- supplier_id, company_name

select o.order_id SiparisNo, p.product_name UrunAdi, s.company_name Tedarikci
from orders o
inner join order_details od on od.order_id = o.order_id
inner join products p on p.product_id = od.product_id
inner join suppliers s on s.supplier_id = p.supplier_id
where o.required_date < o.shipped_date
group by Tedarikci, SiparisNo, UrunAdi

-- 5- Ulkelere gore ciro dagilimlari 
    -- customer customer_id-county,
    -- order_details-order_id-unit_price-quantity
    -- order-order_id-customer_id

    select c.country Ulke, round(sum(od.unit_price * quantity)) Ciro
    from orders o
    inner join customers c on c.customer_id = o.customer_id
    inner join order_details od on od.order_id = o.order_id
    group by Ulke
