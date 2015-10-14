/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package amit;
import javax.servlet.http.*;
import javax.servlet.*;
import java.util.*;
import java.io.*;

/**
 *
 * @author Amit
 */
public class seeresult extends HttpServlet{
    public void doGet(HttpServletRequest request,HttpServletResponse response)
            throws ServletException,IOException{
    HttpSession session=request.getSession();
    Enumeration e=session.getAttributeNames();
    if(e.hasMoreElements()){
     int term=Integer.parseInt(request.getParameter("term").toString());
        ArrayList a=new ArrayList();
        jdbcconnection j=new jdbcconnection();
        String class_id=session.getAttribute("class_id").toString();
        String s_id=session.getAttribute("s_id").toString();
        a=j.getData("select subj_name from subject where class_id='"+class_id+"' order by subj_name");
        ArrayList b=new ArrayList();
        ArrayList result=new ArrayList();
        b=j.getData("select s_id from result where s_id='"+s_id+"' and term="+term);
        if(b.size()>0){
        for(int i=0;i<a.size();i++)
        {
            b=j.getData("select "+a.get(i)+" from result where s_id='"+s_id+"' and term="+term);
            if(b.size()==0)break;
            result.add(a.get(i));
            result.add(b.get(0));
        }
        }else result=null;
        int subjects=a.size();
        session.setAttribute("result",result);
        session.setAttribute("subjects",subjects);
        RequestDispatcher r=request.getRequestDispatcher("result.jsp");
        r.forward(request, response);
    }else {
            PrintWriter out=response.getWriter();
            out.println("<html><head><title>Error</title></head>" +
                    "<body bgcolor='#ffffcc'><p align='center'><img src='logo.bmp'></p>" +
                    "<br><br><<p align='center'><strong>Please Login First</strong></p>"+
                "<p align='center'><a href='login.jsp'>Log In</a></p></html>");
      }

  }

}
