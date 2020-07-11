<%@page import="com.vp.dao.veterinarioDao"%>
<%@page import="com.vp.dao.razaDao"%>
<%@page import="com.vp.dao.especieDao"%>
<%@page import="com.vp.dao.priviligedUserDao"%>
<%@page import="com.vp.model.Priviligeduservp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
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

	priviligedUserDao pvpD = new priviligedUserDao();
	veterinarioDao vD = new veterinarioDao();
	especieDao eD = new especieDao();
	razaDao rD = new razaDao();

	int numRz = 0;
	int numEsp = 0;
	int numMod = 0;
	int numVet = 0;
	
	if(variableSesion == null || variableSesion.equals("null")){
		response.sendRedirect("loginPVP.jsp");
	} else {
		for (Priviligeduservp pvp:pvpD.datosPvp(variableSesion)) {
			request.setAttribute("nombreAdm", pvp.getNombresPVP());
			request.setAttribute("acceso", pvp.getAccessPVP());
			
			int accesso = (Integer) (request.getAttribute("acceso"));
			if(accesso == 1) {
				response.sendRedirect("loginPVP.jsp");
			}
		 }
		
		numMod = pvpD.modsLista().size();
		numVet = vD.vetsLista().size();
		numEsp = eD.especiesLista().size();
		numRz = rD.razasLista().size();
		
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
	<div class="containerContent">
		<div class="saludo">
			<h2>Bienvenido al panel de Administrador, sr. <%out.println(request.getAttribute("nombreAdm"));%></h2>
		</div>
		<div class="container">
			<div class="opcionesAdminCruds">
				<div class="seccionAc rzEsp">
					<div class="titleAC">
						<h4>Especies y Razas</h4>
					</div>
					<div class="infAC" style="background-image: url('img/rzEspO.png')">
						<p>
							Administra la información de las especies y razas animales que Happy Pet está dispuesto a atender.
							Registra nuevas especies o nuevas razas. Elimina o actualiza la información de las que ya están registradas.
						</p>
						<p>
							Actualmente cuentas con <%= numEsp%> especies y <%= numRz%> razas registradas.
						</p>
					</div>
					<div class="opcionAC">
						<a href="crudEspRz.jsp" class="btnOpt">Administrar</a>
					</div>
				</div>
				<div class="seccionAc vets">
					<div class="titleAC">
						<h4>Veterinarios</h4>
					</div>
					<div class="infAC" style="background-image: url('img/vet2O.png')">
						<p>
							Administra los veterinarios que pueden acceder al sistema. 
							Crea una nueva cuenta para algún nuevo veterinario que forme parte de Happy Pet. 
							Elimina o edita la información de los veterinarios que ya están registrados.
						</p>
						<p>
							Actualmente cuentas con <%= numVet %> veterinarios registrados.
						</p>
					</div>
					<div class="opcionAC">
						<a href="crudVet.jsp" class="btnOpt">Administrar</a>
					</div>
				</div>
				<div class="seccionAc mods">
					<div class="titleAC">
						<h4>Moderadores</h4>
					</div>
					<div class="infAC" style="background-image: url('img/modO.png')">
						<p>
							Crea una nueva cuenta para algún moderador de Happy Pet, elimina o edita la información de los moderadores que ya están registrados. 
							Lleva un control de las acciones que tus moderadores realizan.
						</p>
						<p>
							Actualmente cuentas con <%= numMod %> moderadores registrados.
						</p>
					</div>
					<div class="opcionAC">
						<a href="crudMod.jsp" class="btnOpt">Administrar</a>
					</div>
				</div>
			</div>
		</div>
		<div class="products">
			<div class="seccionPRD">
				<img src="img/prd.png">
				<p>
					Administra, crea, edita o elimina los productos que ofreces en Happy Pet.
					Promociona los nuevos productos, añade imagenes y descripciones a cada uno. Recuerda que los moderadores pueden ayudarte en este proceso.
				</p>
			</div>
			<div class="optionPRD">
				<span class="btnOpt Prd">Ver lista actual</span>
				<a href="crudProductos.jsp" class="btnOpt Prd">Administrar</a>
			</div>
		</div>
	</div>
</body>
</html>