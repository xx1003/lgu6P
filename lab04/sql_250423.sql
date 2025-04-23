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