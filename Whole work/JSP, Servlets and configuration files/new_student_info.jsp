<%@ page import="amit.StudentTO"%>
<html>
<head>
<title>student information</title>
<body bgcolor='#ffffcc'>
<p align="center"><img src="logo.bmp"></p><br><br>
<%try{String user=session.getAttribute("user_name").toString();%>
    <form method="get" action="logout">
        <p align="right"><strong>Welcome&nbsp;<%=user %></strong>
        &nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="Logout"></p>
    </form>



<% Object o=session.getAttribute("STO");
StudentTO sto=(StudentTO)o;
%>

<table align="center" cellpadding="10" >
<tr><td><strong>Student Id</strong><td><strong><input type="text" size="10" readonly value="<%=sto.getSid()%>" />*</strong>
<tr><td><strong>Password</strong><td><strong><input type="text" size="10" readonly value="<%=sto.getPassword()%>"/>*</strong>

<form method="post" action="new_student_info.jsp">

<tr><td>First Name<td><input type="text" readonly="readonly" size="25" value='<%=sto.getFname()%>'/>
<tr><td>Middle name<td><input type="text" readonly="readonly" size="25" value='<%=sto.getMname()%>'/>
<tr><td>Last Name<td><input type="text" readonly="readonly" size="25" value='<%=sto.getLname()%>'/>
<%
    String s= sto.getDay().toString()+"-"+sto.getMonth().toString()+"-"+sto.getYear();
%>
<tr><td>Date of birth
<td><input type="text" size="25" readonly="readonly" value="<%=s%>"/>
<tr><td>Sec</td>
    <td><input type="text" size="25" readonly value="<%=sto.getSec()%>">
    </td>
</tr>
<tr><td>Sex


<td><input type="text" size="10" readonly value="<%=sto.getSex()%>"/>

<tr><td>Father Name<td><input type="text" size="25" readonly value="<%=sto.getFather()%>"  />
<tr><td>Father Occupation<td><input type="text" readonly size="25" value="<%=sto.getFoccupation()%>" />
<tr><td>Mother Name
<td><input type="text" size="25" readonly value="<%=sto.getMother()%>" />
<tr><td>Mother Occupation
<td><input type="text" size="25" readonly value="<%=sto.getMoccupation()%>" />

<tr><td>Address
<td><input type="text" readonly size="25" value="<%=sto.getAddress()%>" />





<tr><td>Annual income<td><input type="text" size="25" readonly value="<%=sto.getIncome()%>" />

<tr><td>Brother<td><input type="text" readonly size="10" value="<%=sto.getNb()%>" />
<tr><td>Sister<td><input type="text" readonly size="10" value="<%=sto.getNs()%>" />
<tr><td>phone
<td><input type="text" size="12" readonly value="<%=sto.getP()%>" />

<tr><td>Emergency No.

<td><input type="text" size="15" readonly value="<%=sto.getEp()%>" />

<tr><td>Photo

<td>4376367

</form>

</table>

<br>
<strong>*Please note your student Id and Password for future reference
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
