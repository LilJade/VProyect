<!DOCTYPE html>
<%@page import="com.vp.model.Dueniovp"%>
<%@page import="com.vp.dao.duenioDao"%>
<html>
<head>
	<meta charset="UTF-8">
	<title>Happy Pet</title>
	<link rel="stylesheet" type="text/css" href="css/registrarDuenioStyle.css">
	<link rel="stylesheet" type="text/css" href="css/head&footStyle.css">
	<script src="http://code.jquery.com/jquery-latest.js"></script>
</head>
<%
	HttpSession verificacion = (HttpSession) request.getSession();
	String variableSesion = String.valueOf(verificacion.getAttribute("idDueño"));
	
	if(variableSesion == null || variableSesion.equals("null")){

	} else {
		response.sendRedirect("perfilDuenio.jsp");
	}
%>

<script type="text/javascript">
	$(document).ready(function() {
		$('#windPop').hide();
		$('#vete').hide();
		$('#mP').hide();
		$('#LogInItem').show();
		$('#seccion2').hide();
		$('#seccion3').hide();
		$('#finish').hide();
		
		var validandoSesion = "<%= variableSesion %>";

		if (validandoSesion.length > 0 && validandoSesion != null && validandoSesion != "null") {
			$('#mP').show();
			$('#LogInItem').hide();
			$('#entrar').hide();
		}

		$('#mostrar').click(function() {
			$('#vete').hide();
			$('#windPop').show();
		});

		$('#ocultar').click(function() {
			$('#windPop').fadeOut();
		});

		$('#entrar').click(function() {
			$('#windPop').hide();
			$('#vete').show();
		});

		$('#noEntrar').click(function() {
			$('#vete').fadeOut();
		});
		
		$('#btnNext1').click(function(){
			var n = $('#nombres').val();
			var a = $('#apellidos').val();
			
			
			if(n.length > 2 && a.length > 2){
				$('#seccion1').hide();
				$('#seccion2').show();
			} else {
				alert('Debes cumplir con los requesitos solicitados en cada campo.');
			}
		});

		$('#btnNext2').click(function(){
			var e = $('#edad').val();
			var d = $('#direccion').val();
			var t = $('#telefono').val();
			
			if(e.length > 1 && d.length > 10 && t.length == 8){
					$('#seccion2').hide();
					$('#seccion3').show();
					$('#finish').prop('disabled', false);
			} else {
				alert('Debes cumplir con los requesitos solicitados en cada campo.');
			}

		});
		
		$('#btnCancel2').click(function(){
			$('#seccion2').hide();
			$('#seccion1').show();
		});
		
		$('#btnCancel3').click(function(){
			$('#seccion3').hide();
			$('#seccion2').show();
		});

		document.getElementById("pass2").addEventListener("keyup", myFunction);
		function myFunction(){
			var correo = $('#correo').val();
			var pass = $('#pass').val();
			var pass2 = $('#pass2').val();
			console.log(pass);

			if(correo.length != 0 && pass==pass2){
				$('#finish').show();
			}
		}
	});
