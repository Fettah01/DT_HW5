SELECT
    p.prod_category,
    SUM(s.amount_sold) AS total_sales_amount
FROM
    sh.sales s
JOIN
    sh.products p ON s.prod_id = p.prod_id
JOIN
    sh.times t ON s.time_id = t.time_id
WHERE
    t.calendar_year = '2004' 
GROUP BY
    p.prod_category;


SELECT
    c.country_region,
    ROUND(AVG(s.quantity_sold), 2) AS avg_sales_quantity
FROM
    sales s
JOIN
    customers cust ON s.cust_id = cust.cust_id
JOIN
    countries c ON cust.country_id = c.country_id
WHERE
    s.prod_id = 13 
GROUP BY
    c.country_region;
	

SELECT
    cust.cust_id,
    CONCAT(cust.cust_first_name, ' ', cust.cust_last_name) AS customer_name,
    SUM(s.amount_sold) AS total_sales_amount
FROM
    sh.sales s
JOIN
    sh.customers cust ON s.cust_id = cust.cust_id
GROUP BY
    cust.cust_id, customer_name
ORDER BY
    total_sales_amount DESC
LIMIT 5;
