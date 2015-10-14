<html>
<head>
<title>student</title>
<body bgcolor='#ffffcc'>
<p align="center"><img src="logo.bmp"></p>
<br><br><br>
<%try{String user=session.getAttribute("user_name").toString();%>
    <form method="get" action="logout">
        <p align="right"><strong>Welcome&nbsp;<%=user %></strong>
        &nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="Logout"></p>
    </form>


 <br><br><br>
<table align="center" border="0">
<tr>
<td align="center"><form method="get" action="student_info.jsp" >
    <input type="submit" value="See your personal information">
</form></td></tr>

<tr><td align="center"><form method="get" action="student_fee.jsp" >
    <input type="submit" value="See your fee and fines">
</form></td></tr>

<tr><td align="center"><form method="get" action="stud_attendance.jsp" >
    <input type="submit" value="See your attendance">
</form></td>

<tr><td align="center"><form method="get" action="ask" >
    <input type="submit" value="See your result" id="link" name="link">
</form></td>

<tr><td align="center"><form method="get" action="library.jsp" >
    <input type="submit" value="Library">
</form></td>

</table>







<br>
<br><br><br><br><br><br><br><br><br>
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



