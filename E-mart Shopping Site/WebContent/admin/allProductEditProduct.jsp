<%@ page import="project.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<%@ include file="adminHeader.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Product</title>
<style>
h3
{
	color: yellow;
	text-align: center;
}
.rahul :hover {
	color: yellow;
	font-size: 20px;
}
</style>
</head>
<body>
<div style="color: white; text-align: center; font-size: 30px;">Edit Products  &nbsp; <i class='fab fa-elementor'></i></div>
<br>
<%
String msg=request.getParameter("msg");
if("done".equals(msg))
{
%>
<h3 class="alert">Product Successfully Updated!</h3>
<%} %>
<%
if("wrong".equals(msg))
{
%>
<h3 class="alert">Some thing went wrong! Try again!</h3>
<%} %>
<table>
        <thead>
          <tr>
            <th style="color: white;font-size: 20px;"  scope="col"><b>ID</b></th>
            <th style="color: white;font-size: 20px;"  scope="col"><b>Name</b></th>
            <th style="color: white;font-size: 20px;"  scope="col"><b>Category</b></th>
            <th style="color: white;font-size: 20px;"  scope="col"><b><i class="fa fa-inr"></i> Price</b></th>
            <th style="color: white;font-size: 20px;" ><b>Status</b></th>
            <th style="color: white;font-size: 20px;" scope="col"><b>Edit <i class='fas fa-pen-fancy'></i></b></th>
          </tr>
        </thead>
        <tbody>
       <%
       try{
    	   Connection con=ConnectionProvider.getCon();
    	   Statement st=con.createStatement();
    	   ResultSet rs=st.executeQuery("select *from product");
    	   while(rs.next())
    	   {
       %>
          <tr>
            <td style="color: white;" ><%=rs.getString(1) %></td>
            <td style="color: white;" ><%=rs.getString(2) %></td>
            <td style="color: white;" ><%=rs.getString(3) %></td>
            <td style="color: white;" ><i class="fa fa-inr"></i> <%=rs.getString(4) %></td>
            <td style="color: white;" ><%=rs.getString(5) %></td>
            <td style="color: white;font-size: 16px;"  class="rahul" ><a href="editProduct.jsp?id=<%=rs.getString(1) %>">Edit <i class='fas fa-pen-fancy'></i></a></td>
          </tr>
         <%
         }
       }
       catch(Exception e)
       {
    	   System.out.println(e);
       }
         %>
        </tbody>
      </table>
      <br>
      <br>
      <br>
<%@ include file="../footer.jsp" %>
</body>
</html>