--��ͬʱ�䡾��-- ��ѯ���¹���
select * from itf_6afault_start
where gzmc like '%��%��%'

--ͳ�����������ϵĳ���
select t_type_id, count(*) as num
from itf_6afault_start
where gzmc like '%��%��%'
group by t_type_id
order by num desc
--ͳ�����������ϵĳ���+����
select t_type_id, loco_no, count(*) as num
from itf_6afault_start
where gzmc like '%��%��%'
group by t_type_id, loco_no
order by t_type_id

--ͳ�����¹�������
select gzdm, gzmc, count(*) num 
from itf_6afault_start
where gzmc like '%��%��%'
group by gzdm, gzmc
order by num desc
--���ݽ������2��5λ�����������
--ɸѡ������2�ᱨ����GZDM
select gzdm, gzmc, count(*) num 
from itf_6afault_start
where gzmc like '%2��%��%'
group by gzdm, gzmc
order by num desc

--��������ϵ�gzdm
  select gzdm
  from (
    select gzdm, gzmc, count(*) num 
    from itf_6afault_start
    where gzmc like '%��%��%'
    group by gzdm, gzmc
    order by num desc
  ) t1
  where rownum = 1

--��ѯ�������¹���
select * 
from itf_6afault_start
where gzdm = 
(
  select gzdm
  from (
    select gzdm, gzmc, count(*) num 
    from itf_6afault_start
    where gzmc like '%��%��%'
    group by gzdm, gzmc
    order by num desc
  ) t1
  where rownum = 1
)

--ͳ��������¹��ϳ���
select t_type_id, loco_no, gzdm,count(*) num 
from itf_6afault_start
where gzdm = 
(
  select gzdm
  from (
    select gzdm, gzmc, count(*) num 
    from itf_6afault_start
    where gzmc like '%��%��%'
    group by gzdm, gzmc
    order by num desc
  ) t1
  where rownum = 1
)
group by t_type_id, loco_no, gzdm
order by num desc

--ͳ���������¹���ʱ��
select t_type_id, loco_no,to_char(gzkssj, 'yyyy-mm-dd') as gzkssj
from itf_6afault_start
where gzdm = 
(
  select gzdm
  from (
    select gzdm, gzmc, count(*) num 
    from itf_6afault_start
    where gzmc like '%��%��%'
    group by gzdm, gzmc
    order by num desc
  ) t1
  where rownum = 1
)
group by t_type_id, loco_no, to_char(gzkssj, 'yyyy-mm-dd')

--��ѯ�������¹��Ͽ�ʼʱ��
select t_type_id, loco_no, gzkssj
from itf_6afault_start
where gzdm = 
(
  select gzdm
  from (
    select gzdm, gzmc, count(*) num 
    from itf_6afault_start
    where gzmc like '%��%��%'
    group by gzdm, gzmc
    order by num desc
  ) t1
  where rownum = 1
)
order by t_type_id asc, loco_no asc, gzkssj asc

--ͳ��������231���Ͳ�ͬ����
select loco_no, count(*) num
from itf_6afault_start
where gzdm = 
(
  select gzdm
  from (
    select gzdm, gzmc, count(*) num 
    from itf_6afault_start
    where gzmc like '%��%��%'
    group by gzdm, gzmc
    order by num desc
  ) t1
  where rownum = 1
)
and t_type_id = 231
group by loco_no
order by num desc
--6057

select loco_no,gzdm, gzmc, gzkssj
from itf_6afault_start
where 1=1
and t_type_id = 162
and loco_no in (70,87)
order by loco_no, gzkssj

select to_char(gzkssj, 'yyyy-mm-dd') gzkssj, count(*) as num
from itf_6afault_start
where 1=1
and t_type_id = 162
and loco_no = 70
group by to_char(gzkssj, 'yyyy-mm-dd')
--2016-04-13	1
--2016-04-08	7

select to_char(gzkssj, 'yyyy-mm-dd') gzkssj, count(*) as num
from itf_6afault_start
where 1=1
and t_type_id = 162
and loco_no = 87
group by to_char(gzkssj, 'yyyy-mm-dd')
--2016-04-25	6


select *
from itf_6a
where 1=1
and t_type_id = 162
and loco_no = 70
and btsj between to_date('2016/04/13', 'yyyy-mm-dd') and to_date('2016/04/13', 'yyyy-mm-dd')+1-1/24/60/60
order by btsj asc

