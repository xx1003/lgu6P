-- HAVING vs WHERE : 필터링
-- WHERE : 원본 데이터를 기준으로 필터링
-- HAVING : 그룹화 계산이 끝난 이후를 기준으로 필터링(단독 사용 불가능)
-- 고객별로 매출 구하고, 그 값이 20,000을 초과하는 값만 구하고 싶음

SELECT
	customer_id					-- 중복되는 값이 다수 존재하는가?
	,SUM(sales_amount) AS 매출 
FROM sales_ch5
GROUP BY customer_id
HAVING SUM(sales_amount) > 20000
;

-- MS-SQL, ORACLE 같은 경우 문법이 엄격한 편
/*
SELECT CASE WHEN ==> 그룹
		, 수치필드
FROM 테이블
GROUP BY CASE WHEN
;

-- MYSQL, postgreSQL
SELECT CASE WHEN ==> 그룹
		, 수치필드
FROM 테이블
GROUP BY 1	-- 숫자만 입력하면 인식 가능 
;
*/

-- p.144 3번문제


-- ORDER BY
SELECT
	customer_id					-- 중복되는 값이 다수 존재하는가?
	,SUM(sales_amount) AS 매출 
FROM sales_ch5
GROUP BY customer_id
ORDER BY 매출 DESC	-- alias 사용가능 
;

-- DB가 데이터를 처리하는 순서
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
INSERT INTO product_info VALUES ('p001','A노트북 14inch','c01',1500000,'전시중','2022-10-02')
INSERT INTO product_info VALUES ('p002','B노트북 16inch','c01',2000000,'전시중지','2022-11-30')
INSERT INTO product_info VALUES ('p003','C노트북 16inch','c01',3000000,'전시중','2023-03-11')
INSERT INTO product_info VALUES ('p004','D세탁기','c01',1500000,'전시중','2021-08-08')
INSERT INTO product_info VALUES ('p005','E건조기','c01',1800000,'전시중','2022-08-09')
INSERT INTO product_info VALUES ('p006','핸드폰케이스','c02',21000,'전시중','2023-04-03')
INSERT INTO product_info VALUES ('p007','노트북 액정보호필름','c02',15400,'전시중','2023-04-03')

-- SELECT  * FROM product_info



/***********************************************************
■ 데이터 7.3.1
■ category_info : 제품 카테고리에 대한 정보
■ 방법 : CREATE부터 INSERT INTO의 마지막줄까지 드래그 후 실행(단축키F5)시켜주세요.
************************************************************/

CREATE TABLE category_info
(
  category_id   VARCHAR(10),
  category_name VARCHAR(10)
)

INSERT INTO category_info VALUES ('c01','가전제품')
INSERT INTO category_info VALUES ('c02','액세서리')

-- SELECT  * FROM category_info



/***********************************************************
■ 데이터 7.4.1
■ event_info : 이벤트 제품에 대한 정보
■ 방법 : CREATE부터 INSERT INTO의 마지막줄까지 드래그 후 실행(단축키F5)시켜주세요.
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

-- 데이터 확인
SELECT * FROM product_info;
SELECT * FROM category_info;
SELECT * FROM event_info;

-- p.161
-- 제품 정보가 있는 product_info 테이블
-- 제품 카테고리가 있는 category_info 테이블
-- 이벤트 제품에 대한 정보 event_info 테이블

-- 서로 다른 테이블 ==> 테이블 조인 (일반적인 방법)
-- 서브쿼리 vs 테이블 조인
SELECT 
	product_id,
	product_name,
	category_id,
	(SELECT category_name FROM category_info WHERE category_id = p.category_id) 
FROM product_info p;	-- 일반적으로 테이블 조인할 때 테이블 이름 ALIAS 처리


SELECT * 
FROM category_info c JOIN product_info p on c.category_id = p.category_id;

-- FROM절 서브쿼리
-- data1 = data.가공
-- data2 = data1.가공
-- SELECT FROM (SELECT FROM (SELECT FROM))
-- product_info 테이블, 카테고리별로 제품의 개수가 5개 이상인 카테고리만 출력

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

--WHERE절 서브쿼리
-- 서브쿼리 잘하고 싶음 : 분할 후 합치기
-- product_info T, 가전제품 카테코리만 출력하고 싶다.
-- 서브쿼리, 메인쿼리 분할해서 처리
-- 서브쿼리 : 가전제품 카테고리만 조회
-- 메인쿼리 : product_info 테이블만 조회


-- 가전제품 카테고리 id ==> c01
SELECT * FROM category_info;

SELECT * FROM PRODUCT_INFO WHERE CATEGORY_ID=(
	SELECT category_id FROM category_info WHERE category_name = '액세서리'
);


-- p.168
-- product_info T, event_id 컬럼의 e2에 포함된 제품의 정부만 출력
-- 메인쿼리 : product_info T 제품의 정보 출력
-- 서브쿼리 : event_id 컬럼의 e2에 해당하는 제품
SELECT * FROM product_info;
SELECT * FROM event_info;

SELECT * FROM product_info WHERE product_id IN (
	SELECT product_id FROM event_info WHERE event_id = 'e2'
);


-- 테이블의 결합
-- LEFT JOIN, RIGHT JOIN, OUTER JOIN (FULL JOIN), INNER JOIN
SELECT *
FROM product_info pi
LEFT
JOIN category_info ci ON pi.category_id = ci.category_id
;

-- UNION 연산자 : 테이블 아래로 붙이기
-- UNION(중복 값 제거) vs UNION ALL (중복 값 제거하지 않은 채 그대로 출력)

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

-- 서브쿼리 추가 질문
USE BikeStores

-- 테이블
SELECT * FROM sales.orders;

-- 문제 : 2017년에 가장 많은 주문을 처리한 직원이 처리한 모든 주문을 조회
-- 1. 모든 주문 정보 표시
-- 2. where 서브쿼리 사용해서 2017년 최다 주문 처리 직원 찾기
-- 3. Top 1과 groupby 사용
-- 4. 활용함수 : year, count(*)

-- 메인쿼리 : 모든 주문 정보 표시
-- SELECT * FROM sales.orders;

-- 서브쿼리 : 2017년에 가장 많은 주문을 처리한 직원 찾기
-- staff_id 빈번하게 등장한 직원 찾기

select staff_id, year(order_date), count(*) as orders from sales.orders where year(order_date) = 2017
	group by staff_id, year(order_date);


select * from sales.orders where staff_id = (
	select top 1 staff_id from sales.orders where year(order_date) = 2017
	group by staff_id
	order by count(*) desc)
;


-- 테이블 2개
SELECT * FROM production.products;
SELECT * FROM sales.order_items;

-- 문제 : 한 번도 주문되지 않은 제품들의 정보를 조회하시오.
-- 중복 제거하는 방법 : SELECT DISTINCT

select * from production.products where product_id not in (
select distinct product_id from sales.order_items);