<html>
<head>
<title>Library</title>
<body bgcolor='#ffffcc'>
<p align="center"><img src="logo.bmp"></p>

    <%try{String user=session.getAttribute("user_name").toString();%>
    <form method="get" action="logout">
        <p align="right"><strong>Welcome&nbsp;<%=user %></strong>
        &nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="Logout"></p>
    </form>


<br><br><br><br>
<p>
<table align="center" border="0">
<form method=get  action="book_search.jsp">
<tr><td align="center"><input type="submit" value="Search Book"></form>
<form method="get" action="ask">
<tr><td align="center"><input type="submit" value="Book Retrievals" id="link" name="link"></form>
<form method="get" action="new_book_required.jsp">
<tr><td align="center"><input type="submit" value="New required book entry"></form>
</table>




<BR>
<br><br><br><br><br><br>
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