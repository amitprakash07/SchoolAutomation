<%@page import="amit.jdbcconnection" %>
<%@page import="java.util.ArrayList" %>
<%@page import="amit.StudentTO" %>
<%@page import="java.util.Calendar" %>

<html>
<head>
<title>student Attendance</title></head>
<body bgcolor='#ffffcc'>
<p align="center"><img src="logo.bmp"></p><br>
<%try{String user=session.getAttribute("user_name").toString();%>
    <form method="get" action="logout">
        <p align="right"><strong>Welcome&nbsp;<%=user %></strong>
        &nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="Logout"></p>
    </form>

<%
    jdbcconnection j=new jdbcconnection();
    ArrayList a=new ArrayList();
    String user_name=session.getAttribute("user_name").toString();
    a=j.getData("select class_id from class where class_teacher='"+user_name+"'");
    System.out.println(a.get(0));
    session.setAttribute("class_id",a.get(0));
    String class_id=a.get(0).toString();
    a=j.getData("select s_id from student where class_id='"+class_id+"'");
    int n=a.size();
    Calendar c=Calendar.getInstance();
    String[] months={"JAN","FEB","MAR","APR",
                            "MAY",
                            "JUN",
                            "JUL",
                            "AUG",
                            "SEP",
                            "OCT",
                            "NOV",
                            "DEC" };
                    String today_date=c.get(5)+"-"+months[c.get(2)]+"-"+c.get(1);

    //System.out.println(Calendar.DATE+"/"+Calendar.MONTH+"/"+Calendar.YEAR);
    //s.setAttribute("nos",n);
    //System.out.print(n);
%>

<p align="center"><strong><a href="class_teacher.jsp">Home</a></strong></p>
<br>
<form method="post" action="attendance">
<table border="1" align="center" width="75%">
    <p>Attendance Entry for Date&nbsp;&nbsp;<%=today_date%></p>
    <tr><th width="30%">Student Id</th><th width="50%">Student Name</th><th width="20%">Attendance</th></tr>
<% if(n>0){ %>
<%
a=j.getData("select s_id,first_name||'  '||middle_name||'  '||last_name AS name from student where class_id='"+class_id+"' order by s_id");

       for(int k=0;k<n;k=k+2)
        {
            //int l=0;
            //while(l<2){
%>

<tr><td align="center"><%=a.get(k)%></td>
<td align="center"><%=a.get(k+1)%></td>
<td><input type="radio" name="<%=a.get(k)%>" id="<%=a.get(k)%>" value="p">Present&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="radio" name="<%=a.get(k)%>" id="<%=a.get(k)%>" value="a" checked>Absent</td></tr>
<% }}else{ %><tr><td>No Students Found In Your Class</td></tr><%}%>
</table>

<br>
<br><br><br><br><br><br><br>
<p align="center"><input type="submit" name="attendance" id="attendance" value="Enter Student Attendance"></p>

</form>

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