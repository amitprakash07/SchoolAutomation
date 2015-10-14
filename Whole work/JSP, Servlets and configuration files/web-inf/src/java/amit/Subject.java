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
public class Subject {
    private String subj_id;
    private String subj_name;
    private String subj_teacher;
    private String class_id;

    /**
     * @return the subj_id
     */
    public String getSubj_id() {
        return subj_id;
    }

    /**
     * @param subj_id the subj_id to set
     */
    public void setSubj_id(String subj_id) {
        this.subj_id = subj_id;
    }

    /**
     * @return the subj_name
     */
    public String getSubj_name() {
        return subj_name;
    }

    /**
     * @param subj_name the subj_name to set
     */
    public void setSubj_name(String subj_name) {
        this.subj_name = subj_name;
    }

    /**
     * @return the subj_teacher
     */
    public String getSubj_teacher() {
        return subj_teacher;
    }

    /**
     * @param subj_teacher the subj_teacher to set
     */
    public void setSubj_teacher(String subj_teacher) {
        this.subj_teacher = subj_teacher;
    }

    /**
     * @return the class_id
     */
    public String getClass_id() {
        return class_id;
    }

    /**
     * @param class_id the class_id to set
     */
    public void setClass_id(String class_id) {
        this.class_id = class_id;
    }

    public String insertsubject(){
        String message=new String();
        jdbcconnection j=new jdbcconnection();
        check ch= new check();
        String c=new String(",");
        String i=new String("'");
        String l=new String("','");
        ArrayList a=new ArrayList();
        a=j.getData("select subj_id from subject where class_id='"+class_id+"' and subj_name='"+subj_name+"'");
        System.out.println(a);
        if(a.size()==0){
        if(!ch.issubject(subj_id)&& ch.isclass(class_id)&& ch.isemployee(subj_teacher)){
              int n=j.insertData("insert into subject values ('" +
                      subj_id+l+subj_name+l+subj_teacher+l+class_id+i+")");
              if(n==1){message="New Subject entry is successful";}
        }
        else
        {
            if(ch.issubject(subj_id)){message="Subject already Exists";}
            else if(!ch.isemployee(subj_teacher)){message=ch.getMessage();}
            else if(!ch.isclass(class_id)){message=ch.getMessage();}
        }
      }
        else{message="Subject already exists for specified class";}
     
        return message;
    }


    public String updatesubject(){
        String message=new String();
        jdbcconnection j=new jdbcconnection();
        check ch= new check();
        String c=new String(",");
        String i=new String("'");
        String l=new String("','");
        if(ch.isclass(class_id)&& ch.isemployee(subj_teacher)){
            int n=j.insertData("update subject set " +
                    "subj_name='"+subj_name+i+c+"subj_teacher='"+subj_teacher+i
                    +c+"class_id='"+class_id+i +"where subj_id='"+subj_id+i);
            if(n==1){message="Update Successful";}
        }
        else{
            if(!ch.isclass(class_id)){message=ch.getMessage();}
            else if(!ch.isemployee(subj_teacher)){message=ch.getMessage();}
        }
    
        return message;
    }


    public void getsubbject(){
        jdbcconnection j=new jdbcconnection();
        //check ch= new check();
        String i=new String("'");
        ArrayList a=new ArrayList ();
        a=j.getData("select * from subject where subj_id='"+this.subj_id+i);
        this.subj_name=a.get(1).toString();
        this.subj_teacher=a.get(2).toString();
        this.class_id=a.get(3).toString();
    }

    public int countsubject(){
        int n;
        jdbcconnection j=new jdbcconnection();
        ArrayList a=new ArrayList();
        a=j.getData("select subj_id from subject");
        n=a.size();
        return n;
    }

    
}
