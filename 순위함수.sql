-- 09/28 4주차 순위함수

-- 과거 
--오름차순(낮은 점수 순)
select * from 성적
order by 점수 asc -- asc는 디폴트라서 안써도 됨

select * from 성적
order by 점수

--내림차순(높은 점수 순)
select * from 성적
order by 점수 desc

-- 09/28 4주차 오늘 배울거_워크북 5p~6p
/*
!순위함수!

over(order by 점수) -> 오름차순
over(order by 점수 desc) -> 내림차순

1. rank() 
select 이름,점수, rank() over(order by 점수) from 성적
중복 순위가 매겨짐. 그래서 갯수를 무시함

2. dense_rank()
select 이름,점수, dense_rank() over(order by 점수) from 성적
중복 순위 매겨짐. 갯수를 무시하지않음

3.row_number()
select 이름,점수, row_number() over(order by 점수) from 성적
순위 매기는 함수가 아님. 일련 번호 알려줌

4.ntile()
select 이름,점수, ntile(n) over(order by 점수) from 성적
괄호 안에 쓰는 숫자에 따라 그룹이 나눠짐

5. partition by
select 반,이름,점수, dense_rank() over(partition by 반 order by 점수) 순위 from 성적
order by 앞에다 쓴다

*/

select 이름,점수, rank() over(order by 점수) 순위 from 성적
select 이름,점수, dense_rank() over(order by 점수) 순위 from 성적
select 이름,점수, row_number() over(order by 점수) 순위 from 성적
select 이름,점수, ntile(5) over(order by 점수) 순위 from 성적
select 반,이름,점수, dense_rank() over(partition by 반 order by 점수) 순위 from 성적
select 반,이름,점수, row_number() over(partition by 반 order by 점수) 순위 from 성적

--성별로 파티션해서 로우넘버
select row_number() over(partition by 성별 order by 점수) 순위, 성별,이름,점수 from 성적

-- 워크북 5p 9번~ 6p 12번(pubs)

--9. titles테이블에서 책의 출간일(pubdate)순으로 순번이 나타나도록 하시오.
select title_id, pubdate, rank() over (order by pubdate) RANK from titles

--10. sales테이블에서 판매수량(qty)순으로 순위를 매기지만 
--중간 순위를 건너띄지 않고 연속적인 순위가 나타나도록 하시오.
select title_id,qty,DENSE_RANK() over(order by qty) DENSE_RANK from sales

--11. sales테이블을 이용하여 같은 stor_id별로 분류하고 
-- 같은 stor_id안에서 판매량(qty)순으로 row_number()함수에 의한 순위가 나타나도록 하시오. 
select row_number() over(order by qty),stor_id,qty from sales