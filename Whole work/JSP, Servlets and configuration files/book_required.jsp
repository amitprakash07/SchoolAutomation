<%@page import="amit.jdbcconnection,java.util.ArrayList" %>

<html>
<head>
<title>Book required</title>
</head>
<body bgcolor='#ffffcc'>
    
<p align="center"><img src="logo.bmp"></p>
<%try{String user=session.getAttribute("user_name").toString();%>
    <form method="get" action="logout">
        <p align="right"><strong>Welcome&nbsp;<%=user %></strong>
        &nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="Logout"></p>
    </form>
<br><br>

    <br><br><br><br><br><br><br><br>
<table width="100%" border="1">
    <tr><td>Book Name</td>
    <td>Author</td>
    <td>Publisher</td>
    <td>Quantity</td>
    <td>Type</td>
    </tr>

<%
    jdbcconnection j=new jdbcconnection();
    ArrayList a=new ArrayList();
    a=j.getData("select * from library_req order by book_name");
    for(int i=0;i<a.size();i=i+5){
%>

<tr>
<td><%=a.get(i)%></td>
<td><%=a.get(i+1)%></td>
<td><%=a.get(i+2)%></td>
<td><%=a.get(i+3)%></td>
<td><%=a.get(i+4)%></td>
</tr>
<%}%>

</table>

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