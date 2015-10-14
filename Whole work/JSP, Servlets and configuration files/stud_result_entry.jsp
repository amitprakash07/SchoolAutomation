<%@page import="amit.jdbcconnection"%>
<%@page import="java.util.ArrayList"%>



<html>
<head>
<title>Student Result</title>
<body bgcolor='#ffffcc'>
<script src="formvalidation.js">

</script>
</head>
<p align="center"><img src="logo.bmp"></p>
<br>
<%try{String user=session.getAttribute("user_name").toString();%>
    <form method="get" action="logout">
        <p align="right"><strong>Welcome&nbsp;<%=user %></strong>
        &nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="Logout"></p>
    </form>


<p align="center"><strong><a href="class_teacher.jsp">Home</a></strong></p>

<form method="post" action="result">

<table align="center" border="0">

<%
    jdbcconnection j=new jdbcconnection();
    ArrayList a=new ArrayList();
    String s_id=session.getAttribute("s_id").toString();
    a=j.getData("select s_id,first_name||' '||middle_name||' '||last_name,class_id from student where s_id='"+s_id+"'");
    String class_id=a.get(2).toString();

%>

<tr><td>Student Id
<td><input type="text" name="s_id" id="s_id" size="30" readonly value="<%=a.get(0)%>">
<tr><td>Student Name
<td><input type="text" size="30" readonly value="<%=a.get(1)%>">

<%
    a=j.getData("select class_name,sec from class where class_id='"+class_id+"'");
    String class_name=a.get(0).toString()+"-"+a.get(1).toString();
%>


<tr><td>class Id
<td><input type="text" name="class_id" id="class_id" readonly value="<%=class_id%>">

<tr><td>Class Name
<td><input type="text" readonly value="<%=class_name%>">
<tr><td>Term</td>
<td><select name="term" id="term">
    <option value="1">1
    <option value="2">2
    <option value="3">3
</select></td></tr>
</table>

<br>
<br>



<table align="center" border="0">

<tr><td align="center"><strong>Subject</strong>
<td align="center"><strong>Marks</strong>

<%
    a=j.getData("select subj_name from subject where class_id='"+class_id+"' order by subj_name");
    int size=a.size();
    session.setAttribute("no_of_subject",size);
    //System.out.println(request.getAttribute("no_of_subject").toString());
    for(int k=0;k<size;k++)
        {
%>

<tr><td><%=a.get(k).toString().toUpperCase()%>
<td><input type="text" name="<%=a.get(k)%>" id="<%=a.get(k)%>" size="30"  onblur="validatenumberfield('<%=a.get(k)%>')">

<%}%>



<%int m=a.size()*100;%>

</table>

<script>
    
    function validatefields()
    {
        var b=true;
        <%
        for (int z=0;z<size;z++)
        {
        %>
            b=b&&(validate('<%=a.get(z)%>'));
        <%}%>
      return b;
    }
</script>

<p align="center"><input type="reset" value="Reset">&nbsp;<input type="submit" value="Go"  onclick="return validatefields()">
</form>
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