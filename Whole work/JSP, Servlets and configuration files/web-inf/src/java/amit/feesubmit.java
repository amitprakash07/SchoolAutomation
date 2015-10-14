/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package amit;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;
/**
 *
 * @author Amit
 */
public class feesubmit extends HttpServlet{
    public void doPost(HttpServletRequest request,HttpServletResponse response)
            throws ServletException,IOException{
       HttpSession session=request.getSession();
       Enumeration e=session.getAttributeNames();
       if(e.hasMoreElements()){
                check c=new check();
                String s_id=request.getParameter("s_id");
                String fee_of_month=request.getParameter("fee_of_month");
                int library_fine=Integer.parseInt(request.getParameter("library_fine").toString());
                int total_fee_paid=Integer.parseInt(request.getParameter("total_fee_paid").toString());
                String message=new String();
                if(!c.isstudentfeepaid(s_id, fee_of_month))
                {
                    jdbcconnection j=new jdbcconnection();
                    j.insertData("insert into fees_collection values ('"+s_id+"','"+fee_of_month+"',sysdate,"+library_fine+","+total_fee_paid+")");
                    message="Fee taken from "+s_id;
                    j.insertData("update library_retrieval set fine_status='paid' where s_id='"+s_id+"'and book_status='returned'");
                }
                else message="Fee already paid by student "+s_id+" of the month "+fee_of_month;

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
