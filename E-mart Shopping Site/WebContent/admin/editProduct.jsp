<%@ page import="project.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<%@ include file="adminHeader.jsp" %>
<html>
<head>
<link rel="stylesheet" href="../css/addNewProduct-style.css">
<title>Edit Product</title>
<style>
.back
{
  color: white;
  margin-left: 2.5%
}

</style>
</head>
<body>
 <h2><a class="back" href="allProductEditProduct.jsp"><i class='fas fa-angle-double-left'> Back</i></a></h2>
<%
String id=request.getParameter("id");
try
{
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select *from product where id='"+id+"'");
	while(rs.next())
	{
	
%>
<form action="editProductAction.jsp" method="post">
<input type="hidden" name="id" value="<%out.println(id);%>">
<div class="left-div">
 <h3>Enter Name</h3>
<input style="border-radius: 10px;background-color: #1a222d;color:white;" class="input-style" type="text" name="name" value="<%=rs.getString(2) %>" required>
<br><br>
</div>

<div class="right-div">
<h3>Enter Category</h3>
 <input style="border-radius: 10px;background-color: #1a222d;color:white;" class="input-style" type="text" name="category" value="<%=rs.getString(3) %>" required>
<br><br>
</div>

<div class="left-div">
<h3>Enter Price</h3>
 <input style="border-radius: 10px;background-color: #1a222d;color:white;" class="input-style" type="number" name="price" value="<%=rs.getString(4) %>" required>
<br><br><br>
</div>

<div class="right-div">
<h3>Active</h3>
<select style="border-radius: 10px;background-color: #1a222d;color:white;" class="input-style" name="active">
<option value="Yes">Active or Not(By Default Yes)</option>
<option value="Yes">Yes</option>
<option value="No">No</option>
</select>
 <br><br><br>
</div>
 <button style="border-radius: 20px;background-color: #0058ff;" class="button">Save <i class='far fa-arrow-alt-circle-right'></i></button>
</form>
<%
}
}
catch(Exception e)
{
	System.out.println(e);
}
%>

</body>
<br><br><br>
<%-- <%@ include file="../footer.jsp" %> --%>
</body>
</html>