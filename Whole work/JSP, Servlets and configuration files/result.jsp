<%@page import="amit.jdbcconnection,java.util.ArrayList" %>
<html>
<head>
<title>student Result</title>
<body bgcolor='#ffffcc'>
<p align="center"><img src="logo.bmp"></p><br><br>

<%try{String user=session.getAttribute("user_name").toString();%>
    <form method="get" action="logout">
        <p align="right"><strong>Welcome&nbsp;<%=user %></strong>
        &nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="Logout"></p>
    </form>



<%
    String s_id=session.getAttribute("s_id").toString();
    jdbcconnection j=new jdbcconnection();
    ArrayList a=new ArrayList();
    a=j.getData("select s.first_name||' '||s.middle_name||' '||s.last_name,c.class_name,c.class_id  " +
            " from student s,class c " +
            " where s.s_id='"+s_id+"' and s.class_id=c.class_id");
    session.setAttribute("class_id", a.get(2));

%>

<p align="center">Name:&nbsp;<%=a.get(0)%></p>
<table align="center">

<form  method="get" action="seeresult">
<tr><td>Select Term&nbsp;&nbsp;</td>
    <td><select name="term" id="term">
    <option value="1">First
    <option value="2">Second
    <option value="3">Third
</select></td></tr>
<br>
    

<tr><td align="center">
<input type="submit" value="Result">
</form>
</table>

<br><br>
<table width="100%" border="1">
    <tr><th align="center">Subjects</th>
    <th align="center">Marks</th></tr>
<%
    try{
        ArrayList result=(ArrayList) session.getAttribute("result");
        if(!(result==null)){
        int subjects=Integer.parseInt(session.getAttribute("subjects").toString());
        if(result.size()>0){
        for(int i=0;i<(2*subjects);i=i+2){
%>
<tr><td align="center"><%=result.get(i)%></td>
<td align="center"><%=result.get(i+1)%></td>
</tr>
<%}}else{%>
<p align="center">No Results Found</p>
<%}%>
<%}}catch(Exception e){}%>

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
</head>
</html>