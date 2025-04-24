USE BikeStores;

-- 1. sales.customers ���̺��� first_name�� 'Debra'�̰� last_name�� 'Burks'�� ���� ��� ������ ��ȸ�Ͻÿ�.
select *
from sales.customers
where first_name = 'Debra' and last_name = 'Burks'
;

-- 2. sales.orders ���̺��� 2016�⿡ �ֹ��� �ֹ����� order_id, customer_id, order_status�� ��ȸ�Ͻÿ�.
select order_id, customer_id, order_status
from sales.orders
where year(order_date) = 2016
;

-- 3. production.products ���̺��� ������ $500 �̻��̰� $1000 �̸��� �����ŵ��� ��ǰ��� ������ ��ȸ�Ͻÿ�.
select product_name, list_price
from production.products
where list_price >= 500 and list_price<1000
;

-- 4. sales.staffs ���̺��� store_id�� 2�� �������� �̸�(first_name, last_name)�� �̸����� ��ȸ�Ͻÿ�.
select concat(first_name, last_name) as name, email
from sales.staffs
where store_id = 2
;

-- 5. production.brands ���̺��� �귣��� 'H/h'�� ���Ե� �귣����� ��� ������ ��ȸ�Ͻÿ�.
select *
from production.brands
where brand_name like '%h%'
;

-- 6. sales.customers ���̺��� ���� �̸��� �ּҿ��� '@' ���� �κи� �����Ͽ� �̸��� �Բ� ��ȸ�Ͻÿ�.
-- SUBSTRING() & CHARINDEX() Ȱ��
select substring(email,1, charindex('@',email)-1)as id, concat(first_name, last_name) as name
from sales.customers
;

-- 7. sales.orders ���̺��� �ֹ���(order_date)�� �����(shipped_date) ������ �ҿ� �ϼ��� ����Ͻÿ�.
-- DATEDIFF(), ISNULL(), GETDATE() Ȱ��
select ISNULL(datediff(day,order_date,shipped_date),0) as shipping_date
from sales.orders
;

select datediff(day,order_date,ISNULL(shipped_date, GETDATE())) as shipping_date
from sales.orders
;

-- 8. sales.orders ���̺��� �ֹ� ����(order_status)�� ������ ���� ��ȯ�Ͽ� ��ȸ�Ͻÿ�:
-- 1: 'Pending', 2: 'Processing', 3: 'Rejected', 4: 'Completed', ELSE 'Unknown'
-- CASE WHEN Ȱ��
select case order_status 
		 when 1 then 'Pending'
		 when 2 then 'Processing'
		 when 3 then 'Rejected'
		 when 4 then 'Completed'
		 else 'Unknown'
		 end as order_status
from sales.orders
;

-- 9. sales.customers ���̺��� phone�� NULL�� ��� 'No Phone'���� ǥ���Ͽ� ��ȸ�Ͻÿ�.
-- ISNULL() Ȱ��
select ISNULL(phone, 'No Phone') as has_phone
from sales.customers
;

-- 10. production.products ���̺��� ��ǰ���� NULL�� �ƴϰ� ������ 0���� ū ��ǰ�鸸 ��ȸ�Ͻÿ�.
select *
from production.products
where product_name IS NOT NULL and list_price>0
;