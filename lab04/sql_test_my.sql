SELECT * FROM customer;

USE lily_book_test;

SELECT COUNT(DISTINCT customerid) AS rentention_cnt
FROM sales
WHERE customerid <> ''
    AND customerid IN (
    SELECT DISTINCT customerid FROM sales 
    WHERE customerid <> ''
        AND YEAR(invoicedate) = '2010'
)
    AND YEAR(invoicedate) = '2011'
;


-- ���̺� �⺻���� Ȯ���ϴ� ��ɾ�
EXEC sp_help 'sales';

-- Chapter 9�� 
-- �ǽ� ������ �Ұ� 
USE lily_book_test;

-- ���̺� Ȯ�� 
SELECT * FROM sales;
SELECT * FROM customer;

/***********************************************************
�� ���� Ʈ���� (p.203)
************************************************************/

-- �Ⱓ�� ���� ��Ȳ
-- Ʈ���� : �ð迭 �м��� ����
-- ��� �÷� : invoicedate, �����, �ֹ�����, �ֹ��Ǽ�, �ֹ�����
-- Ȱ�� �Լ� : SUM(), COUNT()
SELECT CONVERT(DATE, InvoiceDate) as invoicedate
	, ROUND(SUM(ABS(Quantity) * UnitPrice),2) as �����
	, SUM(ABS(Quantity)) as �ֹ�����
	, COUNT(DISTINCT InvoiceNo) as �ֹ��Ǽ�
	, COUNT(DISTINCT CustomerID) as �ֹ�����
FROM sales
GROUP BY CONVERT(DATE, InvoiceDate)
ORDER BY CONVERT(DATE, InvoiceDate)
;

-- ������ ���� ��Ȳ
-- ��� �÷� : country, �����, �ֹ�����, �ֹ��Ǽ�, �ֹ�����
-- Ȱ�� �Լ� : SUM(), COUNT()
SELECT country, SUM(ABS(Quantity) * UnitPrice) as �����, 
		SUM(ABS(Quantity)) as �ֹ�����, 
		COUNT(DISTINCT InvoiceNo) as �ֹ��Ǽ�, 
		COUNT(DISTINCT CustomerID) as �ֹ����� 
FROM sales
GROUP BY Country
;


-- ������ x ��ǰ�� ���� ��Ȳ 
-- ��� �÷� : country, stockcode, �����, �ֹ�����, �ֹ��Ǽ�, �ֹ�����
-- Ȱ�� �Լ� : SUM(), COUNT()
SELECT Country, StockCode
	, SUM(ABS(Quantity) * UnitPrice) as �����
	, SUM(ABS(Quantity)) as �ֹ�����
	, COUNT(InvoiceNo) as �ֹ��Ǽ�
	, COUNT(CustomerID) as �ֹ�����
FROM sales
GROUP BY Country, StockCode
ORDER BY 2, 1			-- ���ڴ� �÷� �ε��� ��ȣ
;

-- Ư�� ��ǰ ���� ��Ȳ
-- ��� �÷� : �����, �ֹ�����, �ֹ��Ǽ�, �ֹ�����
-- Ȱ�� �Լ� : SUM(), COUNT()
-- �ڵ�� : 21615
SELECT StockCode
	, ROUND(SUM(ABS(Quantity) * UnitPrice),2) as �����
	, SUM(ABS(Quantity)) as �ֹ�����
	, COUNT(DISTINCT InvoiceNo) as �ֹ��Ǽ�
	, COUNT(DISTINCT CustomerID) as �ֹ�����
FROM sales
GROUP BY StockCode
HAVING StockCode = '21615'
;


-- Ư�� ��ǰ�� �Ⱓ�� ���� ��Ȳ 
-- ��� �÷� : invoicedate, �����, �ֹ�����, �ֹ��Ǽ�, �ֹ�����
-- Ȱ�� �Լ� : SUM(), COUNT()
-- �ڵ�� : 21615, 21731
SELECT CONVERT(DATE, InvoiceDate) as invoicedate
	, StockCode
	, SUM(ABS(Quantity) * UnitPrice) as �����
	, SUM(ABS(Quantity)) as �ֹ�����
	, COUNT(DISTINCT InvoiceNo) as �ֹ��Ǽ�
	, COUNT(DISTINCT CustomerID) as �ֹ�����
