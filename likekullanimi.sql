/* 

like kullanimi

*/

-- ilk harfi m olan çalısanlar
select * from employees where first_name = 'Nancy'

select * from employees where first_name like 'M%'

-- first name 't' ile biten calisanlar

select * from employees where first_name like '%t'

--first name içerisinde 'an' gecen calısanlar

select * from employees where first_name like '%an%'

--first name icerisnde ilk harf A olacak, ikinci harf onemli degıl, ucuncu harf d olan calısanlar

select * from employees where first_name like 'A_d%'

--first name icerisnde ilk harf A ya da M olan calısanlar

--Büyük veya kücük karakter ikisinide bulsun istersek ilike kullanacağız.

select * from employees where first_name ilike 'a%' or first_name ilike 'M%'

--Adinin icerisinde a ya da l gecen kayitlar

select * from employees where first_name ilike  '%a%' or first_name ilike '%l%'

select * from employees where first_name  similar to '%[al]%'

-- firtsname alanında isimlerin j-r arasinda harflerle başlayan kayitlarin getirilmesi

-- bu kod sadece sql serverda çalışır
select * from employees where first_name like '[j-r]%' order by first_name

--Azure Data için 
--1.Yol Uzun uzun yazmak
select * from employees where first_name ilike 'j%' or first_name ilike 'j%' or first_name ilike 'k%' or first_name ilike 'l%' 
 or first_name ilike 'm%' or first_name ilike 'n%' or first_name ilike 'o%' or first_name ilike 'p%' or first_name ilike 'k%' or first_name ilike 'r%'order by first_name

-- kısa yol sımılar to kullanmak

select * from employees where first_name similar to '[J-Rj-r]%' order by first_name

