<%@page import="amit.jdbcconnection" %>
<%@page import="java.util.ArrayList" %>
<%@page import="amit.Book" %>

<html>
<head>
<title>New Book Entry</title>
</head>
<script src="formvalidation.js">
    
    </script>

 
<body bgcolor='#ffffcc'>
<p align="center"><img src="logo.bmp"></p>
<br>

    <%try{String user=session.getAttribute("user_name").toString();%>
    <form method="get" action="logout">
        <p align="right"><strong>Welcome&nbsp;<%=user %></strong>
        &nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="Logout"></p>
    </form>

<form method="get" action="librarian.jsp">
<p align="center">
</form>
<br>


<p align="center"><strong>New Book Details</strong>
<br>
<br>
<form name="form1" id="form1" method="post" action="newbook" onsubmit="return validate('book_name','book_type','author','price')">

<table align="center">

<%
    Book b=new Book();
    int n=b.countbook();
    String book_id="b-"+(++n);
%>


<tr><td>Book Id</td><td><input type="text" name="book_id" id="book_id" readonly value="<%=book_id%>"></td></tr>
<tr><td>Book Name</td>
<td><input type="text" name="book_name" id="book_name" size="30" onblur="validatetextfield('book_name')">*</td></tr>

<tr><td>Type</td>
<td>
    <select name="type" id="type">
    <option value="text book" selected>Text Book
    <option value="magazine">Magazine
    <option value="reference">Reference Book
    <option value="e-book">e-book
    <option value="novel">Novels
    </select>
</td></tr>
<tr><td>Author</td>
<td><input type="text" name="author" size="30" id="author" onblur="validatetextfield('author')">*</td></tr>
<tr><td>Publisher</td>
<td><input type="text" name="publisher" size="30" id="publisher"onblur="validatetextfield('publisher')">*</td></tr>

<tr>
<td>Section</td>
<td>
    <select name="section" id="section">
    <option value="literature" selected>Literature
    <option value="computer">Computer
    <option value="science">Science
    <option value="social science">Social Science
    <option value="maths">Mathematics
    
</select></td></tr>

<tr>
    <td>Shelf No.</td>
    <td><input type="text" name="shelf_no" id="shelf_no" onblur="validatetextfield('shelf_no')"></td>
</tr>


<tr><td>Price</td>
<td><input type="text" name="price" size="30" id="price"onblur="validateprice('price')">*</td>
</tr>
</table>
<p align="center" ><input type="submit" value="enter" onclick="return validate('book_name','book_type','author','publisher','price')"></p>
</form>


<p><strong>* Mandatory Fields</strong></p>

<br><br><br>
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