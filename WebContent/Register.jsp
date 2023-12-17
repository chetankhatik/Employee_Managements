<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register Yourself</title>
<link rel="icon" href="logo.ico" type="image/x-icon">
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f4f4f4;
	margin: 0;
	padding: 0;
	display: flex;
	justify-content: space-between;
	align-items: center;
	background-image: url(2314950.jpg);
	background-size: cover;
	background-position: center;
	background-repeat: no-repeat;
	height: 100vh;
	justify-content: space-between;
	align-items: center;
	align-items: center;
}

.form1 {
	background: rgba(255, 255, 255, 0.3);
	padding: 44px 138px 50px 150px;
	border-radius: 8px;
	width: 250px;
}

.form2 {
	margin-top: 316px;
	margin-left: -335px;
}

label {
	display: block;
	margin-bottom: 8px;
	color: white;
	font-size: 20px;
}

input {
	width: 100%;
	padding: 8px;
	margin-bottom: 16px;
	box-sizing: border-box;
}

button {
	background-color: #4caf50;
	color: #fff;
	padding: 10px 15px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

button:hover {
	background-color: #45a049;
}

h1 {
	font-size: 60px;
	margin-left: 295px;
	color: White;
}

img {
	margin-top: -270px;
	margin-left: 400px;
	position: absolute;
	height: 195px;
	width: 340px;
	border-radius: 5%;
}

input[type="text"], input[type="password"], input[type="number"] {
	border-bottom: 1px solid white;
	outline: none;
	background-color: transparent;
	color: white;
	height: 35px;
	width: 230px;
	border-radius: 5%;
}

input::placeholder {
	color: white;
}
</style>
</head>
<body>
	<img alt="" src="giphy.gif">
	<h1>Registration Form</h1>



	<form action="register_check.jsp" class="form1">
		<label for="id">ID:</label> <input type="number" id="id" name="id"
			required pattern="[0-9]+" placeholder="Enter ID"> <label
			for="name">Name:</label> <input type="text" id="name" name="name"
			required pattern="[a-zA-Z\s]+" placeholder="Enter Name"> <label
			for="salary">Salary:</label><input type="number" id="salary"
			name="salary" required pattern="[0-9]+" placeholder="Enter Salary">
		<label for="place">Place:</label> <input type="text" id="place"
			name="place" required placeholder="Enter Place"> <br>
		<button type="submit">Submit</button>
		<br>
	</form>
	<form action="Home.jsp" class="form2">
		<button type="submit">Back</button>
	</form>
</body>


</html>