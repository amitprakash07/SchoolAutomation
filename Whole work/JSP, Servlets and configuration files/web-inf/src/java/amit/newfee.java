/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package amit;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;

/**
 *
 * @author Amit
 */
public class newfee extends HttpServlet{
        public void doPost(HttpServletRequest request,HttpServletResponse response)
                throws ServletException,IOException{
         HttpSession session=request.getSession();
         Enumeration e=session.getAttributeNames();
         if(e.hasMoreElements()){
                FeeTO f= new FeeTO();
                String str=new String();
                jdbcconnection j=new jdbcconnection();
                ArrayList a=new ArrayList();
                str=request.getParameter("fees_id");
                f.setFee_id(str);
                str=request.getParameter("tution_fees");
                f.setTution_fee(Float.parseFloat(str));
                String message=new String();
                message=f.insertfee();
                PrintWriter out=response.getWriter();
                    response.setContentType("text/html");
                    out.println("<html><head><title>Error</title></head>" +
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
