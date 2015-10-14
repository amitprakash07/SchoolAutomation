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
public class Room {
    private String room_id;
    private String floor;
    private String description;
    private String available=new String("unused");

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
     * @return the floor
     */
    public String getFloor() {
        return floor;
    }

    /**
     * @param floor the floor to set
     */
    public void setFloor(String floor) {
        this.floor = floor;
    }

    /**
     * @return the description
     */
    public String getDescription() {
        return description;
    }

    /**
     * @param description the description to set
     */
    public void setDescription(String description) {
        this.description = description;
    }

    public void getroom(){
        jdbcconnection j=new jdbcconnection();
        ArrayList a=new ArrayList();
        a=j.getData("select * from room where room_id='"+room_id+"'");
        this.floor=a.get(1).toString();
        this.description=a.get(2).toString();
    }

     /**
     * @return the available
     */
    public String getAvailable() {
        return available;
    }

    /**
     * @param available the available to set
     */
    public void setAvailable(String available) {
        this.available = available;
    }

    public void updateroom(){
        jdbcconnection j=new jdbcconnection();
        String c=new String(",");
        String i=new String("'");
        j.insertData("update room set available='"+available+i+c
                +"floor='"+floor+i+c+"description='"+description+i+"where room_id='"+room_id+i);
    }
    
}
