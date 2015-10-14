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
public class newlab extends HttpServlet{
     public void doPost(HttpServletRequest request,HttpServletResponse response)
                throws ServletException,IOException{
HttpSession session=request.getSession();
            Enumeration e=session.getAttributeNames();
            if(e.hasMoreElements()){

         String str=new String();
         Lab lab=new Lab();
         str=request.getParameter("lab_id");
         lab.setLab_id(str);
         str=request.getParameter("lab_name");
         lab.setLab_name(str);
         str=request.getParameter("lab_attend");
         lab.setLab_attend(str);
         str=request.getParameter("lab_inc");
         lab.setLab_inc(str);
         str=request.getParameter("room_id");
         lab.setRoom_id(str);
         str=request.getParameter("lab_type");
         lab.setLab_type(str);
         str=request.getParameter("lab_timing");
         lab.setLab_timing(str);
         String message=new String(lab.insertlab());
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
