/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package amit;
import javax.servlet.http.*;
import java.util.ArrayList;
//import java.io.IOException;
import java.io.*;
import javax.servlet.*;
import java.util.Enumeration;



/**
 *
 * @author Amit
 */
public class book_issue extends HttpServlet{
    public void doPost(HttpServletRequest request,HttpServletResponse response)
            throws IOException,ServletException{
         //System.out.println(maxbook);
        HttpSession session=request.getSession();
        Enumeration e=session.getAttributeNames();
        if(e.hasMoreElements()){
         String b_id=request.getParameter("id");
         String book_id=request.getParameter("book_id");
         String issue_date=request.getParameter("issue_date");
         String due_date=request.getParameter("due_date");
         String message=new String();
         jdbcconnection j=new jdbcconnection();
         ArrayList a=j.getData("select book_id from library_book where book_id='"+book_id+"'");
         if(a.size()>0)
         {
            a= j.getData("select book_id from library_retrieval where book_id='"+book_id+"' and book_status='not_returned'");
         if(a.size()==0){
             j.insertData("insert into library_retrieval (s_id,book_id,issue_date,due_date,book_status)" +
                 "values ('"+b_id+"','"+book_id+"','"+issue_date+"','"+due_date+"','not_returned')");
             j.insertData("update library_book set status='out' where book_id='"+book_id+"'");
         message="Book Issued";}
         else{message="This book is already issued";}
         }
         else message="Book not present";
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
