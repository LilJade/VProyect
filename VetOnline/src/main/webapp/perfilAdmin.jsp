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

	String name = "";
	String lName = "";
	String direc = "";
	String cor = "";
	String con = "";
	int ax = 0;

	int numRz = 0;
	int numEsp = 0;
	int numMod = 0;
	int numVet = 0;
	
	if(variableSesion == null || variableSesion.equals("null")){
		response.sendRedirect("loginPVP.jsp");
	} else {
		for (Priviligeduservp pvp:pvpD.datosPvp(variableSesion)) {
			request.setAttribute("nombreAdm", pvp.getNombresPVP());
			request.setAttribute("apellidos", pvp.getApellidosPVP());
			request.setAttribute("dir", pvp.getDireccionPVP());
			request.setAttribute("acceso", pvp.getAccessPVP());
			request.setAttribute("correo", pvp.getCorreoPVP());
			request.setAttribute("contra", pvp.getContraPVP());
			
			name = (String) request.getAttribute("nombreAdm");
			lName = (String) request.getAttribute("apellidos");
			direc = (String) request.getAttribute("dir");
			cor = (String) request.getAttribute("correo");
			con = (String) request.getAttribute("contra");
			ax = (Integer) request.getAttribute("acceso");
			
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
<script type="text/javascript">
	$(document).ready(function(){
		$('#optRn').hide();
		$('#floatConfig').hide();
		
		$('#optStImg').click(function(){
			$('#optSt').hide();
			$('#optRn').show();
			$('#floatConfig').show();
			document.getElementsByTagName('body')[0].style.overflow = "hidden";
		});
		
		$('#optRnImg').click(function(){
			$('#optRn').hide();
			$('#optSt').show();
			$('#floatConfig').fadeOut();
			document.getElementsByTagName('body')[0].style.overflow = "auto";
		});
		
		$('#updateData').click(function(){
		});
	});
</script>
<body>
	<header>
		<div class="logo">
			<img src="img/039-pet-house.png"><a href="loginAdmin.jsp">HappyPet</a>
		</div>
		<div class="menu">
			<ul>
				<li>
					<a href="perfilAdmin.jsp">Panel de Administrador</a>
				</li>
				<li id="optSt">
					<img id="optStImg" class="configBtn" src="img/ajustesAdm2.png">
				</li>
				<li id="optRn">
					<img id="optRnImg" class="configBtn" src="img/ajustesAdm1.png">
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
	<div id="floatConfig" class="floatConfig">
		<div class="container-fc">
			<div class="head-fc">
				<div class="logo-fc">
					<img src="img/039-pet-house.png">
					<h5>HappyPet</h5>
				</div>
				<form action="servletPrivUser" method="post">
					<input type="submit" value="Cerrar Sesión" name="btn" class="btnClose-fc">
<!-- 					<span class="closeMe-fc">&#x24E7;</span> -->
				</form>
			</div>
			<div class="activity-fc">
				<div class="latMenu-fc">
					<ul>
						<li>
							<span id="updateData">Configurar Datos</span>
						</li>
						<li>
							<span>Cambiar estilo de Interfaz</span>
						</li>
						<li>
							<span>Agregar nuevo Admin</span>
						</li>
					</ul>
				</div>
				<div class="contenedor-fc">
					<div id="updateData-panel" class="updateData-fc">
						<form class="frmData" action="servletPrivUser" method="post">
							<label class="rotulo">Mis nombres: </label>
							<input id="nombresUD" type="text" class="control" name="nUD" placeholder="Escribe ambos nombres...">
							<label class="rotulo">Mis apellidos: </label>
							<input id="apellidosUD" type="text" class="control" name="aUD" placeholder="Escribe ambos apellidos...">
							<label class="rotulo">Dirección dónde se encuentra HappyPet: </label>
							<input id="direccionUD" type="text" class="control" name="dUD" placeholder="Escribe la dirección de HappyPet....">
							<label class="rotulo">Mi nuevo correo electrónico: </label>
							<input id="correoUD" type="text" class="control" name="cUD" placeholder="">
							<label class="rotulo">Mi nueva contraseña: </label>
							<input id="passwordUD" type="text" class="control" name="pUD" placeholder="">
							<input id="accessUD" type="textn" class="control" name="axUD" placeholder="">
							<label class="rotulo">A continuación debes ingresar tu contraseña actual para poder guardar los cambios: </label>
							<input id="passConfirm" type="text" class="control" name="" placeholder="">
							<div class="frmOpt">
								<span id="btnCancelUD" class="btnClose-fc">Cancelar</span>
								<input id="btnSendUD" type="submit" name="btn" value="Save All" class="btnClose-fc oc-fc">
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$('#nombresUD').val("<%= name%>");
		$('#apellidosUD').val("<%= lName%>");
		$('#direccionUD').val("<%= direc%>");
		$('#correoUD').val("<%= cor%>");
		$('#passwordUD').val("<%= con%>");
		$('#accessUD').val("<%= ax%>");
	</script>
<script type="text/javascript">

</script>
</body>
</html>