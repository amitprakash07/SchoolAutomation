<%-- 
    Document   : enter_emp_attend
    Created on : Dec 24, 2009, 10:00:25 PM
    Author     : Amit
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="amit.jdbcconnection" %>
<%@page import="java.util.ArrayList" %>
<%@page import="java.util.Calendar" %>

<html>
<head>
<title>Enter Employee Attendance</title>
<body bgcolor='#ffffcc'>
<p align="center"><img src="logo.bmp"></p><br>

<%try{String user=session.getAttribute("user_name").toString();%>
    <form method="get" action="logout">
        <p align="right"><strong>Welcome&nbsp;<%=user %></strong>
        &nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="Logout"></p>
    </form>
    <br><br>

<%
            Calendar c=Calendar.getInstance();
            String[] months={"JAN","FEB","MAR","APR",
                            "MAY",
                            "JUN",
                            "JUL",
                            "AUG",
                            "SEP",
                            "OCT",
                            "NOV",
                            "DEC" };
                    String today_date=c.get(5)+"-"+months[c.get(2)]+"-"+c.get(1);
%>

<form method="post" action="attendance">
<table border="1" align="center" width="75%">
<p>Attendance Entry for Date&nbsp;&nbsp;<%=today_date%></p>
<br><br>
    <tr><th width="30%">Employee Id</th><th width="50%">Employee Name</th><th width="20%">Attendance</th></tr>

<%
    jdbcconnection j=new jdbcconnection();
    ArrayList a=new ArrayList();
    a=j.getData("select emp_id,first_name||' '||middle_name||' '||last_name from employee");
    int n=a.size();
    if(a.size()>0){
        for(int k=0;k<n;k=k+2){
%>
<tr><td align="center"><%=a.get(k)%></td>
<td align="center"><%=a.get(k+1)%></td>
<td><input type="radio" name="<%=a.get(k)%>" id="<%=a.get(k)%>" value="p">Present&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="radio" name="<%=a.get(k)%>" id="<%=a.get(k)%>" value="a" checked>Absent</td></tr>
<%}}else{%>
<tr><td>No Employees Is Present</td></tr><%}%>
</table>

<br><br><br><br><br><br><br>
<p align="center"><input type="submit" name="attendance" id="attendance" value="Enter Employee Attendance"></p>

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
</head>
</html>
