/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package amit;

/**
 *
 * @author Amit
 */
public class JobTO {
    private String job_id;
    private String job_name;
    private float basic_sal;
    private float pf;
    private float da;
    private float hra;
    private float income_tax;
    private String dept_id;
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
     * @return the job_name
     */
    public String getJob_name() {
        return job_name;
    }

    /**
     * @param job_name the job_name to set
     */
    public void setJob_name(String job_name) {
        this.job_name = job_name;
    }

    /**
     * @return the basic_sal
     */
    public float getBasic_sal() {
        return basic_sal;
    }

    /**
     * @param basic_sal the basic_sal to set
     */
    public void setBasic_sal(float basic_sal) {
        this.basic_sal = basic_sal;
    }

    /**
     * @return the pf
     */
    public float getPf() {
        return pf;
    }

    /**
     * @param pf the pf to set
     */
    public void setPf(float pf) {
       this.pf = (pf/100)*basic_sal;
    }

    /**
     * @return the da
     */
    public float getDa() {
        return da;
    }

    /**
     * @param da the da to set
     */
    public void setDa(float da) {
        this.da = (da/100)*basic_sal;
    }

    /**
     * @return the hra
     */
    public float getHra() {
        return hra;
    }

    /**
     * @param hra the hra to set
     */
    public void setHra(float hra) {
        this.hra = hra;
    }

    /**
     * @return the income_tax
     */
    public float getIncome_tax() {
        return income_tax;
    }

    /**
     * @param income_tax the income_tax to set
     */
    public void setIncome_tax(float income_tax) {
        this.income_tax = income_tax;
    }

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

    public String insertjob(){
        jdbcconnection j=new jdbcconnection();
        String l=new String("','");
        String i=new String("'");
        String c=new String(",");
        String message=new String();
        check ch=new check();
        //System.out.println("amit");
        if(!ch.isjob(job_id)&& ch.isdepartment(dept_id)){
            j.insertData("insert into job values ('"+job_id+l
                    +job_name+"',"+basic_sal+c+pf+c+da+c+hra+c+income_tax+c+i+dept_id+"')");
            message="New Job Entry is successful";
            System.out.println(message);
        }
        else{
            if(ch.isjob(job_id)){message="Job already exists";}
            else if(!ch.isdepartment(dept_id)){message=ch.getMessage();}
            System.out.println(message);
        }

            return message;
    }
    
    public String jobUpdate(){
                jdbcconnection j=new jdbcconnection();
                String l=new String("','");
                String i=new String("'");
                String c=new String(",");
                check ch=new check();
                String message=new String();
                if(ch.isdepartment(dept_id)){
                int n=j.insertData("update job set " +
                        "job_id='"+job_id+i+c
                        +"job_name='"+job_name+i+c
                        +"basic_sal="+basic_sal+c
                        +"pf="+pf+c
                        +"da="+da+c
                        +"hra="+hra+c
                        +"income_tax="+income_tax+c
                        +"dept_id='"+dept_id+i+"where job_id='"+job_id+i);
                message="Update successful";
                }
                else{
                    if(!ch.isdepartment(dept_id))message=ch.getMessage();
                }

                return message;
            }
}
