<%@ page import="project.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<%@ include file="adminHeader.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Order Received</title>
<style>
.th-style
{ width: 25%;}
.rahul :hover {
	color: yellow;
	font-size: 20px;
}
</style>
</head>
<body>
<div style="color: white; text-align: center; font-size: 30px;">Orders Received <i class="fas fa-archive"></i></div>
<br>
<%
String msg=request.getParameter("msg");
if("cancel".equals(msg))
{
%>
<h3 class="alert">Order Cancel Successfully!</h3>
<%} %>
<%
if("delivered".equals(msg))
{
%>
<h3 class="alert">Successfully Updated!</h3>
<%} %>
<%
if("invalid".equals(msg))
{
%>
<h3 class="alert">Some thing went wrong! Try Again!</h3>
<%} %>
<table id="customers">
          <tr>
          <th style="color: white;" ><b>Mobile Number</b></th>
            <th style="color: white;"  scope="col"><b>Product Name</b></th>
            <th style="color: white;"  scope="col"><b>Quantity</b></th>
            <th style="color: white;"  scope="col"><b> Sub Total</b></th>
            <th style="color: white;" ><b>Address</b></th>
            <th style="color: white;" ><b>City</b></th>
            <th style="color: white;" ><b>State</b></th>
            <th style="color: white;" ><b>Country</b></th>
            <th style="color: white;"  scope="col"><b>Order Date</b></th>
            <th style="color: white;"  scope="col"><b>Expected Delivery Date</b></th>
            <th style="color: white;"  scope="col"><b>Payment Method</b></th>
              <th style="color: white;"  scope="col"><b>T-ID</b></th>
              <th style="color: white;"  scope="col"><b>Status</b></th>
              <th style="color: white;"  scope="col"><b>Cancel order <i class='fas fa-close'></i></b></th>
              <th style="color: white;"  scope="col"><b>Order Delivered <i class='fas fa-dolly'></i></b></th>
          </tr>
        <%
        try
        {
        	Connection con= ConnectionProvider.getCon();
        	Statement st=con.createStatement();
        	ResultSet rs=st.executeQuery("select * from cart inner join product where cart.product_id=product.id and cart.orderDate is not NULL and cart.status='processing'");
        	while(rs.next())
        	{
        %>
       
          <tr>
          <td style="color: white;" ><%=rs.getString(10) %></td>
            <td style="color: white;" ><%=rs.getString(17) %></td>
            <td style="color: white;" ><%=rs.getString(3) %></td>
            <td style="color: white;" ><i class="fa fa-inr"></i> <%=rs.getString(5) %> </td>
                <td style="color: white;" ><%=rs.getString(6) %></td>
               <td style="color: white;" ><%=rs.getString(7) %></td>
                <td style="color: white;" ><%=rs.getString(8) %></td>
                 <td style="color: white;" ><%=rs.getString(9) %></td>
             <td style="color: white;" ><%=rs.getString(11) %></td>
              <td style="color: white;" ><%=rs.getString(12) %></td>
               <td style="color: white;" ><%=rs.getString(13) %></td>
               <td style="color: white;" ><%=rs.getString(14) %></td>
               <td style="color: white;" ><%=rs.getString(15) %></td>
               <td style="color: white;font-size: 16px" class="rahul" ><a  href="cancelOrdersAction.jsp?id=<%=rs.getString(2)%>&email=<%=rs.getString(1) %>">Cancel <i class='fas fa-close'></i></a></td>
                <td style="color: white;font-size: 16px" class="rahul" ><a  href="deliveredOrdersAction.jsp?id=<%=rs.getString(2)%>&email=<%=rs.getString(1) %>">Delivered <i class='fas fa-dolly'></i></a></td>
            </tr>
         <%	 }
        }
            catch(Exception e)
            {}
         %>
        </table>
      <br>
      <br>
      <br>
<%@ include file="../footer.jsp" %>
</body>
</html>