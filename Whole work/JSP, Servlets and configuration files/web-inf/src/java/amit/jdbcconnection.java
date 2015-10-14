/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package amit;
import java.sql.*;
import java.util.ArrayList;
//import java.util.Iterator;
/**
 *
 * @author Amit
 */
public class jdbcconnection {
    //ResultSet r;
    int m;
    Connection con=null;
    String url = "jdbc:oracle:thin:@localhost:1521:amit";
    public ArrayList getData(String s1){
        ResultSet r=null;
        ArrayList a=new ArrayList();
        //Iterator it=a.iterator();
        
        try {
        String driver = "oracle.jdbc.driver.OracleDriver";
        Class.forName(driver).newInstance( );
         }
        catch( Exception e ) {
        System.out.println("Failed to load Oracle driver.");
        }
        try{
        
         con=DriverManager.getConnection(url,"ias10cbse","admin");
        Statement s=con.createStatement();
        r = s.executeQuery(s1);
        ResultSetMetaData rsmd=r.getMetaData();
        int column =rsmd.getColumnCount();
        while(r.next()){
            for(int j=1;j<=column;j++)
            {
                a.add(r.getString(j));
            }
          //System.out.println("amit");
        }
        s.close();
        con.close();
       }catch(Exception e){System.out.println("Exception Found"+e);}

    return a;
    }

    public int insertData(String s1){
        //int r;
        try{
        Class.forName("oracle.jdbc.driver.OracleDriver");
        con=DriverManager.getConnection(url,"ias10cbse","admin");
        Statement s=con.createStatement();
        m = s.executeUpdate(s1);
        s.close();
        con.close();
       
        }catch(Exception e){System.out.println("Exception Found"+e);}
    return m;
    }
}
