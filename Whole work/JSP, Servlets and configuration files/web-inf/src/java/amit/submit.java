/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package amit;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
//import java.sql.*;
import java.util.*;

/**
 *
 * @author Amit
 */
public class submit extends HttpServlet{

    public void doPost(HttpServletRequest request,HttpServletResponse response)
        throws ServletException ,IOException{
        //synchronized(getServletContext().getInitParameter("student"))
       HttpSession session=request.getSession();
       Enumeration e1=session.getAttributeNames();
       if(e1.hasMoreElements()){
            String months[] = {"Jan", "Feb", "Mar", "Apr","May", "Jun", "Jul", "Aug","Sep", "Oct", "Nov", "Dec"};
            Object o= session.getAttribute("STO");
            StudentTO sto= (StudentTO) o ;
            Calendar calendar=Calendar.getInstance();
            String s_id =new String();
            int i=sto.countstudent();
            if(i==0){s_id=calendar.get(Calendar.YEAR)+"0001";}
            if(i>0&&i<9){s_id=calendar.get(Calendar.YEAR)+"000"+(i+1);}
            if(i>=9&&i<99){s_id=calendar.get(Calendar.YEAR)+"00"+(i+1);}
            if(i>=99&&i<999){s_id=calendar.get(Calendar.YEAR)+"0"+(i+1);}
            if(i>=999){s_id=calendar.get(Calendar.YEAR)+(i+1)+"";}
            sto.setSid(s_id);
            sto.setPassword(s_id);
            //System.out.println("amit");
            //String s1=getServletContext().getInitParameter(url);

            String message=new String();
            System.out.print("g2");
            message=sto.insertstudent();
            //System.out.println("amit");
            if(message.equals("New Student admission is successful")){
            //System.out.println("amit");
            RequestDispatcher r=request.getRequestDispatcher("/new_student_info.jsp");
            r.forward(request,response);}
            else{
              //  System.out.println("amit");
            PrintWriter out=response.getWriter();
            out.println("<html><title>Error message</title><body bgcolor='#ffffcc'><h1 align='center'>"+message+"</h1></body></html>");
            System.out.println("Exception is thrown");}

    //    }
       }else {
            PrintWriter out=response.getWriter();
            out.println("<html><head><title>Error</title></head>" +
                    "<body bgcolor='#ffffcc'><p align='center'><img src='logo.bmp'></p>" +
                    "<br><br><<p align='center'><strong>Please Login First</strong></p>"+
                "<p align='center'><a href='login.jsp'>Log In</a></p></html>");
      }

    }
}