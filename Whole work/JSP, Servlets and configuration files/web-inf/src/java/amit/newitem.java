/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package amit;
import javax.servlet.*;
import java.io.*;
import javax.servlet.http.*;
//import java.util.ArrayList;
import java.util.*;
/**
 *
 * @author Amit
 */
public class newitem extends HttpServlet{

    public void doPost(HttpServletRequest request,HttpServletResponse response)
            throws ServletException,IOException{
        HttpSession session=request.getSession();
            Enumeration e=session.getAttributeNames();
        if(e.hasMoreElements()){
        String str=new String();
        Items i=new Items();
        str=request.getParameter("item_name");
        i.setItem_name(str);
        str=request.getParameter("item_code");
        i.setItem_code(str);
        str=request.getParameter("price");
        i.setPrice(Float.parseFloat(str));
        str=request.getParameter("quantity");
        i.setQuantity(Integer.parseInt(str));
        Calendar cal=Calendar.getInstance();
        String months[] = {"Jan", "Feb", "Mar", "Apr","May", "Jun", "Jul", "Aug","Sep", "Oct", "Nov", "Dec"};
        i.setPurchase_date(cal.get(Calendar.DATE)+"-"+months[cal.get(Calendar.MONTH)]+"-"+cal.get(Calendar.YEAR));
        str=request.getParameter("company");
        i.setCompany(str);
        str=request.getParameter("dept_id");
        i.setDept_id(str);
        String message=new String(i.insertitem());
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
