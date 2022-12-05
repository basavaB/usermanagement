<%@ page import="java.sql.*" %>
<%
try
{
String name=request.getParameter("uname");

Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","ojava2","ojava2");
PreparedStatement ps=con.prepareStatement("select*from usereg1 where name=?");
ps.setString(1, name);
ResultSet rs=ps.executeQuery();
ResultSetMetaData rsmd=rs.getMetaData();
out.print("<table border='1'>");
int n=rsmd.getColumnCount();
for(int i=1; i<=n; i++)

out.println("<td><font color=red size=3>"+"<br>"+rsmd.getColumnName(i));
out.println("<tr>");

while(rs.next())
{
	for(int i=1; i<=n; i++)
		
		out.print("<td> <br>"+rs.getString(i));
	    out.println("<tr>");
	    
}
out.println("</table> </body> </html>");
con.close();
}
catch(Exception ex)
{
  out.print(ex);
}

%>







