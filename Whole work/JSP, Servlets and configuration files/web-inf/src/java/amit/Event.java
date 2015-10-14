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
public class Event {
    private String event_id;
    private String event_name;
    private String organiser;
    private String event_inc;
    private String descrip;

    /**
     * @return the event_id
     */
    public String getEvent_id() {
        return event_id;
    }

    /**
     * @param event_id the event_id to set
     */
    public void setEvent_id(String event_id) {
        this.event_id = event_id;
    }

    /**
     * @return the event_name
     */
    public String getEvent_name() {
        return event_name;
    }

    /**
     * @param event_name the event_name to set
     */
    public void setEvent_name(String event_name) {
        this.event_name = event_name;
    }

    /**
     * @return the organiser
     */
    public String getOrganiser() {
        return organiser;
    }

    /**
     * @param organiser the organiser to set
     */
    public void setOrganiser(String organiser) {
        this.organiser = organiser;
    }

    /**
     * @return the event_inc
     */
    public String getEvent_inc() {
        return event_inc;
    }

    /**
     * @param event_inc the event_inc to set
     */
    public void setEvent_inc(String event_inc) {
        this.event_inc = event_inc;
    }

    
    /**
     * @return the descrip
     */
    public String getDescrip() {
        return descrip;
    }

    /**
     * @param descrip the descrip to set
     */
    public void setDescrip(String descrip) {
        this.descrip = descrip;
    }



    public String insertevent(){
        String message =new String();
        jdbcconnection j=new jdbcconnection();
        check ch=new check();
        String l=new String("','");
        String i=new String("'");
        String c=new String(",");
        if(!ch.isevent(event_id)&& ch.isemployee(event_inc)){
            int n=j.insertData("insert into event values ('" +
                    event_id+l+event_name+l+organiser+l+event_inc+l+descrip+i+")");
            if(n==1)message="New Event is successful";
        }
        else{
            if(ch.isevent(event_id))message="Event already exists";
            else if(!ch.isemployee(event_inc))message=ch.getMessage();
        }
        return message;
    }

    public void getevent(){
        jdbcconnection j=new jdbcconnection();
        ArrayList a=new ArrayList();
        a=j.getData("select * from event where event_id='"+this.event_id+"')");
        this.event_name=a.get(1).toString();
        this.organiser=a.get(2).toString();
        this.event_inc=a.get(3).toString();
        this.descrip=a.get(4).toString();
    }

    
}
