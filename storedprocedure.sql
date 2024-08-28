/*
Yazan: Bahadir Can Kardes
Tarih: 28.08.2024
Açiklama:
Parametreler:
*/

create or replace procedure KargoFirmalariSiparisDagilim (kargoFirmasi varchar(50), yil int)
LANGUAGE plpgsql
as $$
BEGIN
if (kargoFirmasi is null and yil is null) then
    select date_part('year', o.order_date) Yil, s.company_name, count(*) Adet
    from orders o
    inner join shippers s on s.shipper_id = o.ship_via
    group by date_part('year', o.order_date), s.company_name
    order by Adet;
else
    select date_part('month', o.order_date) Yil, s.company_name, count(*) Adet
    from orders o
    inner join shippers s on s.shipper_id = o.ship_via
    where s.company_name = kargofirmasi and date_part('year', o.order_date) = yil
    group by date_part('month', o.order_date), s.company_name
    order by Adet;
end if;
end;$$;

call KargoFirmalariSiparisDagilim ()


