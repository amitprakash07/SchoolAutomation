<%@page import="amit.jdbcconnection"%>
<%@page import="amit.ClassTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="amit.check"%>



<html>
<head>
<title>New Event</title>
<script type="text/javascript"   src="formvalidation.js">



</script>

<body bgcolor='#ffffcc' onload="setfocus('event_name')">
<p align="center"><img src="logo.bmp"></p>
<%try{String user=session.getAttribute("user_name").toString();%>
    <form method="get" action="logout">
        <p align="right"><strong>Welcome&nbsp;<%=user %></strong>
        &nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="Logout"></p>
    </form>


<br>
<br>

<form method="post" action="newevent" onsubmit="return validate('event_name','event_id','event_inc')">

<table align="center" border="0">

<tr><td>Event Name
<td><input type="text"  id="event_name"name="event_name" size="30" onblur="validatetextfield('event_name')">*
<tr><td>Event Id
    <%
        jdbcconnection j=new jdbcconnection();
        ArrayList a=new ArrayList();
        a=j.getData("select event_id from event");
        int s=a.size();
        String event_id=new String();
        if(s<9){ event_id=new String("event-0"+(++s));}
        else{event_id=new String("event-"+(++s));}
    %>


<td><input type="text" name="event_id" id="event_id" size="30" readonly  value="<%=event_id%>"onblur="validateid('event_id')">*
<tr><td>Organiser
<td><input type="text" name="organiser" size="30" id="organiser" onblur="validatetextfield('organiser')">
<tr><td>Event Incharge
<td>

<select name="event_inc" size="1" id="event_inc" >

<%
    a=j.getData("select emp_id,first_name||' '||middle_name||' '||last_name from employee where type='teaching' order by emp_id");
    s=a.size();
    for(int k=0;k<s;k=k+2)
        {
%>
<option value="<%=a.get(k)%>"><%=a.get(k)%>/<%=a.get(k+1)%>
<%}%>

</select>
<tr><td>Description
<td><input type="text" name="descrip" size="30"  id="descrip"onblur="validatetextfield('description')">

</table>

<p align="center"><input type="submit" value="ok" onclick="return validate('event_name','event_id','event_inc')">
<p align="center"><input type="button" value="See Events" onclick=events('div1')></p>
</form>

<script>
    function events(division)
    {
        document.getElementById(division).innerHTML="<table width='100%' border='1'>"+
            "<tr><td align='center'>Event Name"+
            "<td align='center'>Description"+
            "<td align='center'>Event Incharge"+
            "<td align='center'>Organiser"+
            "<%
                jdbcconnection jnew=new jdbcconnection();
                ArrayList anew=new ArrayList();
                anew=jnew.getData("select * from event_view");
                for(int i=0;i<anew.size();i=i+4)
                    {

            %>"+
                        "<tr><td align='center'><%=anew.get(i)%>"+
                        "<td align='center'><%=anew.get(i+1)%>"+
                        "<td align='center'><%=anew.get(i+2)%>"+
                        "<td align='center'><%=anew.get(i+3)%>"+
                 "<%}%>"+
                 "</table>";
    }
</script>

 


<br>
<div id="div1"></div>


<BR>
<p><strong>* Mandatory Fields</strong></p>
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