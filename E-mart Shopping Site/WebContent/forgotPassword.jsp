<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/signup-style.css">
<title>ForgotPassword</title>
</head>
<body>
<div id='container'>
  <div class='signup'>
     <form action="forgotPasswordAction.jsp" method="post">
     <h3 style="color: black;font-family: Lucida Handwriting;font-size: xx-large;;margin-top: -10px;">Forgot ID/Password?</h3>
     <input style="background-color: black;color: white;padding-left: 12px;" type="email" name="email" placeholder="Enter Email" required>
     <input style="background-color: black;color: white;padding-left: 12px;" type="number" name="mobileNumber" placeholder="Enter Mobile Number" required>
     <select style="background-color: black;color: white;padding-left: 12px;" name="securityQuestion">
     <option style="color: white;" value="What was your first car?">Select Security Question</option>
     <option style="color: white;" value="What was your first car?">What was your first car?</option>
     <option style="color: white;" value="What is the name of your first pet?">What is the name of your first pet?</option>
     <option style="color: white;" value="What elementary school did you attend?">What elementary school did you attend?</option>
     <option style="color: white;" value="What is the name of the town where you were born?">What is the name of the town where you were born?</option>
     </select>
     <input style="background-color: black;color: white;padding-left: 12px;" type="text" name="answer" placeholder="Enter answer" required>
     <input style="background-color: black;color: white;padding-left: 12px;" type="password" name="newPassword" placeholder="Enter your new Password" required>
     <input style="font-size: 25px;font-family: Lucida Handwriting;" type="submit" value="Submit">
     </form>
      <h2 ><a style="text-decoration: none;font-family: Lucida Handwriting;" href="login.jsp">Login</a></h2>
  </div>
  <div class='whyforgotPassword'>
   <%
   String msg=request.getParameter("msg");
   if("done".equals(msg))
   {
   %>
<h1>Password Changed Successfully!</h1>
<%} %>
<%
  if("invalid".equals(msg))
  {
%>
<h1>Invalid Credential! Try Again !</h1>
<%} %>
    <!-- <h2>Online Shopping</h2>
    <p>The Online Shopping System is the application that allows the users to shop online without going to the shops to buy them.</p> -->
  </div>
</div>
</body>
</html>