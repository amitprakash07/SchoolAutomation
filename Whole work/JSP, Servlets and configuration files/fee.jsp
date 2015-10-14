<html>
<head>
<title>Fee</title>
<script type="text/javascript"   src="formvalidation.js">



</script>

<body bgcolor='#ffffcc'>
    
    
    


<br>
<p align="center"><img src="logo.bmp"></p>

<%try{String user=session.getAttribute("user_name").toString();%>
    <form method="get" action="logout">
        <p align="right"><strong>Welcome&nbsp;<%=user %></strong>
        &nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="Logout"></p>
    </form>
<br><br>


<form method="post" submit="feesubmit" onsubmit="validate('s_id')">
<table align="center">
<tr><td>Enter student Id
<td><input type="text" name="s_id" id="s_id" size="30" onblur="validateid('s_id')">*
<tr><td>Enter Name
<td><input type="text" name="name" size="30" id="name"onblur="validatetextfield('name')">
<tr><td>class
<td><select name="class" size="1" id="class">
<option selected>Nursery
<option>L.K.G
<option>U.K.G
<option>1
<option>2
<option>3
<option>4
<option>5
<option>6
<option>7
<option>8
<option>9
<option>10
</select>

<tr><td>Section
<td><select name="sec" size="1" id="sec">
<option selected>A
<option>B
<option>C
<option>D
<option>E
</select>

<tr><td>Month
<td><select name="month" size="1" id="month">
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

<tr><td>Tution fee
<td><input type="text" name="total_fee" id="total_fee"size="30" >
<tr><td>Dues
<td><input type="number" name="remaining_fee" id="remaining_fee" size="30">
<tr><td>Total
<td><input type="number" name="total" size="30" id="total">
</table>
<p align="center">
<input type="submit" value="Save and print" onclick="return validate('s_id')">
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