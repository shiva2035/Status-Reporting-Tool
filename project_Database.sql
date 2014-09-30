create table users (emp_id varchar(30) primary key,name varchar(25), phone varchar(15), email varchar(25), position varchar(10), address varchar(100));
describe user_login;
create table assign_mgr (emp_id varchar(30), sup_id varchar(30), dept varchar(20));
create table emp_status (emp_id varchar(30), dt date, status varchar(1000),mgr_id varchar(30));
create table emp_remarks(emp_id varchar(30), dt date, remark varchar(500),mgr_id varchar(30));
create table todo (emp_id varchar(30), task_title varchar(50),task varchar(500), dead_dt date, dead_time varchar(10), status varchar(10));
create table box(to1 varchar(30), message varchar(500), dt date, from1 varchar(30));
/**

*
*
*/
select * from assign_mgr;
select * from todo;
select * from user_login;
update user_login set pwd='Welcome123$' where emp_id='tiru@opentext.com';
select distinct sup_id from assign_mgr where emp_id='tiru@opentext.com';