<%@page
	import="org.hibernate.engine.jdbc.connections.internal.DriverManagerConnectionCreator"%>
<%@page import="com.mysql.jdbc.Connection"%>
<%@page import="com.mysql.jdbc.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
if (session.getAttribute("session") != null) {
	response.sendRedirect("welcome.jsp");
}
%>

<%
try {
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://192.168.18.245:3306/javadb_161", "javadb_161",
	"fdefdscxss");
	if (request.getParameter("register") != null) {
		String firstname, dateofbirth, email, mobileno, gender, appoinmentdate, doctors;
		firstname = request.getParameter("firstname");
		dateofbirth = request.getParameter("dateofbirth");
		email = request.getParameter("email");
		mobileno = request.getParameter("mobileno");
		gender = request.getParameter("gender");
		appoinmentdate = request.getParameter("appoinmentdate");
		doctors = request.getParameter("dep");
		PreparedStatement ps = null;
		ps = con.preparedStatement("insert into Hospt_003(firstname,dateofbirth,email,mobileno,gender,appoinmentdate,dep)values(?,?,?,?,?,?,?)");
		ps.setString(1, firstname);
		ps.setString(2, dateofbirth);
		ps.setString(3, email);
		ps.setString(4, mobileno);
		ps.setString(5, gender);
		ps.setString(6, appoinmentdate);
		ps.setString(7, doctors);
		ps.executeUpdate();
		request.setAttribute("successMsg", "Registered successfully....!");
		con.close();

	}

} catch (Exception e) {
	out.println(e);
}
%>