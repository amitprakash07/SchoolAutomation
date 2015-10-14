<%@page import="amit.jdbcconnection,java.util.ArrayList,java.util.Calendar" %>

<html>
<head>
<title>Employee Salary</title>
 <script src="formvalidation.js"></script>
</head>
<body bgcolor='#ffffcc'>
<p align="center"><img src="logo.bmp"></p><br><br>
<%try{String user=session.getAttribute("user_name").toString();%>
    <form method="get" action="logout">
        <p align="right"><strong>Welcome&nbsp;<%=user %></strong>
        &nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="Logout"></p>
    </form>


<form method="post" action="salary" onsubmit="return validate('emp_id')">
<table align="center" cellspacing="15">
    <%
        jdbcconnection j=new jdbcconnection();
        ArrayList a=new ArrayList();
        String emp_id=session.getAttribute("s_id").toString();
        a=j.getData("select first_name||' '||middle_name||' '||last_name,job_id from employee where emp_id='"+emp_id+"'");
        String name=a.get(0).toString();
        String job_id=a.get(1).toString();
        a=j.getData("select basic_sal,(basic_sal+pf+da+hra+income_tax) as total_salary from job where job_id='"+job_id+"'");
    %>
<tr><td>Employee Id</td>
<td><input type="text" name="emp_id" id="emp_id" size="30" readonly value="<%=emp_id%>"></td></tr>

<tr><td>Name</td>
<td><input type="text" name="name" id="name" size="30" value="<%=name%>" readonly></td></tr>

<tr><td>Basic salary</td>
<td><input type="number" name="bs" size="30" id="bs" readonly value="<%=a.get(0)%>"></td></tr>

<tr><td>Pay of month</td>
<td>

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
         
          int month=c.get(2);
    %>




<select name="pay_of_month" id="pay_of_month" size="1">

    <%
        for(int i=0;i<=month;i++){
    %>
  <option value="<%=months[i]%>"><%=months[i]%>
<%}%>

</select></td></tr>



<tr><td>Total Salary</td>
<td><input type="number" name="total_salary" size="15" id="total_salary" readonly value="<%=a.get(1)%>"></td></tr>
</table>
<%
if(session.getAttribute("user_type").toString().equals("accountant")){
%>
<p align="center"><input type="submit" value="Pay">
<%}%>
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
