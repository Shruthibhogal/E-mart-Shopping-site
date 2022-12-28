<%@ page import="project.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<%@ include file="header.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>My Cart</title>
<style>
h3
{
	color: white;
	text-align: center;
}
.patidar :hover {
	color: yellow;
	font-size: 14.5px;
}
</style>
</head>
<body>
<div style="color: white; text-align: center; font-size: 30px;">My Cart <i class="fa fa-shopping-cart"></i></div>
<%
String msg=request.getParameter("msg");
if("notPossible".equals(msg))
{
%>
<h3 class="alert">There is only one Quantity! So click on remove!</h3>
<%} %>
<%
if("inc".equals(msg))
{
%>
<h3 class="alert">Quantity  Increased Successfully!</h3>
<%} %>
<%
if("dec".equals(msg))
{
%>
<h3 class="alert">Quantity  Decreased Successfully!</h3>
<%} %>
<%
if("removed".equals(msg))
{
%>
<h3 class="alert">Product Successfully Removed!</h3>
<%} %>
<table>
<thead>
<%
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
            <th scope="col" style="background-color: #4169E1 ;color:white;font-size: large;"><b>Total: </b><i class="fa fa-inr"><%out.println(total); %></i> </th>
            <%if(total>0){ %><th class="patidar" scope="col"><a href="addressPaymentForOrder.jsp">Proceed to order</a></th><%} %>
          </tr>
        </thead>
        <br>
        <thead>
          <tr>
          <th style="color: white;font-size: large;" scope="col"><b>S.No</b></th>
            <th style="color: white;font-size: large;" scope="col"><b>Product Name</b></th>
            <th style="color: white;font-size: large;" scope="col"><b>Category</b></th>
            <th style="color: white;font-size: large;" scope="col"><i class="fa fa-inr"></i><b> price</b></th>
            <th style="color: white;font-size: large;" scope="col"><b>Quantity</b></th>
            <th style="color: white;font-size: large;" scope="col"><b>Sub Total</b></th>
            <th style="color: white;font-size: large;"  scope="col"><b>Remove</b> <i class='fas fa-trash-alt'></i></th>
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
           <td style="color: white;" ><%out.println(sno); %></td>
            <td style="color: white;" ><%=rs.getString(2) %></td>
            <td style="color: white;" ><%=rs.getString(3) %></td>
            <td style="color: white;" ><i class="fa fa-inr"></i><%=rs.getString(4) %> </td>
            <td style="color: white;" class="patidar" ><a href="incDecQuantityAction.jsp?id=<%=rs.getString(1)%>&quantity=inc"><i class='fas fa-plus-circle'></i></a>&nbsp;<%=rs.getString(8) %>  <a href="incDecQuantityAction.jsp?id=<%=rs.getString(1)%>&quantity=dec""><i class='fas fa-minus-circle'></i></a></td>
            <td style="color: white;" ><i class="fa fa-inr"></i><%=rs.getString(10) %> </td>
            <td style="color: white;" class="patidar" ><a  href="removeFromCart.jsp?id=<%=rs.getString(1)%>">Remove <i class='fas fa-trash-alt'></i></a></td>
          </tr>
<%
      }
      
}
catch(Exception e)
{}
%>
        </tbody>
      </table>
      <br>
      <br>
      <br>
<%@ include file="footer.jsp" %>
</body>
</html>