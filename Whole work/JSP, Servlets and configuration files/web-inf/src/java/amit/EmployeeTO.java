/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package amit;
import java.util.*;

/**
 *
 * @author Amit
 */
public class EmployeeTO {
    private String emp_id="";
    private String first_name="";
    private String middle_name="";
    private String last_name="";
    private String job_id="";
    private String type="";
    private String hire_date="";
    private String address="";
    private long phone=0;
    private String qualification="";

    /**s
     * @return the emp_id
     */
    public String getEmp_id() {
        return emp_id;
    }

    /**
     * @param emp_id the emp_id to set
     */
    public void setEmp_id(String emp_id) {
        this.emp_id = emp_id;
    }

    /**
     * @return the first_name
     */
    public String getFirst_name() {
        return first_name;
    }

    /**
     * @param first_name the first_name to set
     */
    public void setFirst_name(String first_name) {
        this.first_name = first_name;
    }

    /**
     * @return the middle_name
     */
    public String getMiddle_name() {
        return middle_name;
    }

    /**
     * @param middle_name the middle_name to set
     */
    public void setMiddle_name(String middle_name) {
        this.middle_name = middle_name;
    }

    /**
     * @return the last_name
     */
    public String getLast_name() {
        return last_name;
    }

    /**
     * @param last_name the last_name to set
     */
    public void setLast_name(String last_name) {
        this.last_name = last_name;
    }

    /**
     * @return the job_id
     */
    public String getJob_id() {
        return job_id;
    }

    /**
     * @param job_id the job_id to set
     */
    public void setJob_id(String job_id) {
        this.job_id = job_id;
    }

    /**
     * @return the type
     */
    public String getType() {
        return type;
    }

    /**
     * @param type the type to set
     */
    public void setType(String type) {
        this.type = type;
    }

    /**
     * @return the hire_date
     */
    public String getHire_date() {
        return hire_date;
    }

    /**
     * @param hire_date the hire_date to set
     */
    public void setHire_date(String hire_date) {
        this.hire_date = hire_date;
    }

    /**
     * @return the address
     */
    public String getAddress() {
        return address;
    }

    /**
     * @param address the address to set
     */
    public void setAddress(String address) {
        this.address = address;
    }

    /**
     * @return the phone
     */
    public long getPhone() {
        return phone;
    }

    /**
     * @param phone the phone to set
     */
    public void setPhone(long phone) {
        this.phone = phone;
    }

    /**
     * @return the qualification
     */
    public String getQualification() {
        return qualification;
    }

    /**
     * @param qualification the qualification to set
     */
    public void setQualification(String qualification) {
        this.qualification = qualification;
    }

    public String insertemployee(){
        jdbcconnection j=new jdbcconnection();
        ArrayList a=new ArrayList();
        check ch=new check();
        String l=new String("','");
        String i=new String("'");
        String c=new String(",");
        String message=new String();
        if(!ch.isemployee(emp_id)&& ch.isjob(job_id))
        {
         
           int n=j.insertData("insert into employee values('" +
                    emp_id+l+first_name+l+middle_name+l+last_name+
                    l+job_id+l+type+l+hire_date+l+address+i+c+phone+c+i+qualification+i+")");
            message ="New Employee Entry is successful";
        LoginTO log=new LoginTO();
        log.setUsername(emp_id);
        log.setPassword(emp_id);
        a=j.getData("select job_name from job where job_id='"+job_id+"'");
        System.out.println("amitprakash");
        if(type.equals("teaching"))log.setUser_type("teacher");
        else if(a.get(0).equals("administrator"))log.setUser_type("administrator");
        else if(a.get(0).equals("librarian"))log.setUser_type("librarian");
        else if(a.get(0).equals("accountant"))log.setUser_type("accountant");
        else log.setUser_type("staff");
        if(n==1)log.insertlogin();
        }
        else
        {
            if(ch.isemployee(emp_id)){message="Employee already exists";}
            else if(!ch.isjob(job_id)){message=ch.getMessage();}
        }
        return message;
    }

        public void setEmployee()
        {
            jdbcconnection j=new jdbcconnection();
            ArrayList a=new ArrayList();
            a=j.getData("select * from employee where emp_id='"+emp_id+"'");
            this.first_name=a.get(1).toString();
            if(a.get(2)!=null)this.middle_name=a.get(2).toString();
            this.last_name=a.get(3).toString();
            this.job_id=a.get(4).toString();
            this.type=a.get(5).toString();
            this.hire_date=a.get(6).toString();
            if(a.get(7)!=null)this.address=a.get(7).toString();
            if(a.get(8)!=null)this.phone=Long.parseLong(a.get(8).toString());
            this.qualification=a.get(9).toString();

        }

}
