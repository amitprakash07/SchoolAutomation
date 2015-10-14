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
public class Lab {
    private String lab_id;
    private String lab_name;
    private String lab_inc;
    private String lab_attend;
    private String lab_type;
    private String room_id;
    private String lab_timing;

    /**
     * @return the lab_id
     */
    public String getLab_id() {
        return lab_id;
    }

    /**
     * @param lab_id the lab_id to set
     */
    public void setLab_id(String lab_id) {
        this.lab_id = lab_id;
    }

    /**
     * @return the lab_name
     */
    public String getLab_name() {
        return lab_name;
    }

    /**
     * @param lab_name the lab_name to set
     */
    public void setLab_name(String lab_name) {
        this.lab_name = lab_name;
    }

    /**
     * @return the lab_inc
     */
    public String getLab_inc() {
        return lab_inc;
    }

    /**
     * @param lab_inc the lab_inc to set
     */
    public void setLab_inc(String lab_inc) {
        this.lab_inc = lab_inc;
    }

    /**
     * @return the lab_attend
     */
    public String getLab_attend() {
        return lab_attend;
    }

    /**
     * @param lab_attend the lab_attend to set
     */
    public void setLab_attend(String lab_attend) {
        this.lab_attend = lab_attend;
    }

    /**
     * @return the lab_type
     */
    public String getLab_type() {
        return lab_type;
    }

    /**
     * @param lab_type the lab_type to set
     */
    public void setLab_type(String lab_type) {
        this.lab_type = lab_type;
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
     * @return the lab_timing
     */
    public String getLab_timing() {
        return lab_timing;
    }

    /**
     * @param lab_timing the lab_timing to set
     */
    public void setLab_timing(String lab_timing) {
        this.lab_timing = lab_timing;
    }

    public String insertlab(){
        String message=new String();
        String l=new String("','");
        String c=new String(",");
        String i=new String("'");
        jdbcconnection j=new jdbcconnection();
        check ch=new check();
        if(!ch.islab(lab_id)&& ch.isemployee(lab_inc)&& ch.isemployee(lab_attend)&& ch.isroom(room_id)){
         Room r=new Room();
                r.setRoom_id(room_id);
                r.getroom();
                r.setAvailable("used");
                r.updateroom();
         int n=j.insertData("insert into lab values('" +
                    lab_id+l+lab_attend+l+lab_inc+l+lab_type+l+room_id+l+lab_timing+l+lab_name+i+")");
            if(n==1){message="New Lab Entry is successful";}
        }
        else
        {
            if(ch.islab(lab_id))message="Lab already exists";
            else if(!ch.isemployee(lab_inc))message="Lab Incharge does not exist";
            else if(!ch.isemployee(lab_attend))message="Lab Attendant does not exist";
            else if(!ch.isroom(room_id))message=ch.getMessage();
        }
        return message;
    }


}
