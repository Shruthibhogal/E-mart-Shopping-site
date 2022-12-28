<%@ page import="project.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<%@ include file="adminHeader.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Messages</title>
<style>
h3
{
	color: yellow;
	text-align: center;
}
</style>
</head>
<body>
<div style="color: white; text-align: center; font-size: 30px;">Messages Received <i class='fas fa-comment-alt'></i></div>
<br>
<table>
        <thead>
          <tr>
            <th style="color: white;"  scope="col"><b>ID</b></th>
            <th style="color: white;"  scope="col"><b>Email</b></th>
            <th style="color: white;"  scope="col"><b>Subject</b></th>
            <th style="color: white;"  scope="col"><b>Body</b></th>
          </tr>
        </thead>
        <tbody>
       <%
       try
       {
    	   Connection con=ConnectionProvider.getCon();
    	   Statement st=con.createStatement();
    	   ResultSet rs=st.executeQuery("select * from message");
    	   while(rs.next())
    	   {
       %>
          <tr>
            <td style="color: white;" ><%=rs.getString(1) %></td>
            <td style="color: white;" ><%=rs.getString(2) %></td>
            <td style="color: white;" ><%=rs.getString(3) %></td>
            <td style="color: white;" ><%=rs.getString(4) %></td>
          </tr>
         <%
         }}
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