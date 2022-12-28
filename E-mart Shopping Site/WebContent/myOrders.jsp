<%@ page import="project.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<%@ include file="header.jsp" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>My Order</title>
</head>
<body>
<div style="color: white; text-align: center; font-size: 30px;">My Orders <i class='fas fa-shipping-fast'></i></div>
<br>
<table>
        <thead>
          <tr>
            <th style="color: white;font-size: large;"  scope="col"><b>S.No</b></th>
            <th style="color: white;font-size: large;"  scope="col"><b>Product Name</b></th>
            <th style="color: white;font-size: large;"  scope="col"><b>category</b></th>
            <th  style="color: white;font-size: large;" scope="col"><b><i class="fa fa-inr"></i>  Price</b></th>
            <th style="color: white;font-size: large;"  scope="col"><b>Quantity</b></th>
            <th  style="color: white;font-size: large;" scope="col"><b><i class="fa fa-inr"></i> Sub Total</b></th>
            <th style="color: white;font-size: large;"  scope="col"><b>Order Date</b></th>
             <th style="color: white;font-size: large;"  scope="col"><b>Expected Delivery Date</b></th>
             <th style="color: white;font-size: large;"  scope="col"><b>Payment Method</b></th>
              <th style="color: white;font-size: large;"  scope="col"><b>Status</b></th>
              
          </tr>
        </thead>
        <tbody>
<%
int sno=0;
try
{
Connection con=ConnectionProvider.getCon();
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select * from cart inner join product where cart.product_id=product.id and cart.email='"+email+"' and cart.orderDate is not NULL");
while(rs.next())
{
	sno=sno+1;

%>
          <tr>
            <td style="color: white;" ><%out.println(sno); %></td>
            <td style="color: white;" ><%=rs.getString(17) %></td>
            <td style="color: white;" ><%=rs.getString(18) %></td>
            <td style="color: white;" ><i class="fa fa-inr"></i> <%=rs.getString(19) %></td>
            <td style="color: white;" ><%=rs.getString(3) %></td>
            <td style="color: white;" ><i class="fa fa-inr"></i> <%=rs.getString(5) %></td>
             <td style="color: white;" ><%=rs.getString(11) %></td>
              <td style="color: white;" ><%=rs.getString(12) %></td>
               <td style="color: white;" ><%=rs.getString(13) %></td>
               <td style="color: white;" ><%=rs.getString(15) %></td>
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