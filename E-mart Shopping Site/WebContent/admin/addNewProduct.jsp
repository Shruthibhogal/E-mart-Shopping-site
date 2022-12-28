<%@ page import="project.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<%@ include file="adminHeader.jsp" %>

<html>
<head>
<link rel="stylesheet" href="../css/addNewProduct-style.css">
<title>Add New Product</title>
</head>
<body>
<%
String msg=request.getParameter("msg");
if("done".equals(msg))
{
%>
<h3 class="alert">Product Added Successfully!</h3>
<%} %>
<%
if("wrong".equals(msg))
{
%>
<h3 class="alert">Some thing went wrong! Try Again!</h3>
<%} %>
<% 
int id=1;
try
{
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select max(id) from product");
	while(rs.next())
	{
		id=rs.getInt(1);
		id=id+1;
	}
}
catch(Exception e)
{}
%>
<form action="addNewProductAction.jsp" method="post">
<h3 style="color: white;">Product ID: <% out.println(id);%> </h3>
<input type="hidden" name="id" value="<%out.println(id);%>">

<div class="left-div">
 <h3>Enter Product Name</h3>
 <input style="border-radius: 10px;background-color: #1a222d;color:white;" class="input-style" type="text" name="name" placeholder="Enter Product Name" required>
<br>
</div>

<div class="right-div">
<h3>Enter Product Category</h3>
 <input style="border-radius: 10px;background-color: #1a222d;color:white;" class="input-style" type="text" name="category" placeholder="Enter Product Category" required>
<br>
</div>

<div class="left-div">
<h3>Enter Product Price</h3>
 <input style="border-radius: 10px;background-color: #1a222d;color:white;" class="input-style" type="number" name="price" placeholder="Enter Product Price" required>
<br><br>
</div>

<div class="right-div">
<h3>Active</h3>
  <select style="border-radius: 10px;background-color: #1a222d;color:white;" class="input-style" name="active">
  <option value="Active or Not">Active or Not (By Default Active)</option>
  <option value="Yes">Yes</option>
  <option value="No">No</option>
  </select> 
<br><br>
</div>
  <button style="border-radius: 20px;background-color: #0058ff;" class="button">Save <i class='far fa-arrow-alt-circle-right'></i></button>
</form>
<!-- <button style="border-radius: 20px;background-color: #0058ff;" class="button">Save <i class='far fa-arrow-alt-circle-right'></i></button> -->
<br><br><br>
<%-- <%@ include file="../footer.jsp" %> --%>
</body>
</html>