select t_type_id, loco_no,to_char(gzkssj,'yyyy-mm-dd') as gzkssj, count(*) num 
from itf_6afault_start
where gzmc like '%��%��%'
group by t_type_id, loco_no, to_char(gzkssj,'yyyy-mm-dd')
order by num desc

--���������¹�������
select t_type_id, loco_no, gzdm, gzmc, gzkssj
from itf_6afault_start
where gzmc like '%��%��%'
order by t_type_id, loco_no, gzdm, gzmc

--����������ϵ���ϸ��Ϣ
select * 
from itf_6afault_start
where 1=1
and gzdm = (
  select gzdm
  from (
    select gzdm, gzmc, count(*) num 
    from itf_6afault_start
    where gzmc like '%��%��%'
    group by gzdm, gzmc
    order by num desc
  ) t1
  where rownum = 1 )
--231������¼
--ɸѡ����ʱ��
select to_char(gzkssj, 'yyyy-mm-dd') as gzkssj, count(*) as num 
from itf_6afault_start
where 1=1
and gzdm = (
  select gzdm
  from (
    select gzdm, gzmc, count(*) num 
    from itf_6afault_start
    where gzmc like '%��%��%'
    group by gzdm, gzmc
    order by num desc
  ) t1
  where rownum = 1 )
and t_type_id = 231
group by to_char(gzkssj,'yyyy-mm-dd')
order by gzkssj asc

--
select gzkssj, loco_no 
from itf_6afault_start
where 1=1
and gzdm = (
  select gzdm
  from (
    select gzdm, gzmc, count(*) num 
    from itf_6afault_start
    where gzmc like '%��%��%'
    group by gzdm, gzmc
    order by num desc
  ) t1
  where rownum = 1 )
and t_type_id = 231
order by gzkssj asc

--��Debug��----------------------------------------------------
--Out_1_day_data_pro
---------------------------------------------------------------
--231����-û�б����ϵ�ʱ��
--ȡǰ5��û�й��ϵ�ʱ��
select *
from 
(
  --ɸѡû�й��ϵ�ʱ��
  select to_char(btsj, 'yyyy-mm-dd') as btsj
  from itf_6a
  where 1=1
  and t_type_id=231
  and to_char(btsj, 'yyyy-mm-dd') not in
  (
    --�й��ϵ�ʱ��
    select to_char(gzkssj, 'yyyy-mm-dd') as gzkssj
    from itf_6afault_start
    where 1=1
    and gzdm = (
      select gzdm
      from (
        select gzdm, gzmc, count(*) num 
        from itf_6afault_start
        where gzmc like '%��%��%'
        group by gzdm, gzmc
        order by num desc
      ) t1
      where rownum = 1 )
    and t_type_id = 231
    group by to_char(gzkssj,'yyyy-mm-dd')
  )
  group by to_char(btsj, 'yyyy-mm-dd')
  order by btsj desc
)
where 1=1
and rownum<11
----------------------------------------------------------------
--231����-û�б����ϵ�ʱ��
--ȡǰ10��û�й��ϵ�ʱ��
select btsj, loco_no
from 
(
  select to_char(btsj, 'yyyy-mm-dd') as btsj, loco_no
  from itf_6a
  where 1=1
  and t_type_id=231
  group by to_char(btsj, 'yyyy-mm-dd'), loco_no
  order by btsj desc  
)
where 1=1
and rownum<11
----------------------------
and btsj not in
(
    --�й��ϵ�ʱ��
    select to_char(gzkssj, 'yyyy-mm-dd') as gzkssj
    from itf_6afault_start
    where 1=1
    and gzdm = (
      select gzdm
      from (
        select gzdm, gzmc, count(*) num 
        from itf_6afault_start
        where gzmc like '%��%��%'
        group by gzdm, gzmc
        order by num desc
      ) t1
      where rownum = 1 )
    and t_type_id = 231
    group by to_char(gzkssj,'yyyy-mm-dd')
)

--���͡����š�ʱ�����
select *
from 
(
  select t_type_id, loco_no, to_char(btsj, 'yyyy-mm-dd') as btsj, count(*) as num
  from itf_6a
  where 1=1
  group by t_type_id, loco_no, to_char(btsj, 'yyyy-mm-dd')
  order by num desc
)
where 1=1
and rownum < 100

