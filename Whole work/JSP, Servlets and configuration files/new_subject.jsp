<%@page import="amit.jdbcconnection" %>
<%@page import="amit.Subject" %>
<%@page import="java.util.ArrayList" %>
<html>
<head>
<title>New Subject</title>
<body bgcolor='#ffffcc'>
<p align="center"><img src="logo.bmp"></p>
<br>
<br>
<%try{String user=session.getAttribute("user_name").toString();%>
    <form method="get" action="logout">
        <p align="right"><strong>Welcome&nbsp;<%=user %></strong>
        &nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="Logout"></p>
    </form>

<form method="post" action="newsubject">
<table align="center" border="0">
<%
    Subject s=new Subject();
    jdbcconnection j=new jdbcconnection();
    ArrayList a=new ArrayList();
    int k=s.countsubject();
    String subj_id=new String();
    if(k<9)subj_id="s-0"+(k+1);
    else subj_id="s-"+(k+1);
%>
<tr><td>Subject Id
<td><input type="text" id="subj_id" name="subj_id" size="30" readonly value="<%=subj_id%>">
<tr><td>Subject Name
<td><select id="subj_name"name="subj_name" size="1">
    <option value="english">English
    <option value="hindi">Hindi
    <option value="maths">Maths
    <option value="mental_maths">Mental Maths
    <option value="science">Science
    <option value="social_science">Social Science
    <option value="sanskrit">Sanskrit
    <option value="computer">Computer
    <option value="moral_science">Moral Science
    <option value="gk">General Knowledge
    <option value="drawing">Drawing
    <option value="regi_lang">Regional Language
    <option value="phe">Physical Education
</select>

    <%
    a=j.getData("select emp_id,first_name||' '||middle_name||' '||last_name from employee where type='teaching' order by emp_id");
    int size=a.size();
    
    %>

<tr><td>Subject Teacher
<td>

    <select id="subj_teacher"name="subj_teacher" size="1">


<%
    for(int l=0;l<size;l=l+2)
        {
%>

<option value="<%=a.get(l)%>"><%=a.get(l)%>/<%=a.get(l+1)%>

<%}%>

</select>

<tr><td>class
<td><select name="class" size="1">
<option selected value="nursery">Nursery
<option value="l.k.g">L.K.G
<option value="u.k.g">U.K.G
<option value="1">1
<option value="2">2
<option value="3">3
<option value="4">4
<option value="5">5
<option value="6">6
<option value="7">7
<option value="8">8
<option value="9">9
<option value="10">10
</select>

<tr>
    <td>Section</td>
    <td><select name="sec" id="sec" size="1">
        <option value="a">A
        <option value="b">B
        <option value="c">C
        <option value="d">D
        <option value="e">E
    </select></td>
</tr>

</table>
<p align="center"><input type="submit" value="ok">
<br><p align="center"><input type="button" value="See Subjects" onclick=subject('div1')></p>
</form>
<div name="div1" id="div1"></div>
<script>

    function subject(division)
    {
        document.getElementById(division).innerHTML="<table width=\"100%\" border=\"1\">"+
            "<tr><td align='center' width='25%'>Subject"+
            "<td align='center' width='25%'>Class"+
            "<td align='center' width='25%'>Sec"+
            "<td align='center' width='25%'>Subject Teacher"+
       
  "<%
        jdbcconnection jnew=new jdbcconnection();
        ArrayList anew=new ArrayList();
        anew=jnew.getData("select * from subjects");
        for(int i=0;i<anew.size();i=i+4)
            {
  %>"+
              "<tr><td align='center' width='25%'><%=anew.get(i)%>"+
              "<td align='center' width='25%'><%=anew.get(i+1)%>"+
              "<td align='center' width='25%'><%=anew.get(i+2)%>"+
              "<td align='center' width='25%'><%=anew.get(i+3)%>"+
       "<%}%>"+"</table>";
          
    }


</script>

<br>
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