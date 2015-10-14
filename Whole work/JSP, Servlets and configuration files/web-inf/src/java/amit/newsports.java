/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package amit;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;


public class newsports extends HttpServlet{

    public void doPost(HttpServletRequest request,HttpServletResponse response)
            throws IOException,ServletException{
    HttpSession session=request.getSession();
     Enumeration e=session.getAttributeNames();
     if(e.hasMoreElements()){
        Sports s2=new Sports();
        String s=new String();
        //System.out.println("amit");
        s=request.getParameter("sports_id");
        s2.setSports_id(s);
        s=request.getParameter("sports_name");
        s2.setSports_name(s);
        s=request.getParameter("sports_inc");
        s2.setSports_inc(s);
        //System.out.println("amit");
        s=s2.insertsport();
        PrintWriter out=response.getWriter();
                    response.setContentType("text/html");
                    out.println("<html><head><title>Result</title></head>" +
                            "<body bgcolor='#ffffcc'><p align='center'><img src='logo.bmp'></p>" +
                            "<p align='center'>"+s+"</body></html>");
    }else {
            PrintWriter out=response.getWriter();
            out.println("<html><head><title>Error</title></head>" +
                    "<body bgcolor='#ffffcc'><p align='center'><img src='logo.bmp'></p>" +
                    "<br><br><<p align='center'><strong>Please Login First</strong></p>"+
                "<p align='center'><a href='login.jsp'>Log In</a></p></html>");
      }


 }

}