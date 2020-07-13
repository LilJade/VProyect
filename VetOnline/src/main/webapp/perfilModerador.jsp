
<%@page import="com.vp.dao.duenioDao"%>
<%@page import="com.vp.dao.priviligedUserDao"%>
<%@page import="com.vp.dao.productoDao"%>
<%@page import="com.vp.model.Priviligeduservp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Admin Panel - Happy Pet</title>
	<link rel="stylesheet" type="text/css" href="css/stylemod.css">
	
	<link rel="stylesheet" type="text/css" href="css/head&footStyle.css">
	<link rel="stylesheet" type="text/css" href="css/estiloo.css">
	<script src="http://code.jquery.com/jquery-latest.js"></script>
</head>
<%
	HttpSession verificacion = (HttpSession) request.getSession();
	String variableSesion = String.valueOf(verificacion.getAttribute("idPVP"));
	System.out.println(variableSesion);
	
	priviligedUserDao pvpD = new priviligedUserDao();
	productoDao pro = new productoDao();
	duenioDao d = new duenioDao();
	
	
	int numpro = 0;
	int numd = 0;
	if(variableSesion == null || variableSesion.equals("null")){
		response.sendRedirect("loginPVP.jsp");
	} else {
		for (Priviligeduservp pvp:pvpD.datosPvp(variableSesion)) {
			request.setAttribute("nombreMod", pvp.getNombresPVP());
			request.setAttribute("correo",pvp.getCorreoPVP());
                 request.setAttribute("acceso", pvp.getAccessPVP());
			
			int accesso = (Integer) (request.getAttribute("acceso"));
			if(accesso == 0) {
				response.sendRedirect("loginPVP.jsp");
			}
			
				
			}
		 }
		
		numpro = pro.proLista().size();
		numd = d.dLista().size();
		
		
	
%>
<body>
	<header>
		<div class="logo">
			<img src="img/039-pet-house.png"> <a href="loginAdmin.jsp">HappyPet</a>
		</div>
		<div class="menu">
			<ul>
				<li>
					<a href="perfilModerador.jsp">Perfil Moderador</a>
					
				</li>
			</ul>
		</div>
		
	</header>
	
			<div class="panel">
<a href="perfilAdmin.jsp"><i class="fas fa-sign-out-alt"></i>Regresar a Login</a>
</div>
		
	<div class="containerE">
	<div class="saludo">
	<h2>Bienvenido al perfil de Moderador <%out.println(request.getAttribute("nombreMod"));%></h2>
	</div>

	<br>
	
	<div class="saludos" >
	<h2 >tu correo  <%out.println(request.getAttribute("correo"));%></h2>
	</div>
	

	<div class="container" align="center">
			<div class="opcionesModCrud">
				<div class="paneles producto" align="left">
					<div class="titleAC">
						<h4>Producto en la tienda</h4>
					</div>
					<div class="infAC" style="background-image: url('img/rzEspO.png')">
						<p>
							regulacion de los productos existentes en la tienda 
						agrega,actualzia o elimina deacuerdo a la existencia real de los productos disponibles</p>
						<p>
							Actualmente cuentas con <%= numpro%> productos registradas.
						</p>
					</div>
					<div class="opcionAC">
						<span class="btnOpt">Administrar</span>
					</div>
				</div>
				<div class="paneles duenio"align="center">
					<div class="titleAC">
						<h4>Dueños</h4>
					</div>
					<div class="infAC" style="background-image: url('img/persona.png')">
						<p>
						seccion para inspeccionar los dueños de mascotas registradas en el sistema 
						de igual forma puedes eliminar a  los dueños que hacen mal uso de su perfil.
							</p>
						<p>
							Actualmente cuentas con <%= numd%> dueños registrados.
						</p>
					</div>
					<div class="opcionAC">
						<a href="perfilDuenio.jsp" class="btnOpt">Administrar</a>
					</div>
				</div>
				
			</div>
		</div>
	</div>
</body>
</html>