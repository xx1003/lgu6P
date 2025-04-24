-- HAVING vs WHERE : ���͸�
-- WHERE : ���� �����͸� �������� ���͸�
-- HAVING : �׷�ȭ ����� ���� ���ĸ� �������� ���͸�(�ܵ� ��� �Ұ���)
-- ������ ���� ���ϰ�, �� ���� 20,000�� �ʰ��ϴ� ���� ���ϰ� ����

SELECT
	customer_id					-- �ߺ��Ǵ� ���� �ټ� �����ϴ°�?
	,SUM(sales_amount) AS ���� 
FROM sales_ch5
GROUP BY customer_id
HAVING SUM(sales_amount) > 20000
;

-- MS-SQL, ORACLE ���� ��� ������ ������ ��
/*
SELECT CASE WHEN ==> �׷�
		, ��ġ�ʵ�
FROM ���̺�
GROUP BY CASE WHEN
;

-- MYSQL, postgreSQL
SELECT CASE WHEN ==> �׷�
		, ��ġ�ʵ�
FROM ���̺�
GROUP BY 1	-- ���ڸ� �Է��ϸ� �ν� ���� 
;
*/

-- p.144 3������


-- ORDER BY
SELECT
	customer_id					-- �ߺ��Ǵ� ���� �ټ� �����ϴ°�?
	,SUM(sales_amount) AS ���� 
FROM sales_ch5
GROUP BY customer_id
ORDER BY ���� DESC	-- alias ��밡�� 
;

-- DB�� �����͸� ó���ϴ� ����
-- FROM ==> WHERE ==> GROUP BY - HAVING ==> SELECT ==> ORDER BY


CREATE TABLE product_info
(
  product_id		VARCHAR(4) ,
  product_name		VARCHAR(100),
  category_id		VARCHAR(3),
  price				INT,
  display_status	VARCHAR(10),
  register_date		DATE
)
INSERT INTO product_info VALUES ('p001','A��Ʈ�� 14inch','c01',1500000,'������','2022-10-02')
INSERT INTO product_info VALUES ('p002','B��Ʈ�� 16inch','c01',2000000,'��������','2022-11-30')
INSERT INTO product_info VALUES ('p003','C��Ʈ�� 16inch','c01',3000000,'������','2023-03-11')
INSERT INTO product_info VALUES ('p004','D��Ź��','c01',1500000,'������','2021-08-08')
INSERT INTO product_info VALUES ('p005','E������','c01',1800000,'������','2022-08-09')
INSERT INTO product_info VALUES ('p006','�ڵ������̽�','c02',21000,'������','2023-04-03')
INSERT INTO product_info VALUES ('p007','��Ʈ�� ������ȣ�ʸ�','c02',15400,'������','2023-04-03')

-- SELECT  * FROM product_info



/***********************************************************
�� ������ 7.3.1
�� category_info : ��ǰ ī�װ��� ���� ����
�� ��� : CREATE���� INSERT INTO�� �������ٱ��� �巡�� �� ����(����ŰF5)�����ּ���.
************************************************************/

CREATE TABLE category_info
(
  category_id   VARCHAR(10),
  category_name VARCHAR(10)
)

INSERT INTO category_info VALUES ('c01','������ǰ')
INSERT INTO category_info VALUES ('c02','�׼�����')

-- SELECT  * FROM category_info



/***********************************************************
�� ������ 7.4.1
�� event_info : �̺�Ʈ ��ǰ�� ���� ����
�� ��� : CREATE���� INSERT INTO�� �������ٱ��� �巡�� �� ����(����ŰF5)�����ּ���.
************************************************************/

CREATE TABLE event_info
(
  event_id   VARCHAR(3),
  product_id VARCHAR(4)
)

INSERT INTO event_info VALUES ('e1','p001')
INSERT INTO event_info VALUES ('e1','p002')
INSERT INTO event_info VALUES ('e1','p003')
INSERT INTO event_info VALUES ('e2','p003')
INSERT INTO event_info VALUES ('e2','p004')
INSERT INTO event_info VALUES ('e2','p005')

-- SELECT  * FROM event_info

-- ������ Ȯ��
SELECT * FROM product_info;
SELECT * FROM category_info;
SELECT * FROM event_info;

-- p.161
-- ��ǰ ������ �ִ� product_info ���̺�
-- ��ǰ ī�װ��� �ִ� category_info ���̺�
-- �̺�Ʈ ��ǰ�� ���� ���� event_info ���̺�

-- ���� �ٸ� ���̺� ==> ���̺� ���� (�Ϲ����� ���)
-- �������� vs ���̺� ����
SELECT 
	product_id,
	product_name,
	category_id,
	(SELECT category_name FROM category_info WHERE category_id = p.category_id) 
