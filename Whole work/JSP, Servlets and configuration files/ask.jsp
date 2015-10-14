<%-- u1
    Document   : ask
    Created on : Aug 24, 2009, 9:04:15 PM
    Author     : Amit
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Student Id</title>
    </head>
	<script src="formvalidation.js">

</script>

    <body bgcolor='#ffffcc' onload="setfocus('sid')">
<p align="center"><img src="logo.bmp"></p>

    <%try{String user=session.getAttribute("user_name").toString();%>
    <form method="get" action="logout">
        <p align="right"><strong>Welcome&nbsp;<%=user %></strong>
        &nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="Logout"></p>
    </form>
         </p>

<br>

<br><br>
        <form method="post" action="checksid" onsubmit=" return validate('sid')">
        <table align="center" cellpadding="3" cellspacing="5" border="0">
        <tr><td><p align="center">Enter Student/Employee Id<td><input type="text" name="sid" size="25" id="sid"></p>
        </table>
        
        <p align="center"> <input type="submit" value="Enter" onclick="return validate('sid')"> </p>
        </form>
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
