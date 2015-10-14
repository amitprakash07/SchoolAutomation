/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package amit;


/**
 *
 * @author Amit
 */
public class job{


            public int jobinsert(JobTO job){
                jdbcconnection j=new jdbcconnection();
                String l=new String("','");
                String c=new String(",");
                int n=j.insertData("insert into job values ('"+job.getJob_id()+l
                        +job.getJob_name()+"',"+job.getBasic_sal()+c+job.getPf()+c+
                        +job.getDa()+c+job.getHra()+c+job.getIncome_tax()+",'"+job.getDept_id()+"')");
                return n;
            }

            public int jobUpdate(JobTO job){
                jdbcconnection j=new jdbcconnection();
                String l=new String("','");
                String i=new String("'");
                String c=new String(",");
                int n=j.insertData("update job set " +
                        "job_id='"+job.getJob_id()+i+c
                        +"job_name='"+job.getJob_name()+i+c
                        +"basic_sal="+job.getBasic_sal()+c
                        +"pf="+job.getPf()+c
                        +"da="+job.getDa()+c
                        +"hra="+job.getHra()+c
                        +"income_tax="+job.getIncome_tax()+c
                        +"dept_id='"+job.getDept_id()+i+"where job_id='"+job.getJob_id()+i);
                return n;
            }

            
}
