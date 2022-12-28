<%@ page import="project.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<%@ include file="header.jsp" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
<style>
.rahul :hover {
	color: yellow;
	font-size: 20px;
}
</style>
</head>
<body>
<div style="color: white; text-align: center; font-size: 30px;">Home <i class="fa fa-home" aria-hidden="true"></i></div>
<br>
<table>
        <thead>
          <tr>
            <th style="color: white;font-size: 20px;" scope="col"><b>ID</b></th>
            <th style="color: white;font-size: 20px;"  scope="col"><b>Name</b></th>
            <th style="color: white;font-size: 20px;"  scope="col"><b>Category</b></th>
            <th style="color: white;font-size: 20px;"  scope="col"><b><i class="fa fa-inr"></i> Price</b></th>
            <th style="color: white;font-size: 20px;"  scope="col"><b>Add to cart <i class='fas fa-cart-plus'></i></b></th>
          </tr>
        </thead>
        <tbody>
<%
int z=0;
try{
	String search=request.getParameter("search");	
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select *from product where name like '%"+search+"%' or category like '%"+search+"%' and active='Yes'");
	while(rs.next())
	{
		z=1;
%>
          <tr>
            <td style="color: white;" ><%=rs.getString(1) %></td>
            <td style="color: white;"> <%=rs.getString(2) %></td>
            <td style="color: white;" ><%=rs.getString(3) %></td>
            <td style="color: white;" ><i class="fa fa-inr"></i> <%=rs.getString(4) %></td>
            <td style="color: white;font-size: 18px;"class="rahul" ><a href="addToCartAction.jsp?id=<%=rs.getString(1) %>">Add to cart <i class='fas fa-cart-plus'></i></a></td>
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
      <%if(z==0){ %>	
	<h1 style="color:white; text-align: center;">Search Item Not found</h1>
	<%} %>
      <br>
      <br>
      <br>
      <div class="footer">
      </div>
<%@ include file="footer.jsp" %>
</body>
</html>