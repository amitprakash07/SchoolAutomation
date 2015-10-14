/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package amit;
import javax.servlet.http.*;
import javax.servlet.*;
import java.io.*;
import java.util.ArrayList;
import java.util.Enumeration;
/**
 *
 * @author Amit
 */
public class adminreq extends HttpServlet{
        public void doPost (HttpServletRequest request,HttpServletResponse response)
                throws IOException,ServletException{
            HttpSession session=request.getSession();
            Enumeration e=session.getAttributeNames();
            if(e.hasMoreElements()){
            jdbcconnection j=new jdbcconnection();
            check ch=new check();
            String message=new String();
            String dept_name=request.getParameter("dept_name");
            String money_req=request.getParameter("money_req");
            String sr_no=request.getParameter("sr_no");
            String i="'";
            String c=",";
            if(!ch.issrno(sr_no)){
            j.insertData("insert into admin_req (sr_no,dept_id,money_req,date_of_req) values("+
                   sr_no+c+i+dept_name+i+c+money_req+c+"sysdate)" );
                   message="New admin requirement entry is successful";
             }
            else{
                message="Requirement is already entered";
            }
            PrintWriter out=response.getWriter();
                    response.setContentType("text/html");
                    out.println("<html><head><title>Message</title></head>" +
                            "<body bgcolor='#ffffcc'><p align='center'><img src='logo.bmp'></p>" +
                            "<p align='center'>"+message+"</body></html>");

        }
       else {
            PrintWriter out=response.getWriter();
            out.println("<html><head><title>Error</title></head>" +
                    "<body bgcolor='#ffffcc'><p align='center'><img src='logo.bmp'></p>" +
                    "<br><br><<p align='center'><strong>Please Login First</strong></p>"+
                "<p align='center'><a href='login.jsp'>Log In</a></p></html>");
      }
  }


}
