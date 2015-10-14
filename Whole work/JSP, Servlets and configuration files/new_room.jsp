<%@page import="amit.jdbcconnection"%>
<%@page import="java.util.ArrayList"%>


<html>
<head>
<title>New Room</title>
<body bgcolor='#ffffcc'>
<p align='center'><img src='logo.bmp'></p>
<br>
<br>
<%try{String user=session.getAttribute("user_name").toString();%>
    <form method="get" action="logout">
        <p align="right"><strong>Welcome&nbsp;<%=user %></strong>
        &nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="Logout"></p>
    </form>

<!frameset rows="50%,50%">
<!frame name="f1" id="f1" noresize border="5">
<form method="post" action="newroom">

<table align="center" border="0">

<%
        jdbcconnection j=new jdbcconnection();
        ArrayList a=new ArrayList();
        a=j.getData("select room_id from room");
        int s=a.size();
        String room_id=new String();
        if(s<9){ room_id=new String("r-0"+(++s));}
        else{room_id=new String("r-"+(++s));}
%>

<tr><td>Room Id
<td><input type="text"  id="room_id"name="room_id" size="30" readonly value="<%=room_id%>">
<tr><td>Floor
<td><select name="floor" size="1">
    <option selected value="ground">Ground
    <option value="first">First
    <option value="second">Second
    <option value="third">Third
    <option value="fourth">Fourth
</select>
<tr><td>Description
<td><input type="radio" name="description" value="class" checked>Class
<input type="radio" name="description" value="office">Office

</table>
<script type="text/javascript">
function rooms(division)
    {
         document.getElementById(division).innerHTML="<table align=\"center\" width=\"100%\" border='1' c>"+
     "<tr>"+"<td width=\"25%\" align=\"center\">Room Id"+"<td width=\"25%\" align=\"center\">Floor"+
         "<td width=\"25%\" align=\"center\">Description"+
         "<td  align=\"center\" width=\"25%\">Availability"+
"<%
            jdbcconnection j2=new jdbcconnection();
            ArrayList ar=new ArrayList();
            ar=j2.getData("select * from room");
            int size=ar.size();
            if(size>0){
                for(int i=0;i<size;i=i+4){
%>"+
"<tr>"+
    "<td width=\"25%\" align=\"center\"><%=ar.get(i).toString()%></td>"+
    "<td width=\"25%\" align=\"center\"><%=ar.get(i+1).toString()%></td>"+
    "<td width=\"25%\" align=\"center\"><%=ar.get(i+2).toString()%></td>"+
    "<td width=\"25%\" align=\"center\"><%=ar.get(i+3).toString()%></td>"+
"</tr>"
+"<%}}%>"+

"</table>";

    }
    
</script>
<p align="center"><input type="submit" value="Ok">
<br>
<p align="center"><input type="button" onclick=rooms("div1") value="See Rooms"></p>
</form>

<br><br>
<div name="div1" id="div1"></div>
<!/frame>

<!frame name="f2" id="f2" noresize border="5">
    

<!/frame>

<!/frameset>
<BR>
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