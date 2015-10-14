/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package amit;

/**
 *
 * @author Amit
 */
public class Sports {
        private String sports_id;
    private String sports_name;
    private String sports_inc;

    /**
     * @return the sports_id
     */
    public String getSports_id() {
        return sports_id;
    }

    /**
     * @param sports_id the sports_id to set
     */
    public void setSports_id(String sports_id) {
        this.sports_id = sports_id;
    }

    /**
     * @return the sports_name
     */
    public String getSports_name() {
        return sports_name;
    }

    /**
     * @param sports_name the sports_name to set
     */
    public void setSports_name(String sports_name) {
        this.sports_name = sports_name;
    }

    /**
     * @return the sports_inc
     */
    public String getSports_inc() {
        return sports_inc;
    }

    /**
     * @param sports_inc the sports_inc to set
     */
    public void setSports_inc(String sports_inc) {
        this.sports_inc = sports_inc;
    }

    public String insertsport(){
        jdbcconnection j=new jdbcconnection();
        check ch=new check();
        String i="'";
        String c=",";
        String message=new String();
        if(!ch.issport(sports_id) && ch.isemployee(sports_inc))
        {
        j.insertData("insert into sports values("+i+sports_id+i+c+i+sports_name+i+c+i+sports_inc+i+")");
        message="New sports entry is successful";
        }
        else if(ch.issport(sports_id))message="Sports Id already Exists";
            else if(!ch.isemployee(sports_inc))message="Employee does not exist";
    return message;
    }

    public void updatesport(){
        jdbcconnection j=new jdbcconnection();
        String i="'";
        String c=",";
        j.insertData("");
    }
}
