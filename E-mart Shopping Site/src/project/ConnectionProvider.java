package project;
import java.sql.*;
public class ConnectionProvider {
	public static Connection getCon()
	{
		Connection con=null;
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			 con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ospjsp","root","15117476");
			 return con;
		}
		catch (Exception e) 
		{
			e.getStackTrace();
		}	
		return con;
	}
}