FROM sales
GROUP BY StockCode, CONVERT(DATE, InvoiceDate)
HAVING StockCode IN ('21615', '21731')
;


/***********************************************************
�� �̺�Ʈ ȿ�� �м� (p.213)
************************************************************/

SELECT * FROM sales;
-- �̺�Ʈ ȿ�� �м� (�ñ⿡ ���� ��)
-- 2011�� 9/10 ~ 2011�� 9/25���� �� 15�ϵ��� ������ �̺�Ʈ�� ���� Ȯ�� 
-- ��� �÷� : �Ⱓ ����, �����, �ֹ�����, �ֹ��Ǽ�, �ֹ����� 
-- Ȱ�� �Լ� : CASE WHEN, SUM(), COUNT()
-- �Ⱓ ���� �÷��� ���� ���� : �̺�Ʈ �Ⱓ, �̺�Ʈ �񱳱Ⱓ(�������Ⱓ)

SELECT E.�̺�Ʈ AS �Ⱓ����,
		SUM(E.�����) AS �����,
		SUM(E.�ֹ�����) AS �ֹ�����,
		SUM(E.�ֹ��Ǽ�) AS �ֹ��Ǽ�,
		SUM(E.�ֹ�����) AS �ֹ�����
FROM (
	SELECT CASE WHEN CONVERT(DATE, InvoiceDate) BETWEEN '2011-09-10' AND '2011-09-25' THEN '�̺�Ʈ �Ⱓ'
			 WHEN CONVERT(DATE, InvoiceDate) BETWEEN '2011-08-10' AND '2011-08-25' THEN '�̺�Ʈ �񱳱Ⱓ'
		END AS �̺�Ʈ
		, SUM(Quantity * UnitPrice) as �����
		, SUM(Quantity) as �ֹ�����
		, COUNT(DISTINCT InvoiceNo) as �ֹ��Ǽ�
		, COUNT(DISTINCT CustomerID) as �ֹ����� 
	FROM sales
	GROUP BY CONVERT(DATE, InvoiceDate)
	HAVING CONVERT(DATE, InvoiceDate) BETWEEN '2011-08-10' AND '2011-08-25'
		OR CONVERT(DATE, InvoiceDate) BETWEEN '2011-09-10' AND '2011-09-25'
) AS E
GROUP BY E.�̺�Ʈ
;

-- �̺�Ʈ ȿ�� �м� (�ñ⿡ ���� ��)
-- 2011�� 9/10 ~ 2011�� 9/25���� Ư�� ��ǰ�� �ǽ��� �̺�Ʈ�� ���� ���� Ȯ��
-- ��� �÷� : �Ⱓ ����, �����, �ֹ�����, �ֹ��Ǽ�, �ֹ����� 
-- Ȱ�� �Լ� : CASE WHEN, SUM(), COUNT()
-- �Ⱓ ���� �÷��� ���� ���� : �̺�Ʈ �Ⱓ, �̺�Ʈ �񱳱Ⱓ(�������Ⱓ)
-- ��ǰ�� : 17012A, 17012C, 17084N
SELECT * FROM sales;

SELECT E.�̺�Ʈ AS �Ⱓ����,
		SUM(E.�����) AS �����,
		SUM(E.�ֹ�����) AS �ֹ�����,
		SUM(E.�ֹ��Ǽ�) AS �ֹ��Ǽ�,
		SUM(E.�ֹ�����) AS �ֹ�����
