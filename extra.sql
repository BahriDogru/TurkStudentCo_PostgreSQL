-- 1. Hangi film kategorisinde kaç adet film bulunmaktadır?
SELECT c.name AS category_name, COUNT(fc.film_id) AS film_count
FROM category c
JOIN film_category fc ON c.category_id = fc.category_id
GROUP BY c.name;


-- 2. 2006 yılında en çok film kiralayan ilk 3 müşteri kimdir?
SELECT c.first_name, c.last_name, COUNT(r.rental_id) AS rental_count
FROM customer c
JOIN rental r ON c.customer_id = r.customer_id
WHERE EXTRACT(YEAR FROM r.rental_date) = 2006
GROUP BY c.customer_id
ORDER BY rental_count DESC
LIMIT 3;

-- 3. Ortalama kiralama süresi 5 günden fazla olan filmlerin başlıkları nelerdir?
SELECT f.title
FROM film f
JOIN rental r ON f.film_id = r.rental_id
GROUP BY f.title
HAVING AVG(EXTRACT(EPOCH FROM (r.return_date - r.rental_date)) / (60 * 60 * 24)) > 5;


-- 4. Çalışan başına düşen ortalama ödeme miktarı nedir?
SELECT s.staff_id, AVG(p.amount) AS average_payment
FROM staff s
JOIN payment p ON s.staff_id = p.staff_id
GROUP BY s.staff_id;


-- 5. İçinde 'ACADEMY' kelimesi geçen filmlerin ortalama kiralama ücreti nedir?
SELECT AVG(f.rental_rate) AS average_rental_rate
FROM film f
WHERE f.title LIKE '%ACADEMY%';


-- 6. Her bir mağazadaki toplam envanter sayısını gösterin?
SELECT s.store_id, COUNT(i.inventory_id) AS total_inventory
FROM store s
JOIN inventory i ON s.store_id = i.store_id
GROUP BY s.store_id;

-- 7. Soyadı 'WILLIAMS' olan müşterilerin yaptığı toplam ödeme miktarı nedir?
SELECT SUM(p.amount) AS total_payment
FROM customer c
JOIN payment p ON c.customer_id = p.customer_id
WHERE c.last_name = 'WILLIAMS';








