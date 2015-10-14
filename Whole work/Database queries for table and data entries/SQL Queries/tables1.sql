create table room (room_id  varchar(10) primary key ,floor varchar (10) not null,description varchar(50) ,available varchar2(25) default 'unused');

create table department(dept_id varchar(10) primary key ,dept_name varchar(30) not null ,room_id varchar(10) references room (room_id) ,department_incharge varchar(10) ,depart_expense  number(10,2) not null);

create table job (job_id varchar(10) primary key,job_name varchar(20),basic_sal number(10,2) not null, pf number(10,2) not null, da number(10,2) not null,hra number(10,2) not null, income_tax number(10,2) , dept_id varchar(10) not null references department(dept_id));

create table employee (emp_id varchar(10) primary key,first_name varchar(25) not null,middle_name varchar(25), last_name varchar(25) not null,job_id varchar(10) not null references job(job_id),type varchar(25),hire_date date default sysdate, address varchar(100),phone number(12),qualification varchar2(25));

create table fees( fees_id varchar(10) primary key,tution_fees number(8,2) not null);

create table class(class_id varchar(10) primary key,class_name varchar(10) not null, class_teacher varchar(10) not null references employee(emp_id), room_id varchar(10) not null references room(room_id),fees_id varchar(10) not null references fees(fees_id), sec varchar2(10) not null, intake number(3) not null);

create table student(s_id varchar(10) primary key , first_name varchar(25) not null, class_id varchar(10) not null  references class(class_id), middle_name varchar(25), last_name varchar(25) not null,dob date not null,doa date default sysdate not null,coa varchar2(20),sex varchar(5) not null,father_name varchar(25) not null,mother_name varchar(25) , father_occu varchar(25) ,mother_occu varchar(25), address varchar(100), annual_income number(10,2) not null,brothers number(2),sisters number(2),phone number(12) , econt_no number(12) not null,dues number(5,2),fine number(5,2));

create table fees_collection (s_id varchar2(25) not null references student(s_id),fee_of_month varchar2(25) not null,date_of_payment date default sysdate,library_fine number(10,2),total_fee_paid number(10,2));

create table photo(s_id varchar(10) not null references student(s_id),emp_id varchar(10) not null references employee(emp_id),photo blob not null);

create table admin_req(sr_no number(3) unique ,dept_id varchar(10) not null references department(dept_id),money_req number(5,2),date_of_req date default sysdate,sanction number(5,2),sanction_date date ,last_sanction number(5,2),remain number(5,2),last_sanc_date date);

create table library_book(book_id varchar(10) primary key,book_name varchar(100) not null,type varchar(25),price number(5,2) not null,publisher varchar(25),author varchar(50) not null,section varchar2(25) not null,shelf_no varchar2(10) not null,status varchar2(20) default 'On Shelf' not null);

create table library_retrieval(s_id varchar(10) not null,book_id varchar(10) not null references library_book(book_id),issue_date date default sysdate not null,return_date date,due_date date,book_status varchar2(25) default 'not_returned',fine number(5,2),fine_status varchar2(25));

