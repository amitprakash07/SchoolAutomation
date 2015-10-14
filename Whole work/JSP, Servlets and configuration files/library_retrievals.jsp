<%@page import="amit.jdbcconnection,java.util.ArrayList" %>

<html>
<head>
<title>student book retrievals</title>
<body bgcolor='#ffffcc'>
<p align="center"><img src="logo.bmp"></p>
<%try{String user=session.getAttribute("user_name").toString();%>
    <form method="get" action="logout">
        <p align="right"><strong>Welcome&nbsp;<%=user %></strong>
        &nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="Logout"></p>
    </form>

<br><br><br>
    <br><br><br>
        <br><br><br>

<%
    String s_id=session.getAttribute("s_id").toString();
    ArrayList a=new ArrayList();
    jdbcconnection j=new jdbcconnection();
    String id_type=session.getAttribute("idtype").toString();
    if(id_type.equals("student"))
    a=j.getData("select * from stud_lib_retrieval where s_id='"+s_id+"' order by issue_date");
    else
    a=j.getData("select * from emp_lib_retrieval where s_id='"+s_id+"' order by issue_date");
    if(a.size()>0){
%>
<p align="left">Name:&nbsp;<%=a.get(1)%></p>
<br><br>
<table width="100%" border="1">
<tr>
<th scope="col">
BOOK NAME
</th>
<th scope="col">
ISSUE DATE
</th>
<th scope="col">
RETURN DATE
</th>
<th scope="col">
FINE
</th>
<th scope="col">
BOOK STATUS
</th>
<th scope="col">
FINE STATUS
</th>
</tr>

<%
    for (int i=0;i<a.size();i=i+8){
%>

<tr><td align="center"><%=a.get(i+2)%></td>
<td align="center"><%=a.get(i+3)%></td>
<%
if(!(a.get(i+4)==null)){
%>
<td align="center"><%=a.get(i+4)%></td>
<%
    }else{
%>
<td align="center">--</td>
<%
}if(!(a.get(i+5)==null)){
%>
<td align="center"><%=a.get(i+5)%></td>
<%
    }else{
%>
<td align="center">--</td>
<%}%>

<td align="center"><%=a.get(i+6)%></td>
<td align="center"><%=a.get(i+7)%></td>

</tr>
<%}%>
</table>

<%}else{%>

<p align="center">You have not issued any book till now</p>

<%}%>

<BR>
<br><br><br><br><br><br>
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