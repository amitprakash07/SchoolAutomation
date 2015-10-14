/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package amit;

import java.util.ArrayList;

/**
 *
 * @author Amit
 */
public class check {
    jdbcconnection j=new jdbcconnection();
    ArrayList a=new ArrayList();
    private String message=new String("");

    public boolean isroom(String room_id)
    {
        a=j.getData("select room_id from room where room_id='"+room_id+"'");
        if(a.size()==0){message ="Room does not exist"; return false;}
        else {return true;}
    }

    public boolean isdepartment(String dept_id){
        a=j.getData("select dept_id from department where dept_id='"+dept_id+"'");
        if(a.size()==0){message="Department does not exist"; return false;}
        else {return true;}
    }

    public boolean isjob(String job_id){
        a=j.getData("select job_id from job where job_id ='"+job_id+"'");
        if(a.size()==0){message="Job does not exist";return false;}
        else{return true;}
    }

    public boolean isemployee(String emp_id){
        a=j.getData("select emp_id from employee where emp_id='"+emp_id+"'");
        if(a.size()==0){message="Employee_id does not exist";return false;}
        else{return true;}
    }

    public boolean isstudent(String s_id){
        a=j.getData("select s_id from student where s_id='"+s_id+"'");
        if(a.size()==0){message="Student_id does not exist";return false;}
        else{return true;}
    }

    public boolean isfees(String fees_id){
        a=j.getData("select fees_id from fees where fees_id='"+fees_id+"'");
        if(a.size()==0){message="Fees_id does not exist";return false;}
        else{return true;}
    }

    public boolean isclass(String class_id){
        a=j.getData("select class_id from class where class_id='"+class_id+"'");
        if(a.size()==0){message="Class_id does not exist";return false;}
        else{return true;}
    }

    public boolean isbook(String book_id){
        a=j.getData("select book_id from library_book where book_id ='"+book_id+"'");
        if(a.size()==0){message="Book_id does not exist";return false;}
        else{return true;}
    }

    public boolean issubject(String subj_id){
        a=j.getData("select subj_id from subject where subj_id='"+subj_id+"'");
        if(a.size()==0){message="Subject_id does not exist";return false;}
        else{return true;}
    }

    public boolean isitem(String item_code){
        a=j.getData("select item_code from items where item_code='"+item_code+"'");
        if(a.size()==0){message="Item_id does not exist";return false;}
        else{return true;}
    }

    public boolean islabitem(String item_code){
        a=j.getData("select item_code from lab_item where item_code='"+item_code+"'");
        if(a.size()==0){message="Lab Item_code does not exist";return false;}
        else return true;
    }

    public boolean isevent(String event_id){
        a=j.getData("select event_id from event where event_id='"+event_id+"'");
        if(a.size()==0){message="Event_id does not exist";return false;}
        else{return true;}
    }

    public boolean issport(String sports_id){
        a=j.getData("select sports_id from sports where sports_id='"+sports_id+"'");
        if(a.size()==0){message="Sports_id does not exist";return false;}
        else{return true;}
    }

    public boolean islab(String lab_id){
        a=j.getData("select lab_id from lab where lab_id='"+lab_id+"'");
        if(a.size()==0){message="Lab_id does not exist";return false;}
        else{return true;}
    }

    public boolean isuser(LoginTO l){
        a=j.getData("select * from login where username='"+l.getUsername()+"'");
        if(a.size()==0){message="user does not exist";return false;}
        else
        {
            if(!a.get(1).toString().equals(l.getPassword())){message="password is incorrect";return false;}
            else if(!a.get(2).toString().equals(l.getUser_type())){message="U have insufficient previlege to login as "+l.getUser_type();return false;}
            else return true;
        }
    }

    public boolean isclasssec(ClassTO c){
        a=j.getData("select class_id from class where class_name='"+c.getClass_name()+"' and sec='"+c.getSec()+"'");
        if(a.size()>0)return true;
        else {message="class doesnot exists";return false;}
    }

    public boolean isteacher(String emp_id){
        a=j.getData("select emp_id from employee where emp_id='"+emp_id+"'and type='teaching'");
        if(a.size()>0)return true;
        else {message="Teacher does not exist";return false;}
    }

    public boolean isclassteacher(String class_teacher){
        a=j.getData("select class_teacher from class where class_teacher='"+class_teacher+"'");
        if(a.size()>0)return true;
        else {message="class_teacher does not exist";return false;}
    }

    public boolean islabincharge(String lab_incharge){
        a=j.getData("select lab_id from lab where lab_inc='"+lab_incharge+"'");
        if(a.size()>0)return true;
        else {message="lab incharge does not exist";return false;}
    }

    public boolean islabattendant(String lab_attend){
        a=j.getData("select lab_id from lab where lab_attend='"+lab_attend+"'");
        if(a.size()>0)return true;
        else {message="Lab attendant does not exist";return false;}
    }

    /**
     * @return the message
     */
    public boolean issrno(String srno){
        a=j.getData("select sr_no from admin_req where sr_no='"+srno+"'");
        if(a.size()>0){return true;}
        else {message="Requirement does not exist";     return false;}
    }

    public boolean isstudentattend(String s_id){
        a=j.getData("select s_id from stud_attend where today_date like sysdate and s_id='"+s_id+"'");
        if(a.size()>0)return true;
        else return false;
    }

    public boolean isemployattend(String emp_id){
        a=j.getData("select emp_id from emp_attend where today_date like sysdate and emp_id='"+emp_id+"'");
        if(a.size()>0) return true;
        else return false;
    }

    public boolean isstudentfeepaid(String s_id,String month){
                a=j.getData("select s_id from fees_collection where s_id='"+s_id+"' and fee_of_month like '%"+month+"%'");
                if(a.size()>0)return true;
                else return false;
    }

    public boolean isemployeesalarypaid(String emp_id,String month){
        a=j.getData("select emp_id from salary where emp_id='"+emp_id+"' and pay_of_month like '%"+month+"%'");
        if(a.size()>0) return true;
        else return false;
    }

    public boolean isstudentresultentered(String s_id,int term){
        a=j.getData("select s_id from result where s_id='"+s_id+"' and term="+term);
        if(a.size()>0)return true;
        else return false;
    }


    public String getMessage() {
        return message;
    }


}
