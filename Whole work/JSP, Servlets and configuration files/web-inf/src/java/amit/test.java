/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package amit;
import java.util.*;
import java.util.Date;
import java.util.Calendar;
/**
 *
 * @author Amit
 */
import java.sql.*;
import sun.security.jca.GetInstance.Instance;

public class test {

public static void main(String args[]) {
String url = "jdbc:oracle:thin:@localhost:1521:amit";
Connection con = null;
try {
String driver = "oracle.jdbc.driver.OracleDriver";
Class.forName(driver).newInstance( );
}
catch( Exception e ) {
System.out.println("Failed to load Oracle driver.");
return;
}
try {

  Connection  con1 = DriverManager.getConnection(url,"sysman","amit");
Statement s1 = con1.createStatement( );
//String sql="select * from dates";
//ResultSet rs=s1.executeQuery("select * from dates");
//System.out.println(rs.next());
Date d=new Date();
//Calendar d=Calendar.getInstance();
//int i=1;
/*while(rs.next()){

    d=rs.getDate(1);
    String d1=d.toString();
    String d2[]=d1.split("-");
    for(int i=0;i<d2.length;i++){
System.out.println(d2[i]);*/
    
    //System.out.println(d);
    //System.out.println(d.getMonth());

//s1.close();
//Calendar calendar=Calendar.getInstance();
//Calendar c=Calendar.getInstance();
//String idate=calendar.get(Calendar.DATE)+30+"-"+calendar.get(Calendar.MONTH)+"-"+calendar.get(Calendar.YEAR);
//System.out.println(idate);
//calendar.add(calendar.get(Calendar.DATE), 7);
//System.out.println(calendar.get(Calendar.DATE));
//calendar.add(Calendar.DAY_OF_MONTH,35);
//System.out.println(calendar.get(Calendar.DATE));
//System.out.println(c.get(Calendar.DAY_OF_MONTH));
//System.out.println(c.get(Calendar.MONTH));
//Date date1=new Date();
//Date date2=new Date();
//date=date+7;
//String num=date.toString();

//System.out.println(num);
//Calendar c2=Calendar.getInstance();
//System.out.println(c2);
//c2.add(c2.DATE,7));
//System.out.println(Calendar.DAY_OF_MONTH);
//c2.add(Calendar.DATE,10);
//System.out.print(Calendar.DATE);
//c2.add(Calendar.DATE, 8);
//System.out.println(c2.getTime());
//ClassTO c=new ClassTO();
//c.setClass_name("10");
//c.setSec("b");
//jdbcconnection j=new jdbcconnection();
//ArrayList a=new ArrayList();
//a=j.getData("select class_id from class where class_name='"+c.getClass_name()+"' and sec='"+c.getSec()+"'");
//System.out.println(a.size());
//calendar.a;
String s="amit";
char c[]=s.toCharArray();
for(int i=0;i<s.length();i++)
{

    System.out.println(c[i]);
}


}


catch( Exception e ) {System.out.print("amit");
e.printStackTrace( );
}
finally {
if( con != null ) {
try { con.close( ); }
catch( Exception e ) { e.printStackTrace( ); }
}
}
}
}
