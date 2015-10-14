<html>
<head>
<title>accountant</title>
</head>
<body bgcolor='#ffffcc'>
<p align="center"><img src="logo.bmp"></p>
    
    <%try{String user=session.getAttribute("user_name").toString();%>

        <form method="get" action="logout">
        <p align="right"><strong>Welcome&nbsp;<%=user %></strong>
        &nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="Logout"></p>
        </form>

 

<br>


<fieldset>
    <legend align="center">Student</legend>
<table align="center" border="0" cellspacing="5">
    <form method="get" action="registration.jsp">
        <tr><td align="center"><input type="submit" value="New Student Admission" name="registration.jsp" id="registration.jsp" ></td></tr>
    </form>
<form method="get" action="ask" >
    <tr><td align="center"><input type="submit" value="Student Fee" name="link" id="link" ></td></tr>
</form>

<!form method="get" action="ask">
    <!tr><!td align="center"><!input type="submit" value="Update Student Profile" name="link" id="link">

<form method="get" action="ask">
    <tr><td align="center"><input type="submit" value="See student attendance" name="link" id="link" /></td></tr>
</form>

<form method="get" action="ask">
    <tr><td align="center"><input type="submit" value="See Student Profile" name="link" id="link" /></td></tr>
</form>
</table>
</fieldset>

<fieldset>
    <legend align="center">Employee</legend>
    <table align="center" border="0" cellspacing="5">
        <form method="get" action="new_employee.jsp">
            <tr><td align="center"><input type="submit" value="New Recruitment" name="link" id="link" /></td></tr>
        </form>

        <form method="get" action="ask">
            <tr><td align="center"><input type="submit" value="Employee Salary" name="link" id="link" /></td></tr>
        </form>

        <!form method="get" action="ask">
            <!tr><!td align="center"><!input type="submit" value="Update Employee Profile" name="link" id="link">

        <form method="get" action="ask">
            <tr><td align="center"><input type="submit" value="See Employee Attendance" name="link" id="link" /></td></tr>
        </form>

        <form method="get" action="ask">
            <tr><td align="center"><input type="submit" value="See Employee Profile" name="link" id="link" /></td></tr>
        </form>

    </table>
</fieldset>

<fieldset>
    <legend align="center">Library</legend>
<table align="center">
<form method="get" action="library.jsp">
    <tr><td align="center"><input type="submit" value="Library" name="link" id="link"></td></tr>
</form>
</table>

</fieldset>

<p>
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