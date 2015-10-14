<html>
<head>
<title>Book Return</title>
</head>
<script src="formvalidation.js"></script>
<body bgcolor='#ffffcc' onload="setfocus('book_id')">
<p align="center"><img src="logo.bmp"></p>
    <%try{String user=session.getAttribute("user_name").toString();%>
    <form method="get" action="logout">
        <p align="right"><strong>Welcome&nbsp;<%=user %></strong>
        &nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="Logout"></p>
    </form>
    
    



<br>
<form method="get" action="librarian.jsp">
<p align="center">
</form>
<br>
<br>
    
<form method="post" action="return_book" onsubmit="return (validate('book_id')&&validateid('book_id'))">
<p align="center"><strong>Book Id</strong>&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="book_id" id="book_id" onblur="validateid('book_id')">*</p>
<br>
<p align="center"><input type="submit" value="Return Book" onclick="return (validate('book_id')&& validateid('book_id'))">
</form>





<p><strong>* Mandatory Fields</strong></p>
<br>
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