FROM (
	SELECT CASE WHEN CONVERT(DATE, InvoiceDate) BETWEEN '2011-09-10' AND '2011-09-25' THEN '�̺�Ʈ �Ⱓ'
			 WHEN CONVERT(DATE, InvoiceDate) BETWEEN '2011-08-10' AND '2011-08-25' THEN '�̺�Ʈ �񱳱Ⱓ'
		END AS �̺�Ʈ
		, StockCode as ��ǰ�ڵ�
		, SUM(Quantity * UnitPrice) as �����
		, SUM(Quantity) as �ֹ�����
		, COUNT(DISTINCT InvoiceNo) as �ֹ��Ǽ�
		, COUNT(DISTINCT CustomerID) as �ֹ����� 
	FROM sales
	GROUP BY CONVERT(DATE, InvoiceDate), StockCode
	HAVING (CONVERT(DATE, InvoiceDate) BETWEEN '2011-08-10' AND '2011-08-25'
		OR CONVERT(DATE, InvoiceDate) BETWEEN '2011-09-10' AND '2011-09-25')
		AND StockCode IN ('17012A', '17012C', '17084N')
) AS E
GROUP BY E.�̺�Ʈ
;

/***********************************************************
�� CRM �� Ÿ�� ��� (p.217)
************************************************************/
select * from customer;
-- Ư�� ��ǰ ���� �� ����
-- ���� : 2010.12.1 - 2010.12.10�ϱ��� Ư�� ��ǰ ������ �� ���� ���
-- ��� �÷� : �� ID, �̸�, ����, �������, ���� ����, ���, ���� ä��
-- HINT : �ζ��� �� ��������, LEFT JOIN Ȱ��
-- Ȱ���Լ� : CONCAT()
-- �ڵ�� : 21730, 21615
select distinct c.mem_no as '�� ID',
	concat(last_name, first_name) as �̸�,
	gd as ����,
	birth_dt as �������,
	entr_dt as ��������,
	grade as ���,
	sign_up_ch as ����ä��
from customer c left join sales s on c.mem_no = s.CustomerID
where s.StockCode in ('21730', '21615') and
	convert(date, s.InvoiceDate) between '2010-12-01' and '2010-12-18'
order by '�� ID'
;

-- �̱��� �� ���� Ȯ��
-- ���� : ��ü ����� ���� �� �߿��� ���� �̷��� ���� ���� ���� �̷��� �ִ� �� ���� ���� 
-- ��� �÷� : non_purchaser, mem_no, last_name, first_name, invoiceno, stockcode, invoicedate, unitprice, customerid
-- HINT : LEFT JOIN
-- Ȱ���Լ� : CASE WHEN, IS NULL, 

select * from sales;
select * from customer;

select case when s.InvoiceNo is null then c.mem_no
	else NULL end as non_purchaser,
	c.mem_no,
	last_name,
	first_name,
	InvoiceNo,
	stockcode,
	invoicedate, unitprice, customerid
from customer c left join sales s on c.mem_no = s.CustomerID
order by c.mem_no
;


-- ��ü ������ �̱��� ���� ��� 
-- ��� �÷� : non_purchaser, total_customer
-- HINT : LEFT JOIN
-- Ȱ�� �Լ� : COUNT(), IS NULL
select count(distinct f.mem_no)
from (select case when s.InvoiceNo is null then c.mem_no
		else NULL end as non_purchaser,
		c.mem_no
	from customer c left join sales s on c.mem_no = s.CustomerID
	) as f
group by case when f.non_purchaser is null then '�̱��Ű�'
	else '���Ű�'
	end
;

/***********************************************************
�� �� ��ǰ ���� ���� (p.227)
************************************************************/

-- ���� ��� ��ǥ Ȱ���ϱ� 
-- ���� �����ǥ ���� : ATV, AMV, Avg.Frq, Avg.Units
-- ���� : sales �������� ���� �����ǥ, ATV, AMV, Avg.Frq, Avg.Units �˰� ����
-- ��� �÷� : �����, �ֹ�����, �ֹ��Ǽ�, �ֹ�����, ATV, AMV, Avg.Frq, Avg.Units
-- Ȱ���Լ� : SUM(), COUNT()
select  SUM(Quantity * UnitPrice) as �����
		, SUM(Quantity) as �ֹ�����
		, COUNT(DISTINCT InvoiceNo) as �ֹ��Ǽ�
		, COUNT(DISTINCT CustomerID) as �ֹ�����
		, 

