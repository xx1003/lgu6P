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