/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package amit;
import javax.servlet.http.*;
import javax.servlet.*;
import java.io.*;

/**
 *
 * @author Amit
 */
public class logout extends HttpServlet{
    public void doGet(HttpServletRequest request,HttpServletResponse response)
            throws ServletException,IOException{
        HttpSession session=request.getSession();
        session.invalidate();
        RequestDispatcher r=request.getRequestDispatcher("home.jsp");
        r.forward(request, response);

    }
}
