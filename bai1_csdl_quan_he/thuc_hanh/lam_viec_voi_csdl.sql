use classicmodels;
SELECT * FROM classicmodels.customers limit 0,30;
SELECT customerName, phone, city, country FROM customers;
SELECT * FROM customers WHERE customerName like '%ka%';
SELECT * FROM customers WHERE city IN ('Nantes',' Las Vegas',' Warszawa','NYC') 