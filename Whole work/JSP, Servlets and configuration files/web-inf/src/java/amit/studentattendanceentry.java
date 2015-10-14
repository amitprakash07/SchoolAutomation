/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package amit;
import javax.servlet.*;
import java.io.*;
import javax.servlet.http.*;
/**
 *
 * @author Amit
 */
public class studentattendanceentry extends HttpServlet{
    public void doPost(HttpServletRequest request,HttpServletResponse response)
        throws ServletException,IOException{
            StudentTO s=new StudentTO();
            int nos=Integer.parseInt(request.getParameter("nos"));
            String temp=new String();
            for(int k=0;k<nos;k++)
            {
                temp=request.getParameter("student["+k+"]").toString();
                
            }

    }

}
