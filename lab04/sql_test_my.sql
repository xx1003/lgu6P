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


-- 테이블 기본정보 확인하는 명령어
EXEC sp_help 'sales';

-- Chapter 9장 
-- 실습 데이터 소개 
USE lily_book_test;

-- 테이블 확인 
SELECT * FROM sales;
SELECT * FROM customer;

/***********************************************************
■ 매출 트렌드 (p.203)
************************************************************/

-- 기간별 매출 현황
-- 트렌드 : 시계열 분석과 연관
-- 출력 컬럼 : invoicedate, 매출액, 주문수량, 주문건수, 주문고객수
-- 활용 함수 : SUM(), COUNT()
SELECT CONVERT(DATE, InvoiceDate) as invoicedate
	, ROUND(SUM(ABS(Quantity) * UnitPrice),2) as 매출액
	, SUM(ABS(Quantity)) as 주문수량
	, COUNT(DISTINCT InvoiceNo) as 주문건수
	, COUNT(DISTINCT CustomerID) as 주문고객수
FROM sales
GROUP BY CONVERT(DATE, InvoiceDate)
ORDER BY CONVERT(DATE, InvoiceDate)
;

-- 국가별 매출 현황
-- 출력 컬럼 : country, 매출액, 주문수량, 주문건수, 주문고객수
-- 활용 함수 : SUM(), COUNT()
SELECT country, SUM(ABS(Quantity) * UnitPrice) as 매출액, 
		SUM(ABS(Quantity)) as 주문수량, 
		COUNT(DISTINCT InvoiceNo) as 주문건수, 
		COUNT(DISTINCT CustomerID) as 주문고객수 
FROM sales
GROUP BY Country
;


-- 국가별 x 제품별 매출 현황 
-- 출력 컬럼 : country, stockcode, 매출액, 주문수량, 주문건수, 주문고객수
-- 활용 함수 : SUM(), COUNT()
SELECT Country, StockCode
	, SUM(ABS(Quantity) * UnitPrice) as 매출액
	, SUM(ABS(Quantity)) as 주문수량
	, COUNT(InvoiceNo) as 주문건수
	, COUNT(CustomerID) as 주문고객수
FROM sales
GROUP BY Country, StockCode
ORDER BY 2, 1			-- 숫자는 컬럼 인덱스 번호
;

-- 특정 제품 매출 현황
-- 출력 컬럼 : 매출액, 주문수량, 주문건수, 주문고객수
-- 활용 함수 : SUM(), COUNT()
-- 코드명 : 21615
SELECT StockCode
	, ROUND(SUM(ABS(Quantity) * UnitPrice),2) as 매출액
	, SUM(ABS(Quantity)) as 주문수량
	, COUNT(DISTINCT InvoiceNo) as 주문건수
	, COUNT(DISTINCT CustomerID) as 주문고객수
FROM sales
GROUP BY StockCode
HAVING StockCode = '21615'
;


-- 특정 제품의 기간별 매출 현황 
-- 출력 컬럼 : invoicedate, 매출액, 주문수량, 주문건수, 주문고객수
-- 활용 함수 : SUM(), COUNT()
-- 코드명 : 21615, 21731
SELECT CONVERT(DATE, InvoiceDate) as invoicedate
	, StockCode
	, SUM(ABS(Quantity) * UnitPrice) as 매출액
	, SUM(ABS(Quantity)) as 주문수량
	, COUNT(DISTINCT InvoiceNo) as 주문건수
	, COUNT(DISTINCT CustomerID) as 주문고객수
FROM sales
GROUP BY StockCode, CONVERT(DATE, InvoiceDate)
HAVING StockCode IN ('21615', '21731')
;


/***********************************************************
■ 이벤트 효과 분석 (p.213)
************************************************************/

SELECT * FROM sales;
-- 이벤트 효과 분석 (시기에 대한 비교)
-- 2011년 9/10 ~ 2011년 9/25까지 약 15일동안 진행한 이벤트의 매출 확인 
-- 출력 컬럼 : 기간 구분, 매출액, 주문수량, 주문건수, 주문고객수 
-- 활용 함수 : CASE WHEN, SUM(), COUNT()
-- 기간 구분 컬럼의 범주 구분 : 이벤트 기간, 이벤트 비교기간(전월동기간)

SELECT E.이벤트 AS 기간구분,
		SUM(E.매출액) AS 매출액,
		SUM(E.주문수량) AS 주문수량,
		SUM(E.주문건수) AS 주문건수,
		SUM(E.주문고객수) AS 주문고객수
