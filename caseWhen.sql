select first_name, last_name, 
case (country) 
    when 'USA' then 'Amerika' 
    when 'UK' then 'Ingiltere'
end Ulke
from employees

