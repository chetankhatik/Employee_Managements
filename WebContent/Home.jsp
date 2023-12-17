<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home Page</title>
<link rel="icon" href="logo.ico" type="image/x-icon">
<style>
		body {
			font-family: Arial, sans-serif;
			background-color: #f4f4f4;
			margin: 0;
			padding: 0;
			display: flex;
			justify-content: center;
			align-items: center;
			height: 100vh;
			background-image: url(2314950.jpg);
			background-size: cover;
			background-position: center;
		}

		.form1 {
			background: rgba(255, 255, 255, 0.3);
			padding: 20px;
			border-radius: 8px;
			box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
			text-align: center;
			height: 400px;
			width: 400px;
		}

		.form2 {
			margin-top: 245px;
			margin-left: -270px;
		}

		button {
			padding: 10px 15px;
			border: none;
			border-radius: 4px;
			cursor: pointer;
			font-size: 16px;
			margin: 5px;
			transition: background-color 0.3s, box-shadow 0.3s, transform 0.3s;
		}

		#loginBtn {
			background-color: #4caf50;
			color: #fff;
		}

		#registerBtn {
			background-color: #3498db;
			color: #fff;
		}

		button:hover {
			box-shadow: 0 0 20px rgba(255, 65, 65, 0.977);
			transform: translateY(-10px);
		}

		button:active {
			box-shadow: 0 0 10px rgb(237, 66, 66);
			transform: translateY(0);
		}

		h1 {
			color: white;
		}

		input[type="text"],
		input[type="password"] {
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
	<form action="Check.jsp" class="form1">
		<h1>User Name:</h1>
		<input type="text" id="id" name="username" placeholder="Enter ID" required> <br>
		<h1>Password:</h1>
		<input type="password" id="password" name="password" placeholder="Enter Password" required> <br> <br>

		<button type="submit" value="send" onclick="validate()" id="loginBtn">Login</button>
	</form>

	<form action="Register.jsp" class="form2">
		<button type="submit" value="send" id="registerBtn">Register</button>
	</form>



</body>

</html>