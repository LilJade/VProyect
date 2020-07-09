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
			 request.setAttribute("pass", duenio.getContraDVP());
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
				<hr>
				<li id="cb1">
					<img id="configBtn1" class="configBtn" src="img/engranaje.png">
				</li>
				<li id="cb2">
					<img id="configBtn2" class="configBtn" src="img/engranaje2.png">
				</li>
			</ul>
		</div>
	</header>
	<div id="lateralNav">
		<ul>
			<li>
				<img src="img/046-pet-shelter.png">
			</li>
			<li>
				<span>Inicio</span>
			</li>
			<li>
				<span id="changeImg">Cambiar Foto de Perfil</span>
			</li>
			<li>
				<span id="changeData">Actualizar mi Información</span>
			</li>
			<li>
				<span>About us</span>
			</li>
		</ul>
	</div>
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

	<script type="text/javascript">
		$(window).load(function() {

			$(function() {
				$('#changeFotoPerfilEvent').change(function(e) {
					addImage(e);
				});

				function addImage(e) {
					var file = e.target.files[0], imageType = /image.*/;

					if (!file.type.match(imageType))
						return;

					var reader = new FileReader();
					reader.onload = fileOnload;
					reader.readAsDataURL(file);
				}

				function fileOnload(e) {
					var result = e.target.result;
					$('#foto').attr("src", result);
				}
			});
		});
	</script>
	<div id="cambiarFoto" class="floatContainer-ChangeImg fade">
		<div class="imgPre-Load">
			<img src="<%out.println(request.getAttribute("foto"));%>" id="foto">
		</div>
		<form action="servletChangeImgDuenio" method="post" enctype="multipart/form-data">
			<div id="datosOcultos">
				<input type="text" name="ciNombres" id="ciNombres">
				<input type="text" name="ciApellidos" id="ciApellidos">
				<input type="text" name="ciEdad" id="ciEdad">
				<input type="text" name="ciDireccion" id="ciDireccion">
				<input type="text" name="ciCorreo" id="ciCorreo">
				<input type="text" name="ciContra" id="ciContra">
				<input type="text" name="ciCel" id="ciCel">
			</div>
			<input type="file" name="foto" multiple id="changeFotoPerfilEvent">
			<div class="opt">
				<span id="cancelChangeImg" class="btnCI btnCICancel">Cancelar</span>
				<button id="btnConfirm" type="submit" class="btnCI btnCIConfirm">Guardar Cambios</button>
			</div>
		</form>
		<span id="closeChangeImg" class="floatBtnClose">&#x24E7;</span>
	</div>
	<div id="cambiarDatos" class="floatContainer-ChangeImg fade">
		<form action="servletDuenio" method="post">
			<div id="datosChanger">
				<label class="title">Escribe tus nombres: </label>
				<input type="text" name="ciNombres2" id="ciNombres2" class="control">
				<label class="title">Escribe tus apellidos: </label>
				<input type="text" name="ciApellidos2" id="ciApellidos2" class="control">
				<label class="title">Selecciona tu edad: </label>
				<input type="number" name="ciEdad2" id="ciEdad2" class="control">
				<label class="title">Actualiza tu dirección: </label>
				<input type="text" name="ciDireccion2" id="ciDireccion2" class="control">
				<div id="loginData">
					<input type="text" name="ciCorreo2" id="ciCorreo2" class="control">
					<input type="text" name="ciContra2" id="ciContra2" class="control">
					<input type="text" name="ciFoto2" id="ciFoto2" class="control">
				</div>
				<label class="title">Actualiza tu número telefónico: </label>
				<input type="text" name="ciCel2" id="ciCel2" class="control">
			</div>
			<div class="opt">
				<span id="cancelChangeData" class="btnCI btnCICancel">Cancelar</span>
				<input type="submit" name="btn" id="btnConfirm" class="btnCI btnCIConfirm" value="Guardar Cambios">
			</div>
		</form>
		<span id="closeChangeData" class="floatBtnClose">&#x24E7;</span>
	</div>
	<script type="text/javascript">
		$(document).ready(function(){
			$('#cb2').hide();
			$('#cambiarFoto').hide();
			$('#cambiarDatos').hide();
			$('#datosOcultos').hide();
			
			$('#changeImg').click(function(){
				$('#ciNombres').val("<%= request.getAttribute("nombres") %>");
				$('#ciApellidos').val("<%= request.getAttribute("apellidos") %>");
				$('#ciEdad').val("<%= request.getAttribute("edad") %>");
				$('#ciDireccion').val("<%= request.getAttribute("direccion") %>");
				$('#ciCorreo').val("<%= request.getAttribute("correo") %>");
				$('#ciContra').val("<%= request.getAttribute("pass") %>");
				$('#ciCel').val("<%= request.getAttribute("telefono") %>");
				$('#cambiarFoto').show();
			});
			
			$('#changeData').click(function(){
				$('#loginData').hide();
				$('#ciNombres2').val("<%= request.getAttribute("nombres") %>");
				$('#ciApellidos2').val("<%= request.getAttribute("apellidos") %>");
				$('#ciEdad2').val("<%= request.getAttribute("edad") %>");
				$('#ciDireccion2').val("<%= request.getAttribute("direccion") %>");
				$('#ciCorreo2').val("<%= request.getAttribute("correo") %>");
				$('#ciContra2').val("<%= request.getAttribute("pass") %>");
				$('#ciCel2').val("<%= request.getAttribute("telefono") %>");
				$('#ciFoto2').val("<%= request.getAttribute("foto") %>");
				$('#cambiarDatos').show();
			});
			
			$('#closeChangeImg').click(function(){
				$('#cambiarFoto').fadeOut();
			});
			
			$('#cancelChangeImg').click(function(){
				$('#cambiarFoto').fadeOut();
			});
			
			$('#closeChangeData').click(function(){
				$('#cambiarDatos').fadeOut();
			});
			
			$('#cancelChangeData').click(function(){
				$('#cambiarDatos').fadeOut();
			});
		});
	</script>
	<script type="text/javascript">
		$('#configBtn1').click(function(){
			document.getElementById('lateralNav').classList.toggle('active');
			$('#cb1').hide();
			$('#cb2').show();
			document.getElementsByTagName('body')[0].style.overflow = "hidden";
		});
		
		$('#configBtn2').click(function(){
			document.getElementById('lateralNav').classList.toggle('active');
			$('#cb1').show();
			$('#cb2').hide();
			document.getElementsByTagName('body')[0].style.overflow = "auto";
		});
	</script>
</body>
</html>