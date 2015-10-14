<%@page import="amit.jdbcconnection"%>
<%@page import="amit.ClassTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="amit.check"%>


<html>
<head>
<title>New Class</title>
<script type="text/javascript"   src="formvalidation.js">



</script>


<body bgcolor='#ffffcc'>
<p align="center"><img src="logo.bmp"></p>
<br>
<br>
<%try{String user=session.getAttribute("user_name").toString();%>
    <form method="get" action="logout">
        <p align="right"><strong>Welcome&nbsp;<%=user %></strong>
        &nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="Logout"></p>
    </form>

<form method="post" action="newclass" onsubmit="return validate('class_id','class_name','class_teacher','room_id','fee_id')">
<table align="center" border="0">

<tr><td>Class Name
<%String classs=new String();%>

<td><select name="class_name" id="class_name" size="1">
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
<% System.out.println(classs);%>

<tr>
    <td>Sec</td>
    <td>
    <select name="sec" id="sec" size="1">
        <option selected value="a">A
        <option value="b">B
        <option value="c">C
        <option value="d">D
        <option value="e">E
    </select>
    </td>
</tr>

    <%
        jdbcconnection j=new jdbcconnection();
        ArrayList a=new ArrayList();
        a=j.getData("select class_id from class");
        int s=a.size();
        String class_id=new String();
        if(s<9){ class_id=new String("c-0"+(++s));}
        else{class_id=new String("c-"+(++s));}
    %>
<tr><td>Class Id

<td><input  id="class_id"type="text" name="class_id" size="30" value="<%=class_id%>" readonly >*

<tr>
    <td>Intake
    <td>
        <select name="intake" id="intake" size="1">
            <option selected value="40">40
            <option value="45">45
            <option value="50">50
            <option value="55">55
            <option value="60">60
        </select>
</tr>


<tr><td>Class Teacher
<%
    jdbcconnection j1=new jdbcconnection();
    ArrayList a1=new ArrayList();
    a1=j1.getData("select emp_id,first_name||' '||middle_name||' '||last_name from employee where type='teaching'");
%>
<td>
    <select name="class_teacher" id="class_teacher" size="1">

<%
    if(a1.size()>0){
%>

     <%
        check ch=new check();
        for(int n=0;n<a1.size();n=n+2)
            {
                if(!ch.isclassteacher(a1.get(n).toString())){
      %>

      <option value="<%=a1.get(n)%>"><%=a1.get(n)%>&nbsp;<%=a1.get(n+1)%>
    <%}}%>

<%}else{%>
<option selected>Insufficient Teachers.Recruit some
<%}%>
    </select>

</td>

<%
        a1=j1.getData("select room_id from room where available='unused' and description='class' order by room_id");
        s=a1.size();
%>
<tr><td>Room Id
<td>
    <select name="room_id" id="room_id" size="1">

<%
    if(s>0){
%>
<%
        for (int n=0;n<s;n++){
%>
    <option value="<%=a1.get(n)%>"><%=a1.get(n)%>
    <%}%>

<%}else{%>
<option selected>Room is not available.Enter Room
<%}%>

</select>


<%
            a1=j1.getData("select fees_id,tution_fees from fees order by fees_id");
%>
<tr><td>Fees ID

<%
    if(a1.size()>0){
%>
<td>
    <select name="fee_id" id="fee_id" size="1">

     <%
        for(int n=0;n<a1.size();n=n+2)
            {
      %>

      <option value="<%=a1.get(n)%>"><%=a1.get(n)%>/&nbsp;<%=a1.get(n+1)%>
    <%}%>



<%}else{%>
    <option selected>No Fee Id is present.Enter Fees Id
<%}%>

</select>


</table>
<p align="center"><input type="submit" value="ok" onclick="return validate('class_id','class_name','class_teacher','room_id','fee_id')">
<p align="center"><input type="button" value="See class" onclick=classes('div1')></p>
</form>

<BR>
<div id="div1"></div>
<script>
    
    function classes(division)
    {
        document.getElementById(division).innerHTML="<table width='100%' border='1'>"+
            "<tr><td align='center'>Class"+
            "<td align='center'>Sec"+
            "<td align='center'>Class Teacher"+
            "<td align='center'>Total Student"+
            "<td align='center'>Intake"+
            "<td align='center'>Floor"+
            "<td align='center'>Fees"+

            "<%
                jdbcconnection jnew=new jdbcconnection();
                ArrayList anew=new ArrayList();
                anew=jnew.getData("select * from class_view");
                for(int i=0;i<anew.size();i=i+7)
                    {
             %>"+

                     "<tr><td align='center'><%=anew.get(i)%>"+
                     "<td align='center'><%=anew.get(i+1)%>"+
                     "<td align='center'><%=anew.get(i+2)%>"+
                     "<td align='center'><%=anew.get(i+3)%>"+
                     "<td align='center'><%=anew.get(i+4)%>"+
                     "<td align='center'><%=anew.get(i+5)%>"+
                     "<td align='center'><%=anew.get(i+6)%>"+
              "<%}%>"+
              "</table>";

    }
</script>


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