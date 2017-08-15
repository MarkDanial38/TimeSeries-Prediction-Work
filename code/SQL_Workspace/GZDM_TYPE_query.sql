
--��������
CREATE SEQUENCE SEQ_TEST
minvalue 1
maxvalue 99999999
start with 1
increment by 1
nocache order;

--����triger
CREATE OR REPLACE TRIGGER AUTOINCREMENT
BEFORE INSERT ON GZDM_TYPE
FOR EACH ROW
WHEN (NEW.ID IS NULL)
BEGIN
SELECT SEQ_TEST.NEXTVAL INTO :NEW.ID FROM DUAL;
END;

--��ȡtxt
declare
  filehandle utl_file.file_type;
  filebuffer varchar(200);
  filename varchar(200);
  P_DIR varchar(200);
begin
    filename := 'GZDM_B.txt';
    P_DIR := 'MYDIR';
    filehandle := utl_file.fopen(P_DIR, filename, 'r');
    loop
      begin
        utl_file.get_line(filehandle, filebuffer);
        insert into GZDM_TYPE(GZDM) values(filebuffer); 
        exception when no_data_found then exit;
      end;
    end loop;   
    utl_file.fclose(filehandle);
    commit;
end;

--ɾ������
delete from GZDM_TYPE t1
where id != (select id from GZDM_TYPE t2 where t1.gzdm = t2.gzdm)

--ɾ��ȫ��
delete from GZDM_TYPE

--�鿴����
select count(*) from GZDM_TYPE
group by gzdm

--�鿴���ϳ�����
select t1.t_type_id, t1.loco_no, t1.gzdm, t2.gzmc, t2.gzms 
from itf_tcmsfault_start t1, gzdm_type t2
where t1.gzdm = t2.gzdm

--ͳ�ƹ��ϳ�����
select count(*) 
from itf_tcmsfault_start t1, gzdm_type t2
where t1.gzdm = t2.gzdm

--ͳ�ƹ��ϳ�����
select r1.gzdm, r1.gzmc, r1.gzms, r2.num from gzdm_type r1,
(
select t1.gzdm, count(*) num
from itf_tcmsfault_start t1, gzdm_type t2
where t1.gzdm = t2.gzdm
group by t1.gzdm
order by num desc
) r2
where r1.gzdm = r2.gzdm

--ͳ�Ʋ�ͬ���͡����ŵĹ��ϴ���
select r2.num, r2.t_type_id, r2.loco_no, r1.gzdm, r1.gzmc, r1.gzms from gzdm_type r1,
(
select t1.gzdm, t1.t_type_id, t1.loco_no, count(*) num
from itf_tcmsfault_start t1, gzdm_type t2
where t1.gzdm = t2.gzdm
group by t1.gzdm, t1.t_type_id, t1.loco_no
) r2
where r1.gzdm = r2.gzdm
order by r2.num desc, r2.t_type_id desc

--ͳ�Ʋ�ͬ���͡����ŵĹ��ϴ�������
select count(*) from
(
select t1.gzdm, t1.t_type_id, t1.loco_no, count(*) num
from itf_tcmsfault_start t1, gzdm_type t2
where t1.gzdm = t2.gzdm
group by t1.gzdm, t1.t_type_id, t1.loco_no
)

select * 
from itf_tcms_hxd_v20
where 


select t_type_id, loco_no
from itf_tcms_hxd_v20
group by t_type_id, loco_no





