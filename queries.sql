SELECT customers.company_name, CONCAT(first_name, ' ', employees.last_name) as full_name FROM customers
LEFT JOIN employees USING (city)
LEFT JOIN shippers ON employees.reports_to = shippers.shipper_id
WHERE city = 'London' and shippers.company_name = 'United Package'
--1.1) Название компании заказчика (company_name из табл. customers) и ФИО сотрудника, работающего над заказом этой компании (см таблицу employees), когда и заказчик и сотрудник зарегистрированы в городе London, а доставку заказа ведет компания United Package (company_name в табл shippers)

SELECT product_name, units_in_stock, contact_name, phone
FROM products, suppliers
WHERE discontinued != 1 and units_in_stock <= 25 and (category_id = 2 or category_id = 4)
ORDER BY units_in_stock ASC
--1.2) Наименование продукта, количество товара (product_name и units_in_stock в табл products), имя поставщика и его телефон (contact_name и phone в табл suppliers) для таких продуктов, которые не сняты с продажи (поле discontinued) и которых меньше 25 и которые в категориях Dairy Products и Condiments. Отсортировать результат по возрастанию количества оставшегося товара.

SELECT company_name
FROM customers
LEFT JOIN orders USING(customer_id)
WHERE customer_id NOT IN (SELECT customer_id FROM orders)
--1.3) Список компаний заказчиков (company_name из табл customers), не сделавших ни одного заказа

SELECT DISTINCT product_name FROM products AS _name_
WHERE EXISTS (SELECT * FROM order_details AS p WHERE p.product_id = _name_.product_id AND quantity = 10)
ORDER BY product_name
--1.4) уникальные названия продуктов, которых заказано ровно 10 единиц (количество заказанных единиц см в колонке quantity табл order_details)
