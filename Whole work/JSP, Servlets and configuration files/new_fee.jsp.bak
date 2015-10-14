
<%@page import="amit.jdbcconnection"%>
<%@page import="java.util.ArrayList"%>



<html>
<head>
<title>New Fee</title>

<script type="text/javascript"   src="formvalidation.js">



</script>

<body bgcolor='#ffffcc' onload="setfocus('tution_fees')">
<p align="center"><img src="logo.bmp"></p>

<br>
<br>
<br>
<%try{String user=session.getAttribute("user_name").toString();%>
    <form method="get" action="logout">
        <p align="right"><strong>Welcome&nbsp;<%=user %></strong>
        &nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="Logout"></p>
    </form>

<form method="post" action="newfee" onsubmit="return validate('fees_id','tution_fees')">
<table align="center">

<%
        jdbcconnection j=new jdbcconnection();
        ArrayList a=new ArrayList();
        a=j.getData("select fees_id from fees");
        int s=a.size();
        String fees_id=new String();
        if(s<9){ fees_id=new String("f-0"+(++s));}
        else{fees_id=new String("f-"+(++s));}
%>

<tr><td>Fee Id
<td><input type="text" name="fees_id" id="fees_id" size="30" value="<%=fees_id%>" readonly>*

<tr><td>Tution Fees
<td><input type="text" name="tution_fees" id="tution_fees" size="30" onblur="validateprice('tution_fees')">*
</table>
<p align="center"><input type="submit" value="Ok" onclick="return validate('fees_id','tution_fees')">
<p align="center"><input type="button" onclick=fees('div1') value="See Fees"></p>
</form>
<br>
<div id="div1"></div>

 <script>


            function fees(division)
            {
                document.getElementById(division).innerHTML="<table width='100%' border='1'>"+
                    "<tr><td align='center' width='50%'>Fee Id"+
                    "<td align='center' width='50%'>Tution fees"+

                   "<%
                        jdbcconnection jnew=new jdbcconnection();
                        ArrayList anew=new ArrayList();
                        anew=jnew.getData("select * from fees");
                        for(int i=0;i<anew.size();i=i+2)
                            {
                   %>"+

                              "<tr><td align='center'><%=anew.get(i)%>"+
                              "<td align='center'><%=anew.get(i+1)%>"
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