from sales
;
-- ���� : ���� : ���� �� ���� ���� �����ǥ, ATV, AMV, Avg.Frq, Avg.Units �˰� ����
-- ��� �÷� : ����, ��, �����, �ֹ�����, �ֹ��Ǽ�, �ֹ�����, ATV, AMV, Avg.Frq, Avg.Units
-- Ȱ���Լ� : SUM(), COUNT(), YEAR, MONTH

/***********************************************************
�� �� ��ǰ ���� ���� (p.230)
************************************************************/

-- Ư�� ���� ����Ʈ���� ��ǰ Ȯ��
-- ���� : 2011�⿡ ���� ���� �Ǹŵ� ��ǰ TOP 10�� ���� Ȯ�� 
-- ��� �÷� : stockcode, description, qty
-- Ȱ���Լ� : TOP 10, SUM(), YEAR()


-- ������ ����Ʈ���� ��ǰ Ȯ��
-- ���� : �������� ���� ���� �Ǹŵ� ��ǰ ������ ������ ���ϰ� ����
-- ��� �÷� : RNK, country, stockcode, description, qty
-- HINT : �ζ��� �� ��������
-- Ȱ���Լ� : ROW_NUMBER() OVER(PARTITION BY...), SUM()


-- 20�� ���� ���� ����Ʈ���� ��ǰ Ȯ�� 
-- ���� : 20�� ���� ���� ���� ���� ������ TOP 10�� ���� Ȯ�� 
-- ��� �÷� : RNK, country, stockcode, description, qty
-- HINT : �ζ��� �� ��������, �ζ��� �� �������� �ۼ� ��, LEFT JOIN �ʿ�
-- Ȱ���Լ� : ROW_NUMBER() OVER(PARTITION BY...), SUM(), YEAR()

/***********************************************************
�� �� ��ǰ ���� ���� (p.238)
************************************************************/

-- Ư�� ��ǰ�� �Բ� ���� ���� ������ ��ǰ Ȯ�� 
-- ���� : Ư�� ��ǰ(stockcode='20725')�� �Բ� ���� ���� ������ TOP 10�� ���� Ȯ��
-- ��� �÷� : stockcode, description, qty 
-- HINT : INNER JOIN
-- Ȱ���Լ� : SUM()




/***********************************************************
�� �� ��ǰ ���� ���� (p.244)
************************************************************/

-- �籸�� ���� ���� Ȯ��
-- ��� 1 : ������ ������ �� ���� ���
-- ���� : ���θ��� �籸�� ���� Ȯ�� 
-- ��� �÷� : repurchaser_count
-- HINT : �ζ��� ��
-- Ȱ�� �Լ� : COUNT()




-- ��� 2 : ������ ������ �ϼ��� ������ �ű�� ���
-- ���� : ���θ��� �籸�� ���� Ȯ�� 
-- ��� �÷� : repurchaser_count
-- HINT : �ζ��� ��
-- Ȱ�� �Լ� : COUNT(), DENSE_RANK() OVER(PARTITION BY...)


-- ���ټ� �� ��ȣƮ �м�
-- 2010�� ���� �̷��� �ִ� 2011�� ������ Ȯ�� 
SELECT COUNT(DISTINCT customerid) AS rentention_cnt
FROM sales
WHERE customerid <> ''
	AND customerid IN (
	SELECT DISTINCT customerid FROM sales 
	WHERE customerid <> ''
		AND YEAR(invoicedate) = '2010'
)
	AND YEAR(invoicedate) = '2011'
;

SELECT 
	customerid 
	, invoicedate 
	, DENSE_RANK() OVER(PARTITION BY customerid ORDER BY invoicedate) AS day_no 
FROM (
	SELECT customerid, invoicedate 
	FROM sales 
	WHERE customerid <> ''
	GROUP BY customerid, invoicedate
) a
;
