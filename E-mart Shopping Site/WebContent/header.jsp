<%@page errorPage="error.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/home-style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
</head>
    <!--Header-->
    <div class="topnav sticky">
    <%String email=session.getAttribute("email").toString(); %>
            <span class="logo"><img src="1.png" height=100px width="160px" style="margin-left: 10px;border-radius: 1.5rem"></span>
            <span class="rahu"><b style="margin-left: -130px;">Welcome To E Mart <i class="fa fa-shopping-cart"></i></b></span>
            <h2><a href=""><b>Welcome <%out.println(email); %> <i class='far fa-user-circle'></i></b></a></h2>
            <a href="home.jsp"><b>Home<i class="fa fa-home" aria-hidden="true"></i></b></a>
            <a href="myCart.jsp"><b>Cart<i class="fa fa-shopping-cart"></i></b></a>
            <a href="myOrders.jsp"><b>My Orders  <i class='fas fa-shipping-fast'></i></b></a>
            <a href="changeDetails.jsp"><b>Change Details <i class="fa fa-edit"></i></b></a>
            <a href="messageUs.jsp"><b>Feedback <i class="fa fa-comments-o"></i></b></a>
            <!-- <a href="about.jsp">About Us <i class="fa fa-address-book"></i></a> -->
            <a href="logout.jsp"><b>Logout <i class="fa fa-sign-out"></i></b></a>
            <div class="search-container">
             <form action="searchHome.jsp" method="post">
             <input style="background-color: #1a222d;color:white;" type="text" placeholder="Search" name="search">
             <button type="submit"><i class="fa fa-search" ></i></button>
             </form>        
            </div>
          </div>
           <br>
           <!--table-->
