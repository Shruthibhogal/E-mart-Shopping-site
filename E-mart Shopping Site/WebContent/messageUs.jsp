<%@ page import="project.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<%@ include file="header.jsp" %>
<html>
<head>
<link rel="stylesheet" href="css/messageUs.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Feedback</title>
</head>
<body>
<div style="color: white; text-align: center; font-size: 30px;">Feedback <i class="fa fa-comments-o"></i></div>
<br>
<%
String msg=request.getParameter("msg");
if("valid".equals(msg))
{
%>
<h3 style="text-align:center; color:white ;">Message successfully sent. Our team will contact you soon!</h3>
<%} %>
<%
if("invalid".equals(msg))
{
%>
<h3 style="text-align:center; ">Some thing Went Wrong! Try Again!</h3>
<%} %>
<form action="messageUsAction.jsp" method="post">
<input  style="border-radius: 10px;background-color: #1a222d;color:white;" class="input-style" name="subject" type="text" placeholder="Subjects" required>
<br><br>
<textarea style="border-radius: 10px;background-color: #1a222d;color:white;" class="input-style" name="body" placeholder="Enter your Message" required></textarea>
<br><br>
<button  style="border-radius: 20px" class="button" type="submit">Send <i class="far fa-arrow-alt-circle-right"></i></button>
</form>
<br><br><br>
<%@ include file="footer.jsp" %>

</body>
</html>