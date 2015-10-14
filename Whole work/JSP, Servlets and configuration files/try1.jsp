
<%-- 
    Document   : try1
    Created on : Aug 25, 2009, 7:35:27 PM
    Author     : Amit
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
<script>var js="Hello World"</script>

<%// String js="<script>document.writeln(js);out.println("js="+js)</script>"; %>

</head>
<body bgcolor='#ffffcc'>

        <h1>Hello World!</h1>
                <script>
        function iload()
        {  var k=1;
            
            k=k+document.getElementById("n").value+document.getElementById("m").value;
            document.getElementById("k").value=k;
            alert(typeof(k));
            
        }


</script>
<form name="form1" id="form1">
tution fee
  <input type="text" name="n" id="n" onblur="iload()">
 Dues
  <input type="text" name="m" id="m" onblur="iload()">
  <input type="text" name="k" id="k" onfocus="iload()">
</form>
<script>
    function newwindow()
    {
        
        alert("amit");
    }
</script>

<form method="get">

<input type="button" value="test button" onclick="newwindow()">

<div name="div1" id="div1"></div>
</form>

    </body>
</html>
