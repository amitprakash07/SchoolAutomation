<%@page import="amit.jdbcconnection,java.util.ArrayList,java.util.Calendar,java.util.Date" %>


<html>
    <head>
        <title>Book Issue</title>
    </head>
    <script src="formvalidation.js"></script>
    </head>
    <script>
        function load(form_name,focus_field)
        {
            
            setfocus(focus_field);
        }
    </script>
    <body bgcolor='#ffffcc'>
        <p align="center"><img src="logo.bmp"></p>

        <%try{String user=session.getAttribute("user_name").toString();%>
    <form method="get" action="logout">
        <p align="right"><strong>Welcome&nbsp;<%=user %></strong>
        &nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="Logout"></p>
    </form>
        
        
        

        <br>
        <form method="get" action="librarian.jsp">
            
        </form>
        <br>
        <p align="center"><strong>Issue Book Details</strong></p>
        <br>
        <form method="post" action="book_issue" id="issue_book_form" onsubmit="return validate('id','book_id')">


            <table align="center" border="0">

                <%
                    String b_id=session.getAttribute("s_id").toString();
                    String idtype=session.getAttribute("idtype").toString();
                    jdbcconnection j=new jdbcconnection();
                    ArrayList a=new ArrayList();
                    if(idtype.equals("student")){
                    a=j.getData("select first_name||' '||middle_name||' '||last_name from student where s_id='"+b_id+"'");
                    }else{
                    a=j.getData("select first_name||' '||middle_name||' '||last_name from employee where emp_id='"+b_id+"'");
                      }
                 %>
                <tr><td>Borrower's Id</td>
                <td><input type="text" name="id" id="id" size="30" onblur="validateid('id')" readonly value="<%=b_id%>" >*</td></tr>
                <tr><td>Borrower's Name</td>
                <td><input type="text" name="issued_to" id="issued_to" size="30" onblur="validatetextfield('issued_to')" readonly value="<%=a.get(0)%>"></td></tr>
                <tr><td>Book Id</td>
                <td><input type="text" name="book_id" size="30" id="book_id" onblur="validateid('book_id')">*</td></tr>
               

                <%
                    Calendar c=Calendar.getInstance();
                    //System.out.println(c.get(5));
                    //System.out.println(c.get(2));
                    //System.out.println(c.get(1));
                    String[] months={"JAN","FEB","MAR","APR",
                            "MAY",
                            "JUN",
                            "JUL",
                            "AUG",
                            "SEP",
                            "OCT",
                            "NOV",
                            "DEC" };
                    String issuedate=c.get(5)+"-"+months[c.get(2)]+"-"+c.get(1);
                    c.add(Calendar.DATE,7);
                    String returndate=c.get(5)+"-"+months[c.get(2)]+"-"+c.get(1);
                    int maxbook=Integer.parseInt(getServletContext().getInitParameter("maxbook"));
                    System.out.println(maxbook);

                %>

                <tr><td>Issue Date</td>
                <td><input type="text" name="issue_date" size="30" id="issue_date" value="<%=issuedate%>" readonly></td></tr>
                <tr><td>Return Date</td>
                <td><input type="text" name="due_date" size="30" id="due_date" value="<%=returndate%>" readonly></td></tr>

  <%
     a=j.getData("select count(*) from library_retrieval where s_id='"+b_id+"' and book_status='not_returned'");
  %>

 <tr><td>Total Book Issued</td>
 <td><input type="text" readonly name="book_no" id="book_no" value="<%=a.get(0)%>"></td></tr>
            </table>
            <p align="center"><input type="submit" value="Issue" onclick="return (validate('id','book_id')&& countbook())"></p>
        </form>
<script>
    function countbook()
    {
        var book_no=document.getElementById("book_no").value;
        if(book_no<<%=maxbook%>)
        {
            return true;
        }
        else
            {
                alert("already <%=maxbook%> books issued");
                return false;
            }
    }

</script>
 <br><br>
     <div id="div1"></div>
        <br><br>
        <p><strong>* Mandatory Fields</strong></p>
        <br><br>
        <hr>
    <p align="center"><em>&copy;&nbsp;Amit,Gaurangi,Kawaljot,Kirti@HCL</em></p>
    <%}catch(Exception e){%>
<br>
<p align="center">
    <strong>Please Login First</strong>
</p>
<br>
    <p align="center"><a href="login.jsp">Log In</a></p>
<%}%>

    </body>
</html>