FROM product_info p;	-- �Ϲ������� ���̺� ������ �� ���̺� �̸� ALIAS ó��


SELECT * 
FROM category_info c JOIN product_info p on c.category_id = p.category_id;

-- FROM�� ��������
-- data1 = data.����
-- data2 = data1.����
-- SELECT FROM (SELECT FROM (SELECT FROM))
-- product_info ���̺�, ī�װ����� ��ǰ�� ������ 5�� �̻��� ī�װ��� ���

SELECT *
FROM (SELECT CATEGORY_ID,
		COUNT(PRODUCT_ID) AS COUNT_OF_PRODUCT
	FROM PRODUCT_INFO
	GROUP BY category_id
) P
WHERE P.COUNT_OF_PRODUCT >= 5;

SELECT CATEGORY_ID,
		COUNT(PRODUCT_ID) AS COUNT_OF_PRODUCT
FROM PRODUCT_INFO
GROUP BY category_id
;

--WHERE�� ��������
-- �������� ���ϰ� ���� : ���� �� ��ġ��
-- product_info T, ������ǰ ī���ڸ��� ����ϰ� �ʹ�.
-- ��������, �������� �����ؼ� ó��
-- �������� : ������ǰ ī�װ��� ��ȸ
-- �������� : product_info ���̺� ��ȸ


-- ������ǰ ī�װ� id ==> c01
SELECT * FROM category_info;

SELECT * FROM PRODUCT_INFO WHERE CATEGORY_ID=(
	SELECT category_id FROM category_info WHERE category_name = '�׼�����'
);


-- p.168
-- product_info T, event_id �÷��� e2�� ���Ե� ��ǰ�� ���θ� ���
-- �������� : product_info T ��ǰ�� ���� ���
-- �������� : event_id �÷��� e2�� �ش��ϴ� ��ǰ
SELECT * FROM product_info;
SELECT * FROM event_info;

SELECT * FROM product_info WHERE product_id IN (
	SELECT product_id FROM event_info WHERE event_id = 'e2'
);


-- ���̺��� ����
-- LEFT JOIN, RIGHT JOIN, OUTER JOIN (FULL JOIN), INNER JOIN
SELECT *
FROM product_info pi
LEFT
JOIN category_info ci ON pi.category_id = ci.category_id
;

-- UNION ������ : ���̺� �Ʒ��� ���̱�
-- UNION(�ߺ� �� ����) vs UNION ALL (�ߺ� �� �������� ���� ä �״�� ���)

CREATE TABLE sales_2022
(
  order_id       VARCHAR(10),
  order_date	 DATE,
  order_amount   INT
)

INSERT INTO sales_2022 VALUES ('or0001','2022-10-01',100000)
INSERT INTO sales_2022 VALUES ('or0002','2022-10-03',100000)
INSERT INTO sales_2022 VALUES ('or0003','2022-10-03',100000)
INSERT INTO sales_2022 VALUES ('or0004','2022-12-23',120000)

CREATE TABLE sales_2023
(
  order_id       VARCHAR(10),
  order_date	 DATE,
  order_amount   INT
)

INSERT INTO sales_2023 VALUES ('or0005','2023-05-01',50000)
INSERT INTO sales_2023 VALUES ('or0006','2023-07-31',70000)
INSERT INTO sales_2023 VALUES ('or0007','2023-12-31',120000)

SELECT * FROM sales_2022;
SELECT * FROM sales_2023;

-- �������� �߰� ����
USE BikeStores

-- ���̺�
SELECT * FROM sales.orders;

-- ���� : 2017�⿡ ���� ���� �ֹ��� ó���� ������ ó���� ��� �ֹ��� ��ȸ
-- 1. ��� �ֹ� ���� ǥ��
-- 2. where �������� ����ؼ� 2017�� �ִ� �ֹ� ó�� ���� ã��
-- 3. Top 1�� groupby ���
-- 4. Ȱ���Լ� : year, count(*)

-- �������� : ��� �ֹ� ���� ǥ��
-- SELECT * FROM sales.orders;

-- �������� : 2017�⿡ ���� ���� �ֹ��� ó���� ���� ã��
-- staff_id ����ϰ� ������ ���� ã��

select staff_id, year(order_date), count(*) as orders from sales.orders where year(order_date) = 2017
	group by staff_id, year(order_date);


select * from sales.orders where staff_id = (
	select top 1 staff_id from sales.orders where year(order_date) = 2017
	group by staff_id
	order by count(*) desc)
;


-- ���̺� 2��
SELECT * FROM production.products;
SELECT * FROM sales.order_items;

-- ���� : �� ���� �ֹ����� ���� ��ǰ���� ������ ��ȸ�Ͻÿ�.
-- �ߺ� �����ϴ� ��� : SELECT DISTINCT

select * from production.products where product_id not in (
select distinct product_id from sales.order_items);