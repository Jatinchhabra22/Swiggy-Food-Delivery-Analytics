-- 6) Delivery speed vs rating


SELECT delivery_time ,
       ROUND(AVG(avg_ratings),2) AS avg_rating,
       COUNT(*) AS restaurant_count
FROM swiggy_restaurants
GROUP BY delivery_time ;


-- 7) Premium segment restaurants with bad ratings (risk)

SELECT restaurant, area, price, avg_ratings
FROM swiggy_restaurants
WHERE price_range  = 'premium'
  AND avg_ratings < 3.5
ORDER BY avg_ratings ASC;

-- 8) Budget restaurants with excellent ratings (hidden gems)

SELECT restaurant, area, price, avg_ratings
FROM swiggy_restaurants
WHERE price_range  = 'budget'
  AND avg_ratings >= 4.5
ORDER BY avg_ratings DESC;


--9) Areas where delivery is slow (>45 mins on avg)

SELECT area,
       ROUND(AVG(delivery_time),1) AS avg_delivery_time,
       COUNT(*) AS restaurant_count
FROM swiggy_restaurants
GROUP BY area
HAVING AVG(delivery_time) > 45
ORDER BY avg_delivery_time DESC;

-- 10) Cuisines that tend to be premium

SELECT primary_cuisine,
       ROUND(AVG(price),0) AS avg_price,
       COUNT(*) AS restaurant_count
FROM swiggy_restaurants
GROUP BY primary_cuisine
ORDER BY avg_price DESC;



