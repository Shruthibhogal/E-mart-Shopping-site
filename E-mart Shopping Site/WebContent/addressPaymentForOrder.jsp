<%@ page import="project.ConnectionProvider"%>
<%@ page import="java.sql.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="css/addressPaymentForOrder-style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Proceed To Order</title>
<script>
if(window.history.forward(1) != null)
	window.history.forward(1);</script>
</head>
<body>
<br>
<table>
<thead>
<%
String email=session.getAttribute("email").toString();
int total=0;
int sno=0;
try
{
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	ResultSet rs1=st.executeQuery("select sum(total) from cart where email='"+email+"' and address is NULL");
	while(rs1.next())
	{
		total=rs1.getInt(1);
	}
%>
          <tr>
          <th scope="col"><a href="myCart.jsp"><i class='fas fa-arrow-circle-left'> Back</i></a></th>
            <th scope="col" style="background-color:#4169E1 ;">Total: <i class="fa fa-inr"></i> <%out.println(total); %></th>
          </tr>
        </thead>
        <thead>
          <tr>
          <th style="color: white;" scope="col">S.No</th>
            <th style="color: white;"  scope="col">Product Name</th>
            <th style="color: white;"  scope="col">Category</th>
            <th style="color: white;"  scope="col"><i class="fa fa-inr"></i> price</th>
            <th style="color: white;"  scope="col">Quantity</th>
            <th style="color: white;"  scope="col">Sub Total</th>
          </tr>
        </thead>
        <tbody>
        <%
      ResultSet rs=st.executeQuery("select *from product inner join cart on product.id=cart.product_id and cart.email='"+email+"' and cart.address is NULL");
      while(rs.next())
      {
      %>
          <tr>
          <%sno=sno+1; %>
           <td style="color: white;"><%out.println(sno);%></td>
            <td style="color: white;"><%=rs.getString(2) %></td>
            <td style="color: white;"><%=rs.getString(3) %></td>
            <td style="color: white;"><i class="fa fa-inr"></i> <%=rs.getString(4) %></td>
            <td style="color: white;"> <%=rs.getString(8) %></td>
            <td style="color: white;"><i class="fa fa-inr"></i> <%=rs.getString(10) %></td>
            </tr>
         <%
         }
         ResultSet rs2=st.executeQuery("select * from users where email='"+email+"'");
         while(rs2.next())
         {
         %>
        </tbody>
      </table>
      
<hr style="width: 100%">
<form action="addressPaymentForOrderAction.jsp" method="post">
 <div class="left-div">
 <h3>Enter Address</h3>
<input style="border-radius: 10px;background-color: #1a222d;;color:white;" class="input-style" type="text" name="address" value="<%=rs2.getString(7) %>" placeholder="Enter Address" required>
 </div>

<div class="right-div">
<h3>Enter city</h3>
<input style="border-radius: 10px;background-color: #1a222d;;color:white;" class="input-style" type="text" name="city" value="<%=rs2.getString(8) %>" placeholder="Enter City" required>
</div> 

<div class="left-div">
<h3>Enter State</h3>
<input style="border-radius: 10px;background-color: #1a222d;;color:white;" class="input-style" type="text" name="state" value="<%=rs2.getString(9) %>" placeholder="Enter State" required>
</div>

<div class="right-div">
<h3>Enter country</h3>
<input style="border-radius: 10px;background-color: #1a222d;;color:white;" class="input-style" type="text" name="country" value="<%=rs2.getString(10) %>" placeholder="Enter Country" required>
</div>
<h3 style="color: yellow;">*Please set your correct address!</h3>
<!-- <h3 style="color: red">*This address will also updated to your profile</h3> -->
<hr style="width: 100%">
<div class="left-div">
<h3>Select way of Payment</h3>
 <select style="border-radius: 10px;background-color: #1a222d;;color:white;" class="input-style" name="paymentMethod">
 <option value="Please Select Payment Option">Please Select Payment Option (By Default COD)</option>
 <option value="Cash on delivery(COD)">Cash on delivery(COD) </option>
 <option value="Online Payment">Online Payment</option>
 </select>
</div>

<div class="right-div">
<h3>Pay online on this UPI ID 8234001137@ybl</h3>
<input style="border-radius: 10px;background-color: #1a222d;;color:white;" class="input-style" type="text" name="transactionId" placeholder="Enter Transaction ID" >
<h3 style="color: yellow;">*If you select online Payment then enter your transaction ID</h3>
</div>
<hr style="width: 100%">

<div class="left-div">
<h3>Mobile Number</h3>
<input style="border-radius: 10px;background-color: #1a222d;;color:white;" class="input-style" type="text" name="mobileNumber" value="<%=rs2.getString(3) %>" placeholder="Enter Mobile Number" required>
<!-- <h3 style="color: purple;">*This mobile number will also updated to your profile</h3> -->
</div>
<div class="right-div">
<h3 style="color: yellow;">*****If you enter wrong transaction id then your order will becancel!****</h3>
<button style="border-radius: 20px;background-color: #3b3bd0;" class="button" type="submit">Procced to Generate Bill <i class='far fa-arrow-alt-circle-right'></i></button>
<!-- <h3 style="color: purple">*Fill form correctly</h3> -->
</div>
</form>
<%
         }     
}
catch(Exception e)
{
	System.out.println(e);
}
%>
      <br>
      <br>
      <br>
<%-- <%@ include file="footer.jsp" %> --%>
</body>
</html>