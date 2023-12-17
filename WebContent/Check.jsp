<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
</head>
<body>
	<%
	String username = request.getParameter("username");
	String password = request.getParameter("password");

	Class.forName("com.mysql.cj.jdbc.Driver");

	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/user", "root", "Ckk@8099");

	PreparedStatement pstmt = conn.prepareStatement("select * from user where username=? and password=?");
	pstmt.setString(1, username);
	pstmt.setString(2, password);

	ResultSet rs = pstmt.executeQuery();

	if (rs.next()) {
		RequestDispatcher rd = request.getRequestDispatcher("Display.jsp");
		out.print("<html><body><style>.mess{color:green;margin-top: -470px;margin-left: -170px;font-size:35px;}</style><h3 class=mess>Login!</h3></body></html>");
		request.setAttribute("username", username);
		rd.include(request, response);
	} else {
		out.print("<html><body><style>.mess{color:red;margin-top: -470px;margin-left: -170px;font-size:35px;}</style><h3 class=mess>Invalid Crendital</h3></body></html>");
		RequestDispatcher rd = request.getRequestDispatcher("Home.jsp");
		rd.include(request, response);
		

	}

	conn.close();
	pstmt.close();
	%>
</body>
</html>