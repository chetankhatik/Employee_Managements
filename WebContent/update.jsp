<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f8f9fa;
	margin: 0;
	padding: 0;
}

form {
	display: flex;
	flex-direction: column;
	max-width: 400px;
	margin: 50px auto;
}

input[type="text"], input[type="number"] {
	margin-bottom: 15px;
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 4px;
}

input[type="submit"] {
	background-color: #007bff;
	color: white;
	padding: 10px 20px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

input[type="submit"]:hover {
	background-color: #0056b3;
}
</style>
</head>
<body>

	<form action="up.jsp">

		<label for="name">ID:</label><br> <input type="number" name="idy" value="${param.id}" readonly><br>

		<label for="name">Name:</label><br> <input type="text"
			name="namey"><br> <label for="salary">Salary:</label><br>
		<input type="number" name="salaryy"><br> <label
			for="place">Place:</label><br> <input type="text" name="placey"><br>
		<br> <input type="submit" value="Submit">
	</form>




</body>
</html>