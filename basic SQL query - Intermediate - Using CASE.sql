USE mavenmovies;

-- Create categories with CASE
SELECT 	
	first_name,
    last_name,
CASE
	WHEN active=1 AND  store_id=1 THEN 'store 1 active'
    WHEN active=1 AND  store_id=2 THEN 'store 2 active'
    WHEN active=0 AND  store_id=1 THEN 'store 1 inactive'
    WHEN active=0 AND  store_id=2 THEN 'store 2 inactive'
	ELSE 'Error'
    END AS status
FROM customer;

-- Create Pivots using CASE + GROUP BY
SELECT 	
	store_id,
    COUNT(CASE WHEN active=1 THEN store_id ELSE NULL END) AS active,
    COUNT(CASE WHEN active=0 THEN store_id ELSE NULL END) AS inactive
FROM customer	
GROUP BY store_id