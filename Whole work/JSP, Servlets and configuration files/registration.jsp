<html>
<head>
<title>student admission</title></head>
<script type="text/javascript"   src="formvalidation.js">



</script>




<body bgcolor='#ffffcc' onload="setfocus('stud_first_name')">
    <script language="text/javascript">




</script>

<p align="center"><img src="logo.bmp"></p><br><br>
<%try{String user=session.getAttribute("user_name").toString();%>
    <form method="get" action="logout">
        <p align="right"><strong>Welcome&nbsp;<%=user %></strong>
        &nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="Logout"></p>
    </form>


<p align="center"><strong>New Admission Registration Form</strong><br><br>
<form method="post" action="submit" onsubmit="return (validate('econt_no','stud_last_name','father_name','stud_first_name')&& valid_f_m_l_name('stud_first_name') && valid_f_m_l_name('stud_last_name') && validatetextfield('father_name') && validatephone('econt_no'))">
<table align="center" >
<tr><td>First Name<td><input type="text"  id="stud_first_name"name="stud_first_name" size="30" onblur="return valid_f_m_l_name('stud_first_name')" >*
<tr><td>Middle name<td><input type="text" name="stud_middle_name" id="stud_middle_name" size="30" onblur="valid_f_m_l_name('stud_middle_name')">
<tr><td>Last Name<td><input type="text" name="stud_last_name" size="30" id="stud_last_name" onblur="valid_f_m_l_name('stud_last_name')">*
<tr><td>Date of birth
<td><select name="day" size="1">
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

<select name="month" size="1">
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


<select name="year" size="1">
<option selected>1985
<option>1986
<option>1987<option>1988<option>1989<option>1990<option>1991<option>1992<option>1993
<option>1994<option>1995<option>1996<option>1997<option>1998<option>1999<option>2000
<option>2001<option>2002<option>2003<option>2004<option>2005<option>2006<option>2007
<option>2008<option>2009<option>2010
</select>

<tr><td>Sex


<td><input type="radio" name="sex" value="Male" checked>Male
<input type="radio" name="sex" value="Female">Female

<tr><td>class
<td><select name="class" size="1">
<option selected value="nursery">Nursery
<option value="l.k.g">L.K.G
<option value="u.k.g">U.K.G
<option value="1">1
<option value="2">2
<option value="3">3
<option value="4">4
<option value="5">5
<option value="6">6
<option value="7">7
<option value="8">8
<option value="9">9
<option value="10">10
</select>

<tr>
    <td>Section</td>
    <td><select name="sec" id="sec" size="1">
        <option value="a">A
        <option value="b">B
        <option value="c">C
        <option value="d">D
        <option value="e">E
    </select></td>
</tr>
<tr><td>Father Name<td><input type="text" name="father_name" size="30" id="father_name" onblur="validatetextfield('father_name')">*
<tr><td>Father Occupation<td><input type="text" name="father_occupation" size="30" id="father_occupation" onblur="validatetextfield('father_occupation')">
<tr><td>Mother Name<td><input type="text" name="mother_name" size="30" id="mother_name" onblur="validatetextfield('mother_name')">
<tr><td>Mother Occupation<td><input type="text" name="mother_occupation" size="30" id="mother_occupation" onblur="validatetextfield('mother_occupation')">

<tr><td>Address
<td><textarea name="address" rows="3" cols="30"></textarea>
				




<tr><td>Annual income<td><select name="annual_income" size="1">

<option>Below 50000
<option>50000-100000
<option>100000-200000
<option selected>Above 200000
</select>
<tr><td>Brother<td><input type="text" name="no_of_brother" size="5" id="no_of_brother" onblur="validatenumberfield('No_of_brother')">
<tr><td>Sister
<td><input type="text" id="no_of_sister"name="no_of_sister" size="5" onblur="validatenumberfield('no_of_sister')">
<tr><td>phone
<td><input type="text" name="phone_no" id="phone_no" size="15" onblur="validatephone('phone_no')">
<tr><td>Emergency No.

<td><input type="text" name="econt_no" size="15" id="econt_no" onblur="validatephone('econt_no')">*
<!tr><!td>
<!td><!input type="file" name="photo" accept="*.jpg,*.bmp" size="30">



</table>

<br><p align="center"><input type="Submit" value="Submit" onclick="return (validate('econt_no','stud_last_name','father_name','stud_first_name')&& valid_f_m_l_name('stud_first_name') && valid_f_m_l_name('stud_last_name') && validatetextfield('father_name') && validatephone('econt_no'))">
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
