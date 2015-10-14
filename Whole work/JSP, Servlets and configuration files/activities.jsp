<%@page import="amit.jdbcconnection"%>
<%@page import="amit.ClassTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="amit.check"%>


<html>
<head>
<title>Activities</title>
</head>
<body bgcolor='#ffffcc' onload="events('div1')">
<p align="center"><img src="logo.bmp"></p>
<table align="center" border="0" cellspacing="-20" cellpadding="1">
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

<tr>
<td><a href="home.jsp"><img src="home.bmp" border="0"></a>
<td><a href="academics.jsp"><img src="academics1.bmp" border="0"></a>
<td><a href="activities.jsp"><img src="activities.bmp" border="0"></a>
<td><a href="infrastructure_home.jsp"><img src="infrastructure.bmp" border="0"></a>
<td><a href="faculties.jsp"><img src="faculties.bmp" border="0"></a>
<td><a href="about_us.jsp"><img src="about us.bmp" border="0"></a>
<td><a href="contact_us.jsp"><img src="contact.bmp" border="0"></a>
</tr>
</table>
<br>


<br>
<div id="div1"></div>




<BR>
<br><br><br><br><br><br>
<hr>
<p align="center" bgcolor="#FF00FF">
<a href="home.jsp">Home</a>&nbsp;|
<a href="academics.jsp">Academic</a>&nbsp;|
<a href="activities.jsp">Activity</a>&nbsp;|
<a href="infrastructure_home.jsp">Infrastructure</a>&nbsp;|
<a href="faculties.jsp">Faculties</a>&nbsp;|
<a href="about_us.jsp">About us</a>&nbsp;|
<a href="contact_us.jsp">Contact us</a>
</p>
</body>
</html>