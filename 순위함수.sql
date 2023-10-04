-- 09/28 4���� �����Լ�

-- ���� 
--��������(���� ���� ��)
select * from ����
order by ���� asc -- asc�� ����Ʈ�� �Ƚᵵ ��

select * from ����
order by ����

--��������(���� ���� ��)
select * from ����
order by ���� desc

-- 09/28 4���� ���� ����_��ũ�� 5p~6p
/*
!�����Լ�!

over(order by ����) -> ��������
over(order by ���� desc) -> ��������

1. rank() 
select �̸�,����, rank() over(order by ����) from ����
�ߺ� ������ �Ű���. �׷��� ������ ������

2. dense_rank()
select �̸�,����, dense_rank() over(order by ����) from ����
�ߺ� ���� �Ű���. ������ ������������

3.row_number()
select �̸�,����, row_number() over(order by ����) from ����
���� �ű�� �Լ��� �ƴ�. �Ϸ� ��ȣ �˷���

4.ntile()
select �̸�,����, ntile(n) over(order by ����) from ����
��ȣ �ȿ� ���� ���ڿ� ���� �׷��� ������

5. partition by
select ��,�̸�,����, dense_rank() over(partition by �� order by ����) ���� from ����
order by �տ��� ����

*/

select �̸�,����, rank() over(order by ����) ���� from ����
select �̸�,����, dense_rank() over(order by ����) ���� from ����
select �̸�,����, row_number() over(order by ����) ���� from ����
select �̸�,����, ntile(5) over(order by ����) ���� from ����
select ��,�̸�,����, dense_rank() over(partition by �� order by ����) ���� from ����
select ��,�̸�,����, row_number() over(partition by �� order by ����) ���� from ����

--������ ��Ƽ���ؼ� �ο�ѹ�
select row_number() over(partition by ���� order by ����) ����, ����,�̸�,���� from ����

-- ��ũ�� 5p 9��~ 6p 12��(pubs)

--9. titles���̺��� å�� �Ⱓ��(pubdate)������ ������ ��Ÿ������ �Ͻÿ�.
select title_id, pubdate, rank() over (order by pubdate) RANK from titles

--10. sales���̺��� �Ǹż���(qty)������ ������ �ű����� 
--�߰� ������ �ǳʶ��� �ʰ� �������� ������ ��Ÿ������ �Ͻÿ�.
select title_id,qty,DENSE_RANK() over(order by qty) DENSE_RANK from sales

--11. sales���̺��� �̿��Ͽ� ���� stor_id���� �з��ϰ� 
-- ���� stor_id�ȿ��� �Ǹŷ�(qty)������ row_number()�Լ��� ���� ������ ��Ÿ������ �Ͻÿ�. 
select row_number() over(order by qty),stor_id,qty from sales