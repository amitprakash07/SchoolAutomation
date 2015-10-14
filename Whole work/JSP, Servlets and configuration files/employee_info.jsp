
<%@page import="amit.EmployeeTO" %>
<%@page import="amit.jdbcconnection" %>
<%@page import="java.util.ArrayList" %>

<html>
<head>
<title>Employee Information</title>
<body bgcolor='#ffffcc'>
    <%try{String user=session.getAttribute("user_name").toString();%>
    <form method="get" action="logout">
        <p align="right"><strong>Welcome&nbsp;<%=user %></strong>
        &nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="Logout"></p>
    </form>
    <p align="right"><strong>Welcome&nbsp;<%=user %></strong>
    
<p align="center"><img src="logo.bmp"></p>





<% EmployeeTO e=new EmployeeTO();
    String user_type=session.getAttribute("user_type").toString();
    String s_id=new String();
    if(!(user_type.equals("administrator")||user_type.equals("accountant"))){
    s_id=session.getAttribute("user_name").toString();}
    else{ s_id=session.getAttribute("s_id").toString();}
    e.setEmp_id(s_id);
//System.out.print(e.getEmp_id());
    e.setEmployee();
%>

<table align="center" cellspacing="10" cellpadding="15">

<tr><td>Employee Id</td>
<td><input type="text" readonly size="25" value="<%=e.getEmp_id().toString()%>"/></td></tr>



<tr>
    <td>First Name

<td><input type="text" value='<%=e.getFirst_name()%>' readonly size="25"/>

<tr><td>Middle Name
<td><input type="text" size="25" readonly value="<%=e.getMiddle_name()%>" />
<tr><td>Last Name
<td><input type="text" readonly size="25" value="<%=e.getLast_name()%>" />


<tr><td>Job Type
<td><input type="text" readonly size="25" value="<%=e.getType()%>" /></td>

<%
    jdbcconnection j=new jdbcconnection();
    ArrayList a=new ArrayList();
    a=j.getData("select job_name from job where job_id='"+e.getJob_id()+"'");

%>


<tr><td>Job Name
<td><input type="text" readonly size="25" value="<%=a.get(0)%> " /> </td>
</tr>
<tr><td>Address
<td><input type="text" readonly size="25" value="<%=e.getAddress()%>" /></td>

<tr><td>Qualification
<td><input type="text" readonly size="25" value="<%=e.getQualification()%>" />

<tr><td>Phone
<td><input type="text" readonly size="25" value="<%=e.getPhone()%>" />

<tr><td>Photo
<td>73476

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