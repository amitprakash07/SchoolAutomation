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
public class recruitment extends HttpServlet{
        public void doPost(HttpServletRequest request,HttpServletResponse response)
                throws ServletException,IOException{

             //   System.out.print("amit");
                HttpSession session=request.getSession();
                Enumeration e1=session.getAttributeNames();
                if(e1.hasMoreElements()){
                String s=new String();
                EmployeeTO e=new EmployeeTO();
                jdbcconnection j=new jdbcconnection();
                ArrayList a=new ArrayList();
                String months[] = {"Jan", "Feb", "Mar", "Apr","May", "Jun", "Jul", "Aug","Sep", "Oct", "Nov", "Dec"};
                s=request.getParameter("emp_first_name");
                e.setFirst_name(s);//1
                //System.out.print("amit");
                s=request.getParameter("emp_middle_name");
                e.setMiddle_name(s);//2
                s=request.getParameter("emp_last_name");
                e.setLast_name(s);//3
                s=request.getParameter("job_type");
                e.setType(s);//4
                s=request.getParameter("address");
                e.setAddress(s);//5
                s=request.getParameter("phone");
                e.setPhone(Long.parseLong(s));//6
                s=request.getParameter("qualification");
                e.setQualification(s);//7
                s=request.getParameter("job_name");
                e.setJob_id(s);//8
                //System.out.print("amit");
                Calendar cal=Calendar.getInstance();
                s=cal.get(Calendar.DATE)+"-"+months[cal.get(Calendar.MONTH)]+"-"+cal.get(Calendar.YEAR);
                e.setHire_date(s);//9
                a=j.getData("select emp_id from employee");
                LoginTO log=new LoginTO();
                int size=a.size();
                if(size==0){e.setEmp_id("e-001");log.setUsername("e-001");}
                if(size>0&&size<=9){e.setEmp_id("e-00"+(size+1));log.setUsername("e-00"+(size+1));}
                if(size>=10&&size<=99){e.setEmp_id("e-0"+(size+1));log.setUsername("e-0"+(size+1));}
                if(size>=100){e.setEmp_id("e-"+(size+1));log.setUsername("e-"+(size+1));}
                log.setPassword(log.getUsername());
                if(e.getType().equals("teaching")){log.setUser_type("teacher");}
                else{log.setUser_type("staff");}
            //    System.out.println("amit");
                String message=new String();
                message=e.insertemployee();
                if(message.equals("New Employee Entry is successful")){
                //log.insertlogin();
                session.setAttribute("employee",e);
                RequestDispatcher r=request.getRequestDispatcher("/new_employee_info.jsp");
                r.forward(request,response);
                }
                else
                {
                    PrintWriter out=response.getWriter();
                    response.setContentType("text/html");
                    out.println("<html><head><title>Error</title></head>" +
                            "<body bgcolor='#ffffcc'><p align='center'><img src='logo.bmp'></p>" +
                            "<p align='center'>"+message+"</body></html>");
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