</script>
<script type="text/javascript">
	$(window).load(function() {

		$(function() {
			$('#fotoPerfil').change(function(e) {
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
</script><body>
	<header>
		<div class="logIn" id="windPop">
			<div class="logo">
				<img src="img/039-pet-house.png">
				<h2>Iniciar Sesión</h2>
			</div>
			<form action="servletDuenio" method="post">
				<label class="lbl">Ingresa tu Correo Electrónico: </label>
				<input type="text" class="txt" placeholder="tuCorreo@ejemplo.com" name="txtCorreo">
				<label class="lbl">Escribe tu contraseña: </label>
				<input type="password" class="txt" placeholder="&#x25CF;&#x25CF;&#x25CF;&#x25CF;&#x25CF;&#x25CF;&#x25CF;&#x25CF;&#x25CF;" name="txtPass">
				<span class="regAnun">¿No tienes una cuenta? <a href="registrarDuenio.jsp" class="reg">Regístrate aquí</a></span>
				<div class="botones">
					<input type="submit" class="btnOk" value="Ingresar" name="btn">
					<span class="btnCancel" id="ocultar">Cancelar</span>
				</div>
			</form>
		</div>
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
						<li><a id="entrar">Iniciar Sesión</a></li>
						<li><a href="">Contactar Veterinaria</a></li>
					</ul></li>
				<div id="LogInItem">
					<hr>
					<li><a id="mostrar">Iniciar Sesión</a></li>
					<hr>
					<li><a href="registrarDuenio.jsp">Registrarse</a></li>
				</div>
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
		<div class="rotulos">
			<h2>Happy Pet</h2>
			<h4>Registrate y crea un perfil para tus mascotas</h4>
		</div>
		<div class="registro">
			<form>
				<div class="seccion" id="seccion1">
					<div class="encabezado">
						<img id="foto" src="img/persona.png">
						<span>Selecciona una foto de perfil si así lo deseas</span>
						<input type="file" class="inp" name="foto" id="fotoPerfil">
					</div>
					<div class="datos">
						<label class="title">Nombres: </label>
						<input type="text" class="control" id="nombres" name="" placeholder="Escribe ambos nombres aquí..." maxlength="20" pattern="[A-Za-z]{3,20}" title="Tus nombres deben tener entre 3 y 40 letras" required>
						<label class="title">Apellidos: </label>
						<input type="text" class="control" id="apellidos" name="" placeholder="Escribe ambos apellidos aquí..." maxlength="20" pattern="[A-Za-z]{3,20}" title="Tus apellidos deben tener entre 3 y 40 letras" required>
					</div>
					<div class="continue" id="continue1">
						<a href= "index.jsp" class="btn Cancel">Cancelar</a>
						<span class="btn Next" id="btnNext1">Siguiente</span>
					</div>
				</div>
				<div class="seccion" id="seccion2">
					<div class="encabezado">
						<span class="tit">Datos personales</span>
						<p>Necesitaremos algunos de tus datos personales. <br>No te preocupes, estos datos son de manejo publico y los solicitamos con el único fin de brindarte el servicio que tú te mereces.</p>
					</div>
					<div class="datos">
						<label class="title">Edad: </label>
						<input type="number" class="control" id="edad" name="" placeholder="Selecciona tu edad..." min="18" max="99" title="Seleccione una edad entre 18 y 99" required pattern="[0-9]{2}">
						<label class="title">Direccion: </label>
						<input type="text" class="control" id="direccion" name="" placeholder="Escribe tu dirección..." maxlength="250" title="introducir entre 10 y 250 letras" required>
						<label class="title">Teléfono: </label>
						<input type="text" class="control" id="telefono" name="" placeholder="Escribe tu numero telefónico..." maxlength="8" pattern="[0-9]{8}" title="introducir número telefonico de 8 cifras" required>
					</div>
					<div class="continue" id="continue2">
						<a href= "index.jsp" class="btn Cancel">Cancelar</a>
						<span class="btn Cancel" id="btnCancel2">Regresar</span>
						<span class="btn Next" id="btnNext2">Siguiente</span>
					</div>
				</div>
				<div class="seccion" id="seccion3">
					<div class="encabezado">
						<span class="tit">Datos de Inicio de Sesión</span>
						<p>Estos datos son los que utilizarás para poder iniciar sesión. <br>Para ello utilizaremos tu correo electrónico y esperamos que no olvides tu contraseña!</p>
					</div>
					<div class="datos">
						<label class="title">Correo Electrónico: </label>
						<input type="text" class="control" id="correo" name="" placeholder="Escribe tu correo electrónico..." maxlength="140" pattern="[a-z-0-9]+@+[a-z]+.+[a-z]" title="Ingrese su dirección de correo electrónico. Ejemplo: alguien@dominio.com" required>
						<label class="title">Contraseña: </label>
						<input type="password" class="control" id="pass" name="" placeholder="Escribe tu contraseña..." maxlength="20" min="4" max="20"  title="Debe introducir una contraseña entre 4 y 16 digitos" pattern="[a-z-0-9]{4,20}" required>
						<label class="title">Confirmación de contraseña: </label>
						<input type="password" class="control" id="pass2" name="" placeholder="Reescribe tu contraseña...">
					</div>
					<div class="continue">
						<a href= "index.jsp" class="btn Cancel">Cancelar</a>
						<span class="btn Cancel" id="btnCancel3">Regresar</span>
						<input type="submit" class="btn Finish" id="finish" name="" value="Registrarme">
					</div>
				</div>
			</form>
		</div>
	</div>
	<footer></footer>
	<div class="logov" id="vete">
		<div class="logo">
			<img src="img/005-veterinary-1.png">
			<h2>Iniciar Sesión</h2>
		</div>
		<form action="ServletVeterinario" method="post">
			<label class="lbl">Correo Electrónico: </label> 
			<input type="text" class="txt" placeholder="tu Correo" name="correo">
			<label class="lbl">Contraseña: </label> 
			<input type="password" class="txt" placeholder="&#x25CF;&#x25CF;&#x25CF;&#x25CF;&#x25CF;&#x25CF;&#x25CF;&#x25CF;&#x25CF;" name="contra">
			<div class="botones">
				<input type="submit" class="btnOk" value="Ingresar">
				<span class="btnCancel" id="noEntrar">Cancelar</span>
			</div>
		</form>
	</div>
</body>
</html>