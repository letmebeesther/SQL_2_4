--09/28 4���� SQL ���α׷���_��ũ�� 13�� 7p~8p

use SampleDB -- sample DB�� �ٲٱ�
use pubs -- pubs�� �ٲٱ�

print 'hello'-- �̰� �׳� �޼��� ���. ���ڸ� ���
select 'hello' -- ǥ�� ����

--goto ���̺�
declare @title_id varchar(6)

if @title_id is null goto ERR
select*from titles where title_id=@title_id
return
ERR: print'å �ڵ尪�� �߸� �����Ǿ����ϴ�.'

--if��
if(select ���� from ���� where �̸�='������') >= 80
	print 'good'
else
	print 'you should get very hard on your study'

-- �������̺��� ������� �л��� �ִ��� üũ�ؼ� ������ '�츮 �б� �л��Դϴ�.'
-- ������ '�츮 �б��� ���� �л��Դϴ�.'��� ����Ͻÿ�.
if(select count(*) from ���� where �̸�='����')>=1 -- �Ѱ��� ������
	print'�츮 �б��� �ִ� �л��Դϴ�.'
else
	print'�츮 �б��� ���� �л��Դϴ�.'

--1. ��ǰ���̺��� ��ǰ�� ������ ����Ʈ���� �ִ� Ȯ���Ͽ� 
--��Ʈ�� ������ '��� �ֽ��ϴ�.'
--��Ʈ�� ������ '��� �����ϴ�.' �� ����Ͻÿ�.
if(select count(*) from ��ǰ where ����='��Ʈ') >= 1
	print '��� �ֽ��ϴ�.'
else
	print '��� �����ϴ�.' 

--������ �� �ֱ�(�ʱ�ȭ) / �ٿ뵵���� select
declare @a int, @b int
select @a=10, @b=20 -- ���Կ� select
select @a,@b -- ��¿� select

--2. ���� '@avg' �� �����ϰ� titles���̺��� ��� å�� å����(price)�� ����� ���ؼ� 
-- ��հ��� ����'@avg'�� �־� ����Ͻÿ�.
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
end ����
*/

select pub_name, 
case country
	when 'USA' then '�̱�'
	when 'Germany' then '����'
	when 'France' then '������'
	else '��Ÿ����'
end ����
from publishers

-- 3. ������ ���̺� '��ǰ'���� ��ǰ��,����,������ ����ϴ� SQL�����̴�. 
-- SELECT ��ǰ��, ����, ���� FROM ��ǰ �̸� �����غ��ÿ�.
-- �� SQL�������� ������ ����� ��µǴµ� ����ó��  ������ �ѱ۷� ��µǵ��� �Ͻÿ�.
--'BLACK' �� '��������
--'YELLOW' �� '�����'
--'BROWN' �� '����'
--'BLUE' �� '�Ķ���'
--�� �� �� '��Ÿ'

SELECT ��ǰ��, 
case ����
	when 'BLACK' then '������'
	when 'YELLOW' then '�����'
	when 'BROWN' then '����'
	when 'BLUE' then '�Ķ���'
	else '��Ÿ' 
end ����, 
���� FROM ��ǰ