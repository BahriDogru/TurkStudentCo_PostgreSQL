 -- Bütün tobloyu getirme
select * from employees;


 -- from ile employees tablosundan first_name, last_name, salary sütunlarını getirme.
select firstname, lastname, salary from employees;


--Distinct komutu ile çalışanların çalıştıkları departmanları benzersiz olarak listeleyen SQL sorgusu.
select distinct departmentid from employees;

-- where şartı kullanrak sadece IT departmanında çalışanların bilgilerini getiren SQL sorgusu.
select * from departments;
select * from employees where departmentid = 1;


-- order by ile sıralayarak ve desc diyerek çalışanları maaşlarına göre büyükten küçüğe sıralayan bir SQL sorgusu.
select * from employees order by salary desc;

-- first_name ve last_name kolonlarını birleştirme (Concatenation), burada "as" kullanarak yeni oluşturulan kolona isim verildi. 
select firstname ||' '|| lastname as name_surname from employees;