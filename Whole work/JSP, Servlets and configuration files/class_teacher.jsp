<html>
<head>
<title>class Teacher</title>
</head>
<body bgcolor='#ffffcc'>
<p align="center"><img src="logo.bmp"></p>

     <%try{String user=session.getAttribute("user_name").toString();%>
    <form method="get" action="logout">
        <p align="right"><strong>Welcome&nbsp;<%=user %></strong>
        &nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="Logout"></p>
    </form>
    <p align="right"><strong>Welcome&nbsp;<%=user %></strong>
    


<table align="center" border="0" width="100%">

<form method="get" action="employee_info.jsp">
<tr><td align="center"><input type="submit" value="See Your Profile" name="link" id="link"></td></tr>
</form>
<tr></tr><tr></tr>
<form method="get" action="ask">
<tr><td align="center"><input type="submit" value="See your attendance" name="link" id="link"></td></tr>
</form>
<tr></tr><tr></tr>
<form method="get" action="ask">
<tr><td align="center"><input type="submit" value="See Student Profile" name="link" id="link"></td></tr></form>
<tr></tr><tr></tr><br>
<form method="get" action="ask">
<tr><td align="center"><input type="submit" value="See student attendance" name="link" id="link"></td></tr>
</form>
<br><tr></tr><tr></tr>

<form method="get" action="enter_class_attendance.jsp">
<tr><td align="center"><input type="submit" value="Enter Class attendance" name="link" id="link"></td></tr>
</form>
<br><tr></tr><tr></tr>
<form method="get" action="ask">
<tr><td align="center"><input type="submit" value="See student result" name="link" id="link"></td></tr>
</form>
<br><tr></tr><tr></tr>
<form method="get" action="ask">
<tr><td align="center"><input type="submit" value="Enter student result" name="link" id="link"></td></tr>
</form>
<tr></tr><tr></tr>
<br>
<form method="get" action="library.jsp">
    <tr><td align="center"><input type="submit" value="Library" name="link" id="link"></td></tr>
</form>

<br><tr></tr><tr></tr>
<form method="get" action="ask">
    <tr><td align="center"><input type="submit" value="Employee Salary" name="link" id="link"></td></tr>
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

<p align="center"><em>&copy;&nbsp;Amit,Gaurangi,Kawaljot,Kirti@HCL</em></p></body>
</html>