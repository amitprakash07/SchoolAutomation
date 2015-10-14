/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package amit;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;
//import java.util.ArrayList;
/**
 *
 * @author Amit
 */
public class newbook extends HttpServlet{
    public void doPost(HttpServletRequest request,HttpServletResponse response)
            throws ServletException,IOException{
        HttpSession session=request.getSession();
        Enumeration e=session.getAttributeNames();
        //System.out.print("tyyyt");
        if(e.hasMoreElements()){
          //  System.out.print("tyyyt");
        String str=new String();
        Book b=new Book();
        str=request.getParameter("book_id");
        b.setBook_id(str);
        str=request.getParameter("book_name").toLowerCase();
        b.setBook_name(str);
        str=request.getParameter("type").toLowerCase();
        b.setType(str);
        str=request.getParameter("price");
        b.setPrice(Integer.parseInt(str));
        str=request.getParameter("publisher").toLowerCase();
        b.setPublisher(str);
        str=request.getParameter("author").toLowerCase();
        b.setAuthor(str);
        str=request.getParameter("section").toLowerCase();
        b.setSection(str);
        str=request.getParameter("shelf_no").toLowerCase();
        b.setShelf_no(str);
        String message=new String(b.insertbook());
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
