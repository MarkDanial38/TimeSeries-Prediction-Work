/*����Ŀ¼*/
create or replace directory MYDIR as'o:\output\';
/*�鿴Ŀ¼*/
desc dba_directories
select * from dba_directories;
/**/
 
 /*test query*/
 select * from itf_6a where rownum <= 10
 select * from itf_6a where t_type_id = 231 and loco_no = 6107 and rownum <= 10
 
/* (1)�û�UserName��Ȩ*/
grant execute on Proc to UserName;

/*��̬����*/

