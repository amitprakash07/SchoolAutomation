<html>
<head>
<title>Login</title>
<script type="text/javascript"   src="formvalidation.js">



</script>

<body bgcolor='#ffffcc' onload="setfocus('user_name')">
<p align="center"><img src="logo.bmp"></p>
<table align="center" border="0" cellspacing="-20" cellpadding="1">
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


<table border="0" width="100%">
<tr>
<td>






<td width="15%">
<fieldset>
<legend align="center"><strong>Log In</strong></legend>
<form method="post" action="Login" onsubmit="return validate('user_name','password')">
<table width="100%" border="0">
<tr><td>Username<td><input type="text" name="user_name" id="user_name" size="30">
<tr><td>password<td><input type="password" name="password" id="password" size="30">
<tr><td>user type<td><select name="user_type" size="1">
<option value="student" selected>Student
<option value="teacher">Teacher
<option value="class Teacher">Class Teacher
<option value="staff">Staff
<option value="administrator">Administrator
<option value="accountant">Accountant
<option value="librarian">Librarian
</select>
</table>

<p align="center"><input type="submit" value="sign In" onclick="return validate('user_name','password')"></p>
</form>
</fieldset>
</table>

<br>
<br><br><br><br><br><br>
<hr>
<p align="center" bgcolor="#435678">
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
