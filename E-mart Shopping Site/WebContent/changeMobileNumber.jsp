<%@ page import="project.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<%@ include file="changeDetailsHeader.jsp" %>
<html>
<head>
<link rel="stylesheet" href="css/changeDetails.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Change Mobile Number</title>
</head>
<body>
<%
String msg=request.getParameter("msg");
if("done".equals(msg))
{
%>
<h3 class="alert">Your Mobile Number successfully changed!</h3>
<%} %>
<%
if("wrong".equals(msg))
{
%>
<h3 class="alert">Your Password is wrong!</h3>
<%} %>
<form action="changeMobileNumberAction.jsp" method="post">
 <h3>Enter Your New Mobile Number</h3>
 <input style="border-radius: 10px;background-color: #1a222d;color:white;" class="input-style" type="number" name="mobileNumber" placeholder="Enter Your New Mobile Number" required>
 <br>
<h3>Enter Password</h3>
<input style="border-radius: 10px;background-color: #1a222d;color:white;" class="input-style" type="password" name="password" placeholder="Enter Your Password" required>
<br><br>
 <button style="border-radius: 20px" class="button" type="submit">Save <i class='far fa-arrow-alt-circle-right'></i></button>
</form>
<%@ include file="footer.jsp" %>
</body>
<br><br><br>
</html>