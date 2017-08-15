--ITF_TCMSFAULT_START:��ѹ�����¼�¼
select * from ITF_TCMSFAULT_START
where GZDM = 1070
and t_type_id = 237

--ITF_TCMSFAULT_START:237����-��ͬ���ű�ѹ�����¼�¼��Ŀ
select loco_no, count(*) num 
from ITF_TCMSFAULT_START
where GZDM = 1070
and t_type_id = 237
group by loco_no
order by num desc

--ITF_TCMSFAULT_START & ITF_TCMS_HXD_V20: 237����-ͬһ���ŵı�ѹ�����¼�¼
select r1.loco_no, r1.num as fault_num, r2.num tcms_num
from
(select loco_no, count(*) num 
from ITF_TCMSFAULT_START
where GZDM = 1070
and t_type_id = 237
group by loco_no) r1,
(select loco_no, count(*) num from ITF_TCMS_HXD_V20
where t_type_id = 237
group by loco_no) r2
where r1.loco_no = r2.loco_no

--ITF_TCMSFAULT_START:��ѹ�����¼�¼����
select count(*) from ITF_TCMSFAULT_START
where GZDM = 1070
--27,4616

--ITF_TCMSFAULT_START:��ѹ�����·ֳ��ͼ�¼��Ŀ
select t_type_id, count(*) as num 
from ITF_TCMSFAULT_START
where GZDM = 1070
group by t_type_id
order by num desc

--ITF_TCMSFAULT_START ���й��� 1070 �� ITF_TCMS_HXN_V20 ���еĳ���
select *
from
(select t_type_id, count(*) as num 
from ITF_TCMSFAULT_START
where GZDM = 1070
group by t_type_id
order by num desc) r1
where r1.t_type_id in
(select t_type_id from ITF_TCMS_HXD_V20
group by t_type_id)

--ITF_TCMS_HXD_V20:237����-��ѹ�����¼�¼
select * from ITF_TCMS_HXD_V20
where t_type_id = 237
order by BTSJ

--ITF_TCMS_HXD_V20:237����-��ͬ���ű�ѹ�����¼�¼��Ŀ
select loco_no, count(*) num from ITF_TCMS_HXD_V20
where t_type_id = 237
group by loco_no
order by num desc

--itf_tcms_hxd_v20:237��-352�ż�¼
select *
from itf_tcms_hxd_v20
where 1=1
and t_type_id = 237
and loco_no = 352
order by btsj

--itf_tcmsfault_start:237��-447�ż�¼
select *
from itf_tcmsfault_start
where 1=1
and gzdm = 1070
and t_type_id = 237
and loco_no = 352
order by btsj

