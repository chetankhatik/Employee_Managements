<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Display Data</title>
<link rel="icon" href="logo.ico" type="image/x-icon">
<style>
body {
	background-image: url(2314950.jpg);
	background-size: cover;
	background-position: center;
	background-repeat: no-repeat;
	height: 100vh;
}

.Table_name {
	margin-top: -65px;
	color: rgb(230, 30, 230);
	font-size:50px;
}

table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 20px;
	font-size:20px
}

th {
	border: 1px solid black;
	background-color: #3498db;
	color: #fff;
	font-weight: bold;
	padding: 10px;
	text-align: left;
}

td {
	border: 1px solid white;
	padding: 10px;
	color: White;
}

a, button {
	background-color: #4caf50;
	color: #fff;
	padding: 10px 15px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	text-decoration: none;
	font-size:20px
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

.name {
	margin-left: 1050px;
	color: white;
}
</style>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>

	<script>
		function openIframe(id) {
			var overlay = document.createElement('div');
			overlay.style.position = 'fixed';
			overlay.style.top = '25%';
			overlay.style.left = '30%';
			overlay.style.backgroundColor = 'rgba(0, 0, 0, 0.5)';
			overlay.style.zIndex = '9999';

			var iframe = document.createElement('iframe');
			iframe.src = "update.jsp?id=" + id;
			iframe.width = "600px";
			iframe.height = "400px";
			iframe.style.border = "none";
			iframe.style.overflow = "visible";

			var closeButton = document.createElement('button');
			closeButton.innerHTML = 'Close';
			closeButton.style.position = 'absolute';
			closeButton.style.top = '355px';
			closeButton.style.right = '42px';
			closeButton.style.zIndex = '10000';
			closeButton.addEventListener('click', function() {
				document.body.removeChild(overlay);
				window.location.href = "Display.jsp";
			});

			overlay.appendChild(iframe);
			overlay.appendChild(closeButton);
			document.body.appendChild(overlay);
		}
	</script>


	<%
	int id = 0;
	String name = null;
	double salary = 0;
	String place = null;
	Connection con = null;

	try {

		Class.forName("com.mysql.cj.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/emploee_project", "root", "Ckk@8099");

	} catch (Exception e) {
		e.printStackTrace();
	}
	%>
	<%
	String username = (String) request.getAttribute("username");
	%>
	<h1 class="name">
	<i class="fa-solid fa-user-secret"></i> &nbsp; &nbsp; Welcome!</h1>
	<h1 class="Table_name">Employee Details</h1>

	<table>
		<thead>
			<tr>
				<th>ID</th>
				<th>Name</th>
				<th>Salary</th>
				<th>Place</th>
				<th>Opt 1</th>
				<th>Opt2</th>
			</tr>
		</thead>
		<tbody>
			<%
			Statement stmt = con.createStatement();
			ResultSet set = stmt.executeQuery("select * from employee");
			while (set.next()) {
				id = set.getInt(1);
				name = set.getString(2);
				salary = set.getInt(3);
				place = set.getString(4);
			%>
			<tr>
				<td><%=id%></td>
				<td><%=name%></td>
				<td><%=salary%></td>
				<td><%=place%></td>
				<td><button onclick="openIframe('<%=id%>')">Edit</button></td>
				<td><a href="delete.jsp?id=<%=id%>" class="delete-btn">Delete</a>
				</td>
			</tr>

			<%
			}
			%>
		</tbody>
	</table>
	<form action="Home.jsp">
		<button type="submit">Back</button>
	</form>
</body>
</html>