select *
from itf_6a
where 1=1
and 
  

--[itf_6a]--------------------------------------------
select * from
(select to_char(btsj, 'yyyy-mm-dd') as btsj
from itf_6a
where 1=1
and t_type_id = 231
and loco_no = 6057
group by to_char(btsj, 'yyyy-mm-dd')
order by btsj asc)
where btsj not in
(
  select to_char(gzkssj, 'yyyy-mm-dd') as gzkssj
  from itf_6afault_start
  where 1=1
  and gzdm not in (4264229,4264228)
  and t_type_id = 231
  and loco_no = 6057
  group by to_char(gzkssj, 'yyyy-mm-dd')
)
--where rownum <5

declare 
m_query varchar(1000);
m_dir varchar(100);
m_filename varchar(50);

m_cursor INTEGER DEFAULT DBMS_SQL.OPEN_CURSOR;
m_status integer;
m_gzkssj varchar(100);
m_t_type_id varchar(100);
m_loco_no varchar(100);
m_columnum integer := 0;
m_desctab dbms_sql.desc_tab;
begin
  m_query := 'select t_type_id, loco_no,to_char(gzkssj, ''yyyy-mm-dd'') as gzkssj
from itf_6afault_start
where gzdm = 
(
  select gzdm
  from (
    select gzdm, gzmc, count(*) num 
    from itf_6afault_start
    where gzmc like ''%��%��%''
    group by gzdm, gzmc
    order by num desc
  ) t1
  where rownum = 1
)
group by t_type_id, loco_no, to_char(gzkssj, ''yyyy-mm-dd'')';  
  
  dbms_sql.parse(m_cursor, m_query, dbms_sql.native);
  dbms_sql.describe_columns(m_cursor, m_columnum, m_desctab);
  dbms_sql.define_column(m_cursor, 1, m_t_type_id, 100); 
  dbms_sql.define_column(m_cursor, 2, m_loco_no, 100); 
  dbms_sql.define_column(m_cursor, 3, m_gzkssj, 100);    
  
  --get gzdm related
  t_cursor INTEGER DEFAULT DBMS_SQL.OPEN_CURSOR;
  t_columnum integer :=0;
  t_gzdm varchar(100);
  t_desctab dbms_sql.desc_tab;
  
  m_query := '';
  while(dbms_sql.fetch_rows(m_cursor) > 0) loop
    dbms_sql.column_value(m_cursor, 1, m_t_type_id);
    dbms_sql.column_value(m_cursor, 2, m_loco_no);
    dbms_sql.column_value(m_cursor, 3, m_gzkssj);
    
    m_filename = m_type_id || '_' || loco_no || '_' ;    
  end loop;
  
end;

--[itf_6a & itf_6afault_start]------------------------


select * 
from itf_6a
where 1=1
and t_type_id = 162
and loco_no = 70
order by btsj desc

--[1]
--��6a�У������´���ĳ��Ͳߡ����š�ʱ��
select t_type_id, loco_no, to_char(btsj, 'yyyy-mm-dd') as btsj, count(*) as num
from itf_6a
where 1=1
and btsj in 
(
  select btsj 
  from
  (
    select t_type_id, loco_no,to_char(gzkssj,'yyyy-mm-dd') as gzkssj
    from itf_6afault_start
    where gzmc like '%��%��%'
    group by t_type_id, loco_no, to_char(gzkssj,'yyyy-mm-dd')
  )
)
group by t_type_id, loco_no, to_char(btsj, 'yyyy-mm-dd')
order by num desc

----------------------------------
--[1]
--��ͬ���͡����ţ������´����ʱ���
select t_type_id, loco_no,gzkssj
from itf_6afault_start
where gzmc like '%��%��%'
order by gzkssj 
--[1.1]
--�鿴231-6075���Ĺ������¹���   
select *
from itf_6afault_start
where 1=1
and t_type_id=231
and loco_no=6075
and gzmc like '%��%��%'
--[1.2]
--���162��-0070�Ź�������
select *
from itf_6afault_start
where 1=1
and t_type_id=162
and loco_no=0070
and gzmc like '%��%��%'
----------------------------------
--[2]
--��ͬ���͡����ţ������´����ʱ���+��������
select t_type_id, loco_no, gzkssj,gzmc
from itf_6afault_start
where gzmc like '%��%��%'
order by t_type_id, loco_no, gzkssj


    
    
    