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
public class bookrequired extends HttpServlet{
    public void doPost(HttpServletRequest request,HttpServletResponse response)
            throws ServletException,IOException{
        HttpSession session=request.getSession();
        Enumeration e=session.getAttributeNames();
        if(e.hasMoreElements()){
        Newbooks nb=new Newbooks();
        String str=new String();
        str=request.getParameter("book_name");
        nb.setBook_name(str);
        str=request.getParameter("author");
        nb.setAuthor(str);
        str=request.getParameter("publisher");
        nb.setPublisher(str);
        str=request.getParameter("quantity");
        nb.setQuantity(Integer.parseInt(str));
        str=request.getParameter("type");
        nb.setType(str);
        str=nb.insertnewbook();
        PrintWriter out=response.getWriter();
        response.setContentType("text/html");
                    out.println("<html><head><title>Error</title></head>" +
                            "<body bgcolor='#ffffcc'><p align='center'><img src='logo.bmp'></p>" +
                            "<p align='center'>"+str+"</body></html>");
    }else {
            PrintWriter out=response.getWriter();
            out.println("<html><head><title>Error</title></head>" +
                    "<body bgcolor='#ffffcc'><p align='center'><img src='logo.bmp'></p>" +
                    "<br><br><<p align='center'><strong>Please Login First</strong></p>"+
                "<p align='center'><a href='login.jsp'>Log In</a></p></html>");
      }

    
    
    }
}
