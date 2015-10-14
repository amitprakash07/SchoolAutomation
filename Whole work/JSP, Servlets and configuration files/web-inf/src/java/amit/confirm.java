/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package amit;
import java.util.*;
//import javax.servlet.*;
import javax.servlet.*;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.*;

/**
 *
 * @author welcome
 */
public class confirm extends HttpServlet{
    String s=new String();
    //public Enumeration e;
    public void doPost(HttpServletRequest request,HttpServletResponse response)
            throws ServletException,IOException  {
            HttpSession session=request.getSession();
            Enumeration e=session.getAttributeNames();
            if(e.hasMoreElements()){
            StudentTO sto=new StudentTO();
            s=request.getParameter("stud_first_name");
            sto.setFname(s);
            s=request.getParameter("stud_middle_name");
            sto.setMname(s);
            s=request.getParameter("stud_last_name");
            sto.setLname(s);
            s=request.getParameter("day");
            sto.setDay(s);
            s=request.getParameter("month");
            sto.setMonth(s);
            s=request.getParameter("year");
            sto.setYear(s);
            s=request.getParameter("sex");
            sto.setSex(s);
            s=request.getParameter("class");
            sto.setClas(s);
            s=request.getParameter("sec");
            sto.setSec(s);
            s=request.getParameter("father_name");
            sto.setFather(s);
            s=request.getParameter("father_occupation");
            sto.setFoccupation(s);
            s=request.getParameter("mother_name");
            sto.setMother(s);
            s=request.getParameter("mother_occupation");
            sto.setMoccupation(s);
            s=request.getParameter("address");
            sto.setAddress(s);
            s=request.getParameter("annual_income");
            float f;
            if(s.equals("Below 50000")){f=50000;}
            else if(s.equals("50000-100000")){f=100000;}
            else if(s.equals("100000-200000")){f=200000;}
            else f=250000;
            sto.setIncome(f);
            s=request.getParameter("no_of_brother");
            if(!s.equals("")){sto.setNb(Integer.parseInt(s));}
            s=request.getParameter("no_of_sister");
            if(!s.equals("")){sto.setNs(Integer.parseInt(s));}
            s=request.getParameter("phone_no");
            if(!s.equals("")){sto.setP(Long.parseLong(s));}
            s=request.getParameter("econt_no");
            if(!s.equals("")){sto.setEp(Long.parseLong(s));}
            sto.setDob(sto.getDay()+"-"+sto.getMonth()+"-"+sto.getYear());
            Calendar calendar=Calendar.getInstance();
            String months[] = {"Jan", "Feb", "Mar", "Apr","May", "Jun", "Jul", "Aug","Sep", "Oct", "Nov", "Dec"};
            sto.setDoa(calendar.get(Calendar.DATE)
                  +"-"+months[calendar.get(Calendar.MONTH)]+"-"+calendar.get(Calendar.YEAR));
            session.setAttribute("STO",sto);
            //System.out.println("g2");
            RequestDispatcher r=request.getRequestDispatcher("/submit.jsp");
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

/**
 *
 * @author Amit
 */
