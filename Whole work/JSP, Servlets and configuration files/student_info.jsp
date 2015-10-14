<%@page import="amit.jdbcconnection" %>
<%@page import="amit.StudentTO" %>
<%@page import="java.util.ArrayList" %>
<html>
<head>
<title>student information</title>
<body bgcolor='#ffffcc'>
<p align="center"><img src="logo.bmp"></p><br>
<%try{String user=session.getAttribute("user_name").toString();%>
    <form method="get" action="logout">
        <p align="right"><strong>Welcome&nbsp;<%=user %></strong>
        &nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="Logout"></p>
    </form>


<p align="center"><strong><a href="class_teacher.jsp">Home</a></strong></p>

<br>
    <%
        jdbcconnection j=new jdbcconnection();
        StudentTO s=new StudentTO();
        s.setSid(session.getAttribute("s_id").toString());
        //s.setSid("20090023");
        s.setStudent();
        System.out.println(s.getDob());
        String sid=new String();
        //sid=session.getAttribute("s_id").toString();
        //ArrayList a=new ArrayList();
        //a=j.getData("select * from student where s_id='"+sid+"'");
    %>

<table align="center" cellpadding="10" >

    <tr><td>Student Id<td><input type="text" size="25" value="<%=s.getSid()%>" readonly />
<tr><td>First Name<td><input type="text" readonly size="25" value="<%=s.getFname()%>" />
<tr><td>Middle name<td><input type="text" readonly size="25" value="<%=s.getMname()%>"/>
<tr><td>Last Name<td><input type="text" readonly size="25" value="<%=s.getLname()%>" />
<tr><td>Date of birth
<td><input type="text" size="25" value="<%=s.getDob()%>" readonly />


<tr><td>Sex


<td><input type="text" size="25" value="<%=s.getSex()%>" readonly />

<tr><td><tr><td>Father Name<td><input type="text" size="25" value="<%=s.getFather()%>" readonly />
<tr><td>Father Occupation<td><input type="text" size="25" value="<%=s.getFoccupation()%>" readonly />
<tr><td>Mother Name<td><input type="text" value="<%=s.getMother()%> " size="25" readonly />
<tr><td>Mother Occupation<td><input type="text" size="25" value="<%=s.getMoccupation()%>" readonly />

<tr><td>Address
<td><input type="text" size="25" value="<%=s.getAddress()%>" readonly />





<tr><td>Annual income<td><input type="text" value="<%=s.getIncome()%>" readonly />

<tr><td>Brother<td><input type="text" value="<%=s.getNb()%>" readonly />
<tr><td>Sister
<td><input type="text" size="25" value="<%=s.getNs()%>" readonly />
<tr><td>phone
<td><input type="text" size="25" value="<%=s.getP()%>" readonly />
<tr><td>Emergency No.

<td><input type="text" size="25" value="<%=s.getEp()%>" readonly />
<tr><td>Photo
<td>4376367


</table>
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
