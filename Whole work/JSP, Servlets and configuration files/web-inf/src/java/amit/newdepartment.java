/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package amit;
import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
/**
 *
 * @author Amit
 */
public class newdepartment extends HttpServlet{
            public void doPost(HttpServletRequest request,HttpServletResponse response)
                    throws ServletException,IOException{
                HttpSession session=request.getSession();
                Enumeration e=session.getAttributeNames();
                if(e.hasMoreElements()){
                DepartmentTO d=new DepartmentTO();
                jdbcconnection j=new jdbcconnection();
                String message=new String();
                //message=null;
                String s=new String();
                String l=new String("','");
                s=request.getParameter("dept_id");
                d.setDept_id(s);
                s=request.getParameter("dept_name");
                d.setDept_name(s);
                s=request.getParameter("depart_expense");
                d.setDepart_expense(Float.parseFloat(s));
                s=request.getParameter("room_id");
                d.setRoom_id(s);
                s=request.getParameter("dept_incharge");
                if(s.equals("none")){s="";}
                d.setDept_incharge(s);
                session.setAttribute("department",d);
                ArrayList a=new ArrayList();
                message=d.insertdepartment();
                PrintWriter out=response.getWriter();
                response.setContentType("text/html");
                    out.println("<html><head><title>Error</title></head>" +
                            "<body bgcolor='#ffffcc'><p align='center'><img src='logo.bmp'></p>" +
                            "<p align='center'>"+message+"</body></html>");
                /* a=j.getData("select dept_id from department where dept_id='"+d.getDept_id()+"'");
                if(a.size()!=0){
                    PrintWriter out=response.getWriter();
                         out.println("<html><head><title>Department confirm</title></head>" +
                                 "<body bgcolor='#ffffcc'><p align='center'><img src='logo.bmp'></p>" +
                                 "<p align='center'>Department already exists</body></html>");

                   }
                else
                {
                     if(!(d.getRoom_id().equals("")))
                     {
                       a=j.getData("select room_id from room where room_id='"+d.getRoom_id()+"'");
                            if(a.size()==0){message=new String("Room Id does not exists");}
                      }

                     if(!(d.getDept_incharge().equals("")))
                     {
                     a=j.getData("select emp_id from employee where emp_id='"+d.getDept_incharge()+"'");
                            if(a.size()==0){message=message+" Department Incharge does not exists";}
                     }

                     if(message.equals("")){
                         department dep =new department();
                         int n=dep.departmentinsert(d);
                         if(n!=0){message="New Department Entry is successful";}
                         else{message="Some error occurs in entry";}
                     }
                     PrintWriter out=response.getWriter();
                     out.println("<html><head><title>Department confirm</title></head>" +
                                 "<body bgcolor='#ffffcc'><p align='center'><img src='logo.bmp'></p>" +
                                 "<p align='center'>"+message+"</body></html>");

                }*/


                //RequestDispatcher r=request.getRequestDispatcher("/new_department_confirm.jsp");
                //r.forward(request,response);
                }else {
            PrintWriter out=response.getWriter();
            out.println("<html><head><title>Error</title></head>" +
                    "<body bgcolor='#ffffcc'><p align='center'><img src='logo.bmp'></p>" +
                    "<br><br><<p align='center'><strong>Please Login First</strong></p>"+
                "<p align='center'><a href='login.jsp'>Log In</a></p></html>");
      }

    }

}
