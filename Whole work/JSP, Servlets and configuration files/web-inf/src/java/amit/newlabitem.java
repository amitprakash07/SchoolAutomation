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
public class newlabitem extends HttpServlet{
        public void doPost(HttpServletRequest request,HttpServletResponse response)
                throws ServletException,IOException{
            HttpSession session=request.getSession();
            Enumeration e=session.getAttributeNames();
            if(e.hasMoreElements()){
            String message=new String();
            String str=new String();
            Labitem li=new Labitem();
            str=request.getParameter("lab_id");
            li.setLab_id(str);
            str=request.getParameter("item_code");
            li.setItem_code(str);
            str=request.getParameter("item_name");
            li.setItem_name(str);
            str=request.getParameter("price");
            li.setPrice(Float.parseFloat(str));
            str=request.getParameter("quantity");
            li.setQuantity(Integer.parseInt(str));
            li.setTotal();
            message=li.insertlabitem();
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
