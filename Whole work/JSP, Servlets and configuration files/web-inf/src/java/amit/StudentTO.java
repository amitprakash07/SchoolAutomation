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
public class StudentTO {
    private String sid="";
    private String password="";
    private String fname="";
    private String mname="";
    private String lname="";
    private String day="";
    private String month="";
    private String year="";
    private String sex="";
    private String clas="";
    private String father="";
    private String foccupation="";
    private String mother="";
    private String moccupation="";
    private String address="";
    private int nb=0;
    private int ns=0;
    private long p;
    private long ep;
    private float income;
    private String class_id="";
    private String dob="";
    private String doa="";
    private float dues=0;
    private float fine=0;
    private String sec;
    /**
     * @return the fname
     */
    public String getFname() {
        return fname;
    }

    /**
     * @param fname the fname to set
     */
    public void setFname(String fname) {
        this.fname = fname;
    }

    /**
     * @return the mname
     */
    public String getMname() {
        return mname;
    }

    /**
     * @param mname the mname to set
     */
    public void setMname(String mname) {
        this.mname = mname;
    }

    /**
     * @return the lname
     */
    public String getLname() {
        return lname;
    }

    /**
     * @param lname the lname to set
     */
    public void setLname(String lname) {
        this.lname = lname;
    }

    /**
     * @return the day
     */
    public String getDay() {
        return day;
    }

    /**
     * @param day the day to set
     */
    public void setDay(String day) {
        this.day = day;
    }

    /**
     * @return the month
     */
    public String getMonth() {
        return month;
    }

    /**
     * @param month the month to set
     */
    public void setMonth(String month) {
        this.month = month;
    }

    /**
     * @return the year
     */
    public String getYear() {
        return year;
    }

    /**
     * @param year the year to set
     */
    public void setYear(String year) {
        this.year = year;
    }

    /**
     * @return the sex
     */
    public String getSex() {
        return sex;
    }

    /**
     * @param sex the sex to set
     */
    public void setSex(String sex) {
        this.sex = sex;
    }

    /**
     * @return the clas
     */
    public String getClas() {
        return clas;
    }

    /**
     * @param clas the clas to set
     */
    public void setClas(String clas) {
        this.clas = clas;
    }

    /**
     * @return the father
     */
    public String getFather() {
        return father;
    }

    /**
     * @param father the father to set
     */
    public void setFather(String father) {
        this.father = father;
    }

    /**
     * @return the foccupation
     */
    public String getFoccupation() {
        return foccupation;
    }

    /**
     * @param foccupation the foccupation to set
     */
    public void setFoccupation(String foccupation) {
        this.foccupation = foccupation;
    }

    /**
     * @return the mother
     */
    public String getMother() {
        return mother;
    }

    /**
     * @param mother the mother to set
     */
    public void setMother(String mother) {
        this.mother = mother;
    }

    /**
     * @return the moccupation
     */
    public String getMoccupation() {
        return moccupation;
    }

