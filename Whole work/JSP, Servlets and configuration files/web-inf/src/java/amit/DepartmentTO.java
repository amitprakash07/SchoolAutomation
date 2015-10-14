/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package amit;

/**
 *
 * @author Amit
 */
public class DepartmentTO {
    private String dept_id;
    private String dept_name;
    private float depart_expense;
    private String room_id;
    private String dept_incharge;

    /**
     * @return the dept_id
     */
    public String getDept_id() {
        return dept_id;
    }

    /**
     * @param dept_id the dept_id to set
     */
    public void setDept_id(String dept_id) {
        this.dept_id = dept_id;
    }

    /**
     * @return the dept_name
     */
    public String getDept_name() {
        return dept_name;
    }

    /**
     * @param dept_name the dept_name to set
     */
    public void setDept_name(String dept_name) {
        this.dept_name = dept_name;
    }

    /**
     * @return the depart_expense
     */
    public float getDepart_expense() {
        return depart_expense;
    }

    /**
     * @param depart_expense the depart_expense to set
     */
    public void setDepart_expense(float depart_expense) {
        this.depart_expense = depart_expense;
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
     * @return the dept_incharge
     */
    public String getDept_incharge() {
        return dept_incharge;
    }

    /**
     * @param dept_incharge the dept_incharge to set
     */
    public void setDept_incharge(String dept_incharge) {
        this.dept_incharge = dept_incharge;
    }

    public String insertdepartment(){
        jdbcconnection j=new jdbcconnection();
        String l=new String("','");
        String i=new String("'");
        String c=new String(",");
        String message=new String();
        check ch=new check();
        if(!dept_incharge.equals("")){
        if(!ch.isdepartment(dept_id)&&ch.isroom(room_id)&&ch.isemployee(dept_incharge)){
            j.insertData("insert into department (dept_id,dept_name,depart_expense,room_id,department_incharge)" +
                    "values ('"+dept_id+l
                    +dept_name+"',"+depart_expense+",'"+room_id+l+dept_incharge+"')");
            Room r=new Room();
                r.setRoom_id(room_id);
                r.getroom();
                r.setAvailable("used");
                r.updateroom();
            message="New Department Entry is successful";
        }
        else{
            if(ch.isdepartment(dept_id)){message="Department already exists";}
            else if(!ch.isroom(room_id)){message=ch.getMessage();}
            else if(!ch.isemployee(dept_incharge)){message=ch.getMessage();}

        }}
        else
        {
            if(!ch.isdepartment(dept_id)&&ch.isroom(room_id)){
            j.insertData("insert into department (dept_id,dept_name,depart_expense,room_id)" +
                    "values ('"+dept_id+l
                    +dept_name+"',"+depart_expense+",'"+room_id+"')");
            Room r=new Room();
                r.setRoom_id(room_id);
                r.getroom();
                r.setAvailable("used");
                r.updateroom();
            message="New Department Entry is successful";
            }
            else
            {
                if(ch.isdepartment(dept_id)){message="Department already exists";}
                else if(!ch.isroom(room_id)){message=ch.getMessage();}
            }
        }
        return message;
    }
}
