/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package amit;
import javax.servlet.http.*;
import javax.servlet.*;
import java.io.*;
import java.util.Enumeration;
//import java.Math.*;

/**
 *
 * @author Amit
 */
public class result extends HttpServlet{
    public void doPost(HttpServletRequest request,HttpServletResponse response)
            throws ServletException,IOException{
        HttpSession session=request.getSession();
        Enumeration e1=session.getAttributeNames();
        if(e1.hasMoreElements()){
        String s_id=request.getParameter("s_id").toString();
        int no_of_subject=Integer.parseInt(session.getAttribute("no_of_subject").toString());
        int term=Integer.parseInt(request.getParameter("term").toString());
        String class_id=request.getParameter("class_id");
        Enumeration e;
        check c=new check();
        e=request.getParameterNames();
        String subject=new String();
        int marks;
        int i=0;
        int total=0;
        String message=new String();
        jdbcconnection j=new jdbcconnection();
        if(!c.isstudentresultentered(s_id,term))
        {
            j.insertData("insert into result (s_id,class_id,term,total,percentage,result) values ('"+s_id+"','"+class_id+"',"+term+",0,0,'fail')");
             while(e.hasMoreElements())
            {
                String str=e.nextElement().toString();
                if(!((str.equals("class_id"))||(str.equals("s_id"))||(str.equals("term"))))
                {
                    i++;
                    marks=Integer.parseInt(request.getParameter(str));
                    j.insertData("update result set "+str+"="+marks+" where s_id='"+s_id+"' and term="+term);
                    total+=marks;
                }
            }
          int per=Math.round((total/i));
          String result=new String();
          if(per>50)result="pass";else result="fail";
          j.insertData("update result set total="+total+",percentage="+per+",result='"+result+"' where s_id='"+s_id+"' and term="+term);
          message="Result is saved successfully";
        }else message="Result is already entered of this student";

        PrintWriter out=response.getWriter();
                    response.setContentType("text/html");
                    out.println("<html><head><title>Result</title></head>" +
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
