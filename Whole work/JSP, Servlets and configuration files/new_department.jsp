<%@page import="amit.jdbcconnection"%>
<%@page import="java.util.ArrayList"%>

<html>
<head>
<title>New Department</title>

<script type="text/javascript"   src="formvalidation.js"></script>

<body bgcolor='#ffffcc' onload="setfocus('dept_name')">
<p align="center"><img src="logo.bmp"></p>
<br>
<br>
<%try{String user=session.getAttribute("user_name").toString();%>
    <form method="get" action="logout">
        <p align="right"><strong>Welcome&nbsp;<%=user %></strong>
        &nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="Logout"></p>
    </form>

<form method="post" action="newdepartment" onsubmit="return validate('dept_id','dept_name','depart_expense')">

<table align="center" border="0">

<%
        jdbcconnection j=new jdbcconnection();
        ArrayList a=new ArrayList();
        a=j.getData("select dept_id from department");
        int s=a.size();
        String dept_id=new String();
        if(s<9){ dept_id=new String("d-0"+(++s));}
        else{dept_id=new String("d-"+(++s));}
%>

<tr><td>Department Id
<td><input type="text" name="dept_id" id="dept_id" size="30" value="<%=dept_id%>" readonly>*
<tr><td>Department Name
<td><input type="text" name="dept_name" size="30" id="dept_name" onblur="validatetextfield('dept_name')">*
<tr><td>Department Expense
<td><input type="text" name="depart_expense" size="30" id="depart_expense" onblur="validateprice('depart_expense')">*
<%
        //jdbcconnection j=new jdbcconnection();
        //ArrayList a=new ArrayList();
        a=j.getData("select room_id from room where available='unused' and description='office' order by room_id");
        s=a.size();
        System.out.println(s);

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

<%

    a=j.getData("select e.emp_id,j.job_name from employee e,job j where e.job_id=j.job_id order by e.emp_id");
    int size=a.size();
%>




<tr><td>Department Incharge
<td>
    <select name="dept_incharge" id="dept_incharge">
<% if(size>0){
%>

        <%
            for(int k=0;k<size;k=k+2)
            {
        %>
        <option value="<%=a.get(k)%>"><%=a.get(k)%>/<%=a.get(k+1)%>
        <%}%>
        <option value="none">None
         <%}else{%>
         <option selected>No employee exists
         <option value="none">None
         <%}%>
    </select>


</table>
<p align="center"><input type="submit" value="ok" onclick="return validate('dept_id','dept_name','depart_expense')">

<br>
    <p align="center"><input type="button" onclick=department('div1') value="See Department"></p>
</form>


<script>

function department(division)
    {

        
    document.getElementById(division).innerHTML="<table width=\"100%\" border=\"1\">"+
            "<tr><td align=\"center\" width=\"25%\" >Department Name"+
            "<td align=\"center\" width=\"25%\">Department Incharge"+
            "<td align=\"center\" width=\"25%\">Room Id"+
            "<td align=\"center\" width=\"25%\">Floor"+

        "<%
            jdbcconnection j2=new jdbcconnection();
            ArrayList anew=new ArrayList();
            anew=j2.getData("select * from dept_view");
//System.out.println(anew);

            for(int i=0;i<anew.size();i=i+4)
            {
                Object dept_incharge=anew.get(i+1);
                if(dept_incharge==null){anew.set(i+1, "None");}

%>"+

"<tr><td align=\"center\" width=\"25%\"><%=anew.get(i)%></td>"+
"<td align=\"center\" width=\"25%\" ><%=anew.get(i+1)%></td>"+
"<td align=\"center\" width=\"25%\" ><%=anew.get(i+2)%></td>"+
"<td align=\"center\" width=\"25%\" ><%=anew.get(i+3)%></td></tr>"
+"<%}%>"+"</table>";
 }

</script>
 
<br>
    <br>
<div name="div1" id="div1"></div>





<BR>
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