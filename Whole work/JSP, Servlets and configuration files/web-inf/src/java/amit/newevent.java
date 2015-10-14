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
public class newevent extends HttpServlet{
    public void doPost(HttpServletRequest request,HttpServletResponse response)
            throws ServletException,IOException{
        HttpSession session=request.getSession();
        Enumeration e1=session.getAttributeNames();
        if(e1.hasMoreElements()){
        String str=new String();
        Event e=new Event();
        str=request.getParameter("event_name");
        e.setEvent_name(str);
        str=request.getParameter("event_id");
        e.setEvent_id(str);
        str=request.getParameter("event_inc");
        e.setEvent_inc(str);
        str=request.getParameter("organiser");
        e.setOrganiser(str);
        str=request.getParameter("descrip");
        e.setDescrip(str);
        String message=new String(e.insertevent());
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
