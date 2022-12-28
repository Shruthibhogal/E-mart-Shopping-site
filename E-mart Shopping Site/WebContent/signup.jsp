<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/signup-style.css">
<title>Signup</title>
</head>
<body>
<div id='container'>
  <div class='signup'>
    <form action="signupAction.jsp" method="post">
    <h3 style="color: black;font-size: xx-large;;margin-top: -10px;font-family: Lucida Handwriting;">Create Account</h3>
    <input style="background-color: black;color: white;padding-left: 12px;" type="text" name="name" placeholder="Enter Name" required>
    <input style="background-color: black;color: white;padding-left: 12px;" type="email" name="email" placeholder="Enter Email" required>
    <input style="background-color: black;color: white;padding-left: 12px;" type="number" name="mobileNumber" placeholder="Enter Mobile Number" required>
    <select style="background-color: black;color: white;" name="securityQuestion" required>
    <option style="color: white;" value="">&nbsp;&nbsp;Select Security Question</option>
    <option style="color: white;" value="What was your first car?">What was your first car?</option>
    <option style="color: white;" value="What is the name of your first pet?">What is the name of your first pet?</option>
    <option style="color: white;" value="What elementary school did you attend?">What elementary school did you attend?</option>
    <option style="color: white;" value="What is the name of the town where you were born?">What is the name of the town where you were born?</option>
    </select>
    <input style="background-color: black;color: white;padding-left: 12px;" type="text" name="answer" placeholder="Enter Answer" required>
    <input style="background-color: black;color: white;padding-left: 12px;" type="password" name="password" placeholder="Enter Password" required>
    <input style="font-family: Lucida Handwriting;font-size: 25px"  type="submit" value="signup">
    </form>
      <h2><a style="text-decoration: none;font-family: Lucida Handwriting;" href="login.jsp">Login</a></h2>
  </div>
  <div class='whysign'>
<%
String msg=request.getParameter("msg");
if("valid".equals(msg))
{
%>
<h1>Successfully Registered</h1>
<%} %>
<%
if("invalid".equals(msg))
{
%>
<h1>Some thing Went Wrong! Try Again !</h1>
<%} %>
    <!-- <h2>Online Shopping</h2>
    <p>The Online Shopping System is the application that allows the users to shop online without going to the shops to buy them.</p> -->
  </div>
</div>

</body>
</html>