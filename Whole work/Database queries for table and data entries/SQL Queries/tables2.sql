 create table library_req
 (book_name varchar2(25) not null,author varchar(25) not null,
 publisher varchar(25) not null,quantity number(2) not null,type varchar(10));

create table salary
(emp_id varchar2(25) references employee(emp_id) not null,
pay_of_month varchar2(25) not null,
bs number(10,2),
total number(10,2),
pay_date date default sysdate);


create table subject
(subj_id varchar(10) primary key,subj_name varchar(25) not null,
subj_teacher varchar(10) references employee(emp_id) not null,
class_id varchar(10) references class(class_id) not null);

create table items
(item_code varchar(10) primary key,item_name varchar(25) not null,
price number(5,2) not null,quantity number(5) not null,
purchase_date date default sysdate not null,
company varchar(25) , dept_id varchar(10) references department(dept_id) not null);

create table maintainance
(sr_no number(5) primary key,req_date date default sysdate not null,
dept_id varchar(10) references department(dept_id) not null,
room_id varchar(10) references room(room_id) not null,
item_code varchar(10) references items(item_code) not null,
value number(5,2) not null,status varchar(10) ,
last_maint_date date not null,descrip varchar(50));

create table event 
(event_id varchar(10) primary key,event_name varchar(25) not null,
organiser varchar(25) ,
event_inc varchar(10) references employee(emp_id) not null,
descrip varchar(25));

create table student_event
(event_id varchar(10) references event(event_id) not null
,s_id varchar(10) references student(s_id) not null,
result varchar(25) ,
parti_date date);

create table enquiry
(enquiry_id varchar(10) primary key,
enquiry_name varchar(25) not null,
enq_about varchar(50) not null,phone number(12) ,
feedback varchar(50), enq_date date not null);

create table item_req
(item_code varchar(10) references items(item_code) not null,
item_name varchar(25) not null,
price number(5,2), quantity number(5) not null,
dept_id varchar(10) references department(dept_id) not null,
total number(5,2) not null,status varchar(25) );


 create table sports 
 (sports_id varchar(10) primary key,
 sports_name varchar(25),
 sports_inc varchar(10) references employee(emp_id));

create table sports_item
(item_code varchar(10) references items(item_code) not null,
item_name varchar(25) , quantity number(5) not null,
price number(5,2) not null);

create table student_sports 
(sports_id varchar(10) references sports(sports_id) not null,
s_id varchar(10) references student(s_id) not null,
position number(3));

create table lab
(lab_id varchar(10) primary key,
lab_attend varchar(10) references employee(emp_id) not null,
lab_inc varchar(10) references employee(emp_id) not null,
lab_type varchar(25) not null,
room_id varchar(10) references room(room_id) not null,
lab_timing varchar2(30) not null,lab_name varchar2(25) not null);

create table lab_item
(lab_id varchar(10) references lab(lab_id) not null,
item_code varchar(10) not null,
item_name varchar(25) not null,
price number(5,2) not null,
quantity number(5) not null,total number(5,2) not null);

 create table stud_attend
 (s_id varchar(10) references student(s_id) not null,
 class_id varchar(10) references class(class_id) not null,
 today_date date default sysdate not null,
 p_a varchar(25) not null);


create table emp_attend
(emp_id varchar(10) references employee(emp_id) not null,
today_date date default sysdate not null,
p_a varchar(25) not null);

create table result
(s_id varchar(10) references student(s_id) not null,
class_id varchar(10) references class(class_id) not null,
english number(3) default -1 not null,
hindi number(3) default -1 not null,
maths number(3) default -1 not null,
mental_maths number(3) default -1 not null,
science number(3) default -1 not null,
social_science number(3) default -1 not null,
sanskrit number(3) default -1 not null,
computer number(3) default -1 not null,
moral_science number(3) default -1 not null,
gk number(3) default -1 not null,
drawing number(3) default -1 not null,
regi_lang number(3) default -1 not null,
phe number(3) default -1 not null,
total number(5) not null,
percentage number(5,2) not null,
result varchar(10) not null,
term number(5));


create table login 
(username varchar2(25) primary key,
password varchar2(25) not null,
user_type varchar2(25) not null);

insert into login values ('administrator','admin','administrator');

insert into login values ('accountant','admin','accountant');
