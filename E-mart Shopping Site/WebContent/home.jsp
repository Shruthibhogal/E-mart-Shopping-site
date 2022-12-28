<%@ page import="project.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<%@ include file="header.jsp" %>
<%-- <%@ include file="footer.jsp" %> --%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
<style>
h3
{
	color: white;
	text-align: center;
}
.rahul :hover {
	color: yellow;
	font-size: 20px;
}
</style>
</head>
<body>
<div style="color: white; text-align: center; font-size: 30px;">Home <i class="fa fa-home" aria-hidden="true"></i></div>
<%
String msg=request.getParameter("msg");
if("added".equals(msg))
{
%>
<h3 class="alert">Product added successfully!</h3>
<%} %>
<%
if("exist".equals(msg))
{
%>
<h3 class="alert">Product already exist in your cart! Quantity  increased!</h3>
<%} %>
<%
if("invalid".equals(msg))
{
%>
<h3 class="alert">Something went wrong! Try Again!</h3>
<%} %>
<br>
<table>
        <thead>
          <tr>
            <th style="color: white; font-size: 20px;" scope="col"><b>ID</b></th>
            <th style="color: white; font-size: 20px;" scope="col"><b>Name</b></th>
            <th style="color: white;font-size: 20px;" scope="col"><b>Category</b></th>
            <th style="color: white;font-size: 20px;" scope="col"><i class="fa fa-inr"></i><b> Price</b></th>
            <th style="color: white;font-size: 20px;" scope="col"><b>Add to cart</b> <i class='fas fa-cart-plus'></i></th>
          </tr>
        </thead>
        <tbody>
<%
try{
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select *from product where active='Yes'");
	while(rs.next())
	{
%>
          <tr>
            <td style="color: white;"><%=rs.getString(1) %></td>
            <td style="color: white;"><%=rs.getString(2) %></td>
            <td style="color: white;"><%=rs.getString(3) %></td>
            <td style="color: white;"><i class="fa fa-inr"></i> <%=rs.getString(4) %></td>
            <td style="color: white; font-size: 18px;" class="rahul"><a href="addToCartAction.jsp?id=<%=rs.getString(1) %>">Add to cart <i class='fas fa-cart-plus'></i></a></td>
          </tr>
<%
}
}
catch(Exception e)
{
	System.out.println(e);
}%>
        </tbody>
      </table>
      <br>
      <br>
      <br>
<%@ include file="footer.jsp" %>
</body>
</html>