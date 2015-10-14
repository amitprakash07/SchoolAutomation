<%@page import="amit.jdbcconnection"%>
<%@page import="java.util.ArrayList"%>

<html>
<head>
<title>Admin Requirement</title>
<script type="text/javascript"   src="formvalidation.js">

</script>

<body bgcolor='#ffffcc' onload="setfocus('money_req')">
<p align="center"><img src="logo.bmp"></p>
<%try{String user=session.getAttribute("user_name").toString();%>
    <form method="get" action="logout">
        <p align="right"><strong>Welcome&nbsp;<%=user %></strong>
        &nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="Logout"></p>
    </form>


<br>
<br>
<form method="post" action="adminreq" onsubmit="return (validate('dept_name','money_req')&& validateprice('money_req'))">
<table align="center" border="0">
<tr><td>Sr No.
<%
    jdbcconnection j=new jdbcconnection();
    ArrayList a=new ArrayList();
    a=j.getData("select sr_no from admin_req");
            int size=a.size()+1;
%>

<td><input name="sr_no" id="sr_no" type="text" readonly value="<%=size%>">

<tr><td>Department Name

<td><select name="dept_name" id="dept_name" >

<%    a=j.getData("select dept_id,dept_name from department order by dept_id,dept_name");
     size=a.size();
    
    if(size>0){
        for(int i=0;i<size;i=i+2){
%>
<option value="<%=a.get(i)%>"><%=a.get(i+1)%>

<%}}else{%>

<option selected value="">Department does not Exist<%}%>

</select>
<tr><td>Money Required
<td><input type="text" name="money_req" size="30" id="money_req" onblur="validateprice('money_req')">*

</table>
<p align="center"><input type="submit" value="ok" onclick="return (validate('dept_name','money_req','dept_id')&& validateprice('money_req'))">
</form>

<BR>
<br><br>
<p><strong>* Mandatory Fields</strong></p>
<br><br><br><br>
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