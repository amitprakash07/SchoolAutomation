<%@page import="amit.jdbcconnection" %>
<%@page import="java.util.ArrayList" %>


<html>
<head>
<title> New Lab Item</title>
</head>

<body bgcolor='#ffffcc' onload="setfocus('item_name')">
<p align="center"><img src="logo.bmp"></p>
<br>
<br>
<%try{String user=session.getAttribute("user_name").toString();%>
    <form method="get" action="logout">
        <p align="right"><strong>Welcome&nbsp;<%=user %></strong>
        &nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="Logout"></p>
    </form>

<form method="post" action="newlabitem" onsubmit="return (validate('item_name','quantity','price','lab_id')&& validatenumberfield('quantity')&& validateprice('price'))">
<table align="center" border="0">
<script src="formvalidation.js">

</script>
<tr><td>Item Code

  <%
    jdbcconnection j=new jdbcconnection();
    ArrayList a=new ArrayList();
    a=j.getData("select item_code from lab_item");
    int size=a.size();
    String item_code="li-"+(++size);
  %>

<td><input type="text" name="item_code" size="30" id="item_code" readonly value="<%=item_code%>">*

<tr><td>Item Name
<td><input type="text" name="item_name" id="item_name"size="30" onblur="validatetextfield('item_name')">*


<tr><td>Lab Name

<td><select name="lab_id" id="lab_id">


  <%  a=j.getData("select lab_id,lab_name from lab order by lab_id");
    if(a.size()>0){
        for (int i=0;i<a.size();i=i+2){
%>

<option value="<%=a.get(i)%>"><%=a.get(i+1)%>/&nbsp;<%=a.get(i)%>

<%}}else{%>

<option selected value="">No Lab Exist<%}%>

</select>

<tr><td>Price
<td><input type="text" name="price" size="30" id="price" onblur="validateprice('price')">*
<tr><td>Quantity
<td><input type="text" name="quantity" size="30" id="quantity" onblur="validatenumberfield('quantity')">*
</table>
<p align="center"><input type="submit" value="ok" onclick="return (validate('item_name','quantity','price','lab_id')&& validatenumberfield('quantity')&& validateprice('price'))">
<p align="center"><input type="button" onclick=lab_item('div1') value="See Lab Items"></p>
</form>
<br>

<div id="div1"></div>

<script>
    function lab_item(division)
    {
        document.getElementById(division).innerHTML="<table width='100%' border='1'>"+
            "<tr><td align='center'>Lab Name"+
            "<td align='center'>Item Name"+
            "<td align='center'>Quantity"+

        "<%
                jdbcconnection jnew=new jdbcconnection();
                ArrayList anew=new ArrayList();
                anew=jnew.getData("select * from lab_item_view");
                for(int i=0;i<anew.size();i=i+3){
        %>"+

           "<tr><td align='center'><%=anew.get(i)%>"+
           "<td align='center'><%=anew.get(i+1)%>"+
           "<td align='center'><%=anew.get(i+2)%>"+
         "<%}%>"+
         "</table>";
    }
</script>

<br><br><br><br><br><br>
<hr>

<p><strong>*Mandatory Fields</strong></p>
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