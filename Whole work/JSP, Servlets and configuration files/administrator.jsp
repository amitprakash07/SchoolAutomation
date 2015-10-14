<%-- 
    Document   : administrator
    Created on : Aug 30, 2009, 1:00:03 PM
    Author     : Amit
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Administrator-Home</title>
    </head>
    <body bgcolor='#ffffcc'>
 <p align="center"><img src="logo.bmp"></p>
 <%try{String user=session.getAttribute("user_name").toString();%>
    <form method="get" action="logout">
        <p align="right"><strong>Welcome&nbsp;<%=user %></strong>
        &nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="Logout"></p>
    </form>
    
<br>
<table align="center" border="0" width="100%">
    <form method="get" action="new_room.jsp">
<tr><td align="center"><input type="submit" value="New Room Entry" name="link" id="link"></form>

<form method="get" action="new_department.jsp">
<tr><td align="center"><input type="submit" value="New Department Entry" name="link" id="link"></form>

<form method="get" action="new_job.jsp">
<tr><td align="center"><input type="submit" value="New Job Entry" name="link" id="link"></form>

<form method="get" action="new_fee.jsp">
<tr><td align="center"><input type="submit" value="New Fee Entry" name="link" id="link"></form>

<form method="get" action="new_class.jsp">
<tr><td align="center"><input type="submit" value="New Class Entry" name="link" id="link"></form>

<form method="get" action="new_subject.jsp">
<tr><td align="center"><input type="submit" value="New Subject Entry" name="link" id="link"></form>

<form method="get" action="new_event.jsp">
<tr><td align="center"><input type="submit" value="New Event Entry" name="link" id="link"></form>

<form method="get" action="new_lab.jsp">
<tr><td align="center"><input type="submit" value="New Laboratory Entry" name="link" id="link"></form>

<form method="get" action="new_item.jsp">
<tr><td align="center"><input type="submit" value="New Item Entry" name="link" id="link"></form>

<form method="get" action="new_sports.jsp">
<tr><td align="center"><input type="submit" value="New Sports entry" name="link" id="link"></form>

<form method="get" action="new_admin_req.jsp">
<tr><td align="center"><input type="submit" value="Admin Requirement Entry" name="link" id="link"></form>

<form method="get" action="new_lab_item.jsp">
<tr><td align="center"><input type="submit" value="Laboratory Items Entry" name="link" id="link"></form>

<form method="get" action="enter_emp_attend.jsp">
<tr><td align="center"><input type="submit" value="Enter Employees Attendance" name="link" id="link"></td></tr></form>

<form method="get" action="ask">
<tr><td align="center"><input type="submit" value="See Employee Attendance" name="link" id="link"></td></tr>
</form>

<form method="get" action="ask">
<tr><td align="center"><input type="submit" value="See Employee Profile" name="link" id="link"></td></tr>
</form>

<form method="get" action="library.jsp">
    <tr><td align="center"><input type="submit" value="Library" name="link" id="link"></td></tr>
</form>

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
