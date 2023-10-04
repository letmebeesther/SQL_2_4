--09/28 4주차 SQL 프로그래밍_워크북 13장 7p~8p

use SampleDB -- sample DB로 바꾸기
use pubs -- pubs로 바꾸기

print 'hello'-- 이건 그냥 메세지 출력. 문자만 출력
select 'hello' -- 표로 만듦

--goto 레이블
declare @title_id varchar(6)

if @title_id is null goto ERR
select*from titles where title_id=@title_id
return
ERR: print'책 코드값이 잘못 지정되었습니다.'

--if문
if(select 점수 from 성적 where 이름='김태희') >= 80
	print 'good'
else
	print 'you should get very hard on your study'

-- 성적테이블에서 공유라는 학생이 있는지 체크해서 있으면 '우리 학교 학생입니다.'
-- 없으면 '우리 학교에 없는 학생입니다.'라고 출력하시오.
if(select count(*) from 성적 where 이름='공유')>=1 -- 한개라도 있으면
	print'우리 학교에 있는 학생입니다.'
else
	print'우리 학교에 없는 학생입니다.'

--1. 제품테이블에서 제품의 종류중 ‘코트’가 있는 확인하여 
--코트가 있으면 '재고가 있습니다.'
--코트가 없으면 '재고가 없습니다.' 를 출력하시오.
if(select count(*) from 제품 where 종류='코트') >= 1
	print '재고가 있습니다.'
else
	print '재고가 없습니다.' 

--변수에 값 넣기(초기화) / 다용도적인 select
declare @a int, @b int
select @a=10, @b=20 -- 대입용 select
select @a,@b -- 출력용 select

--2. 변수 '@avg' 를 정의하고 titles테이블의 모든 책의 책가격(price)의 평균을 구해서 
-- 평균값을 변수'@avg'로 넣어 출력하시오.
declare @avg int
select @avg = (select avg(price) from titles)
select @avg

declare @avg int
select @avg = avg(price) from titles
select @avg

--case_end
/*
case @y
when then
when then
when then
when then
else
end 가격
*/

select pub_name, 
case country
	when 'USA' then '미국'
	when 'Germany' then '독일'
	when 'France' then '프랑스'
	else '기타국가'
end 국가
from publishers

-- 3. 다음은 테이블 '제품'에서 제품명,색상,가격을 출력하는 SQL구문이다. 
-- SELECT 제품명, 색상, 가격 FROM 제품 이를 실행해보시오.
-- 이 SQL구문에서 색상이 영어로 출력되는데 다음처럼  색상이 한글로 출력되도록 하시오.
--'BLACK' → '검정색’
--'YELLOW' → '노란색'
--'BROWN' → '갈색'
--'BLUE' → '파랑색'
--그 외 → '기타'

SELECT 제품명, 
case 색상
	when 'BLACK' then '검정색'
	when 'YELLOW' then '노란색'
	when 'BROWN' then '갈색'
	when 'BLUE' then '파랑색'
	else '기타' 
end 색상, 
가격 FROM 제품