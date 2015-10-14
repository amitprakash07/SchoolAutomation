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
public class newclass extends HttpServlet{
    public void doPost(HttpServletRequest request,HttpServletResponse response)
            throws ServletException,IOException{
        HttpSession session=request.getSession();
        Enumeration e=session.getAttributeNames();
        if(e.hasMoreElements()){
        String class_id=request.getParameter("class_id");
        String class_name=request.getParameter("class_name");
        String class_teacher=request.getParameter("class_teacher");
        String room_id =request.getParameter("room_id");
        String fee_id=request.getParameter("fee_id");
        String sec=request.getParameter("sec");
        String intake=request.getParameter("intake");
        ClassTO c=new ClassTO();
        c.setClass_id(class_id);
        c.setClass_name(class_name);
        c.setClass_teacher(class_teacher);
        c.setFees_id(fee_id);
        c.setRoom_id(room_id);
        c.setSec(sec);
        c.setIntake(Integer.parseInt(intake));
        String message=c.ClassInsert();
        System.out.println(message);
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
