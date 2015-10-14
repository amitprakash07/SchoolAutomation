/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package amit;
import javax.servlet.*;
import java.io.*;
import javax.servlet.http.*;
import java.util.ArrayList;
import java.util.Enumeration;
/**
 *
 * @author Amit
 */
public class checksid extends HttpServlet{
            public void doPost(HttpServletRequest request,HttpServletResponse response)
                    throws ServletException,IOException{
         HttpSession session=request.getSession();
         Enumeration e=session.getAttributeNames();
         if(e.hasMoreElements()){
                RequestDispatcher r;
                String link=new String();
                //jdbcconnection j=new jdbcconnection();
                link =session.getAttribute("link").toString();
                String s_id=new String();
                s_id=request.getParameter("sid");
                session.setAttribute("s_id", s_id);
                String user_type=new String();
                user_type=session.getAttribute("idtype").toString();
                //System.out.println(user_type.equals("student"));
                boolean b=user_type.equals("employee");
                //System.out.println(b);
            if(!link.equals("/book_return.jsp") && !link.equals("/book_issue.jsp"))
           {
                if(user_type.equals("student"))
                {
                    check ch=new check();
                    //System.out.println(ch.isstudent(s_id));
                    if(!ch.isstudent(s_id)){
                        r=request.getRequestDispatcher("not_found.jsp");
                    r.forward(request, response);}
                    else{
                        r=request.getRequestDispatcher(link);
                        r.forward(request, response);
                    }
                }
                else if(user_type.equals("employee"))
                {
                    check ch=new check();
                    //System.out.print("amit");
                    if(!ch.isemployee(s_id)){
                        r=request.getRequestDispatcher("/not_found.jsp");
                    r.forward(request, response);
                    }
                    else{
                        r=request.getRequestDispatcher(link);
                        r.forward(request, response);
                    }

                }
           }

           else{
                    check ch=new check();
                    if(!ch.isstudent(s_id))
                    {
                        if(!ch.isemployee(s_id)){
                            r=request.getRequestDispatcher("/not_found.jsp");
                            r.forward(request, response);
                        }else{session.setAttribute("idtype","employee");}
                    }else{session.setAttribute("idtype","student");}
                        r=request.getRequestDispatcher(link);
                        r.forward(request, response);

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
