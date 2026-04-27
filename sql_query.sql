SELECT *
FROM retail_sales
WHERE transaction_id IS NULL
   OR gender IS NULL
   OR age IS NULL
   OR category IS NULL
   OR cogs IS NULL;

SELECT *
FROM retail_sales
WHERE sale_date = '2022-11-05';

SELECT category, SUM(quantiy)
FROM retail_sales
WHERE category = 'Clothing'
GROUP BY 1;

SELECT category, SUM(total_sales), COUNT(*) AS total_orders
FROM retail_sales
GROUP BY category;

SELECT AVG(age)
FROM retail_sales
WHERE category = 'Beauty';

SELECT *
FROM retail_sales
WHERE total_sales > 1000;

SELECT category, gender, COUNT(*) AS total_trans
FROM retail_sales
GROUP BY category, gender
ORDER BY 1;

SELECT ROUND(AVG(total_sales), 2), sale_date
FROM retail_sales
GROUP BY sale_date
ORDER BY sale_date ASC;

SELECT 
    EXTRACT(YEAR FROM sale_date) AS year,
    EXTRACT(MONTH FROM sale_date) AS month,
    ROUND(AVG(total_sales), 2) AS avg_sales
FROM retail_sales
GROUP BY 1, 2
ORDER BY 1, 3 DESC;

SELECT customer_id, SUM(total_sales)
FROM retail_sales
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5;

SELECT COUNT(DISTINCT customer_id), category
FROM retail_sales
GROUP BY category;

SELECT *,
    CASE 
        WHEN EXTRACT(HOUR FROM sale_time) < 12 THEN 'Morning'
        WHEN EXTRACT(HOUR FROM sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
        ELSE 'Evening'
    END AS shift
FROM retail_sales;
     
