<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Admin Panel - Happy Pet</title>
	<link rel="stylesheet" type="text/css" href="css/loginPVPStyle.css">
	<link rel="stylesheet" type="text/css" href="css/head&footStyle.css">
	<script src="http://code.jquery.com/jquery-latest.js"></script>
</head>
<body>
	<header>
		<div class="logo">
			<img src="img/039-pet-house.png"> <a href="loginAdmin.jsp">HappyPet</a>
		</div>
		<div class="menu">
			<ul>
				<li>
					<a>Panel de Administrador</a>
				</li>
			</ul>
		</div>
	</header>
	<div class="content">
		<form class="loginBox" action="servletPrivUser" method="post">
			<img class="img" src="ajustes.png">
			<input class="text" type="text" name="correoPv" placeholder="Ingrese aquí el correo">
			<input class="text" type="password" name="passPv" placeholder="Ingrese aquí la contraseña">
			<input class="btn" type="submit" name="btn" value="Iniciar Sesion">
		</form>
	</div>
</body>
</html>