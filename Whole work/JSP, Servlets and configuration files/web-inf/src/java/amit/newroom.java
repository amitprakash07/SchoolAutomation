/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package amit;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.ArrayList;
import java.util.Enumeration;
/**
 *
 * @author Amit
 */
public class newroom extends HttpServlet{
    public void doPost(HttpServletRequest request,HttpServletResponse response)
            throws ServletException,IOException{
        HttpSession session=request.getSession();
        Enumeration e=session.getAttributeNames();
        if(e.hasMoreElements()){
        String room_id =new String();
        String floor=new String();
        String description=new String();
        room_id=request.getParameter("room_id");
        floor =request.getParameter("floor");
        description=request.getParameter("description");
        jdbcconnection j=new jdbcconnection();
        String l=new String("','");
        ArrayList a=new ArrayList();
        String avail=new String("unused");
        a=j.getData("select room_id from room where room_id='"+room_id+"'");
        if(a.size()==0){
        int n=j.insertData("insert into room values ('"+room_id+l+floor+l+description+l+avail+"')");
        PrintWriter out=response.getWriter();
        response.setContentType("text/html");
        out.println("<html><head><title>Confirm</title></head>" +
                    "<body bgcolor='#ffffcc'><p align='center'><img src='logo.bmp'></p><p align=center>New Room Entry is successful</body></html>");
        }
        else{
            PrintWriter out=response.getWriter();
            out.println("<html><head><title>Error</title></head>" +
                    "<body bgcolor='#ffffcc'><p align='center'><img src='logo.bmp'></p><p align=center>Room Id already exist</body></html>");
        }
      }else {
            PrintWriter out=response.getWriter();
            out.println("<html><head><title>Error</title></head>" +
                    "<body bgcolor='#ffffcc'><p align='center'><img src='logo.bmp'></p>" +
                    "<br><br><<p align='center'><strong>Please Login First</strong></p>"+
                "<p align='center'><a href='login.jsp'>Log In</a></p></html>");
      }

    }

}
