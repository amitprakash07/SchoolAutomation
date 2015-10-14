/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package amit;
import javax.servlet.http.*;
import javax.servlet.*;
import java.io.*;
import java.util.*;

/**
 *
 * @author Amit
 */
public class seeattendance extends HttpServlet{
    public void doGet(HttpServletRequest request,HttpServletResponse response)
            throws ServletException,IOException{
        HttpSession session=request.getSession();
        Enumeration e1=session.getAttributeNames();
        if(e1.hasMoreElements()){
        String month=request.getParameter("months").toString();
        String s_id=session.getAttribute("s_id").toString();
        ArrayList a=new ArrayList();
        String user_type=session.getAttribute("idtype").toString();
        if(user_type.equals("student"))
        {
        StudentTO s=new StudentTO();
        s.setSid(s_id);
        s.setStudent();
        //jdbcconnection j=new jdbcconnection();
        //a=j.getData("select class_id from student where s_id='"+s_id+"'");
        //String class_id=a.get(0).toString();
        //a=j.getData("select today_date,p_a from stud_attend where s_id='"+s_id+"' and class_id='"+class_id+"' and today_date like '%"+month.toUpperCase()+"%'");
        //a=j.getData("select TO_CHAR(today_date,'dd,mon,yyyy'),p_a from stud_attend where s_id='"+s_id+"' and class_id='"+class_id+"' and today_date like '%"+month.toUpperCase()+"%' order by today_date");
        a=s.attendance(month);
        RequestDispatcher r =request.getRequestDispatcher("stud_attendance.jsp");
        session.setAttribute("attendance",a);
        r.forward(request,response);

        }
        else
        {
          jdbcconnection j=new jdbcconnection();
          a=j.getData("select TO_CHAR(today_date,'dd,mon,yyyy'),p_a from emp_attend where emp_id='"+s_id+"' and today_date like '%"+month.toUpperCase()+"%' order by today_date");
          RequestDispatcher r =request.getRequestDispatcher("employee_attendance.jsp");
          session.setAttribute("attendance",a);
          r.forward(request,response);

        }
    }else {
            PrintWriter out=response.getWriter();
            out.println("<html><head><title>Error</title></head>" +
                    "<body bgcolor='#ffffcc'><p align='center'><img src='logo.bmp'></p>" +
                    "<br><br><<p align='center'><strong>Please Login First</strong></p>"+
                "<p align='center'><a href='login.jsp'>Log In</a></p></html>");
      }

    }

}
