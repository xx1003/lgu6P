-- 교재, WHERE 절
-- 조건과 일치하는 데이터 조회(필터링)
-- pandas, iloc, loc, 비교연산자 등 같이 상기

-- p.94
-- 남자 고객만 필터링 후, id, name, gender만 출력
USE lily_book;

-- 문법 주의 : 문자열 큰따옴표 불가능, 작은 따옴표만
SELECT
	*
FROM customer
WHERE customer_id = 'c002'
;

-- WHERE절 안에서 비교연산자 통해서 필터링
-- <>, != : 좌우식이 서로 같지 않음
SELECT * FROM sales;

-- 숫자를 입력할 때 근사하게 입력해보자
SELECT *
FROM sales
WHERE sales_amount = 41000;

-- 데이터가 아예 없을 때도, NULL 형태로 출력
-- 조회할 때, 정확하게 입력하지 않아도 NULL 형태로 출력

SELECT
	*
FROM customer
WHERE customer_id = 'c002'
;


-- sales_amount의 값이 양수인 것만 조회
SELECT *
FROM sales
WHERE sales_amount > 0;

-- p.100, BETWEEN 연산자, 자주 쓰임
-- 30000과 40000 사이의 조건을 만족하는 행 출력
-- BETWEEN 경계에 있는 값도 포함함
SELECT *
FROM sales
WHERE sales_amount BETWEEN 30000 AND 40000
;

-- 숫자 뿐만 아니라 문자에도 적용 가능
SELECT * FROM customer
WHERE customer_id BETWEEN 'c001' AND 'c003'
;

SELECT * FROM customer
WHERE last_name BETWEEN '가' AND '아'
;

-- IN 연산자, 매우 자주 사용됨
-- OR 연산자 반복해서 쓰기 싫어서 IN 사용함
SELECT * FROM sales WHERE product_name IN('신발', '책');

USE BikeStores;

-- last_name이 letter z로 시직하는 모든 행을 필터링
select * 
from sales.customers
where last_name Like ('%z')

select * 
from sales.customers
where last_name Like ('%z%')


-- IS NULL 연산자 (중요함)
-- 데이터가 NULL값인 행만 필터링

-- 조회 안 됨.
select *
from sales.customers
where phone = NULL;
 
-- 정상적으로 조회
select *
from sales.customers
where phone IS NULL;

select *
from sales.customers
where phone IS NOT NULL;


-- AND OR 연산자
USE lily_book;

select * from distribution_center;

-- AND 연산자
select * 
from distribution_center
where permission_date > '2022-05-1'
	and permission_date < '2022-07-31'
	and status = '영업중'
;

-- OR 연산자
-- LIKE 연산자와 같이 응용한 쿼리
-- 연산자 우선순위 : () > AND > OR
select *
from distribution_center
where address like '%서울%'
	or address like '%경기도 용인시%'
;


-- 부정연산자
-- IN, NOT IN
-- IS NULL, IS NOT NULL
select * 
from distribution_center
where center_no not in (1,2);



-- CHAPTER 5장

DROP TABLE sales

CREATE TABLE sales
(
  날짜        VARCHAR(10),
  제품명    VARCHAR(10),
  수량        INT,
  금액        INT
)

INSERT INTO sales VALUES('01월01일','마우스',1,1000)
INSERT INTO sales VALUES('01월01일','마우스',2,2000)
INSERT INTO sales VALUES('01월01일','키보드',1,10000)
INSERT INTO sales VALUES('03월01일','키보드',1,10000)

SELECT * FROM SALES;

-- 일별로 판매된 수량과 금액
SELECT SUM(수량) AS 수량 FROM SALES;

SELECT 날짜, SUM(수량) AS 수량 FROM SALES
GROUP BY 날짜;

SELECT 제품명, SUM(수량) AS 수량 FROM SALES
GROUP BY 제품명;

SELECT 날짜,제품명, SUM(수량) AS 수량 
FROM SALES
GROUP BY 날짜, 제품명;

SELECT 날짜,제품명, SUM(수량) AS 수량, AVG(금액)
FROM SALES
GROUP BY 날짜, 제품명;

-- p.130~131
-- 수행한 코드, 이미 중복값이 존재한 상태
-- 주문날짜, 2023-03-01, 2023-03-05
-- 월별 총매출액
/*
SELECT MONTH(order_date), sum(매출액)
FROM 테이블
GROUP BY MONTH(order_date);
*/

