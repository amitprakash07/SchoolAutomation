<%@page import="java.util.ArrayList,java.util.Calendar" %>

<html>
<head>
<title>See Student attendance </title>
<body bgcolor='#ffffcc'>
<p align="center"><img src="logo.bmp"></p>

    <%try{String user=session.getAttribute("user_name").toString();%>
    <form method="get" action="logout">
        <p align="right"><strong>Welcome&nbsp;<%=user %></strong>
        &nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="Logout"></p>
    </form>

<%
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

     String month=months[c.get(2)];
     //System.out.println(month);
     
%>

<form method="get" action="seeattendance">
<p align="center">Select Month &nbsp;&nbsp;
<select name="months" id="months">
    <option selected value="<%=month%>"><%=month%>
    <%
        for (int i=0;i<12;i++){
            if(i==c.get(2))continue;
    %>
    <option value="<%=months[i]%>"><%=months[i]%>
    <%}%>
</select></p>
<br>

    <p align="center"><input type="submit" value="Go">
</form>

<br>
    <br><br><br>

<%
    ArrayList a=new ArrayList();
    try{
       a=(ArrayList) session.getAttribute("attendance");
       //System.out.println("amit");
       //System.out.println(a.size());
           if(a.size()>0){
%>

<table width="100%" border="1">

    <tr><td align="center">Date</td>
    <td align="center">Present/Absent</td></tr>
    
    <%
        for(int i=0;i<a.size();i=i+2){
    %>

    <tr><td align="center"><%=a.get(i)%></td>
    <td align="center"><%=a.get(i+1)%></td></tr>
    <%
        }
           }else{
     %>
    <p align="center">You were absent or your attendance is not entered for the month</p>
    
    <%
        }
       }catch(Exception e){}
        finally{session.removeAttribute("attendance");}
    %>

</table>


<%}catch(Exception e){
    //System.out.println("g1");
%>

<br>
<p align="center">
    <strong>Please Login First</strong>
</p>
<br>
    <p align="center"><a href="login.jsp">Log In</a></p>
<%}%>


<br>
    <br><br><br>
<hr>
<p align="center"><em>&copy;&nbsp;Amit,Gaurangi,Kawaljot,Kirti@HCL</em></p></body>
</html>