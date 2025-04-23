-- ���� �����ͺ��̽� Ȯ��
SELECT DB_NAME();

-- �����ͺ��̽� > Table(pandas ������������)
-- �����ͺ��̽� �ȿ� �ִ� �� 
--- ���̺� �ܿ���, view, ���ν���, Ʈ����, ����� ���� �Լ� �� ����
-- SQL, SQEL : E - English
-- ������ ���� ������ �ſ� �����
-- ǥ��SQL, 99% ���, 1% �ٸ� ==> ������Ÿ�� ������ �� ���̰� ����(DB ��������)


-- ������ Ȯ��
SELECT * FROM staff;

-- ���� p.42 SELECT ���� FROM ��
USE lily_book
SELECT employee_id, employee_name, birth_date FROM staff;

-- ����� ��õ
SELECT employee_id, employee_name, birth_date 
FROM staff
; -- �ش� ���� �ڵ� �ۼ� �Ϸ�


SELECT employee_id
		, employee_name
		, birth_date 
FROM staff
; 


SELECT * FROM staff; -- ��õ x
SELECT employee_name, employee_id FROM staff; -- �÷� ���� ���� ����(��ȸ)

-- �÷� ��Ī : ALIAS
-- �÷��� ������ ����, ���� ���� ���� ==> ������ ���Ǽ��� ����
-- ALIAS (AS)

-- ��Ī ���� ���� ������ ����ǥ�� ������� ��


SELECT employee_id, birth_date AS '���� ����'
FROM staff
;

-- DISTINCT �ߺ��� ����
SELECT * FROM staff;

SELECT DISTINCT gender FROM staff;
SELECT gender FROM staff;

SELECT employee_name, gender, position FROM staff;
-- �ߺ����� ���� �÷��� ������ ��������?
SELECT DISTINCT position, employee_name, gender FROM staff;

SELECT DISTINCT position, gender FROM staff;

-- ���ڿ� �Լ� ; �ٸ� DBMS�� ���� ����
SELECT * FROM APPAREL_PRODUCT_INFO;

-- LEFT �Լ� Ȯ��
SELECT product_id,LEFT(product_id, 2) AS ���
FROM apparel_product_info;

-- SUBSTRING ���ڿ� �߰� N��° �ڸ����� N���� ���
-- SUBSTRING(�÷���, ����(N_start), ����(�� �� �����ð���))
-- ���̽�, �ٸ� ���α׷��� ���� �ε����� 0��°���� ����
-- MS-SQL�� �ε����� 0��°���� ����
SELECT product_id,SUBSTRING(product_id,6,2) AS ���
FROM apparel_product_info;

-- CONCAT ���ڿ��� ���ڿ� �̾ ���
SELECT CONCAT(category1, '>', category2,'=','��', price) AS �׽�Ʈ
FROM apparel_product_info;

-- REPLACE : ���ڿ����� Ư�� ���� ����
--p.58
SELECT product_id, REPLACE(product_id, 'F','A') AS ���
FROM apparel_product_info;

-- ISNULL �߿���
-- WHERE���� �Բ� ���� �� ���� ȭ��Ǵ� ���
-- ������ �� ����ġ�� ���� �� ��, ���������;

-- �����Լ� : ABS,CEILING, FLOOR, ROUND, POWER, SQRT
-- �ٸ� DBMS, MySQL, Oracle
SELECT ROUND(CAST(748.58 AS DECIMAL (6,2)), -3);

-- SIGN 
SELECT SIGN(-125), SIGN(0), SIGN(564);

-- CEILING : Ư�� ���ڸ� �ø�ó��
SELECT * FROM sales;
SELECT sales_amount_usd, CEILING(sales_amount_usd) AS ���
FROM sales;

-- ��¥�Լ� : ���Ĺ���, ������ ����
-- GETDATE : ���Ĺ��� ����
-- DATEADD : ���Ĺ��� ����
-- DATEDIFF : p255 �籸���� ���� �� �ʼ�
select 
	order_date
	, DATEADD(YEAR, -1, order_date) as ���1
	, DATEADD(YEAR, +2, order_date) as ���2
	, DATEADD(DAY, +40, order_date) as ���3
FROM sales
;

-- DATEDIFF (p72)
select
	order_date
	, DATEDIFF(MONTH, order_date, '2025-04-22') ���1
	, DATEDIFF(DAY, order_date, '2025-04-22') ���1
from sales
;

select DATEDIFF(YEAR, '2002-01-03', '2025-04-22');

-- �����Լ�
-- ������ �Լ�
-- RANK : 

select * from student_math_score;

select 
	�л�
	, ��������
	, RANK() OVER(ORDER BY �������� DESC) as rank���
	, DENSE_RANK() OVER(ORDER BY �������� DESC) as dense_rank���
	, ROW_NUMBER() OVER(ORDER BY �������� DESC) as row_num���
from student_math_score
;

-- PARTITION BY
-- OVER(ORDER BY) : ��ü �߿��� �� ��
-- OVER(PARTITION BY class ORDER BY) : �� ���� ������ �� �ݿ��� �� ��?

select 
	�л�
	, Class
	, ��������
	, DENSE_RANK() OVER(PARTITION BY Class ORDER BY �������� DESC) as �ݵ��
	, DENSE_RANK() OVER(ORDER BY �������� DESC) as �������
from student_math_score
;

-- CASE��, ���ǹ� (IF�� ��� ���)
-- SELECT�� �ۼ� ��, ��ȸ��
-- PL/SQL �� ��쿡��, IF�� ��� ����

-- ���� 0���� �۴ٸ� 'ȯ�Ұŷ�', 0���� ũ�ٸ� '����ŷ�'�� �з�

select sales_amount
from sales;

select sales_amount
		, CASE WHEN sales_amount < 0 THEN 'ȯ�Ұŷ�'
			   WHEN sales_amount > 0 THEN '����ŷ�' 
	      END as ������
from sales
;


-- �ǽ�

-- 01. �� ���� ������
SELECT * FROM CUSTOMER;

-- Q1. 
SELECT CONCAT(last_name, first_name) as FULLNAME
FROM customer;

-- Q2. 
SELECT ISNULL(phone_number, email) as CONTACT_INFO
FROM customer;

-- Q3.
SELECT DATEDIFF(YEAR, date_of_birth, '2025-04-22') AS AGE
FROM customer;

SELECT 2023 - YEAR(date_of_birth) as AGE
FROM customer;

-- Q4.
SELECT 2023 - YEAR(date_of_birth) as AGE,
		CASE WHEN (2023 - YEAR(date_of_birth)) >= 40 THEN '40��'
			 WHEN (2023 - YEAR(date_of_birth)) >= 30 THEN '30��'
			 WHEN (2023 - YEAR(date_of_birth)) >= 20 THEN '20��'
	    END AS AGEBAND
FROM customer;

-- Q5.
SELECT customer_id
	   , CONCAT(last_name, first_name) as FULLNAME
	   , ISNULL(phone_number, email) as CONTACT_INFO
	   , 2023 - YEAR(date_of_birth) as AGE
	   , CASE WHEN (2023 - YEAR(date_of_birth)) >= 40 THEN '40��'
			 WHEN (2023 - YEAR(date_of_birth)) >= 30 THEN '30��'
			 WHEN (2023 - YEAR(date_of_birth)) >= 20 THEN '20��'
	    END AS AGEBAND
FROM customer;