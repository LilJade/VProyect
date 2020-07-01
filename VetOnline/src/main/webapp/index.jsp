<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" type="text/css" href="css/head&footStyle.css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
</head>
<body>
	<header>
		<div class="logIn" id="windPop">
			<div class="logo">
				<img src="img/039-pet-house.png">
				<h2>Iniciar Sesión</h2>
			</div>
			<form>
				<label class="lbl">Ingresa tu Correo Electrónico: </label> <input
					type="text" class="txt" placeholder="tuCorreo@ejemplo.com">
				<label class="lbl">Escribe tu contraseña: </label> <input
					type="password" class="txt"
					placeholder="&#x25CF;&#x25CF;&#x25CF;&#x25CF;&#x25CF;&#x25CF;&#x25CF;&#x25CF;&#x25CF;">
				<span class="regAnun">¿No tienes una cuenta? <a href=""
					class="reg">Regístrate aquí</a></span>
				<div class="botones">
					<input type="submit" class="btnOk" value="Ingresar"> <span
						class="btnCancel" id="ocultar">Cancelar</span>
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
						<li><a href="">Iniciar Sesión</a></li>
						<li><a href="">Contactar Veterinaria</a></li>
					</ul></li>
				<div id="LogInItem">
					<hr>
					<li><a id="mostrar">Iniciar Sesión</a></li>
					<hr>
					<li><a href="">Registrarse</a></li>
				</div>
				<!--				<div id="mP">
					<hr>
					<li>
						<a href="">Mi Perfil</a>
					</li>
				</div>-->
			</ul>
		</div>
	</header>
	<div class="content"></div>
	<footer></footer>
	<script type="text/javascript">
		$(document).ready(function() {
			$('#windPop').hide();

			$('#mostrar').click(function() {
				$('#windPop').show();
			});

			$('#ocultar').click(function() {
				$('#windPop').fadeOut();
			});
		});
	</script>
</body>
</html>