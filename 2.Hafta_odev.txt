SELECT * FROM invoice


-- SORU 1. Invoice tablosunda, tüm değerleri NULL olan kayıtların sayısını bulmanız isteniyor. 

/* Burada iki şekilde sorguyu yazdım, ilk sorgu benim kendi yazdığım ikinci sorgu ise chatgpt'ye sorarak oluşturduğum çözüm. 
Kendi yaptığım çözümden emin olmadığım için chatgpt'ye sordum, o benim yazdıığım sorgunun hatalı olduğunu iddia etti ancak sorgu hatasız çalıtı. */


-- 1.Çözüm
-- Burada select komutu ile invoice tablosundaki bütün sütünlarımızı çağırıyoruz. 
-- Burada where şartı ile satırlardaki kayıtlarımızdan hepsi Null olan satırların sayısını döndürüyoruz.
SELECT COUNT(*) -- tamamı boş olan değerlerin sayısı
FROM invoice
WHERE (invoice_id, customer_id, 
invoice_date, billing_address, billing_city,
billing_state, billing_country, billingpostal_code, total) IS NULL; -- Eğer şartın içindeki değerlerin tamamıı boş ise 

-- 2.Çözüm
-- Burada AND operatörü ile invoice_id boş olan VE invoice_date boş olan VE billing_address gibi bir şart yazarak bütün değerleri boş olan satırları getirtiyoruz.
SELECT *
FROM invoice
WHERE invoice_id IS NULL
   AND customer_id IS NULL
   AND invoice_date IS NULL
   AND billing_address IS NULL
   AND billing_city IS NULL
   AND billing_state IS NULL
   AND billing_country IS NULL
   AND billingpostal_code IS NULL
   AND total IS NULL;

-- Her iki sorgunun sonuçuda 0 (sıfır) olarak dönüyor. Yani tablomuzda büütün değerleri Null olan bir satırımız yoktur.



---------------------------------------------------------------------------------------------------------------------------

/* SORU 2. Koordinasyondaki kişiler, Total değerlerinde bir hata olduğunu belirtiyorlar. 
Bu değerlerin iki katını görmek ve eski versiyonlarıyla birlikte karşılaştırmak için bir 
sorgu yazmanız isteniyor. Ayrıca, verilerin daha rahat takip edilebilmesi için, 
tablonun yeni versiyonuna ait kolona göre büyükten küçüğe sıralama yapılması 
isteniyor. */

SELECT *, total*2 AS new_total
FROM invoice
ORDER BY new_total DESC;
-- Burada toblodaki tüm değişkenleri çağırdık, ayrıca total değişkeninin 2 katını alarak new_total değişkenini oluştuduuk (geçici bir şekilde). 
-- Sonrasında ise tabloyu ORDER BY kullanarak new_total'a göre DESC alarak büyükten küçüğe doğru sıraladık.


---------------------------------------------------------------------------------------------------------------------------

/* SORU 3. Adres kolonundaki verileri, soldan 3 karakter ve sağdan 4 karakter alarak 
birleştirmeniz ve "Açık Adres" olarak yazmanız isteniyor. Ayrıca, bu yeni açık adresi 
2013 yılı ve 8. ay’a göre filtrelemeniz gerekiyor. */


SELECT *,
CONCAT(LEFT(billing_address, 3),RIGHT(billing_address, 4)) AS "Açık Adres"
FROM invoice
WHERE EXTRACT(YEAR FROM invoice_date) = 2013 
AND EXTRACT(MONTH FROM invoice_date) = 8;
-- Burada LEFT ve RIGHT fonksiyonlarını kullanarak soldan 3 karakter, sağdan 4 karakteri seçerek açık adres adında yeni sütün oluşturduk.
-- Sonrasında tabloyu Where şartı kullanarak extract fonksiyonu ile invoice_date içerisinden yıl 2013 ay ise 8. ay olacak şekilde filtreleme yaptık.


