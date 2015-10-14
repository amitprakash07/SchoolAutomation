<%@page import="amit.jdbcconnection,java.util.ArrayList,java.util.Calendar" %>

<html>
<head>
<title>Staff</title>
</head>
<body bgcolor='#ffffcc'>
<p align="center"><img src="logo.bmp"></p>
 <%try{String user=session.getAttribute("user_name").toString();%>
    <form method="get" action="logout">
        <p align="right"><strong>Welcome&nbsp;<%=user %></strong>
        &nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="Logout"></p>
    </form>

<br>
<table align="center" border="0" width="100%">

<form method="get" action="employee_info.jsp">
<tr><td align="center"><input type="submit" value="See Your Profile" name="link" id="link"></form>
<br>

<form method="get" action="ask">
<tr><td align="center"><input type="submit" value="See your attendance" name="link" id="link"></form>

<form method="get" action="library.jsp">
    <tr><td align="center"><input type="submit" value="Library" name="link" id="link"></td></tr>
</form>

<br>
<form method="get" action="salary.jsp">
    <tr><td align="center"><input type="submit" value="See Your salary" name="link" id="link"></td></tr>
</form>

</table>

<hr>
    <%}catch(Exception e){%>
<br>
<p align="center">
    <strong>Please Login First</strong>
</p>
<br>
    <p align="center"><a href="login.jsp">Log In</a></p>
<%}%>

<p align="center"><em>&copy;&nbsp;Amit,Gaurangi,Kawaljot,Kirti@HCL</em></p>

</body>
</html>