<%@ page import="project.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<%@ include file="changeDetailsHeader.jsp" %>
<html>
<head>
<link rel="stylesheet" href="css/changeDetails.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Change Password</title>
</head>
<body>
<%
String msg=request.getParameter("msg");
if("notMatch".equals(msg))
{
%>
<h3 class="alert">New password and Confirm password does not match!</h3>
<%} %>
<%
if("wrong".equals(msg))
{
%>
<h3 class="alert">Invalid Current Password!</h3>
<%} %>
<%
if("done".equals(msg))
{
%>
<h3 class="alert">Password change successfully!</h3>
<%} %>
<%
if("invalid".equals(msg))
{
%>
<h3 class="alert">Some thing went wrong! Try again!</h3>
<%} %>
<form action="changePasswordAction.jsp" method="post">
<h3>Enter Current Password</h3>
 <input style="border-radius: 10px;background-color: #1a222d;color:white;" class="input-style" type="password" name="oldPassword" placeholder="Enter Old Password" required> 
  <br>
 <h3>Enter New Password</h3>
 <input style="border-radius: 10px;background-color: #1a222d;color:white;" class="input-style" type=password name="newPassword" placeholder="Enter New Password" required>
 <br>
<h3>Enter Confirm Password</h3>
<input style="border-radius: 10px;background-color: #1a222d;color:white;" class="input-style" type="password" name="confirmPassword" placeholder="Enter Confirm Password" required>
<br><br>
 <button style="border-radius: 20px" class="button" type="submit">Save <i class='far fa-arrow-alt-circle-right'></i></button>
</form>
<%@ include file="footer.jsp" %>
</body>
<br><br><br>
</html>