<html>
<head>
<title>Employee Update</title>
<script src="formvalidation.js">

</script>
</head>
<body bgcolor='#ffffcc'>
    <%try{String user=session.getAttribute("user_name").toString();%>
    <form method="get" action="logout">
        <p align="right"><strong>Welcome&nbsp;<%=user %></strong>
        &nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="Logout"></p>
    </form>
    <p align="right"><strong>Welcome&nbsp;<%=user %></strong>
    
<p align="center"><img src="logo.bmp"></p>

<p align="center"><strong>Employee Update</strong>

<br><br>

<form method="post" action="#" onsubmit="return validate('emp_first_name','emp_last_name','job_name')">
<table align="center" >
<tr><td>First Name
<td ><input type="text" name="emp_first_name" id="emp_first_name" size="30" onblur="valid_f_m_l_name('emp_first_name')">*
<tr><td>Middle name
<td ><input type="text" name="emp_middle_name" size="30" id="emp_middle_name" onblur="valid_f_m_l_name('emp_middle_name')">
<tr><td>Last Name
<td ><input type="text" name="emp_last_name" size="30" id="emp_last_name" onblur="valid_f_m_l_name('emp_last_name')">*

<tr><td>Date of birth
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
<tr>
<td>Sex

<td ><input type="radio" name="sex" id="sex" value="Male" checked>Male
<input type="radio" name="sex" id="sex" value="Female">Female

<tr><td>Job Type
<td ><input type="radio" name="job_type" id="job_type" value="Teaching" checked>Teaching
<input type="radio" name="job_type" id="job_type" value="Nonteaching">Non teaching

<tr><td>Job Name
<td ><input type="text" name="job_name" id="job_name" size="30" onblur="validatetextfield('job_name')">*

<tr><td>Address<td ><textarea rows="3" cols="30" ></textarea>
<tr><td>Qualification
<td ><select name="qualification" id="qualification" size="1">
<option>Non-Matriculate
<option>Matriculate
<option>12 passed
<option>Undergraduate
<option selected>Graduate
<option>Master's degree
</select>
<tr><td>Phone
<td ><input type="text" name="phone" id="phone" size="30" onblur="validatephone('phone')">
<tr><td>Photo
<td><input type="file" name="photo" size="30">
</table>
<br><p align="center"><input type="Submit" value="Update" onclick="return validate('emp_first_name','emp_last_name','job_name')">
</form>
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
