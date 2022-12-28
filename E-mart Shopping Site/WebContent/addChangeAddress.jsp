<%@ page import="project.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<%@ include file="changeDetailsHeader.jsp" %>

<html>
<head>
<link rel="stylesheet" href="css/changeDetails.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Add or change Address</title>
</head>
<body>
<%
String msg=request.getParameter("msg");
if("valid".equals(msg))
{
%>
<h3 class="alert">Address Successfully Updated !</h3>
<%} %>
<%
if("invalid".equals(msg))
{
%>
<h3 class="alert">Some thing Went Wrong! Try Again!</h3>
<%} %>
<%
try
{
Connection con=ConnectionProvider.getCon();
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select * from users where email='"+email+"'");
while(rs.next())
{
%>
<form action="addChangeAddressAction.jsp" method="post">
<h3>Enter Address</h3>
 <input style="border-radius: 10px;background-color: #1a222d;color:white;" class="input-style" type="text" name="address" value="<%=rs.getString(7)%>" placeholder="Enter Address" required>
 <br>
 <h3>Enter city</h3>
 <input style="border-radius: 10px;background-color: #1a222d;color:white;" class="input-style" type="text" name="city" value="<%=rs.getString(8)%>" placeholder="Enter City" required>
<br>
<h3>Enter State</h3>
<input style="border-radius: 10px;background-color: #1a222d;color:white;" class="input-style" type="text" name="state" value="<%=rs.getString(9)%>" placeholder="Enter State" required>
<br>
<h3>Enter country</h3>
<input style="border-radius: 10px;background-color: #1a222d;color:white;" class="input-style" type="text" name="country" value="<%=rs.getString(10)%>" placeholder="Enter Country" required>
<br><br>
 <button style="border-radius: 20px" class="button" type="submit">Save <i class='far fa-arrow-alt-circle-right'></i></button>
</form>
<%
}
}
catch(Exception e)
{
	System.out.println(e);
}%>
<br>
<%@ include file="footer.jsp" %>
</body>
<br><br><br>
</html>