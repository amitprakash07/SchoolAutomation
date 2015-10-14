
<%@page import="amit.jdbcconnection"%>
<%@page import="java.util.ArrayList"%>



<html>
<head>
<title>New Item</title>
<script type="text/javascript"   src="formvalidation.js">



</script>

<body bgcolor='#ffffcc' onload="setfocus('item_name')">
<p align="center"><img src="logo.bmp"></p>
<br>
<br>
<%try{String user=session.getAttribute("user_name").toString();%>
    <form method="get" action="logout">
        <p align="right"><strong>Welcome&nbsp;<%=user %></strong>
        &nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="Logout"></p>
    </form>

<form method="post" action="newitem" onsubmit="return validate('item_name','item_code','price','quantity','purchase_date','dept_name')">

<table align="center" border="0">

<tr><td>Item Name
<td><input type="text"  id="item_name"name="item_name" size="30" onblur="validatetextfield('item_name')">*

<%
        jdbcconnection j=new jdbcconnection();
        ArrayList a=new ArrayList();
        a=j.getData("select item_code from items");
        int s=a.size();
        String item_id=new String();
        if(s<9){ item_id=new String("i-0"+(++s));}
        else{item_id=new String("i-"+(++s));}
%>


<tr><td>Item Code
<td><input type="text" name="item_code" id="item_code" readonly value="<%=item_id%>" size="30" onblur="validateid('item_code')">*
<tr><td>Price
<td><input type="text" name="price" size="30" id="price" onblur="validateprice('price')">*
<tr><td>Quantity
<td><input type="text" name="quantity" size="30" id="quantity" onblur="validatenumberfield('quantity')">*

<tr><td>Company
<td><input type="text" name="company" size="30" id="company">
<tr><td>Department Name
<td>

<select name="dept_id" id="dept_id" size="1">

<%
    a=j.getData("select dept_id,dept_name from department order by dept_id");
    s=a.size();
    for(int k=0;k<s;k=k+2)
        {
%>

<option value="<%=a.get(k)%>"><%=a.get(k)%>/<%=a.get(k+1)%>
<%}%>
</select>

</table>
<p align="center"><input type="submit" value="ok" onclick="return validate('item_name','item_code','price','quantity','purchase_date','dept_name')">
<p align="center"><input type="button" value="See Items" onclick=items('div1')></p>
</form>
<br>
<div id="div1"></div>

<script>
    function items(division)
    {
        document.getElementById(division).innerHTML="<table width='100%' border='1'>"+
            "<tr><td align='center'>Item Name"+
            "<td align='center'>Department Name"+
            "<td align='center'>Price"+
            "<td align='center'>Quantity"+
            "<td align='center'>Purchase Date"+

            "<%
               jdbcconnection jnew=new jdbcconnection();
               ArrayList anew=new ArrayList();
               anew=jnew.getData("select * from item_view");
               for(int i=0;i<anew.size();i=i+5)
                   {
            %>"+

                    "<tr><td align='center'><%=anew.get(i)%>"+
                    "<td align='center'><%=anew.get(i+1)%>"+
                    "<td align='center'><%=anew.get(i+2)%>"+
                    "<td align='center'><%=anew.get(i+3)%>"+
                    "<td align='center'><%=anew.get(i+4)%>"+
              "<%}%>"+
            "</table>";

    }
</script>
 






<BR>
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