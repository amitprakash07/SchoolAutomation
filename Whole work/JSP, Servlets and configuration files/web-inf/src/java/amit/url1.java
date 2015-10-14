/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package amit;

/**
 *
 * @author Amit
 */
public class url1 {
        String a;
    public String getuserurl(String s)
    {
        if(s.equals("Accountant"))
            a=new String("/accountant.jsp");
        else if(s.equals("Student"))
            a=new String("/student.jsp");
        else if(s.equals("Class Teacher"))
            a=new String("/class_teacher.jsp");
        else if(s.equals("Administrator"))
            a=new String("/administrator.jsp");
        else if(s.equals("Staff"))
            a=new String("/staff.jsp");
        else if(s.equals("Librarian"))
            a=new String("/librarian.jsp");
        else if(s.equals("Teacher"))
            a=new String("/teacher.jsp");
        System.out.println("amit");
        return a;
    }
}
