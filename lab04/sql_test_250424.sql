USE BikeStores;

-- 1. sales.customers 테이블에서 first_name이 'Debra'이고 last_name이 'Burks'인 고객의 모든 정보를 조회하시오.
select *
from sales.customers
where first_name = 'Debra' and last_name = 'Burks'
;

-- 2. sales.orders 테이블에서 2016년에 주문된 주문들의 order_id, customer_id, order_status를 조회하시오.
select order_id, customer_id, order_status
from sales.orders
where year(order_date) = 2016
;

-- 3. production.products 테이블에서 가격이 $500 이상이고 $1000 미만인 자전거들의 제품명과 가격을 조회하시오.
select product_name, list_price
from production.products
where list_price >= 500 and list_price<1000
;

-- 4. sales.staffs 테이블에서 store_id가 2인 직원들의 이름(first_name, last_name)과 이메일을 조회하시오.
select concat(first_name, last_name) as name, email
from sales.staffs
where store_id = 2
;

-- 5. production.brands 테이블에서 브랜드명에 'H/h'가 포함된 브랜드들의 모든 정보를 조회하시오.
select *
from production.brands
where brand_name like '%h%'
;

-- 6. sales.customers 테이블에서 고객의 이메일 주소에서 '@' 이전 부분만 추출하여 이름과 함께 조회하시오.
-- SUBSTRING() & CHARINDEX() 활용
select substring(email,1, charindex('@',email)-1)as id, concat(first_name, last_name) as name
from sales.customers
;

-- 7. sales.orders 테이블에서 주문일(order_date)과 배송일(shipped_date) 사이의 소요 일수를 계산하시오.
-- DATEDIFF(), ISNULL(), GETDATE() 활용
select ISNULL(datediff(day,order_date,shipped_date),0) as shipping_date
from sales.orders
;

select datediff(day,order_date,ISNULL(shipped_date, GETDATE())) as shipping_date
from sales.orders
;

-- 8. sales.orders 테이블에서 주문 상태(order_status)를 다음과 같이 변환하여 조회하시오:
-- 1: 'Pending', 2: 'Processing', 3: 'Rejected', 4: 'Completed', ELSE 'Unknown'
-- CASE WHEN 활용
select case order_status 
		 when 1 then 'Pending'
		 when 2 then 'Processing'
		 when 3 then 'Rejected'
		 when 4 then 'Completed'
		 else 'Unknown'
		 end as order_status
from sales.orders
;

-- 9. sales.customers 테이블에서 phone이 NULL인 경우 'No Phone'으로 표시하여 조회하시오.
-- ISNULL() 활용
select ISNULL(phone, 'No Phone') as has_phone
from sales.customers
;

-- 10. production.products 테이블에서 제품명이 NULL이 아니고 가격이 0보다 큰 제품들만 조회하시오.
select *
from production.products
where product_name IS NOT NULL and list_price>0
;