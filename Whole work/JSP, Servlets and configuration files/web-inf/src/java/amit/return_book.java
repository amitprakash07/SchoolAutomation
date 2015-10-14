/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package amit;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;


/**
 *
 * @author Amit
 */
public class return_book extends HttpServlet{
    public void doPost(HttpServletRequest request,HttpServletResponse response)
            throws IOException,ServletException{
        HttpSession session=request.getSession();
        Enumeration e=session.getAttributeNames();
        if(e.hasMoreElements()){
            String book_id=request.getParameter("book_id");
            jdbcconnection j=new jdbcconnection();
            Calendar today_date=Calendar.getInstance();
            //System.out.println(today_date.get(2));
            //Calendar due_date=Calendar.getInstance();
            int fine=0;
            String message=new String();
            ArrayList a=new ArrayList();
            a=j.getData("select book_id,due_date from library_retrieval where book_id='"+book_id+"' and book_status='not_returned'");
            if(a.size()>0)
            {
                String date=a.get(1).toString();
                String []newdate=date.split("-");
                String []day=newdate[2].split(" ");
                //System.out.println(day[0]);
                //due_date.set(1,Integer.parseInt(newdate[0]));
                //due_date.set(2,Integer.parseInt(newdate[1]));
                //due_date.set(5,Integer.parseInt(day[0]));
                if(today_date.get(1)>Integer.parseInt(newdate[0]))
                {
                    fine+=((today_date.get(1)-Integer.parseInt(newdate[0]))*365);
                }
                if(today_date.get(2)>Integer.parseInt(newdate[1]))
                {
                    fine+=((today_date.get(1)-Integer.parseInt(newdate[1]))*30);
                }
                if(today_date.get(5)>Integer.parseInt(day[0]))
                {
                    fine+=(today_date.get(1)-Integer.parseInt(day[0]));
                }

                String[] months={"JAN","FEB","MAR","APR",
                            "MAY",
                            "JUN",
                            "JUL",
                            "AUG",
                            "SEP",
                            "OCT",
                            "NOV",
                            "DEC" };
                    String return_date=today_date.get(5)+"-"+months[today_date.get(2)]+"-"+today_date.get(1);
                j.insertData("update library_retrieval set book_status='returned',fine_status='not_paid',fine="+fine+",return_date='"+return_date+"' where book_id='"+book_id+"'");
                j.insertData("update library_book set status='on shelf' where book_id='"+book_id+"'");
                message="Book Returned";
          }else message="No such book was issued";
         PrintWriter out=response.getWriter();
        response.setContentType("text/html");
                    out.println("<html><head><title>Message</title></head>" +
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
