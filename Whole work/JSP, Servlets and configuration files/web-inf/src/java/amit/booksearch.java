/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package amit;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.ArrayList;
import java.io.*;
import java.util.Enumeration;

/**
 *
 * @author Amit
 */
public class booksearch extends HttpServlet{
    public void doGet(HttpServletRequest request,HttpServletResponse response)
        throws ServletException,IOException{
        HttpSession session=request.getSession();
        Enumeration e=session.getAttributeNames();
        if(e.hasMoreElements()){
        String keyword=request.getParameter("keyword").toString();
        int choice=Integer.parseInt(request.getParameter("type").toString());
        jdbcconnection j=new jdbcconnection();
        System.out.println(choice);
        ArrayList a=new ArrayList();
        switch (choice)
        {
            case 1:
                a=j.getData("select * from library_book where book_name like '"+keyword+"%' order by book_id");
                break;
            case 2:
                a=j.getData("select * from library_book where type like '"+keyword+"%' order by book_id");
                break;
            case 3:
                a=j.getData("select * from library_book where publisher like '"+keyword+"%' order by book_id");
                break;
            case 4:
                a=j.getData("select * from library_book where author like '"+keyword+"%' order by book_id");
                break;
        }
        session.setAttribute("book",a);
        RequestDispatcher r=request.getRequestDispatcher("book_search.jsp");
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
