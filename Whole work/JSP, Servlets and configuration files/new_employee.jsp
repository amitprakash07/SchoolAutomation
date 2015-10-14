<%@page import="amit.jdbcconnection"%>
<%@page import="java.util.ArrayList"%>

<html>
<head>
<title>Recruitment</title>
<script src="formvalidation.js">

</script>
</head>
<body bgcolor='#ffffcc' onload="setfocus('emp_first_name')">
<p align="center"><img src="logo.bmp"></p>

<%try{String user=session.getAttribute("user_name").toString();%>
    <form method="get" action="logout">
        <p align="right"><strong>Welcome&nbsp;<%=user %></strong>
        &nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="Logout"></p>
    </form>

<p align="center"><strong>New Recruitment Form</strong></p>

<br><br>

<form method="post" action="recruitment" onsubmit="return (validate('emp_first_name','emp_last_name','job_name','phone') && valid_f_m_l_name('emp_first_name') && valid_f_m_l_name('emp_last_name') && validatephone('phone'))">

<table align="center" border="0">
<tr><td>First Name</td>
<td><input type="text" name="emp_first_name"  id="emp_first_name"size="30" onblur="valid_f_m_l_name('emp_first_name')">*</td></tr>
<tr><td>Middle name</td>
<td><input type="text" name="emp_middle_name" size="30" id="emp_middle_name"onblur="valid_f_m_l_name('emp_middle_name')"></td></tr>
<tr><td>Last Name</td>
<td><input type="text" name="emp_last_name" id="emp_last_name" size="30" onblur="valid_f_m_l_name('emp_last_name')">*</td></tr>

<tr><td>Date of birth</td>
<td ><select name="day" size="1" id="day">
<option selected>1
<option>2
<option>3
<option>4
<option>5
<option>6
<option>7
<option>8
<option>9
<option>10
<option>11
<option>12
<option>13
<option>14
<option>15
<option>16
<option>17
<option>18
<option>19<option>20<option>21<option>22<option>23<option>24<option>25
<option>26<option>27<option>28<option>29<option>30<option>31
</select>

<select name="month" size="1" id="month">
<option selected>JAN
<option>FEB
<option>MAR
<option>APR
<option>MAY
<option>JUN
<option>JUL
<option>AUG
<option>SEP
<option>OCT
<option>NOV
<option>DEC
</select>


<select name="year" size="1" id="year">
<option selected>1985
<option>1986
<option>1987<option>1988<option>1989<option>1990<option>1991<option>1992<option>1993
<option>1994<option>1995<option>1996<option>1997<option>1998<option>1999<option>2000
<option>2001<option>2002<option>2003<option>2004<option>2005<option>2006<option>2007
<option>2008<option>2009<option>2010
</select>
</td></tr>
<tr>
<td>Sex</td>

<td><input type="radio" name="sex" id="sex"value="Male" checked>Male
<input type="radio" name="sex" id="sex" value="Female">Female
</td></tr>

<%
    jdbcconnection j=new jdbcconnection();
    ArrayList a=new ArrayList();
    a=j.getData("select job_id,job_name from job where job_name!='teacher'");
    ArrayList a1=j.getData("select job_id,job_name from job where job_name='teacher'");
    if(a1.size()>0){

%>


<script>

        function user_type(division,name)
        {
            var val=document.getElementById(name).value;
            if(val=="nonteaching"){

             document.getElementById(division).innerHTML="Job Name"+

                "<td><select name=\"job_name\" id=\"job_name\">"+
         "<%
            for(int n=0;n<a.size();n=n+2)
            {
        %>"+
        "<option value=\"<%=a.get(n)%>\"><%=a.get(n)%>/<%=a.get(n+1)%>"+
        "<%}%>"+
        "</select></td>";
            

        }
        else{


            document.getElementById(division).innerHTML="Job Name"+
         "<td><input type=\"text\" name=\"job_name\" id=\"job_name\" readonly value=\"<%=a1.get(0)%>\"></td>";

        }

    }

</script>

<%}%>

<tr><td>Job Type</td>
<td><select name="job_type" id="job_type" onclick="user_type('div3','job_type')" onchange="user_type('div3','job_type')" onkeypress="user_type('div3','job_type')">
    <option selected>Please Select....
    <option value="teaching">Teaching
    <option value="nonteaching" >Non teaching
</select>
</td></tr>


<tr><td><div id="div3"></div></td></tr>

<tr><td>Address</td><td><textarea rows="3" cols="30" name="address"></textarea></td></tr>
<tr><td>Qualification</td>
<td ><select name="qualification" size="1" id="qualification">
<option>Non-Matriculate
<option>Matriculate
<option>12 passed
<option>Undergraduate
<option selected>Graduate
<option>Masters degree
</select>
</td></tr>
<tr><td>Phone</td>
<td ><input type="text" name="phone" size="30" id="phone" onblur="validatephone('phone')">*</td></tr>
<!tr><!td></td>
<!td><!input type="file" name="photo" size="30"></td></tr>
</table>
<br><p align="center"><input type="submit" value="Submit" onclick="return (validate('phone','emp_first_name','emp_last_name','job_name') && valid_f_m_l_name('emp_first_name') && valid_f_m_l_name('emp_last_name') && validatephone('phone'))"</form>

<p><strong>* Mandatory Fields</strong></p>

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
