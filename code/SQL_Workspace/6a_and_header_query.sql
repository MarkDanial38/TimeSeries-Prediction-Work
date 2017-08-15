--itf_6a & itf_3g_header
--itf_6a��ͬһ���ͳ��ų���������·
select r2.lineno lineno, r1.t_type_id t_type_id, r1.loco_no loco_no, r2.num as header_num
from 
(select t_type_id, loco_no, count(*) as num
from itf_6a
group by t_type_id, loco_no) r1, 
(select t_type_id, loco_no, lineno, count(*) as num
from itf_3g_header
group by t_type_id, loco_no, lineno) r2
where 1=1
and r1.t_type_id = r2.t_type_id 
and r1.loco_no = r2.loco_no
order by r2.lineno, r2.loco_no, header_num desc
--order by r1.t_type_id, r1.loco_no, r2.lineno 

--itf_6a & itf_3g_header
--itf_6a��ͬһ���ͳ��ų���������·
--��2��ͳ��ͬһ��·��ͬ�����ܵ�����
select t1.lineno, t1.t_type_id, count(*) num
from
(
  select r2.lineno lineno, r1.t_type_id t_type_id, r1.loco_no loco_no, r2.num as header_num
  from 
  (select t_type_id, loco_no, count(*) as num
  from itf_6a
  group by t_type_id, loco_no) r1, 
  (select t_type_id, loco_no, lineno, count(*) as num
  from itf_3g_header
  group by t_type_id, loco_no, lineno) r2
  where 1=1
  and r1.t_type_id = r2.t_type_id 
  and r1.loco_no = r2.loco_no
) t1
where 1=1
group by t1.lineno, t1.t_type_id
order by num desc

--itf_6a & itf_3g_header
--ͳ��itf_3g_header�������·���ͳ��ŵ�����ʱ��
select to_char(btsj, 'yyyy-mm-dd') as btsj
from itf_3g_header t1,
(select r2.lineno lineno, r1.t_type_id t_type_id, r1.loco_no loco_no
from 
(select t_type_id, loco_no, count(*) as num
from itf_6a
group by t_type_id, loco_no) r1, 
(select t_type_id, loco_no, lineno, count(*) as num
from itf_3g_header
group by t_type_id, loco_no, lineno) r2
where 1=1
and r1.t_type_id = r2.t_type_id 
and r1.loco_no = r2.loco_no
order by r1.t_type_id, r1.loco_no, r2.lineno ) t2
where 1=1
and t1.lineno = t2.lineno
and t1.t_type_id = t2.t_type_id
and t1.loco_no = t2.loco_no
group by to_char(btsj, 'yyyy-mm-dd')

--itf_6a & itf_3g_header
--��1��itf_6a��ͬһ���ͳ��ų���������· + 3g_header����·��ʱ���ڵ�����6a�д���
select r2.lineno lineno, r1.t_type_id t_type_id, r1.loco_no loco_no, r2.btsj, r1.num, r2.num
from 
(
  select t_type_id, loco_no, to_char(btsj, 'yyyy-mm-dd') as btsj, count(*) as num
  from itf_6a
  group by t_type_id, loco_no, to_char(btsj, 'yyyy-mm-dd')
) r1, 
(
  select t_type_id, loco_no, lineno, to_char(btsj, 'yyyy-mm-dd') as btsj,count(*) as num
  from itf_3g_header
  group by t_type_id, loco_no, lineno, to_char(btsj, 'yyyy-mm-dd')
) r2
where 1=1
and r1.t_type_id = r2.t_type_id 
and r1.loco_no = r2.loco_no
and r1.btsj = r2.btsj
order by r2.lineno, r2.t_type_id, r2.num desc
--order by r1.num desc, r2.num desc
--order by r1.t_type_id, r1.loco_no, r2.lineno, r2.btsj 

--itf_6a & itf_3g_header
--itf_6a��ͬһ���ͳ��ų���������· + 3g_header����·��ʱ���ڵ�����6a�д���
--ѡ���ѯ����еģ�
--t_type_id	loco_no	lineno
--237	      6257	   910
select *
from itf_6a
where 1=1
and t_type_id = 237
and loco_no = 6257
and btsj between (to_date('2016-05-20', 'yyyy-mm-dd')) and (to_date('2016-05-20', 'yyyy-mm-dd')+1-1/24/60/60)
order by btsj asc
--------------------------------------------------------------------
select *
from itf_3g_header
where 1=1
and t_type_id = 237
and loco_no = 6257
and lineno = 910
order by btsj asc

--itf_6a & itf_3g_header & itf_6afault_start
--itf_6a��ͬһ���ͳ��ų���������· + 3g_header����·��ʱ���ڵ�����6a�д��ڣ�ͬʱ��fault���д���
--��result��
--��ѯ����ޣ���Ϊfault����Ķ���4�µ����ݣ���header���������5�µ�
select f2.lineno, f2.loco_no, f2.t_type_id, f2.btsj
from
(
  select t_type_id, loco_no, to_char(btsj, 'yyyy-mm-dd') as btsj
  from itf_6a
  group by t_type_id, loco_no, to_char(btsj, 'yyyy-mm-dd')
) f1, 
(
  select t_type_id, loco_no, lineno, to_char(btsj, 'yyyy-mm-dd') as btsj
  from itf_3g_header
  group by t_type_id, loco_no, lineno, to_char(btsj, 'yyyy-mm-dd')
) f2,
(
  select t_type_id, loco_no, to_char(btsj, 'yyyy-mm-dd') as btsj
  from itf_6afault_start
  group by t_type_id, loco_no, to_char(btsj, 'yyyy-mm-dd')
) f3
where 1=1
and f1.t_type_id = f2.t_type_id 
and f1.loco_no = f2.loco_no
and f1.btsj = f2.btsj
and f3.t_type_id = f2.t_type_id 
and f3.loco_no = f2.loco_no
and f3.btsj = f2.btsj









--
select *
from itf_3g_header
where 1=1
and lineno = 21
and t_type_id = 160
and loco_no = 0004

select *
from itf_6a
where 1=1
and t_type_id = 160
and loco_no = 0004