-- 1) Top 10 most popular restaurants

select popularity_scores,restaurant,city,area  from swiggy_restaurants order by popularity_score limit 10

-- 2) Average rating by price band

select price_range ,round(avg(avg_ratings),2) 
from swiggy_restaurants 
group by price_range 

-- 3)  Top cuisines by restaurant count

SELECT primary_cuisine, COUNT(*) AS restaurant_count
FROM swiggy_restaurants
GROUP BY primary_cuisine
ORDER BY restaurant_count DESC
LIMIT 10;

-- 4) Which areas have the best average rating?

SELECT area,
       ROUND(AVG(avg_ratings ),2) AS avg_rating,
       COUNT(*) AS restaurant_count
FROM swiggy_restaurants
GROUP BY area
HAVING COUNT(*) >= 5    -- ignore areas with very few restaurants
ORDER BY avg_rating DESC;

-- 5) Best “value for money” restaurants

SELECT restaurant, area, price, avg_ratings, popularity_scores 
FROM swiggy_restaurants
WHERE avg_ratings >= 4.0
ORDER BY popularity_scores  DESC
LIMIT 10;