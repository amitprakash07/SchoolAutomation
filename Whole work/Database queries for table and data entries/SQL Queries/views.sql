create view activities as select s.first_name||s.middle_name||s.last_name name,c.class_name,e.event_name,se.result,sp.sports_name,ss.position from student s,class c,student_sports ss,student_event se,sports sp,event e 
where s.class_id=c.class_id and s.s_id=se.s_id and s.s_id=ss.s_id and ss.sports_id=sp.sports_id and e.event_id=se.event_id;


create view admin_requirement as select d.dept_name,a.money_req,a.date_of_req,a.sanction,a.sanction_date,a.last_sanc_date
from department d,admin_req a
where d.dept_id=a.dept_Id;

create or replace view class_view as select c.class_name,c.sec,
(select first_name||' '||middle_name||' '||last_name from employee where emp_id=c.class_teacher) as "Class Teacher",
(select count(*) from student where class_id=c.class_id) as "Total Student",c.intake,
(select floor from room where room_id=c.room_id) as "Floor",
(select tution_fees from fees where fees_id=c.fees_id) as "Fees"
from class c;

create or replace view dept_view as select d.dept_name,(select first_name||' '||middle_name||' '||last_name
from employee where emp_id=d.department_incharge) as "Department Incharge",
d.room_id,(select floor from room where room_id=d.room_id) as "Floor" from department d;

create or replace view department_items as select
d.dept_name,i.item_name,i.price,i.quantity
from department d,items i
where i.dept_id=d.dept_id;

create or replace view emp_lib_retrieval as select 
s.emp_id,s.first_name||' '||s.middle_name||' '||s.last_name name, b.book_name,
to_char(r.issue_date,'dd-mon-yyyy') issue_date,
to_char(r.return_date,'dd-mon-yyyy') return_date,r.fine,r.book_status,r.fine_status
from employee s,library_book b,library_retrieval r
where s.emp_id=r.s_id and r.book_id=b.book_id;

create or replace view event_view as select e.event_name,e.descrip,
(select first_name||' '||middle_name||' '||last_name from employee where emp_id=e.event_inc) as "event Incharge",
e.organiser from event e;

create or replace view item_requirement as select 
i.item_name,d.dept_name,i.price,i.quantity,i.total amount,i.status
from department d,item_req i
where d.dept_id=i.dept_id;

create or replace view job_view as select job_name,basic_sal,
(select dept_name from department where dept_id=job.dept_id) as dept_name
from job;

create or replace view lab_item_view as select 
l.lab_name,li.item_name,li.quantity
from lab l,lab_item li
where l.lab_id=li.lab_id;


create or replace view lab_req as select
l.lab_name,l.lab_type,i.item_name,i.price,i.quantity,i.total
from lab l, item_req i
where l.lab_id=i.dept_id;

create or replace view laboratory as select l.lab_name,l.lab_type,
e.first_name||' '||e.middle_name||' '||e.last_name as "lab incharge"
,r.floor as "Floor"
from lab l,employee e,room r
where l.lab_inc=e.emp_id and l.room_id=r.room_id ;

create view library as select
l.book_name,l.author,l.type,l.publisher,l.price,
(select count(*) from library_book where book_name=l.book_name) as "quantity"
from library_book l;

create or replace view sports_view as select 
s.sports_name,e.first_name||' '||e.middle_name||' '||e.last_name||'('||e.emp_id||')' as "Sports Incharge"
from sports s,employee e
where s.sports_inc=e.emp_id;

create or replace view stud_lib_retrieval as select 
s.s_id,s.first_name||' '||s.middle_name||' '||s.last_name name, b.book_name,
to_char(r.issue_date,'dd-mon-yyyy') issue_date,
to_char(r.return_date,'dd-mon-yyyy') return_date,
r.fine,r.book_status,r.fine_status
from student s,library_book b,library_retrieval r
where s.s_id=r.s_id and r.book_id=b.book_id;

create view fee as select  s.first_name||s.middle_name||s.last_name name,c.class_name,t.tution_fees from
student s,class c,fees t
where s.class_id=c.class_id and c.fees_id=t.fees_id;

create or replace view subjects as select s.subj_name,c.class_name,c.sec,e.first_name||' '||e.middle_name||' '||e.last_name||'('||e.emp_id||')' teacher
from subject s,employee e,class c
where s.subj_teacher=e.emp_id and s.class_id=c.class_id;

create or replace view item_view as select
i.item_name,d.dept_name,i.price,i.quantity,i.purchase_date
from items i,department d 
where i.dept_id=d.dept_id;
