<%@page import="com.vp.dao.duenioDao"%>
<%@page import="com.vp.model.Dueniovp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
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

	<h3>ID: <%out.println(request.getAttribute("id"));%></h3>
	<h3>Nombres: <%out.println(request.getAttribute("nombres"));%></h3>
	<h3>Apellidos: <%out.println(request.getAttribute("apellidos"));%></h3>
	
	<form action="servletDuenio" method="post">
		<input type="submit" value="Cerrar Sesión" name="btn">
	</form>
</body>
</html>