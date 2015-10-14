<%@page import="amit.jdbcconnection"%>
<%@page import="java.util.ArrayList"%>



<html>
<head>
<title>New Sports Entry</title>
<script src="formvalidation.js" type="text/javascript">

</script>

<body bgcolor='#ffffcc' onload="setfocus('sports_name')">
<p align="center"><img src="logo.bmp"></p>
<br>
<br>
<%try{String user=session.getAttribute("user_name").toString();%>
    <form method="get" action="logout">
        <p align="right"><strong>Welcome&nbsp;<%=user %></strong>
        &nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="Logout"></p>
    </form>

<form method="post" action="sports" onsubmit="return (validate('sports_name')&& validatetextfield('sports_name'))">
<table align="center" border="0">
<tr><td>Sports Name
<td><input type="text" id="sports_name" name="sports_name" size="30" onblur="validatetextfield('sports_name')">*
<tr><td>Sports Id

<%
    jdbcconnection j2=new jdbcconnection();
    ArrayList a2=new ArrayList();
    int size;
    a2=j2.getData("select sports_id from sports");
    size=a2.size();
    String sports_id=new String();
        if(size<9){ sports_id=new String("sp-0"+(++size));}
        else{sports_id=new String("i-"+(++size));}
%>


<td><input type="text" name="sports_id"  id="sports_id"size="30" readonly value="<%=sports_id%>">
<%
    jdbcconnection j=new jdbcconnection();
    ArrayList a=new ArrayList();
    a=j.getData("select e.emp_id,j.job_name from employee e,job j where e.job_id=j.job_id order by e.emp_id");
    size=a.size();
%>


<tr><td>Sports Incharge
<td>
    <select name="sports_inc" id="sports_inc" title="Select sports incharge">
<% if(size>0){
%>

        <%
            for(int k=0;k<size;k=k+2)
            {
        %>
        <option value="<%=a.get(k)%>"><%=a.get(k)%>/<%=a.get(k+1)%>
        <%}%>
        
         <%}else{%>
         <option selected >No employee exists
    <%}%>
    </select>
</table>
<p align="center"><input type="submit" value="ok" onclick="return validate('sports_name')">
<p align="center"><input type="button" value="See Sports" onclick=sports('div1')></p>
</form>

<script>
    function sports(division)
    {
        document.getElementById(division).innerHTML="<table width='100%' border='1'>"+
            "<tr><td align='center'>Sports Name"+
            "<td align='center'>Sports Incharge"+
        "<%
               a=j.getData("select * from sports_view");
               for(int i=0;i<a.size();i=i+2)
                   {
        %>"+

                "<tr><td align='center'><%=a.get(i)%>"+
                "<td align='center'><%=a.get(i+1)%>"+
       "<%}%>"+"</table>";

    }

</script>

<div id="div1"></div>
<BR>
<br><br><br><br>
* Mandatory Field    <br><br>
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