    /**
     * @param moccupation the moccupation to set
     */
    public void setMoccupation(String moccupation) {
        this.moccupation = moccupation;
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
     * @return the nb
     */
    public int getNb() {
        return nb;
    }

    /**
     * @param nb the nb to set
     */
    public void setNb(int nb) {
        this.nb = nb;
    }

    /**
     * @return the ns
     */
    public int getNs() {
        return ns;
    }

    /**
     * @param ns the ns to set
     */
    public void setNs(int ns) {
        this.ns = ns;
    }

    /**
     * @return the p
     */
    public long getP() {
        return p;
    }

    /**
     * @param p the p to set
     */
    public void setP(long p) {
        this.p = p;
    }

    /**
     * @return the ep
     */
    public long getEp() {
        return ep;
    }

    /**
     * @param ep the ep to set
     */
    public void setEp(long ep) {
        this.ep = ep;
    }

    /**
     * @return the income
     */
    public float getIncome() {
        //float inc=parseFloat(income);
        return income;
    }

    /**
     * @param income the income to set
     */
    public void setIncome(float income) {
        this.income = income;
    }

    /**
     * @return the sid
     */
    public String getSid() {
        return sid;
    }

    /**
     * @param sid the sid to set
     */
    public void setSid(String sid) {
        this.sid = sid;
    }

    /**
     * @return the password
     */
    public String getPassword() {
        return password;
    }

    /**
     * @param password the password to set
     */
    public void setPassword(String password) {
        this.password = password;
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


    /**
     * @return the dues
     */
    public float getDues() {
        return dues;
    }

    /**
     * @param dues the dues to set
     */
    public void setDues(float dues) {
        this.dues = dues;
    }

    /**
     * @return the fine
     */
    public float getFine() {
        return fine;
    }

    /**
     * @param fine the fine to set
     */
    public void setFine(float fine) {
        this.fine = fine;
    }


    /**
     * @return the dob
     */
    public String getDob() {
        return dob;
    }

    /**
     * @param dob the dob to set
     */
    public void setDob(String dob) {
        this.dob = dob;
    }


    /**
     * @return the doa
     */
    public String getDoa() {
        return doa;
    }

    /**
     * @param doa the doa to set
     */
    public void setDoa(String doa) {
        this.doa = doa;
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

    public void setStudent(){
        jdbcconnection j=new jdbcconnection();
        ArrayList a=new ArrayList();
        a=j.getData("select * from student where s_id='"+this.sid+"'");
        this.fname=a.get(1).toString();
        this.class_id=a.get(2).toString();
        if(a.get(3)!=null){this.mname=a.get(3).toString();}
        this.lname=a.get(4).toString();
        this.dob=a.get(5).toString();
        System.out.print(this.dob);
        this.doa=a.get(6).toString();
        this.clas=a.get(7).toString();
        this.sex=a.get(8).toString();
        father=a.get(9).toString();
        if(a.get(10)!=null){this.mother=a.get(10).toString();}
        if(a.get(11)!=null){this.foccupation=a.get(11).toString();}
        if(a.get(12)!=null){this.moccupation=a.get(12).toString();}
        if(a.get(13)!=null){this.address=a.get(13).toString();}
        this.income=Float.parseFloat(a.get(14).toString());
        if(a.get(15)!=null){this.nb=Integer.parseInt(a.get(15).toString());}
        if(a.get(16)!=null){this.ns=Integer.parseInt(a.get(16).toString());}
        if(a.get(17)!=null){this.p=Long.parseLong(a.get(17).toString());}
        this.ep=Long.parseLong(a.get(18).toString());
        if(a.get(19)!=null)this.dues=Float.parseFloat(a.get(19).toString());
        if(a.get(20)!=null)this.fine=Float.parseFloat(a.get(20).toString());

  }

    
    public String insertstudent(){
        jdbcconnection j=new jdbcconnection();
        check ch=new check();
        String message=new String("");
        String c=new String(",");
        String i=new String("'");
        String l=new String("','");
        ClassTO c1=new ClassTO();
        c1.setClass_name(clas);
        c1.setSec(sec);
        //System.out.println(ch.isclasssec(c1));
        if(ch.isclasssec(c1)){
            c1.setclass();
            //System.out.println("amit");
            int n=j.insertData("insert into student values ('" +
                    sid+l+fname+l+c1.getClass_id()+l+mname+l+lname+l+dob+l+doa
                    +l+clas+l+sex+l+father+l+mother+l+foccupation+l
                    +moccupation+l+address+i+c+income+c+nb+c+ns+c+p+c+ep+c+dues+c+fine+")");
            //System.out.println("amit");
            if(n==1){
                LoginTO log=new LoginTO();
                log.setUsername(sid);
                log.setPassword(sid);
                log.setUser_type("student");
            log.insertlogin();
                message="New Student admission is successful";}
        }
        else{
            if(!ch.isclasssec(c1)){message=ch.getMessage();}
            System.out.println(message);
            }
        return message;
    }


    public int countstudent(){
        jdbcconnection j=new jdbcconnection();
        ArrayList a=new ArrayList();
        a=j.getData("select s_id from student");
        int n=a.size();
        return n;

    }

    public void enterattendance(String pa){
        jdbcconnection j=new jdbcconnection();
        j.insertData("insert into stud_attend values ('"+sid+"','"+class_id+"',sysdate,'"+pa+"')");
    }

    public ArrayList attendance(String month){
        jdbcconnection j=new jdbcconnection();
        ArrayList a=new ArrayList();
        a=j.getData("select TO_CHAR(today_date,'dd,mon,yyyy'),p_a from stud_attend where s_id='"+this.sid+"' and class_id='"+this.class_id+"' and today_date like '%"+month.toUpperCase()+"%' order by today_date");
        System.out.println("a1");
        return a;
    }

    

    
}
