select first_name, last_name, 
case (country) 
    when 'USA' then 'Amerika' 
    when 'UK' then 'Ingiltere'
end Ulke
from employees
--************************

select product_name, unit_price,
case
    when unit_price < 50 then 'Ucuz Urun'
    when unit_price > 50 and unit_price < 120 then 'Ekonomik Urun'
    when unit_price > 120 and unit_price < 200 then 'Pahali Urun'
    else 'Luks Urun'
end uruntanimi
from products order by unit_price desc;

