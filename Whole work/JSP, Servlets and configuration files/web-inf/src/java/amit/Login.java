/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package amit;
//import javax.servlet.*;
import javax.servlet.*;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.*;
import java.util.ArrayList;

/**
 *
 * @author welcome
 */
public class Login extends HttpServlet{
        //url1 u1;
        String user_name=new String();
        String user_type=new String();
        String password=new String();
        RequestDispatcher r;
    public void doPost(HttpServletRequest request,HttpServletResponse response )
            throws ServletException,IOException {
        user_type=request.getParameter("user_type");
        HttpSession session=request.getSession();
        //PrintWriter out=response.getWriter();
        LoginTO log=new LoginTO();
        check ch=new check();
        System.out.println(user_type);
        log.setUser_type(user_type);
        session.setAttribute("user_type",user_type);
        user_name=request.getParameter("user_name");
        log.setUsername(user_name);
        //ArrayList a=new ArrayList();
        //System.out.println(user_name);
        jdbcconnection j=new jdbcconnection();
        /*if(!(user_name.equals("administrator")|| user_name.equals("accountant")))
        {
            if(user_type.equals("student")){
                a=j.getData("select first_name from student where s_id='"+user_name+"'");
                user_name=a.get(0).toString();
            }
            else{
                a=j.getData("select first_name from employee where emp_id='"+user_name+"'");
                user_name=a.get(0).toString();
            }
        }*/
        session.setAttribute("user_name",user_name);
        session.setAttribute("s_id",user_name);
        session.setAttribute("book","none");
        password=request.getParameter("password");
        log.setPassword(password);
        if(ch.isuser(log))
        {
           if(user_type.equals("accountant")){
            //a=new String("/accountant.jsp");
            r=request.getRequestDispatcher("/accountant.jsp");}
          else if(user_type.equals("student")){
            //a=new String("/student.jsp");
            r=request.getRequestDispatcher("/student.jsp");}
        else if(user_type.equals("class Teacher")){
            //a=new String("/class_teacher.jsp");
            r=request.getRequestDispatcher("/class_teacher.jsp");}
        else if(user_type.equals("administrator")){
            //a=new String("/administrator.jsp");
            r=request.getRequestDispatcher("/administrator.jsp");}
        else if(user_type.equals("staff")){
            //a=new String("/staff.jsp");
            r=request.getRequestDispatcher("/staff.jsp");}
        else if(user_type.equals("librarian")){
            //a=new String("/librarian.jsp");
            r=request.getRequestDispatcher("/librarian.jsp");}
        else if(user_type.equals("teacher")){
            //a=new String("/teacher.jsp");
            r=request.getRequestDispatcher("/teacher.jsp");}
        //RequestDispatcher r=request.getRequestDispatcher(link);
        //out.println("<html><body bgcolor='#ffffcc'>"+user+"</body></html");

        r.forward(request, response);
        }
        else {PrintWriter out=response.getWriter();
        response.setContentType("text/html");
                    out.println("<html><head><title>Error</title></head>" +
                            "<body bgcolor='#ffffcc'><p align='center'><img src='logo.bmp'></p>" +
                            "<p align='center'>"+ch.getMessage()+"</body></html>");
   }
        }

}
