/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package amit;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;

/**
 *
 * @author Amit
 */
public class newsubject extends HttpServlet{
    public void doPost(HttpServletRequest request,HttpServletResponse response)
            throws ServletException,IOException{
        HttpSession session=request.getSession();
        Enumeration e=session.getAttributeNames();
        if(e.hasMoreElements()){
        String str=new String();
        Subject s=new Subject();
        str=request.getParameter("subj_id");
        s.setSubj_id(str);
        str=request.getParameter("subj_name");
        s.setSubj_name(str);
        str=request.getParameter("subj_teacher");
        s.setSubj_teacher(str);
        String clas=request.getParameter("class");
        String sec=request.getParameter("sec");
        jdbcconnection j=new jdbcconnection();
        ArrayList a=new ArrayList();
        a=j.getData("select class_id from class where class_name='"+clas+"' and sec='"+sec+"'");
        //System.out.print("amit");
        //System.out.print(a);
        String message=new String();
        if(a.size()==0){message="class does not exist";}
        else{s.setClass_id(a.get(0).toString());
        System.out.println(s.getClass_id());
        message=s.insertsubject();}
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
