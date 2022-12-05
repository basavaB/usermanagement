<%@page import="java.sql.*"%>
<%

try
{
        String name=request.getParameter("uname");
		String password=request.getParameter("psw");
		String email=request.getParameter("ename");
		String address=request.getParameter("aname");
		
		
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","ojava2","ojava2");
			PreparedStatement ps=con.prepareStatement("update usereg1 set password=?,email=?,address=? where name=?");
			ps.setString(1, password);
			ps.setString(2, email);
			ps.setString(3, address);
			ps.setString(4, name);
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
	