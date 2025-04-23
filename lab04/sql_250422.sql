-- 현재 데이터베이스 확인
SELECT DB_NAME();

-- 데이터베이스 > Table(pandas 데이터프레임)
-- 데이터베이스 안에 있는 것 
--- 테이블 외에도, view, 프로시저, 트리거, 사용자 정의 함수 등 포함
-- SQL, SQEL : E - English
-- 문법이 영어 문법과 매우 흡사함
-- 표준SQL, 99% 비슷, 1% 다름 ==> 데이터타입 정의할 때 차이가 있음(DB 종류마다)


-- 데이터 확인
SELECT * FROM staff;

-- 교재 p.42 SELECT 절과 FROM 절
USE lily_book
SELECT employee_id, employee_name, birth_date FROM staff;

-- 강사님 추천
SELECT employee_id, employee_name, birth_date 
FROM staff
; -- 해당 쿼리 코드 작성 완료


SELECT employee_id
		, employee_name
		, birth_date 
FROM staff
; 


SELECT * FROM staff; -- 추천 x
SELECT employee_name, employee_id FROM staff; -- 컬럼 순서 변경 가능(조회)

-- 컬럼 별칭 : ALIAS
-- 컬럼명 지정할 때는, 영어 약어로 지정 ==> 데이터 정의서로 관리
-- ALIAS (AS)

-- 별칭 띄어쓰기 쓰고 싶으면 따옴표로 감싸줘야 함


SELECT employee_id, birth_date AS '생년 월일'
FROM staff
;

-- DISTINCT 중복값 제거
SELECT * FROM staff;

SELECT DISTINCT gender FROM staff;
SELECT gender FROM staff;

SELECT employee_name, gender, position FROM staff;
-- 중복값이 없는 컬럼이 있으면 쓰나마나?
SELECT DISTINCT position, employee_name, gender FROM staff;

SELECT DISTINCT position, gender FROM staff;

-- 문자열 함수 ; 다른 DBMS와 문법 유사
SELECT * FROM APPAREL_PRODUCT_INFO;

-- LEFT 함수 확인
SELECT product_id,LEFT(product_id, 2) AS 약어
FROM apparel_product_info;

-- SUBSTRING 문자열 중간 N번째 자리부터 N개만 출력
-- SUBSTRING(컬럼명, 숫자(N_start), 숫자(몇 개 가져올건지))
-- 파이썬, 다른 프로그래밍 언어는 인덱스가 0번째부터 시작
-- MS-SQL은 인덱스가 0번째부터 시작
SELECT product_id,SUBSTRING(product_id,6,2) AS 약어
FROM apparel_product_info;

-- CONCAT 문자열과 문자열 이어서 출력
SELECT CONCAT(category1, '>', category2,'=','옷', price) AS 테스트
FROM apparel_product_info;

-- REPLACE : 문자열에서 특정 문자 변경
--p.58
SELECT product_id, REPLACE(product_id, 'F','A') AS 결과
FROM apparel_product_info;

-- ISNULL 중요함
-- WHERE절과 함께 쓰일 때 자주 화용되는 방법
-- 데이터 상에 결측치가 존재 할 때, 릴요ㅑ마수;

-- 숫자함수 : ABS,CEILING, FLOOR, ROUND, POWER, SQRT
-- 다른 DBMS, MySQL, Oracle
SELECT ROUND(CAST(748.58 AS DECIMAL (6,2)), -3);

-- SIGN 
SELECT SIGN(-125), SIGN(0), SIGN(564);

-- CEILING : 특정 숫자를 올림처리
SELECT * FROM sales;
SELECT sales_amount_usd, CEILING(sales_amount_usd) AS 결과
FROM sales;

-- 날짜함수 : 공식문서, 무조건 참조
-- GETDATE : 공식문서 참조
-- DATEADD : 공식문서 참조
-- DATEDIFF : p255 재구매율 구할 때 필수
select 
	order_date
	, DATEADD(YEAR, -1, order_date) as 결과1
	, DATEADD(YEAR, +2, order_date) as 결과2
	, DATEADD(DAY, +40, order_date) as 결과3
FROM sales
;

-- DATEDIFF (p72)
select
	order_date
	, DATEDIFF(MONTH, order_date, '2025-04-22') 결과1
	, DATEDIFF(DAY, order_date, '2025-04-22') 결과1
from sales
;

select DATEDIFF(YEAR, '2002-01-03', '2025-04-22');

-- 순위함수
-- 윈도우 함수
-- RANK : 

select * from student_math_score;

select 
	학생
	, 수학점수
	, RANK() OVER(ORDER BY 수학점수 DESC) as rank등수
	, DENSE_RANK() OVER(ORDER BY 수학점수 DESC) as dense_rank등수
	, ROW_NUMBER() OVER(ORDER BY 수학점수 DESC) as row_num등수
from student_math_score
;

-- PARTITION BY
-- OVER(ORDER BY) : 전체 중에서 몇 등
-- OVER(PARTITION BY class ORDER BY) : 반 별로 나눴을 때 반에서 몇 등?

select 
	학생
	, Class
	, 수학점수
	, DENSE_RANK() OVER(PARTITION BY Class ORDER BY 수학점수 DESC) as 반등수
	, DENSE_RANK() OVER(ORDER BY 수학점수 DESC) as 전교등수
from student_math_score
;

-- CASE문, 조건문 (IF문 대신 사용)
-- SELECT문 작성 시, 조회용
-- PL/SQL 쓸 경우에는, IF문 사용 가능

-- 값이 0보다 작다면 '환불거래', 0보다 크다면 '정상거래'로 분류

select sales_amount
from sales;

select sales_amount
		, CASE WHEN sales_amount < 0 THEN '환불거래'
			   WHEN sales_amount > 0 THEN '정상거래' 
	      END as 적용결과
from sales
;


-- 실습

-- 01. 고객 정보 데이터
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
		CASE WHEN (2023 - YEAR(date_of_birth)) >= 40 THEN '40대'
			 WHEN (2023 - YEAR(date_of_birth)) >= 30 THEN '30대'
			 WHEN (2023 - YEAR(date_of_birth)) >= 20 THEN '20대'
	    END AS AGEBAND
FROM customer;

-- Q5.
SELECT customer_id
	   , CONCAT(last_name, first_name) as FULLNAME
	   , ISNULL(phone_number, email) as CONTACT_INFO
	   , 2023 - YEAR(date_of_birth) as AGE
	   , CASE WHEN (2023 - YEAR(date_of_birth)) >= 40 THEN '40대'
			 WHEN (2023 - YEAR(date_of_birth)) >= 30 THEN '30대'
			 WHEN (2023 - YEAR(date_of_birth)) >= 20 THEN '20대'
	    END AS AGEBAND
FROM customer;