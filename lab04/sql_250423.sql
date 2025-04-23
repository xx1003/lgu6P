-- ����, WHERE ��
-- ���ǰ� ��ġ�ϴ� ������ ��ȸ(���͸�)
-- pandas, iloc, loc, �񱳿����� �� ���� ���

-- p.94
-- ���� ���� ���͸� ��, id, name, gender�� ���
USE lily_book;

-- ���� ���� : ���ڿ� ū����ǥ �Ұ���, ���� ����ǥ��
SELECT
	*
FROM customer
WHERE customer_id = 'c002'
;

-- WHERE�� �ȿ��� �񱳿����� ���ؼ� ���͸�
-- <>, != : �¿���� ���� ���� ����
SELECT * FROM sales;

-- ���ڸ� �Է��� �� �ٻ��ϰ� �Է��غ���
SELECT *
FROM sales
WHERE sales_amount = 41000;

-- �����Ͱ� �ƿ� ���� ����, NULL ���·� ���
-- ��ȸ�� ��, ��Ȯ�ϰ� �Է����� �ʾƵ� NULL ���·� ���

SELECT
	*
FROM customer
WHERE customer_id = 'c002'
;


-- sales_amount�� ���� ����� �͸� ��ȸ
SELECT *
FROM sales
WHERE sales_amount > 0;

-- p.100, BETWEEN ������, ���� ����
-- 30000�� 40000 ������ ������ �����ϴ� �� ���
-- BETWEEN ��迡 �ִ� ���� ������
SELECT *
FROM sales
WHERE sales_amount BETWEEN 30000 AND 40000
;

-- ���� �Ӹ� �ƴ϶� ���ڿ��� ���� ����
SELECT * FROM customer
WHERE customer_id BETWEEN 'c001' AND 'c003'
;

SELECT * FROM customer
WHERE last_name BETWEEN '��' AND '��'
;

-- IN ������, �ſ� ���� ����
-- OR ������ �ݺ��ؼ� ���� �Ⱦ IN �����
SELECT * FROM sales WHERE product_name IN('�Ź�', 'å');

USE BikeStores;

-- last_name�� letter z�� �����ϴ� ��� ���� ���͸�
select * 
from sales.customers
where last_name Like ('%z')

select * 
from sales.customers
where last_name Like ('%z%')


-- IS NULL ������ (�߿���)
-- �����Ͱ� NULL���� �ุ ���͸�

-- ��ȸ �� ��.
select *
from sales.customers
where phone = NULL;
 
-- ���������� ��ȸ
select *
from sales.customers
where phone IS NULL;

select *
from sales.customers
where phone IS NOT NULL;


-- AND OR ������
USE lily_book;

select * from distribution_center;

-- AND ������
select * 
from distribution_center
where permission_date > '2022-05-1'
	and permission_date < '2022-07-31'
	and status = '������'
;

-- OR ������
-- LIKE �����ڿ� ���� ������ ����
-- ������ �켱���� : () > AND > OR
select *
from distribution_center
where address like '%����%'
	or address like '%��⵵ ���ν�%'
;


-- ����������
-- IN, NOT IN
-- IS NULL, IS NOT NULL
select * 
from distribution_center
where center_no not in (1,2);



-- CHAPTER 5��

DROP TABLE sales

CREATE TABLE sales
(
  ��¥        VARCHAR(10),
  ��ǰ��    VARCHAR(10),
  ����        INT,
  �ݾ�        INT
)

INSERT INTO sales VALUES('01��01��','���콺',1,1000)
INSERT INTO sales VALUES('01��01��','���콺',2,2000)
INSERT INTO sales VALUES('01��01��','Ű����',1,10000)
INSERT INTO sales VALUES('03��01��','Ű����',1,10000)

SELECT * FROM SALES;

-- �Ϻ��� �Ǹŵ� ������ �ݾ�
SELECT SUM(����) AS ���� FROM SALES;

SELECT ��¥, SUM(����) AS ���� FROM SALES
GROUP BY ��¥;

SELECT ��ǰ��, SUM(����) AS ���� FROM SALES
GROUP BY ��ǰ��;

SELECT ��¥,��ǰ��, SUM(����) AS ���� 
FROM SALES
GROUP BY ��¥, ��ǰ��;

SELECT ��¥,��ǰ��, SUM(����) AS ����, AVG(�ݾ�)
FROM SALES
GROUP BY ��¥, ��ǰ��;

-- p.130~131
-- ������ �ڵ�, �̹� �ߺ����� ������ ����
-- �ֹ���¥, 2023-03-01, 2023-03-05
-- ���� �Ѹ����
/*
SELECT MONTH(order_date), sum(�����)
FROM ���̺�
GROUP BY MONTH(order_date);
*/

