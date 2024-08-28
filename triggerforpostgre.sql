--select * from order_details

create or replace FUNCTION stok_Kontrol()
returns TRIGGER
LANGUAGE plpgsql
as
$$
declare 
    stokmiktari int;
    stokadi VARCHAR;
    fark int;
BEGIN
    raise notice 'Yeni Eklenen Kayit %', new;
    select units_in_stock into stokmiktari from products p where p.product_id = new.product_id;
    select (stokmiktari - new.quantity) into fark;

    if(fark<1) then
    raise notice 'Eldeki Stok Miktari: %, siparis verilen miktar: % fark : %', stokmiktari,new.quantity, fark;
    ROLLBACK;
    end if;
END;
$$;

select * from products limit 1 
INSERT INTO order_details(order_id, product_id, unit_price, quantity, discount)
values (10248, 1, 10, 100, 0)

create TRIGGER order_details_insert_before
BEFORE insert
on order_details

for each row EXECUTE FUNCTION stok_Kontrol();