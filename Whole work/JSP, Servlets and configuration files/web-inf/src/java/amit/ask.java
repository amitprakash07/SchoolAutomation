/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package amit;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.Enumeration;
/**
 *
 * @author Amit
 */
public class ask extends HttpServlet{
        public void doGet(HttpServletRequest request,HttpServletResponse response)
                    throws ServletException,IOException{
            String s=request.getParameter("link");
            String link=new String();
            String type=new String();
            HttpSession session=request.getSession();
            //System.out.println(session.isNew());
            Enumeration e=session.getAttributeNames();
            //System.out.println("tttttttt");
            if(e.hasMoreElements()){
            String user_type=session.getAttribute("user_type").toString();
            //System.out.println("tttttttt");
                if(s.equals("Student Fee")){link="/student_fee.jsp";type="student";}
                else if(s.equals("Update Student Profile")){link="/student_update.jsp";type="student";}
                else if(s.equals("See student attendance")){link="/stud_attendance.jsp";type="student";}
                else if(s.equals("See Student Profile")){link="/student_info.jsp";type="student";}
                else if(s.equals("Employee Salary")){link="/salary.jsp";type="employee";}
                else if(s.equals("Update Employee Profile")){link="/employee_update.jsp";type="employee";}
                else if(s.equals("See Employee Attendance")){link="/employee_attendance.jsp";type="employee";}
                else if(s.equals("See Employee Profile")){link="/employee_info.jsp";type="employee";}
                else if(s.equals("Return Book")){link="/book_return.jsp";}
                else if(s.equals("Issue Book")){link="/book_issue.jsp";}
                else if(s.equals("Enter student attendance")){link="/enter_student_attendance.jsp";type="student";}
                else if(s.equals("Update student attendance")){link="/stud_attend_update.jsp";type="student";}
                else if(s.equals("See student result")){link="/result.jsp";type="student";}
                else if(s.equals("Enter student result")){link="/stud_result_entry.jsp";type="student";}
                else if(s.equals("Update result")){link="/stud_result_update.jsp";type="student";}
                else if(s.equals("See Employee Attendance")){link="/employee_attendance.jsp";type="employee";}
                else if(s.equals("See your attendance")){link="/employee_attendance.jsp";type="employee";}
                else if(s.equals("See your result")){link="/result.jsp";type="student";}
                else if(s.equals("Book Retrievals"))
                     {
                        link="/library_retrievals.jsp";
                        if(user_type.equals("student"))type="student";
                        else type="employee";
                     }

            session.setAttribute("link",link);
            session.setAttribute("idtype",type);
            RequestDispatcher r=request.getRequestDispatcher("/ask.jsp");
            r.forward(request, response);
            }
            else{
            PrintWriter out=response.getWriter();
            response.setContentType("text/html");
                    out.println("<html><head><title>Error</title></head>" +
                            "<body bgcolor='#ffffcc'><p align='center'><img src='logo.bmp'></p>" +
                            "<p align='center'>Please Login First" +
                            "<p align='center'><a href='login.jsp'>Login</a></body></html>");

            }

        }
}
