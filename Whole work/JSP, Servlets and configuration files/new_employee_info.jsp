<%@ page import="amit.EmployeeTO" %>
<html>
<head>
<title>Employee Information</title>
<body bgcolor='#ffffcc'>
    
<p align="center"><img src="logo.bmp"></p>
<%try{String user=session.getAttribute("user_name").toString();%>
    <form method="get" action="logout">
        <p align="right"><strong>Welcome&nbsp;<%=user %></strong>
        &nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="Logout"></p>
    </form>





<% EmployeeTO e=new EmployeeTO();
Object o=session.getAttribute("employee");
e=(EmployeeTO)o;
%>

<table align="center" cellspacing="10" cellpadding="15">

<tr><td>Employee Id</td>
<td><input type="text" readonly size="25" value="<%=e.getEmp_id().toString()%>"/>*</td></tr>


<tr><td>Password</td>
<td><input type="text" readonly size="25" value="<%=e.getEmp_id()%>" />*</td>
</tr>

<tr>
    <td>First Name

<td><input type="text" value='<%=e.getFirst_name()%>' readonly size="25"/>

<tr><td>Middle Name
<td><input type="text" size="25" readonly value="<%=e.getMiddle_name()%>" />
<tr><td>Last Name
<td><input type="text" readonly size="25" value="<%=e.getLast_name()%>" />


<tr><td>Job Type
<td><input type="text" readonly size="25" value="<%=e.getType()%>" /></td>

<tr><td>Job Name
<td><input type="text" readonly size="25" value="<%=e.getJob_id()%> " /> </td>

<tr><td>Address
<td><input type="text" readonly size="25" value="<%=e.getAddress()%>" /></td>

<tr><td>Qualification
<td><input type="text" readonly size="25" value="<%=e.getQualification()%>" />

<tr><td>Phone
<td><input type="text" readonly size="25" value="<%=e.getPhone()%>" />

<tr><td>Photo
<td>73476

</table>


<strong>*Please note your Employee Id and Password for future reference
<br>You can change your password after logging in as above username and password
<br>Don't disclose your password to anyone</strong>

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