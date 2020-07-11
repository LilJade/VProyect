<!DOCTYPE html>
<%@page import="com.vp.dao.priviligedUserDao"%>
<%@page import="com.vp.model.Priviligeduservp"%>
<html>
<head>
	<meta charset="UTF-8">
	<title>Admin Panel - Happy Pet</title>
	<link rel="stylesheet" type="text/css" href="css/perfilAdminStyle.css">
	<link rel="stylesheet" type="text/css" href="css/head&footStyle.css">
	<script src="http://code.jquery.com/jquery-latest.js"></script>
</head>
<%
	HttpSession verificacion = (HttpSession) request.getSession();
	String variableSesion = String.valueOf(verificacion.getAttribute("idPVP"));
	String redirectVar = "";

	priviligedUserDao pvpD = new priviligedUserDao();
	
	if(variableSesion == null || variableSesion.equals("null")){
		response.sendRedirect("loginPVP.jsp");
	} else {
		for (Priviligeduservp pvp:pvpD.datosPvp(variableSesion)) {
			request.setAttribute("nombrePVP", pvp.getNombresPVP());
			request.setAttribute("acceso", pvp.getAccessPVP());

			int accesso = (Integer) (request.getAttribute("acceso"));
			if(accesso == 1) {
				redirectVar = "perfilModerador.jsp";
			} else if(accesso == 0){
				redirectVar = "perfilAdmin.jsp";
			}
/*			String nameVerif = String.valueOf(request.getAttribute("nombrePVP"));
			if(nameVerif == null || nameVerif.equals("null")){
				response.sendRedirect("loginPVP.jsp");
			}*/
		 }
	}
%>
<body>
	<header>
		<div class="logo">
			<img src="img/039-pet-house.png"> <a href="<%= redirectVar %>">HappyPet</a>
		</div>
		<div class="menu">
			<ul>
				<li>
				</li>
			</ul>
		</div>
	</header>
</body>
</html>