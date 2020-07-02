<!DOCTYPE html>
<%@page import="com.vp.model.Dueniovp"%>
<%@page import="com.vp.dao.duenioDao"%>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" type="text/css" href="css/head&footStyle.css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
</head>
<%
	HttpSession verificacion = (HttpSession) request.getSession();
	String variableSesion = String.valueOf(verificacion.getAttribute("idDue�o"));
%>
	<script type="text/javascript">
		$(document).ready(function() {
			$('#windPop').hide();
			$('#vete').hide();
			$('#mP').hide();
			
			var validandoSesion = "<%= variableSesion %>";
			
			if(validandoSesion.length > 0 && validandoSesion != null && validandoSesion != "null"){
				$('#mP').show();
				$('#LogInItem').hide();
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
		});
	</script>
<body>
	<header>
		<div class="logIn" id="windPop">
			<div class="logo">
				<img src="img/039-pet-house.png">
				<h2>Iniciar Sesi�n</h2>
			</div>
			<form action="servletDuenio" method="post">
				<label class="lbl">Ingresa tu Correo Electr�nico: </label>
				<input type="text" class="txt" placeholder="tuCorreo@ejemplo.com" name="txtCorreo">
				<label class="lbl">Escribe tu contrase�a: </label>
				<input type="password" class="txt" placeholder="&#x25CF;&#x25CF;&#x25CF;&#x25CF;&#x25CF;&#x25CF;&#x25CF;&#x25CF;&#x25CF;" name="txtPass">
				<span class="regAnun">�No tienes una cuenta? <a href="" class="reg">Reg�strate aqu�</a></span>
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
						<li><a id="entrar">Iniciar Sesi�n</a></li>
						<li><a href="">Contactar Veterinaria</a></li>
					</ul></li>
				<div id="LogInItem">
					<hr>
					<li><a id="mostrar">Iniciar Sesi�n</a></li>
					<hr>
					<li><a href="">Registrarse</a></li>
				</div>
				<div id="mP">
					<hr>
					<li>
						<a href="">Mi Perfil</a>
					</li>
				</div>
			</ul>
		</div>
	</header>
	<div class="content"></div>
	<footer></footer>
	<div class="logov" id="vete">
			<div class="logo">
				<img src="img/005-veterinary-1.png">
				<h2>Iniciar Sesi�n</h2>
			</div>
			<form>
				<label class="lbl">Correo Electr�nico: </label> <input
					type="text" class="txt" placeholder="tu Correo">
				<label class="lbl">Contrase�a: </label> <input
					type="password" class="txt"
					placeholder="&#x25CF;&#x25CF;&#x25CF;&#x25CF;&#x25CF;&#x25CF;&#x25CF;&#x25CF;&#x25CF;">
				<div class="botones">
					<input type="submit" class="btnOk" value="Ingresar"> <span
						class="btnCancel" id="noEntrar">Cancelar</span>
				</div>
			</form>
		</div>
</body>
</html>