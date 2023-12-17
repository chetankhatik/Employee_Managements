<%@page import="java.text.NumberFormat.Style"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script>
		function Idmessage() {
			alert("ID already Exist! Plz enter another ID! Data Not Registered");
		}
	</script>

	<%
	try {

		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/emploee_project", "root", "Ckk@8099");

		String id1 = request.getParameter("id");
		int idx = Integer.parseInt(id1);
		String name1 = request.getParameter("name");
		String salary1 = request.getParameter("salary");
		double salaryx = Double.parseDouble(salary1);
		String place1 = request.getParameter("place");

		CallableStatement cs = con.prepareCall("select * from employee where id=?");
		cs.setInt(1, idx);
		ResultSet set = cs.executeQuery();
		if (set.next()) {

			RequestDispatcher rd = request.getRequestDispatcher("Register.jsp");
			rd.include(request, response);
			out.print("<html><body><style>.mess{color:red;margin-top: -484px;margin-left: -333px;}</style><h3 class=mess>ID Already Present! Data not saved</h3></body></html>");
		} else {
			CallableStatement csmt = con.prepareCall("insert into employee values (?,?,?,?)");
			csmt.setInt(1, idx);
			csmt.setString(2, name1);
			csmt.setDouble(3, salaryx);
			csmt.setString(4, place1);
			csmt.execute();
			RequestDispatcher rd = request.getRequestDispatcher("Register.jsp");
			rd.include(request, response);
			out.print("<html><body><style>.mess{color:green;margin-top: -484px;margin-left: -333px;}</style><h3 class=mess>Data Stored! </h3></body></html>");

		}

	} catch (SQLIntegrityConstraintViolationException e) {
		RequestDispatcher rd = request.getRequestDispatcher("Register.jsp");
		rd.include(request, response);
	}

	catch (Exception e) {
		e.printStackTrace();
		RequestDispatcher rd = request.getRequestDispatcher("Register.jsp");
		rd.include(request, response);
	}
	%>
</body>
</html>