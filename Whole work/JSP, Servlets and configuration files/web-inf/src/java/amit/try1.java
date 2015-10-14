/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package amit;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
/**
 *
 * @author Amit
 */
public class try1 extends HttpServlet{
        public void doGet(HttpServletRequest request,HttpServletResponse response)
                throws ServletException,IOException {
            String s=request.getParameter("first");
            System.out.println(s);
            String s1=new String("amit");
            request.setAttribute("name",s1);

        }
}
