/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package amit;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.Enumeration;
/**
 *
 * @author Amit
 */
public class attendance extends HttpServlet{

    public void doPost(HttpServletRequest request,HttpServletResponse response)
                throws ServletException,IOException{
        jdbcconnection j=new jdbcconnection();
        check ch=new check();
        HttpSession s=request.getSession();
        //Object o=s.getAttribute("nos");
        //int n=Integer.parseInt(o);
        //System.out.print(o);*/
        Enumeration e1=s.getAttributeNames();
        //System.out.println("g1");
        if(e1.hasMoreElements())
        {
            Enumeration e=request.getParameterNames();
            String s_id=new String();
            String p_a=new String();
            String message=new String();
            //System.out.println("g2");
            if(s.getAttribute("user_type").toString().equals(("class Teacher")))
            {
                String class_id=s.getAttribute("class_id").toString();
                //System.out.println("g3");
                message="U have entered/updated the attendance for the following students\n";
                    while(e.hasMoreElements())
                    {
                        s_id=e.nextElement().toString();
                        p_a=request.getParameter(s_id).toString();
                            if(!s_id.equals("attendance")&& !ch.isstudentattend(s_id))
                            {
                                j.insertData("insert into stud_attend values('"+s_id+"','"+class_id+"',sysdate,'"+p_a+"')");
                                message +=s_id+"\n";
                            }
                            else
                            {
                                if(!s_id.equals("attendance"))
                                {
                                    j.insertData("update stud_attend set p_a='"+p_a+"' where s_id='"+s_id+"'");
                                    message +=s_id+"\n";
                                }
                            }
                     }
           }
           else if(s.getAttribute("user_type").toString().equals("administrator"))
                {
                    message="U have entered/updated the attendance for the following employees\n";
                        while(e.hasMoreElements())
                        {
                            s_id=e.nextElement().toString();
                            p_a=request.getParameter(s_id).toString();
                                if(!s_id.equals("attendance")&& !ch.isemployattend(s_id))
                                {
                                    j.insertData("insert into emp_attend values('"+s_id+"',"+"sysdate,'"+p_a+"')");
                                    message +=s_id+"\n";
                                }
                                else
                                {
                                    if(!s_id.equals("attendance"))
                                    {
                                        j.insertData("update emp_attend set p_a='"+p_a+"' where emp_id='"+s_id+"'");
                                        message +=s_id+"\n";
                                    }
                                }
                        }
                }

        PrintWriter out=response.getWriter();
                    response.setContentType("text/html");
                    out.println("<html><head><title>Result</title></head>" +
                            "<body bgcolor='#ffffcc'><p align='center'><img src='logo.bmp'></p>" +
                            "<p align='center'>"+message+"</body></html>");


        }else{
            PrintWriter out=response.getWriter();
            out.println("<html><head><title>Error</title></head>" +
                    "<body bgcolor='#ffffcc'><p align='center'><img src='logo.bmp'></p>" +
                    "<br><br><<p align='center'><strong>Please Login First</strong></p>"+
                "<p align='center'><a href='login.jsp'>Log In</a></p></html>");
      }
    }


}
