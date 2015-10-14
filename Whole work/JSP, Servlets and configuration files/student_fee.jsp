<%@page import="amit.jdbcconnection,java.util.Calendar" %>
<%@page import="java.util.ArrayList" %>

<%! int tot=0;
    String s1=new String("");
    String s2=new String("");
%>

<html>
<head>
<title>Student Fee</title>
<body bgcolor='#ffffcc'>
<p align="center"><img src="logo.bmp"></p>
<%try{String user=session.getAttribute("user_name").toString();%>
    <form method="get" action="logout">
        <p align="right"><strong>Welcome&nbsp;<%=user %></strong>
        &nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="Logout"></p>
    </form>

<br><br>
    <%
        String str=session.getAttribute("s_id").toString();
        jdbcconnection j=new jdbcconnection();
        ArrayList a=new ArrayList();
        a=j.getData("select first_name||' '||middle_name||' '||last_name,class_id from student where s_id='"+str+"'");
    %>


<form method="post" action="feesubmit">
<table align="center" cellpadding="8">
<tr><td>student Id</td>
<td><input type="text" name="s_id" id="s_id" readonly size="25" value="<%=str%>" ></td></tr>
<tr><td>Name</td>

<td><input type="text" size="25" value="<%=a.get(0)%>" readonly ></td></tr>

<tr><td>class
    <%  String s=a.get(1).toString();
        a=j.getData("select class_name,fees_id from class where class_id='"+s+"'");
        String fees_id =new String();
        if(a.size()>0){fees_id=a.get(1).toString();s1=a.get(0).toString();}
    %>

<td><input type="text" readonly size="25" value="<%=s1%>"

<%
         Calendar c=Calendar.getInstance();
         String[] months={"JAN","FEB","MAR","APR",
                            "MAY",
                            "JUN",
                            "JUL",
                            "AUG",
                            "SEP",
                            "OCT",
                            "NOV",
                            "DEC" };
          int month=c.get(2);
%>



<tr><td>Month</td>
<td><select name="fee_of_month" id="fee_of_month" size="1">

    <%
        for(int i=0;i<=month;i++){
    %>
  <option value="<%=months[i]%>"><%=months[i]%>
<%}%>

</select></td></tr>


<tr><td>Tution fee

<%
    a=j.getData("select tution_fees from fees where fees_id='"+fees_id+"'");
    if(a.size()>0){tot+=Integer.parseInt(a.get(0).toString());}
    //System.out.println(a.size());
    //System.out.println(a.get(0));
%>

<td><input type="text" size="25" readonly value="<%=a.get(0)%>">


<tr><td>Library Fine</td>

<%
a=j.getData("select sum(fine) from library_retrieval where s_id='"+str+"' and fine_status='not_paid'");
int fine=0;
//System.out.println(a.size());
//System.out.println(a.get(0));
if(a.size()>1){fine=Integer.parseInt(a.get(0).toString());tot+=fine;}

%>


<td><input type="text" size="25" readonly  name="library_fine" id="library_fine" readonly value="<%=fine%>"></td></tr>

<tr><td>Total</td>
<td><input type="text" size="10" name="total_fee_paid" id="total_fee_paid" readonly  value="<%=tot%>"></td></tr>

</table>
<%
if(!session.getAttribute("user_type").equals("student")){
%>

<p align="center"><input type="submit" value="Collect Fee"></p>

<%}%>

</form>
<%}catch(Exception e){
  //  System.out.println("t2");
    %>
<br>
<p align="center">
    <strong>Please Login First</strong>
</p>
<br>
    <p align="center"><a href="login.jsp">Log In</a></p>
<%}%>

</body>
</html>