<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/signup-style.css">
<title>Login</title>
</head>
<body>
<span class="logo"><img src="1.png" height=100px width="160px" style="margin-left: 10px;border-radius: 1.5rem;"></span>
<div id='container'>
  <div class='signup'>
     <form action="loginAction.jsp" method="post">
     <h3 style="color: black;font-size: xx-large;;margin-top: -10px;font-family: Lucida Handwriting;">Login</h3>
      <input style="background-color: black;color: white;padding-left: 12px;" type="email" name="email" placeholder="Enter Email" required> 
       <input style="background-color: black;color: white;padding-left: 12px;" type="password" name="password" placeholder="Enter Password" required>
       <input style="font-size: 25px;font-family: Lucida Handwriting;" type="submit" value="Submit">
    </form> 
     <h2 ><a style="text-decoration: none;font-family: Lucida Handwriting;" href="signup.jsp">Create Account</a></h2>
   <h2 ><a style="text-decoration: none;font-family: Lucida Handwriting;" href="forgotPassword.jsp">Forgot ID/Password?</a></h2>
  </div>
  <div class='whysignLogin'>
  <%
  String msg=request.getParameter("msg");
  if("notexist".equals(msg))
  {
  %>
  <h1>Invalid Credentials</h1>
<%}%>
<%if("invalid".equals(msg))
{%>
<h1>Invalid Credential!!!</h1>
<%} %>
    
  </div>
</div>

</body>
</html>