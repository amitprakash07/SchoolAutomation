<html>
<head>
<title>Librarian</title>
<body bgcolor='#ffffcc'>
<p align="center"><img src="logo.bmp"></p>

   <%try{String user=session.getAttribute("user_name").toString();%>
    <form method="get" action="logout">
        <p align="right"><strong>Welcome&nbsp;<%=user %></strong>
        &nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="Logout"></p>
    </form>
    <p align="right"><strong>Welcome&nbsp;<%=user %></strong>
    



<br>
<br><br><br>

<table align="center" border="0">

<form method="get" action="book_search.jsp" >
<tr><td align="center"><input type="submit" value="Search Book"></td></tr>
</form>

<form method="get" action="ask">
<tr><td align="center"><input type="submit" value="Issue Book" name="link" id="link"></td></tr>
</form>

<form method="get" action="book_return.jsp">
<tr><td align="center"><input type="submit" value="Return Book" name="link" id="link"></td></tr>
</form>

<form method="get" action="new_book_entry.jsp">
<tr><td align="center"><input type="submit" value="New Book Entry"></td></tr>
</form>

<form method="get" action="book_required.jsp">
<tr><td align="center"><input type="submit" value="See Required Books"></td></tr>
</form>

<form method="get" action="new_book_required.jsp">
<tr><td align="center"><input type="submit" value="New required book entry"></td></tr>
</form>

<form method="get" action="ask">
<tr><td align="center"><input type="submit" value="See your attendance" name="link" id="link"></td></tr>
</form>

<form method="get" action="employee_info.jsp">
<tr><td align="center"><input type="submit" value="See Your Profile" name="link" id="link"></td></tr>
</form>

<br>
<form method="get" action="salary.jsp">
    <tr><td align="center"><input type="submit" value="See Your salary" name="link" id="link"></td></tr>
</form>

</table>

<br><br><br><br><br>
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