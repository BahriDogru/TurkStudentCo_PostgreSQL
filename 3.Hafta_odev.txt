SELECT * FROM invoice LIMIT 100;
SELECT * FROM album LIMIT 100;
SELECT * FROM artist LIMIT 100;
SELECT * FROM playlist LIMIT 100;
SELECT * FROM playlisttrack LIMIT 100;
SELECT * FROM track LIMIT 100;

-- Soru 1: “USA” ülkesine ait, 2009 yılı içerisinde oluşturulmuş tüm faturaların (Invoice) toplamını listeleyen bir sorgu yazınız. 

SELECT SUM(total) as total_invoice_amount -- total column'nın SUM fonksiyonu ile toplamını alıp 'total_invoice_amount' adıya ekrana basıyoruz.
FROM invoice
WHERE billing_country = 'USA' -- 'billing_country' USA olanları getiriyoruz ve aşağııdaki şartla birlikte inceliyoruz. 
AND EXTRACT(YEAR FROM invoice_date) = 2009; -- invoice_date içerisinden 2009 yılını çekiyoruz ve 'AND' şartı içerisinde kullanıyoruz.


-- Soru 2: Tüm parça (track) bilgilerini, bu parçaların ait olduğu playlisttrack ve playlist tablolarıyla birleştirerek (JOIN) listeleyen bir sorgu yazınız.

-- Kullanacağımız tablolar track, playlisttrack, playlist

SELECT 
t.*, -- track tablosundaki bütün column'ları getiriyoruz.
pt.playlist_id, -- playlisttrack tablosundan playlist_id değerini getiriyoruz.
pl.name as playlist_name -- playlist tablosundan gelen sorguların hangi playliste ait olduğunu çekiyoruz. 
FROM track t
INNER JOIN playlisttrack pt ON t.track_id = pt.track_id -- playlisttrack ve track toblolarını track_id üzerinden JOIN işlemi yapıyoruz. 
INNER JOIN playlist pl ON pt.playlist_id = pl.playlist_id; -- playlisttrack ve playlist toblolarını playlist_id üzerinden JOIN işlemi yapıyoruz.



/* Soru 3:  'Let There Be Rock' adlı albüme ait tüm parçaları (Track) listeleyen, sanatçı (Artist) bilgisini 
de içeren bir sorgu yazınız. Ayrıca, sonuçları parça süresi (milliseconds) büyükten küçüğe 
sıralayınız. */

-- Kullanacağımız tablolar track, album, artist

SELECT 
t.*, -- track tablsoundaki bütün sütunlar
a.title as album_name, -- album tablosuundan album'un adı
art.name as artist_name -- artist tablosundan artist adı
FROM track t
JOIN album a ON a.album_id = t.album_id -- album tablsou ile track tablosu album_id üzerinden JOIN'ledik.
JOIN artist art ON art.artist_id = a.artist_id -- artist tablosu ile album tablosunu artist_id üzerinden bileştiriryoruz.
WHERE a.title = 'Let There Be Rock' -- WHERE şartı ile album tablosu içerisinde title'ı  'Let There Be Rock' olan satırları getir diyoruz.
ORDER BY t.milliseconds DESC; -- track tablosundaki milliseconds'a göre büyüükten küçüğe bir sıralama yapıyoruz.








