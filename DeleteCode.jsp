<%@ page import="java.sql.*"%>
<%

try
{
String name=request.getParameter("uname");


Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","ojava2","ojava2");
PreparedStatement ps=con.prepareStatement("delete from usereg1 where name=?");
ps.setString(1, name);

ResultSet rs=ps.executeQuery();
if(rs.next())
{
response.sendRedirect("userhome.jsp");
}
else
{
	out.print("please insert valid username and password");
}	
con.close();
}
catch(Exception ex)
{
	out.print(ex);

}
%>
		
	
	
	
	
	
	
	
	
	
