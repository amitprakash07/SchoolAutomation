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
public class newjob extends HttpServlet{
        public void doPost(HttpServletRequest request,HttpServletResponse response)
                throws ServletException,IOException{
            HttpSession session=request.getSession();
            Enumeration e=session.getAttributeNames();
            if(e.hasMoreElements()){

            String s=new String();
            jdbcconnection j=new jdbcconnection();
            ArrayList a=new ArrayList();
            JobTO job=new JobTO();
            s=request.getParameter("job_id");
            job.setJob_id(s);
            s=request.getParameter("job_name1");
            if(s.equals("other"))
            {
                s=request.getParameter("job_name2");
                job.setJob_name(s);
            }
            else job.setJob_name(s);
            System.out.println(job.getJob_name());
            s=request.getParameter("basic_sal");
            job.setBasic_sal(Float.parseFloat(s));
            s=request.getParameter("pf");
            job.setPf(Float.parseFloat(s));
            s=request.getParameter("da");
            job.setDa(Float.parseFloat(s));
            s=request.getParameter("hra");
            job.setHra(Float.parseFloat(s));
            s=request.getParameter("income_tax");
            job.setIncome_tax(Float.parseFloat(s));
            s=request.getParameter("department_id");
            job.setDept_id(s);
            //String m=new String(job.insertjob());
            //System.out.print(m);
            String message=new String();
            message =job.insertjob();
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
