<%@page import="java.util.ArrayList,amit.Book,amit.jdbcconnection,java.util.Enumeration" %>



<html>
<head>
<title>Search book</title>
<script src="formvalidation.js"></script>

</head>

<body bgcolor='#ffffcc' onload="setfocus('keyword')">
<p align="center"><img src="logo.bmp"></p>

    <%try{String user=session.getAttribute("user_name").toString();%>
    <form method="get" action="logout">
        <p align="right"><strong>Welcome&nbsp;<%=user %></strong>
        &nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="Logout"></p>
    </form>
    

<br><br>

<form method="get" action="librarian.jsp" >
<p align="center">
</form>



<form method="get" action="booksearch" name="form1" id="form1" onsubmit="return (validate('keyword') && validatetextfield('keyword'))" >
<table align="center" border="0" cellspacing="10" cellpadding="5">
<tr><td>Search by</td>

<td><select name="type" id="type" size="1">
<option selected value="1">Book Title
<option value="2">Book type
<option value="3">Publisher
<option value="4">Book Author
</select>
</td></tr>

<tr><td>Key Word</td>
<td><input type="text" name="keyword" size="30" id="keyword" onblur="validatetextfield('keyword')"></td></tr>

</table>

<p align="center"><input type="submit" value="Search" onclick="return (validate('keyword')&& validatetextfield('keyword'))"></p>
</form>
<br><br>

<%
    ArrayList booklist=new ArrayList();
    try{
    booklist=(ArrayList)session.getAttribute("book");
    if(booklist.size()>0){
%>

<table width="100%" border="1">

    <tr><th align="center">Book Id</th>
    <th align="center">Book Name</th>
    <th align="center">Type</th>
    <th align="center">Price</th>
    <th align="center">Publisher</th>
    <th align="center">Author</th>
    <th align="center">Section</th>
    <th align="center">Shelf</th>
    <th align="center">Status</th></tr>

    <% for(int i=0;i<booklist.size();i=i+9)
        { %>
    
    <tr>
        <td align="center"><%=booklist.get(i)%></td>
        <td align="center"><%=booklist.get(i+1)%></td>
        <td align="center"><%=booklist.get(i+2)%></td>
        <td align="center"><%=booklist.get(i+3)%></td>
        <td align="center"><%=booklist.get(i+4)%></td>
        <td align="center"><%=booklist.get(i+5)%></td>
        <td align="center"><%=booklist.get(i+6)%></td>
        <td align="center"><%=booklist.get(i+7)%></td>
        <td align="center"><%=booklist.get(i+8)%></td>
    </tr>

   <%}%>

</table>

<%}else{%>

<p align="center"><em>No Books Found</em></p>
<%}%>

<%
session.setAttribute("book","");
}catch(Exception e){}
%>

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