<!DOCTYPE html>
<%@page import="com.vp.dao.priviligedUserDao"%>
<%@page import="com.vp.model.Priviligeduservp"%>
<html>
<head>
	<meta charset="UTF-8">
	<title>Admin Panel - Happy Pet</title>
	<link rel="stylesheet" type="text/css" href="css/crudEspRzStyle.css">
	<link rel="stylesheet" type="text/css" href="css/head&footStyle.css">
	<script src="http://code.jquery.com/jquery-latest.js"></script>
</head>
<%
	HttpSession verificacion = (HttpSession) request.getSession();
	String variableSesion = String.valueOf(verificacion.getAttribute("idPVP"));

	priviligedUserDao pvpD = new priviligedUserDao();
	
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
	}
%>
<script type="text/javascript">
	$(document).ready(function(){
		$.post('servletCrudRz', {}, function(response){
			let listaRazas = JSON.parse(response);
			var tablaRazas = document.getElementById("rz");
			
			for(let item of listaRazas) {
				tablaRazas.innerHTML +=`
					<tr>
						<td style="display: none">${item[0]}</td>
						<td style="display: none">${item[1]}</td>
						<td>${item[2]}</td>
						<td>${item[3]}</td>
						<td>${item[4]}</td>
						<td>
							<a href="crudRz.jsp?idVef=${item[1]}&idEsp=${item[0]}&razaName=${item[3]}&descrip=${item[4]}" class="btnConfc ed">Editar</a>
							<a href="servletCrudRz?btn=Eliminar&idDel=${item[1]}" class="btnConfc el">Eliminar</a>
						</td>
					</tr>
				`
			}
		});
		
		$.post('servletCrudEsp', {}, function(response){
			let listaEspecies = JSON.parse(response);
			var tablaEspecies = document.getElementById("esp");
			
			for(let item of listaEspecies) {
				tablaEspecies.innerHTML +=`
					<tr>
						<td style="display: none">${item[0]}</td>
						<td>${item[1]}</td>
						<td>${item[2]}</td>
						<td>
							<a href="crudEsp.jsp?idVef=${item[0]}&espName=${item[1]}&descripc=${item[2]}" class="btnConfc ed">Editar</a>
							<a href="servletCrudEsp?btn=Eliminar&idDel=${item[0]}" class="btnConfc el">Eliminar</a>
						</td>
					</tr>
				`
			}
		});
		
	});
</script>
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
		<div class="newReg">
			<a href="crudEsp.jsp" class="bigBtn-reg btnEsp">Registrar una nueva Especie</a>
			<a href="crudRz.jsp" class="bigBtn-reg btnRz">Registrar una nueva Raza</a>
		</div>
		<div class="container-esrz">
			<div class="table-content">
				<table id="esp">
					<thead>
						<th style="display: none">
							Registro N°
						</th>
						<th>
							Especie
						</th>
						<th>
							Descripción
						</th>
						<th>
							Configuraciones
						</th>
					</thead>
					<tbody>
	
					</tbody>
				</table>
			</div>
			<div class="table-content">
				<table id="rz">
					<thead>
						<th style="display: none">
							ID de la especie
						</th>
						<th style="display: none">
							Registro N°
						</th>
						<th>
							Especie
						</th>
						<th>
							Raza
						</th>
						<th>
							Descripción
						</th>
						<th>
							Configuraciones
						</th>
					</thead>
					<tbody>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>