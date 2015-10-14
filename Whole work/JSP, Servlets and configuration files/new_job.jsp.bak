<%@page import="amit.jdbcconnection"%>
<%@page import="java.util.ArrayList"%>

<html>
<head>
<title>New job</title>
<script type="text/javascript"   src="formvalidation.js">

</script>
<script>
    function load()
    {
        setfocus('basic_sal');
        usual();
    }
</script>
<body bgcolor='#ffffcc' onload="usual()">
<p align="center"><img src="logo.bmp"></p>
<br>
<br>
<%try{String user=session.getAttribute("user_name").toString();%>
    <form method="get" action="logout">
        <p align="right"><strong>Welcome&nbsp;<%=user %></strong>
        &nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="Logout"></p>
    </form>


<form method="post" action="newjob" onsubmit="return validate('job_id','job_name','basic_sal','pf','da','hra','income_tax','department_id')">

<table align="center" border="0">

    <%
        jdbcconnection j=new jdbcconnection();
        ArrayList a=new ArrayList();
        a=j.getData("select job_id from job");
        int s=a.size();
        String job_id=new String();
        if(s<9){ job_id=new String("j-0"+(++s));}
        else{job_id=new String("j-"+(++s));}
    %>

<script>

function other()
    {
        document.getElementById("other").innerHTML="<td><input type='text' id='job_name2' name='job_name2' size='30' onblur='validatetextfield(\"job_name2\")'>*"
        document.getElementById("vali").innerHTML="<p align=\"center\"><input type=\"submit\" value=\"ok\" onclick=\"return validate('job_id','job_name1','job_name2','basic_sal','pf','da','hra','income_tax','department_id')\"></p>"
        setfocus('job_name2');
    }


    function usual()
    {
        document.getElementById("other").innerHTML="";
        document.getElementById("vali").innerHTML="<p align=\"center\"><input type=\"submit\" value=\"ok\" onclick=\"return validate('job_id','job_name1','basic_sal','pf','da','hra','income_tax','department_id')\"></p>"
    }


    function check()
    {
        if(document.getElementById("job_name1").value=='other'){other();}
        else usual();
    }

</script>


<tr><td>Job Id

<td><input  id="job_id"type="text" name="job_id" size="30" value="<%=job_id%>" readonly >*

<tr><td>Job Name
<td><select name="job_name1" id="job_name1" size="1" onblur="check()">
    <option value="administrator" onclick="usual()">Administrator
    <option value="librarian" onclick="usual()">Librarian
    <option value="teacher" selected onclick="usual()">Teacher
    <option value="accountant" onclick="usual()">Accountant
    <option value="other" onclick="other()" onblur="other()" onkeyup="other()">Other
</select>

<div id="other" name="other"></div>

<tr><td>Basic Salary
<td><input type="text" name="basic_sal"  id="basic_sal"size="30" onblur="validateprice('basic_sal')">*
<tr><td>Provident Fund
<td><input type="text" name="pf" size="20" id="pf" onblur="validateprice('pf')">&nbsp;&nbsp;%*
<tr><td>Duty Allowance
<td><input type="text" name="da" size="20" id="da" onblur="validateprice('da')">&nbsp;&nbsp;%*
<tr><td>House Rent Allowance
<td><input type="text" name="hra" size="30" id="hra" onblur="validateprice('hra')">*
<tr><td>Income Tax
<td><input type="text" name="income_tax" size="30" id="income_tax" onblur="validateprice('income_tax')">*
<tr><td>Department Name

<%
    a=j.getData("select dept_id,dept_name from department order by dept_id");
    s=a.size();
%>

<td>
    
    <select name="department_id" id="department_id">

        <%
            for(int n=0;n<s;n=n+2){
        %>

        <option value="<%=a.get(n)%>"><%=a.get(n)%>/<%=a.get((n+1))%>

        <%
            }
        %>

</select>

</table>
<div id="vali"></div>
    <p align="center"><input type="button" onclick=jobs('div1') value="See Job"></p>
</form>
<div name="div1" id="div1"></div>
<script>
    function jobs(division)
    {
        document.getElementById(division).innerHTML="<table width='100%' border='1'>"+
            "<tr><td align='center' width='40%'>Job Name"+
            "<td align='center' width='30%'>Basic Salary"+
            "<td align='center' width='30%'>Department Name"+

        "<%
                jdbcconnection jnew=new jdbcconnection();
                ArrayList anew=new ArrayList();
                anew=jnew.getData("select * from job_view");
                for(int i=0;i<anew.size();i=i+3)
                    {
        %>"+
                    "<tr><td align='center' width='30%'><%=anew.get(i)%>"+
                    "<td align='center' width='30%'><%=anew.get(i+1)%>"+
                    "<td align='center' width='30%'><%=anew.get(i+2)%>"+
             "<%}%>"+
             "</table>";

    }
</script>

<br>
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