FROM (
	SELECT CASE WHEN CONVERT(DATE, InvoiceDate) BETWEEN '2011-09-10' AND '2011-09-25' THEN '이벤트 기간'
			 WHEN CONVERT(DATE, InvoiceDate) BETWEEN '2011-08-10' AND '2011-08-25' THEN '이벤트 비교기간'
		END AS 이벤트
		, SUM(Quantity * UnitPrice) as 매출액
		, SUM(Quantity) as 주문수량
		, COUNT(DISTINCT InvoiceNo) as 주문건수
		, COUNT(DISTINCT CustomerID) as 주문고객수 
	FROM sales
	GROUP BY CONVERT(DATE, InvoiceDate)
	HAVING CONVERT(DATE, InvoiceDate) BETWEEN '2011-08-10' AND '2011-08-25'
		OR CONVERT(DATE, InvoiceDate) BETWEEN '2011-09-10' AND '2011-09-25'
) AS E
GROUP BY E.이벤트
;

-- 이벤트 효과 분석 (시기에 대한 비교)
-- 2011년 9/10 ~ 2011년 9/25까지 특정 제품에 실시한 이벤트에 대해 매출 확인
-- 출력 컬럼 : 기간 구분, 매출액, 주문수량, 주문건수, 주문고객수 
-- 활용 함수 : CASE WHEN, SUM(), COUNT()
-- 기간 구분 컬럼의 범주 구분 : 이벤트 기간, 이벤트 비교기간(전월동기간)
-- 제품군 : 17012A, 17012C, 17084N
SELECT * FROM sales;

SELECT E.이벤트 AS 기간구분,
		SUM(E.매출액) AS 매출액,
		SUM(E.주문수량) AS 주문수량,
		SUM(E.주문건수) AS 주문건수,
		SUM(E.주문고객수) AS 주문고객수
FROM (
	SELECT CASE WHEN CONVERT(DATE, InvoiceDate) BETWEEN '2011-09-10' AND '2011-09-25' THEN '이벤트 기간'
			 WHEN CONVERT(DATE, InvoiceDate) BETWEEN '2011-08-10' AND '2011-08-25' THEN '이벤트 비교기간'
		END AS 이벤트
		, StockCode as 제품코드
		, SUM(Quantity * UnitPrice) as 매출액
		, SUM(Quantity) as 주문수량
		, COUNT(DISTINCT InvoiceNo) as 주문건수
		, COUNT(DISTINCT CustomerID) as 주문고객수 
	FROM sales
	GROUP BY CONVERT(DATE, InvoiceDate), StockCode
	HAVING (CONVERT(DATE, InvoiceDate) BETWEEN '2011-08-10' AND '2011-08-25'
		OR CONVERT(DATE, InvoiceDate) BETWEEN '2011-09-10' AND '2011-09-25')
		AND StockCode IN ('17012A', '17012C', '17084N')
) AS E
GROUP BY E.이벤트
;

/***********************************************************
■ CRM 고객 타깃 출력 (p.217)
************************************************************/
select * from customer;
-- 특정 제품 구매 고객 정보
-- 문제 : 2010.12.1 - 2010.12.10일까지 특정 제품 구매한 고객 정보 출력
-- 출력 컬럼 : 고객 ID, 이름, 성별, 생년월일, 가입 일자, 등급, 가입 채널
-- HINT : 인라인 뷰 서브쿼리, LEFT JOIN 활용
-- 활용함수 : CONCAT()
-- 코드명 : 21730, 21615
select distinct c.mem_no as '고객 ID',
	concat(last_name, first_name) as 이름,
	gd as 성별,
	birth_dt as 생년월일,
	entr_dt as 가입일자,
	grade as 등급,
	sign_up_ch as 가입채널
from customer c left join sales s on c.mem_no = s.CustomerID
where s.StockCode in ('21730', '21615') and
	convert(date, s.InvoiceDate) between '2010-12-01' and '2010-12-18'
order by '고객 ID'
;

-- 미구매 고객 정보 확인
-- 문제 : 전체 멤버십 가입 고객 중에서 구매 이력이 없는 고객과 구매 이력이 있는 고객 정보 구분 
-- 출력 컬럼 : non_purchaser, mem_no, last_name, first_name, invoiceno, stockcode, invoicedate, unitprice, customerid
-- HINT : LEFT JOIN
-- 활용함수 : CASE WHEN, IS NULL, 

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


