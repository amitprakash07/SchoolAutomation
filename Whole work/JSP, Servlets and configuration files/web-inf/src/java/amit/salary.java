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
public class salary extends HttpServlet{
    public void doPost(HttpServletRequest request,HttpServletResponse response)
            throws IOException,ServletException{
HttpSession session=request.getSession();
Enumeration e=session.getAttributeNames();
if(e.hasMoreElements()){
        check c=new check();
        jdbcconnection j=new jdbcconnection();
        String emp_id=request.getParameter("emp_id");
        String pay_of_month=request.getParameter("pay_of_month");
        float bs=Float.parseFloat(request.getParameter("bs"));
        float total_salary=Float.parseFloat(request.getParameter("total_salary"));
        String message;
        if(!c.isemployeesalarypaid(emp_id,pay_of_month))
        {
            j.insertData("insert into salary values ('"+emp_id+"','"+pay_of_month+"',"+bs+","+total_salary+",sysdate)");
            message="Salary is paid to employee "+emp_id+" of month "+pay_of_month;
        }
        else message="Salary is already paid to "+emp_id+" of the month "+pay_of_month;

                        PrintWriter out=response.getWriter();
        response.setContentType("text/html");
                    out.println("<html><head><title>Message</title></head>" +
                            "<body bgcolor='#ffffcc'><p align='center'><img src='logo.bmp'></p>" +
                            "<p align='center'>"+message+"</body></html>");

    }else {
            PrintWriter out=response.getWriter();
            out.println("<html><head><title>Error</title></head>" +
                    "<body bgcolor='#ffffcc'><p align='center'><img src='logo.bmp'></p>" +
                    "<br><br><<p align='center'><strong>Please Login First</strong></p>"+
                "<p align='center'><a href='login.jsp'>Log In</a></p></html>");
      }

  }

}
