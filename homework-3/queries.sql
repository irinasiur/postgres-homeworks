-- Напишите запросы, которые выводят следующую информацию:
-- 1. Название компании заказчика (company_name из табл. customers)
-- и ФИО сотрудника, работающего над заказом этой компании (см таблицу employees),
-- когда и заказчик и сотрудник зарегистрированы в городе London,
-- а доставку заказа ведет компания United Package (company_name в табл shippers)
SELECT c.company_name, e.first_name ||' '|| e.last_name as FIO
	FROM customers c
join orders ord
	on c.customer_id = ord.customer_id
join employees e
	on e.employee_id = ord.employee_id
join shippers sh
	on sh.shipper_id = ord.ship_via
where
e.city = 'London' and c.city = 'London'
and
sh.company_name = 'United Package';

-- 2. Наименование продукта, количество товара (product_name и units_in_stock в табл products),
-- имя поставщика и его телефон (contact_name и phone в табл suppliers) для таких продуктов,
-- которые не сняты с продажи (поле discontinued) и которых меньше 25 и которые в категориях Dairy Products и Condiments.
-- Отсортировать результат по возрастанию количества оставшегося товара.
SELECT prod.product_name, prod.units_in_stock, s.contact_name, s.phone
	FROM products prod
INNER join suppliers s
on s.supplier_id = prod.supplier_id
INNER join categories cat
on cat.category_id = prod.category_id
where discontinued = 0
and units_in_stock < 25
and cat.category_name IN ('Dairy Products', 'Condiments')
ORDER BY units_in_stock asc;

-- 3. Список компаний заказчиков (company_name из табл customers), не сделавших ни одного заказа
select c.company_name from customers c
where c.customer_id not in (
select c.customer_id from customers c
right join orders ord
on c.customer_id = ord.customer_id);

-- 4. уникальные названия продуктов, которых заказано ровно 10 единиц (количество заказанных единиц см в колонке quantity табл order_details)
-- Этот запрос написать именно с использованием подзапроса.
select product_name from
(select DISTINCT prod.product_name, prod.product_id FROM products prod
INNER join order_details USING (product_id)
WHERE prod.product_id IN (SELECT product_id FROM order_details WHERE quantity = 10)
order by prod.product_id) a ;

