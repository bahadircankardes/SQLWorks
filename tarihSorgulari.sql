-- bugunun tarıhı
--Sql server da Getate()

select current_date;
select current_time;
select CURRENT_TIMESTAMP -- date ve time birlikte gelir

--Datepart kullanımı

select date_part('year', CURRENT_TIMESTAMP);-- yılı verır
select date_part('month', CURRENT_TIMESTAMP);-- ayı verır
select date_part('day', CURRENT_TIMESTAMP);-- gunu verır

--1997 yilinin 3. ayindaki siparisler
select * from orders where date_part('year', order_date) = 1997 and date_part('month', order_date)= 03 ;

select * from employees
--calisanlarin yasini bulma

select first_name, Last_name, (date_part('year', current_date) - date_part('year', birth_date)) yas from employees 

--yilin kacinci günü oldugunu veren 

 select date_part ('doy', CURRENT_DATE);
 -- haftanın kacıncı gunu
  select date_part ('dow', CURRENT_DATE);

