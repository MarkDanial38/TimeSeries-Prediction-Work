select * from ITF_TCMS_HXD_V20 

select count(*) from ITF_TCMS_HXD_V20 
--4996,1855

/*
231	30498350
240	15869684
232	2696321
239	368
237	897132
*/
/*��ͬ�������ݼ�¼��Ŀ*/
select t_type_id,count(*) from ITF_TCMS_HXD_V20
group by t_type_id

/*240-��������*/
select count(*) from ITF_TCMS_HXD_V20 where t_type_id = 240
/*240-ĳ����ȫ������*/
select * from ITF_TCMS_HXD_V20 where t_type_id = 240

/*231-�����ȫ������*/
select * from ITF_TCMS_HXD_V20 
where t_type_id = 231
order by loco_no, btsj asc

/*231��1124��-�����ȫ������*/
select * from ITF_TCMS_HXD_V20 
where loco_no = 1124
order by loco_no, btsj asc

/*231��-��ͬ��������ͳ�ƣ�*/
select loco_no, count(*) from ITF_6A 
where t_type_id = 231
group by loco_no


/*240-��ͬ�������ݼ�¼��Ŀ*/
select loco_no, count(*) from ITF_TCMS_HXD_V20
where t_type_id = 240
group by loco_no
order by loco_no

/*231��-�������ݣ�*/
select * from ITF_TCMS_HXD_V20 
where t_type_id = 231
and loco_no in (1124,1247,1256,1121,1150,1305,1333,1309,1436,1265,19,177,53,34,248,177)
order by loco_no

select t_type_id, count(*) from ITF_TCMS_HXD_V20 
where loco_no in (1124,1247,1256,1121,1150,1305,1333,1309,1436,1265,19,177,53,34,248,177)
group by t_type_id


/*
select count(*) from ITF_TCMS_V10 where t_type_id = 242
group by loco_no
*/

/*select * from ITF_6A where t_type_id = 242

select * from ITF_6AFAULT_START where t_type_id = 242

select * from ITF_TCMS_V10 where t_type_id = 242

select * from ITF_TCMSFAULT_START where t_type_id = 242*/

--413���������ݣ�����4��23�ŵ��м�¼��4��3��û��
select * from ITF_TCMS_HXD_V20
where 1=1
and t_type_id = 240 
and loco_no = 413
and btsj 
between (select max(gzkssj)-2/24 from ITF_TCMSFAULT_START where t_type_id = 240 and loco_no = 413 and gzdm in (1423,1424))
and (select max(gzkssj)+2/24 from ITF_TCMSFAULT_START where t_type_id = 240 and loco_no = 413 and gzdm in (1423,1424))
order by btsj asc

--445��1����������
select * from ITF_TCMS_HXD_V20
where 1=1
and t_type_id = 240 
and loco_no = 445
and btsj 
between (select max(gzkssj)-2/24 from ITF_TCMSFAULT_START where t_type_id = 240 and loco_no = 445 and gzdm in (1423,1424))
and (select max(gzkssj)+2/24 from ITF_TCMSFAULT_START where t_type_id = 240 and loco_no = 445 and gzdm in (1423,1424))
order by btsj asc


select t.* from ITF_TCMS_HXD_V20 t
where 1=1
and t_type_id = 240 
and loco_no = 413
order by btsj asc

select '2016-04-11 13:50:10' as gzkssj, t.* from itf_tcms_hxd_v20 t  
where 1=1  
and t_type_id = 240   
and loco_no = 142 
and btsj between (to_date('2016-04-11 13:50:10','yyyy-mm-dd hh24:mi:ss')-2/24)and (to_date('2016-04-11 13:50:10','yyyy-mm-dd hh24:mi:ss')+2/24) order by btsj asc

select '2016-04-11 13:50:10' as gzkssj, t.* 
from itf_tcms_hxd_v20 t  
where 1=1  
and t_type_id = 240   
and loco_no = 142 
and btsj
between (to_date('2016-04-11 13:50:10','yyyy-mm-dd hh24:mi:ss')-2/24)and (to_date('2016-04-11 13:50:10','yyyy-mm-dd hh24:mi:ss')+2/24) order by btsj asc

--û�з������ϵ�ʱ��
select r1.btsj, r1.num
from
(
select to_char(btsj,'yyyy-mm-dd') as btsj, count(to_char(btsj,'yyyy-mm-dd')) as num from ITF_TCMS_HXD_V20 t
where 1=1
and t_type_id = 240 
and loco_no = 142 
group by to_char(btsj,'yyyy-mm-dd')
order by btsj desc
) r1
where r1.btsj not in
(
select to_char(gzkssj, 'yyyy-mm-dd') as gzkssj from ITF_TCMSFAULT_START 
where 1=1
and t_type_id = 240
and loco_no = 142
and gzdm = 1423
group by to_char(gzkssj, 'yyyy-mm-dd')
)

--�������һ�������
select BTSJ, YX_YBDY, YX_YBDL
from ITF_TCMS_HXD_V20
where 1=1
and t_type_id = 240
and loco_no = 142
and btsj between '2016-04-09' and '2016-04-10' 
order by btsj asc

select btsj, yx_ybdy, yx_ybdl from itf_tcms_hxd_v20
where 1=1 
and t_type_id = 240     
and loco_no = 445 
and btsj between to_date('2016-04-17', 'yyyy-mm-dd')+1/24/60/60 and to_date('2016-04-17', 'yyyy-mm-dd')+1-1/24/60/60 order by btsj asc



