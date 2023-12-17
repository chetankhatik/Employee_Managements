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
<%
	
	Connection con;

	try {

		Class.forName("com.mysql.cj.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/emploee_project", "root", "Ckk@8099");
		
		String id1=request.getParameter("idy");
		int idx=Integer.parseInt(id1);
		
		
		String name1=request.getParameter("namey");
		String salary1=request.getParameter("salaryy");
		double salaryx=Double.parseDouble(salary1);
		String place1=request.getParameter("placey");
		
		CallableStatement csmt=con.prepareCall("update employee set Name=?,Salary=?,Place=? where ID=?");
		
		csmt.setString(1,name1);
		csmt.setDouble(2, salaryx);
		csmt.setString(3, place1);
		csmt.setInt(4, idx);
		csmt.executeUpdate();	
		RequestDispatcher rd=request.getRequestDispatcher("update.jsp");
		rd.include(request, response);
		

	} catch (Exception e) {
		e.printStackTrace();
		RequestDispatcher rd=request.getRequestDispatcher("update.jsp");
		rd.include(request, response);
	}
	%>
</body>
</html>