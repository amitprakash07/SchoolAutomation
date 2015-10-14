<%@page import="amit.jdbcconnection"%>
<%@page import="amit.ClassTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="amit.check"%>



<html>
<head>
<title>New Lab</title>
<script type="text/javascript" src="formvalidation.js"></script>
<body bgcolor='#ffffcc' onload="setfocus('lab_name')">
<p align="center"><img src="logo.bmp"></p>
<br>
<br>
<%try{String user=session.getAttribute("user_name").toString();%>
    <form method="get" action="logout">
        <p align="right"><strong>Welcome&nbsp;<%=user %></strong>
        &nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="Logout"></p>
    </form>


<form method="post" action="newlab">
<table align="center" border="0">
<tr><td>Lab Name
<td><input id="lab_name"type="text" name="lab_name" size="30" onblur="validatetextfield('lab_name')">


    <%
        jdbcconnection j=new jdbcconnection();
        ArrayList a=new ArrayList();
        a=j.getData("select lab_id from lab");
        int s=a.size();
        String lab_id=new String();
        if(s<9){ lab_id=new String("l-0"+(++s));}
        else{lab_id=new String("l-"+(++s));}
    %>

<tr><td>Lab Id

<td><input  id="lab_id"type="text" name="lab_id" size="30" value="<%=lab_id%>" readonly >

<tr><td>Lab Type
<td><select name="lab_type" size="1" id="lab_type">
<option selected>Physics
<option>Chemistry
<option>Biology
<option>Computer
<option>Music
<option>Drawing
</select>


<%
        //jdbcconnection j=new jdbcconnection();
        //ArrayList a=new ArrayList();
        a=j.getData("select room_id from room where available='unused'and description='class' order by room_id");
        s=a.size();

%>
<tr><td>Room Id
<td>
    <select name="room_id" id="room_id" size="1">

    <%
    if(s>0){
        for (int n=0;n<s;n++){

    %>
    <option value="<%=a.get(n)%>"><%=a.get(n)%>
    <%}}else{%>
    <option>Rooms are not available.Enter New Rooms<%}%>

</select>

<tr><td>Lab Incharge
<%
    jdbcconnection j1=new jdbcconnection();
    //jdbcconnection j2=new jdbcconnection();
    ArrayList a1=new ArrayList();
    //ArrayList a2=new ArrayList();
    a1=j1.getData("select emp_id,first_name||' '||middle_name||' '||last_name from employee where type='nonteaching'");
    //a2=j2.getData("select class_teacher from class");

%>
<td>

    <select name="lab_inc" id="lab_inc" size="1">

<%
    if(a1.size()>0){
%>

     <%
        check ch=new check();
        for(int n=0;n<a1.size();n=n+2)
            {
                if(!ch.islabincharge(a1.get(n).toString())){
             a=j.getData("select j.job_name from employee e,job j where e.emp_id='"+a1.get(n).toString()+"' and e.job_id=j.job_id ");
      %>

<option value="<%=a1.get(n)%>"><%=a1.get(n)%>&nbsp;<%=a1.get(n+1)%>/<%=a.get(0)%>
<%}%>
    <%}}else{%>
       <option selected value="">Lab Incharge Not present or assigned to another lab.<%}%>
    

</select>

<tr><td>Lab Attendant

<%
    a1=j1.getData("select emp_id,first_name||' '||middle_name||' '||last_name from employee where type='nonteaching'");
%>
<td>


<select name="lab_attend" id="lab_attend" size="1">

<%
    if(a1.size()>0){
%>

     <%
        check ch=new check();
        for(int n=0;n<a1.size();n=n+2)
            {
                if(!ch.islabattendant(a1.get(n).toString())){
                a=j.getData("select j.job_name from employee e,job j where e.emp_id='"+a1.get(n).toString()+"' and e.job_id=j.job_id ");

     %>

      <option value="<%=a1.get(n)%>"><%=a1.get(n)%>&nbsp;<%=a1.get(n+1)%>/<%=a.get(0)%>

    <%}}}else{%><option selected value="">Lab Attendant Not present or assigned to another lab<%}%>

</select>

<tr><td>Lab Timing
<td><input type="text" name="lab_timing" size="30" id="lab_timing" readonly value="school timing">
</table>
<p align="center"><input type="submit" value="ok" onclick="return validate('lab_name','lab_inc','lab_attend')">
<p align="center"><input type="button" value="See Labs" onclick=labs('div1')></p>
</form>
<script>
        function labs(division)
        {
            document.getElementById(division).innerHTML="<table width='100%' border='1'>"+
                "<tr><td align='center' width='25%'>Lab Name"+
                "<td align='center' width='25%'>Subject"+
                "<td align='center' width='25%'>Lab Incharge"+
                "<td align='center' width='25%'>Room"+

       "<%
            jdbcconnection jnew=new jdbcconnection();
            ArrayList anew=new ArrayList();
            anew=jnew.getData("select * from  laboratory");
            for(int i=0;i<anew.size();i=i+4)
                {

       %>"+

               "<tr><td align='center' width='25%'><%=anew.get(i)%>"+
               "<td align='center' width='25%'><%=anew.get(i+1)%>"+
               "<td align='center' width='25%'><%=anew.get(i+2)%>"+
               "<td align='center' width='25%'><%=anew.get(i+3)%>"+
           "<%}%>"+
           "</table>";
        }
    
</script>
<BR>
<div id="div1"></div>
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