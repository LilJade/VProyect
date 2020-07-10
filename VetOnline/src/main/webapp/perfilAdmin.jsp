<%@page import="com.vp.dao.priviligedUserDao"%>
<%@page import="com.vp.model.Priviligeduservp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Admin Panel - Happy Pet</title>
	<link rel="stylesheet" type="text/css" href="css/Style.css">
	<link rel="stylesheet" type="text/css" href="css/head&footStyle.css">
	<script src="http://code.jquery.com/jquery-latest.js"></script>
</head>
<%
	HttpSession verificacion = (HttpSession) request.getSession();
	String variableSesion = String.valueOf(verificacion.getAttribute("idPVP"));
	System.out.println(variableSesion);
	priviligedUserDao pvpD = new priviligedUserDao();
	
	if(variableSesion == null || variableSesion.equals("null")){
		response.sendRedirect("loginPVP.jsp");
	} else {
		for (Priviligeduservp pvp:pvpD.datosPvp(variableSesion)) {
			request.setAttribute("nombreAdm", pvp.getNombresPVP());
		 }
	}
%>
<body>
	<header>
		<div class="logo">
			<img src="img/039-pet-house.png"> <a href="loginAdmin.jsp">HappyPet</a>
		</div>
		<div class="menu">
			<ul>
				<li>
					<a href="perfilAdmin.jsp">Panel de Administrador</a>
				</li>
			</ul>
		</div>
	</header>
	<div class="content">
		<h2>Bienvenido al panel de Administrador, sr. <%out.println(request.getAttribute("nombreAdm"));%></h2>
	</div>
</body>
</html>