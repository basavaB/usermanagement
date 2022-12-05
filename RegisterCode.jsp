<%@ page import="java.sql.*"%>
<%
try
{

        String name=request.getParameter("uname");
		String password=request.getParameter("psw");
		String email=request.getParameter("ename");
		String address=request.getParameter("aname");
		
		
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","ojava2","ojava2");
			PreparedStatement ps=con.prepareStatement("insert into usereg1 values(?,?,?,?)");
			ps.setString(1, name);
			ps.setString(2, password);
			ps.setString(3, email);
			ps.setString(4, address);
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
	