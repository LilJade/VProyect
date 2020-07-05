<%@page import="com.vp.dao.duenioDao"%>
<%@page import="com.vp.model.Dueniovp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" type="text/css" href="css/perfilDuenioStyle.css">
<link rel="stylesheet" type="text/css" href="css/head&footStyle.css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="js/headerValidate.js"></script>
</head>
<%
	HttpSession verificacion = (HttpSession) request.getSession();
	String variableSesion = String.valueOf(verificacion.getAttribute("idDueño"));
	System.out.println(variableSesion);
	duenioDao dD = new duenioDao();
	
	if(variableSesion == null || variableSesion.equals("null")){
		response.sendRedirect("index.jsp");
	} else {
		for (Dueniovp duenio:dD.datosDuenio(variableSesion)) {
			 request.setAttribute("id", duenio.getIdDVP());
			 request.setAttribute("nombres", duenio.getNombresDVP());
			 request.setAttribute("apellidos", duenio.getApellidosDVP());
			 request.setAttribute("foto", duenio.getFotoDVP());
			 request.setAttribute("edad", duenio.getEdadDVP());
			 request.setAttribute("telefono", duenio.getTelefonoDVP());
			 request.setAttribute("correo", duenio.getCorreoDVP());
			 request.setAttribute("direccion", duenio.getDireccionDVP());
		 }
	}
%>
<body>
	<header>
		<div class="logo">
			<img src="img/039-pet-house.png"> <a href="index.jsp">Happy
				Pet</a>
		</div>
		<div class="menu">
			<ul>
				<li><a href="">Tienda</a></li>
				<hr>
				<li><a href="">Adopciones</a></li>
				<hr>
				<li><a href="">Soy Veterinario &#x25BE;</a>
					<ul class="subMenu">
						<li><a href="">Contactar Veterinaria</a></li>
					</ul>
				</li>
				<div id="mP">
					<hr>
					<li>
						<a href="perfilDuenio.jsp">Mi Perfil</a>
					</li>
				</div>
			</ul>
		</div>
	</header>
	<div class="content">
		<div class="container">
			<div class="contenidoActivo">
				<div class="seccion">
					Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
					tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
					quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
					consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
					cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
					proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
				</div>
				<div class="seccion">
					Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
					tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
					quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
					consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
					cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
					proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
				</div>
				<div class="seccion">
					Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
					tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
					quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
					consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
					cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
					proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
				</div>
			</div>
			<div class="dataUser">
				<div class="fotoUser">
					<img src="<%out.println(request.getAttribute("foto"));%>" id="fotoPerfil">
				</div>
				<div class="infoUser">
					<h3><%out.println(request.getAttribute("nombres"));%><%out.println(request.getAttribute("apellidos"));%></h4>
					<h4>Correo: <%out.println(request.getAttribute("correo"));%></h4>
					<h4>Telefono: <%out.println(request.getAttribute("telefono"));%></h4>
					<h4>Edad: <%out.println(request.getAttribute("edad"));%> años</h4>
					<h5>Direccion: <%out.println(request.getAttribute("direccion"));%></h5>
				</div>
				<div class="option">
					<form action="servletDuenio" method="post">
						<input type="submit" value="Cerrar Sesión" name="btn" class="btnClose">
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>