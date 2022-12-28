<%@page errorPage="error.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../css/home-style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
</head>
    <!--Header-->
    
    <div class="topnav sticky">
   <%String email=session.getAttribute("email").toString(); %>
   			<span class="logo"><img src="logo.jpeg" height=100px width="160px" style="margin-left: 10px;border-radius: 1.5rem"></span>
            <h2 style="color: #a6ffcd;margin-left: 39% ; font-family:cursive;margin-bottom: 0px;margin-top: -50px;font-size: xx-large;">Welcome To Rahul Mart <i class="fa fa-shopping-cart"></i></h2>
            <a href="addNewProduct.jsp">Add New Product <i class='fas fa-plus-square'></i></a>
            <a href="allProductEditProduct.jsp">Edit Products <i class="fa fa-edit"></i></a>
            <a href="messagesReceived.jsp">Messages Received <i class="fa fa-envelope" aria-hidden="true"></i></a>
            <a href="ordersReceived.jsp">Orders Received <i class="fas fa-archive"></i></a>
            <a href="cancelOrders.jsp">Cancel Orders <i class='fas fa-close'></i></a>
            <a href="deliveredOrders.jsp">Delivered Orders <i class="fa fa-shopping-cart"></i></a>
            <a href="../logout.jsp">Logout <i class='fas fa-sign-out-alt'></i></a>
          </div>
           <br>
           <!--table-->
