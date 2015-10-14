/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package amit;

/**
 *
 * @author Amit
 */
public class LoginTO {
            private String username;
            private String password;
            private String user_type;

    /**
     * @return the username
     */
    public String getUsername() {
        return username;
    }

    /**
     * @param username the username to set
     */
    public void setUsername(String username) {
        this.username = username;
    }

    /**
     * @return the password
     */
    public String getPassword() {
        return password;
    }

    /**
     * @param password the password to set
     */
    public void setPassword(String password) {
        this.password = password;
    }

    /**
     * @return the user_type
     */
    public String getUser_type() {
        return user_type;
    }

    /**
     * @param user_type the user_type to set
     */
    public void setUser_type(String user_type) {
        this.user_type = user_type;
    }

    public void insertlogin(){
        jdbcconnection j=new jdbcconnection();
        String c=new String(",");
        String i=new String("'");
        String l=new String("','");
        j.insertData("insert into login values('"+username+l+password+l+user_type+i+")");
    }

    public String updatepassword(String password){
        jdbcconnection j=new jdbcconnection();
        String message=new String("");
        int n=j.insertData("update login set password='"+password+"' where username='"+username+"'");
        if(n==1){message="Ur password is changed";}
        return message;
    }

}
