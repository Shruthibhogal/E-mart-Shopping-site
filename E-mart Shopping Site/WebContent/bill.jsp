<%@ page import="project.ConnectionProvider"%>
<%@ page import="java.sql.*"%>

<html>
<head>
<link rel="stylesheet" href="css/bill.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Bill</title>
</head>
<body>
<%
String email=session.getAttribute("email").toString();
try
{
   int total=0;
   int sno=0;
   Connection con=ConnectionProvider.getCon();
   Statement st=con.createStatement();
   ResultSet rs=st.executeQuery("select sum(total) from cart where email='"+email+"' and status='bill'");
   while(rs.next())
   {
	   total=rs.getInt(1);
   }
   ResultSet rs2=st.executeQuery("select * from users inner join cart where cart.email='"+email+"' and cart.status='bill'");
   while(rs2.next())
   {
%>
<h3 style="font-family: cursive;font-size: xx-large;">Thank you for Shopping in E Mart <i class='fas fa-cart-arrow-down'></h3>
<br>
<div class="left-div"><h3>Name:<%=rs2.getString(1)%></h3></div>
<div class="right-div-right"><h3>Email:<%out.println(email); %>  </h3></div>
<div class="right-div"><h3>Mobile Number: <%=rs2.getString(20) %> </h3></div>  

<div class="left-div"><h3>Order Date:  <%=rs2.getString(21) %></h3></div>
<div class="right-div-right"><h3>Payment Method: <%=rs2.getString(23) %> </h3></div>
<div class="right-div"><h3>Expected Delivery:  <%=rs2.getString(22) %></h3></div> 

<div class="left-div"><h3>Transaction Id: <%=rs2.getString(24) %> </h3></div>
<div class="right-div-right"><h3>City:  <%=rs2.getString(17) %></h3></div> 
<div class="right-div"><h3>Address: <%=rs2.getString(16) %> </h3></div> 

<div class="left-div"><h3>State: <%=rs2.getString(18) %></h3></div>
<div class="right-div-right"><h3>Country: <%=rs2.getString(19) %> </h3></div>  

<hr>
<%break;} %>

	
	<br>
	
<table id="customers">
<h3>Product Details</h3>
  <tr>
    <th>S.No</th>
    <th>Product Name</th>
    <th>category</th>
    <th>Price</th>
    <th>Quantity</th>
     <th>Sub Total</th>
  </tr>
  <%
  ResultSet rs1=st.executeQuery("select * from cart inner join product where cart.product_id=product.id and cart.email='"+email+"' and cart.status='bill'");
  while(rs1.next())
  {
	  sno+=1;
  %>
  <tr>
    <td><%out.println(sno); %></td>
    <td><%=rs1.getString(17) %></td>
    <td><%=rs1.getString(18) %></td>
    <td><i class="fa fa-inr"></i><%=rs1.getString(19) %></td>
    <td><%=rs1.getString(3) %></td>
     <td><i class="fa fa-inr"></i><%=rs1.getString(5) %></td>
  </tr>
  <tr>
<%} %>
</table>
<h3>Total:<i class="fa fa-inr"></i>  <%out.println(total); %></h3>
<a href="continueShopping.jsp"><button class="button left-button">Continue Shopping</button></a>
<a onclick="window.print();"><button class="button right-button">Print</button></a>
<br><br><br><br>
<%
}
catch(Exception e)
{
	System.out.println(e);
}
%>
<%-- <%@ include file="footer.jsp" %> --%>
</body>
</html>