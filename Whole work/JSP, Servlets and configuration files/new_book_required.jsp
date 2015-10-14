<html>
<head>
<title>Book Requirement</title>
<script src="formvalidation.js"></script>
</head>

<body bgcolor='#ffffcc' onload="setfocus('book_name')">
<p align="center"><img src="logo.bmp"></p>

<%try{String user=session.getAttribute("user_name").toString();%>
    <form method="get" action="logout">
        <p align="right"><strong>Welcome&nbsp;<%=user %></strong>
        &nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="Logout"></p>
    </form>

<br>

<p align="center"><strong>Enter new required book details</strong>
<br>


<br>
<br>

<form method="post" action="bookrequired" onsubmit="return (validate('book_name','author','publisher') && validatetextfield('book_name') && validatetextfield('author') && validatetextfield('publisher') && validatetextfield('type'))">
<table align="center">
<tr><td>Book name
<td><input type="text" name="book_name"  id="book_name" onblur="validatetextfield('book_name')">*
<tr><td>Author
<td><input type="text" name="author" id="author" onblur="validatetextfield('author')">*
<tr><td>Publisher
<td><input type="text" name="publisher" id="publisher" onblur="validatetextfield('publisher')">*
<tr><td>Type
<td><input type="text" name="type"  id="type" onblur="validatetextfield('type')">
<tr><td>Quantity
<td><select name="quantity" size="1" id="quantity">
<option selected>1
<option>2
<option>3
<option>4
<option>5
<option>6
<option>7
<option>8
<option>9
<option>10
</select>
</table>

<p align="center"><input type="submit" value="Enter" onclick="return (validate('book_name','author','publisher') && validatetextfield('book_name') && validatetextfield('author') && validatetextfield('publisher') && validatetextfield('type'))">

</form>
 






<BR>
<br><br><br>
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