-- 전체 고객수와 미구매 고객수 계산 
-- 출력 컬럼 : non_purchaser, total_customer
-- HINT : LEFT JOIN
-- 활용 함수 : COUNT(), IS NULL
select count(distinct f.mem_no)
from (select case when s.InvoiceNo is null then c.mem_no
		else NULL end as non_purchaser,
		c.mem_no
	from customer c left join sales s on c.mem_no = s.CustomerID
	) as f
group by case when f.non_purchaser is null then '미구매고객'
	else '구매고객'
	end
;

/***********************************************************
■ 고객 상품 구매 패턴 (p.227)
************************************************************/

-- 매출 평균 지표 활용하기 
-- 매출 평균지표 종류 : ATV, AMV, Avg.Frq, Avg.Units
-- 문제 : sales 데이터의 매출 평균지표, ATV, AMV, Avg.Frq, Avg.Units 알고 싶음
-- 출력 컬럼 : 매출액, 주문수량, 주문건수, 주문고객수, ATV, AMV, Avg.Frq, Avg.Units
-- 활용함수 : SUM(), COUNT()
select  SUM(Quantity * UnitPrice) as 매출액
		, SUM(Quantity) as 주문수량
		, COUNT(DISTINCT InvoiceNo) as 주문건수
		, COUNT(DISTINCT CustomerID) as 주문고객수
		, 

from sales
;
-- 문제 : 문제 : 연도 및 월별 매출 평균지표, ATV, AMV, Avg.Frq, Avg.Units 알고 싶음
-- 출력 컬럼 : 연도, 월, 매출액, 주문수량, 주문건수, 주문고객수, ATV, AMV, Avg.Frq, Avg.Units
-- 활용함수 : SUM(), COUNT(), YEAR, MONTH

/***********************************************************
■ 고객 상품 구매 패턴 (p.230)
************************************************************/

-- 특정 연도 베스트셀링 상품 확인
-- 문제 : 2011년에 가장 많이 판매된 제품 TOP 10의 정보 확인 
-- 출력 컬럼 : stockcode, description, qty
-- 활용함수 : TOP 10, SUM(), YEAR()


-- 국가별 베스트셀링 상품 확인
-- 문제 : 국가별로 가장 많이 판매된 제품 순으로 실적을 구하고 싶음
-- 출력 컬럼 : RNK, country, stockcode, description, qty
-- HINT : 인라인 뷰 서브쿼리
-- 활용함수 : ROW_NUMBER() OVER(PARTITION BY...), SUM()


-- 20대 여성 고객의 베스트셀링 상품 확인 
-- 문제 : 20대 여성 고객이 가장 많이 구매한 TOP 10의 정보 확인 
-- 출력 컬럼 : RNK, country, stockcode, description, qty
-- HINT : 인라인 뷰 서브쿼리, 인라인 뷰 서브쿼리 작성 시, LEFT JOIN 필요
-- 활용함수 : ROW_NUMBER() OVER(PARTITION BY...), SUM(), YEAR()

/***********************************************************
■ 고객 상품 구매 패턴 (p.238)
************************************************************/

-- 특정 제품과 함께 가장 많이 구매한 제품 확인 
-- 문제 : 특정 제품(stockcode='20725')과 함께 가장 많이 구매한 TOP 10의 정보 확인
-- 출력 컬럼 : stockcode, description, qty 
-- HINT : INNER JOIN
-- 활용함수 : SUM()




/***********************************************************
■ 고객 상품 구매 패턴 (p.244)
************************************************************/

-- 재구매 고객의 비율 확인
-- 방법 1 : 고객별로 구매일 수 세는 방법
-- 문제 : 쇼핑몰의 재구매 고객수 확인 
-- 출력 컬럼 : repurchaser_count
-- HINT : 인라인 뷰
-- 활용 함수 : COUNT()




-- 방법 2 : 고객별로 구매한 일수에 순서를 매기는 방법
-- 문제 : 쇼핑몰의 재구매 고객수 확인 
-- 출력 컬럼 : repurchaser_count
-- HINT : 인라인 뷰
-- 활용 함수 : COUNT(), DENSE_RANK() OVER(PARTITION BY...)


-- 리텐션 및 코호트 분석
-- 2010년 구매 이력이 있는 2011년 유지율 확인 
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
