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

public class ClassTO {
    private String class_id;
    private String class_name;
    private String class_teacher;
    private String room_id;
    private String fees_id;
    private String sec;
    private int intake;

    public String ClassInsert(){
        jdbcconnection j=new jdbcconnection();
        String l=new String("','");
        String i=new String("'");
        String c=new String(",");
        String message=new String();
        check ch=new check();
        if(!ch.isclass(class_id)&& ch.isemployee(class_teacher)&& ch.isroom(room_id) && ch.isfees(fees_id))
        {
            System.out.println("amit");
            if(!ch.isclasssec(this)){
        j.insertData("insert into class values('"+class_id+l+
             class_name+l+class_teacher+l+room_id+l+fees_id+l+sec+i+c+intake+")");
        Room r=new Room();
                r.setRoom_id(room_id);
                r.getroom();
                r.setAvailable("used");
                r.updateroom();
             j.insertData("update login set user_type='class Teacher' where username='"+class_teacher+"'" );
        message=new String("New Class Entry is successful");}
            else message="Class already exists";
        //System.out.println(message);
        }
        else
        {
            if(ch.isclass(class_id)){message="class_id already present";}
            else if(!ch.isemployee(class_teacher)){message=ch.getMessage();}
            else if(!ch.isfees(fees_id)){message=ch.getMessage();}
            else if(!ch.isroom(room_id)){message=ch.getMessage();}
            System.out.println(message);
        }
        return message;
    }



    /**
     * @return the class_id
     */

    public void setclass(){
        jdbcconnection j=new jdbcconnection();
        ArrayList a=new ArrayList();
        a=j.getData("select * from class where class_name='"+class_name+"' and sec='"+sec+"'");
        this.class_id=a.get(0).toString();
        this.class_name=a.get(1).toString();
        this.class_teacher=a.get(2).toString();
        //System.out.println(class_id);
        this.room_id=a.get(3).toString();
        this.fees_id=a.get(4).toString();
        this.sec=a.get(5).toString();
        this.intake=Integer.parseInt(a.get(6).toString());
    }

    public String getClass_id() {
        return class_id;
    }

    /**
     * @param class_id the class_id to set
     */
    public void setClass_id(String class_id) {
        this.class_id = class_id;
    }

    /**
     * @return the class_name
     */
    public String getClass_name() {
        return class_name;
    }

    /**
     * @param class_name the class_name to set
     */
    public void setClass_name(String class_name) {
        this.class_name = class_name;
    }

    /**
     * @return the class_teacher
     */
    public String getClass_teacher() {
        return class_teacher;
    }

    /**
     * @param class_teacher the class_teacher to set
     */
    public void setClass_teacher(String class_teacher) {
        this.class_teacher = class_teacher;
    }

    /**
     * @return the room_id
     */
    public String getRoom_id() {
        return room_id;
    }

    /**
     * @param room_id the room_id to set
     */
    public void setRoom_id(String room_id) {
        this.room_id = room_id;
    }

    /**
     * @return the fees_id
     */
    public String getFees_id() {
        return fees_id;
    }

    /**
     * @param fees_id the fees_id to set
     */
    public void setFees_id(String fees_id) {
        this.fees_id = fees_id;
    }


    /**
     * @return the sec
     */
    public String getSec() {
        return sec;
    }

    /**
     * @param sec the sec to set
     */
    public void setSec(String sec) {
        this.sec = sec;
    }

    /**
     * @return the intake
     */
    public int getIntake() {
        return intake;
    }

    /**
     * @param intake the intake to set
     */
    public void setIntake(int intake) {
        this.intake = intake;
    }

    
}

