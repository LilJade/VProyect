<!DOCTYPE html>
<%@page import="com.vp.dao.priviligedUserDao"%>
<%@page import="com.vp.model.Priviligeduservp"%>
<html>
<head>
	<meta charset="UTF-8">
	<title>Admin Panel - Happy Pet</title>
	
</head>
<link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/perfilAdminStyle.css">
	<link rel="stylesheet" type="text/css" href="css/head&footStyle.css">
	<link rel="stylesheet" type="text/css" href="css/stylemod.css">
<script src="http://code.jquery.com/jquery-latest.js">
</script><script src="https://kit.fontawesome.com/a076d05399.js"></script>
<script type="text/javascript">
	$(document).ready(function () {
 var btn=$('#carga').val();
 $.post('servletModCrud',{

 },function(respose){
 let datos= JSON.parse(respose);
// console.log(datos);
var tabladato=document.getElementById('tablaDatos');
for(let item of datos){
	tabladato.innerHTML += `	
<tr>
		<td>${item.idPVP}</td>
		<td>${item.nombresPVP}</td>
		<td>${item.apellidosPVP}</td>
		<td>${item.direccionPVP}</td>
		<td>${item.correoPVP}</td>
		<td>${item.contraPVP}</td>
		
		
<td>
<a href="ControladorDocente?btn=Eliminar&Id=${item.idPVP}" class="btn btn-warning">Eliminar Registro</a>

</td>
</tr>
`
}
});
});
</script>
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

<%
	String id = request.getParameter("idp");
	String nombre = request.getParameter("n");
	String apellido = request.getParameter("a");
	String direccion = request.getParameter("d");
	String correo = request.getParameter("c");
	String contra = request.getParameter("con");
	String acceso = request.getParameter("ac");

	if (id == null) {
		id = "";
		nombre = "";
		apellido = "";
		direccion = "";
		acceso = "";
		correo = "";
		contra = "";
		
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
	<div class="panel">
<a href="perfilAdmin.jsp"><i class="fas fa-sign-out-alt"></i>Regresar a Menu</a>
</div>
	<br>
	<br>
<form action="servletModCrud">
<div align="center"> 
<div class="col-12 logo-img"> 
<img src="img/modO.png">
<section class="form-registerR">
	<h4><i class="fas fa-chalkboard-teacher"></i>Gestionar moderadores</h4>
	<input  type="hidden"  name="id" id="Idcarga"value="<%=id%>" placeholder="Ingrese EL numero ID">
                    <label ><i class="fas fa-file-signature" ></i>nombres</label>
                   <input  class="controlsR" type="text" class="input" name="nombres" id="n"value="<%=nombre%>" placeholder="Ingrese nombres de moderador" >
                    <label ><i class="fas fa-file-signature"></i>apellidos</label>
                    <input  class="controlsR" type="text" class="input" name="apellidos"id="a" value="<%=apellido%>"placeholder="ingrese apellidos de moderador" >
					<label><i class="fas fa-signature"></i>direccion</label>
					 <input class="controlsR" type="text" class="input" name="direccion" id="d"value="<%=direccion%>" placeholder="ingrese la direccion del moderador" > 
					 <label><i class="fas fa-file-signature"></i>correo</label>
					<input class="controlsR" type="text" class="input" name="correo" id="correo"value="<%=correo%>" placeholder="ingrese el correo del moderador" >
					 <label><i class="fas fa-lock"></i>contraseña</label>
					<input class="controlsR" type="password"  class="input" name="contra" id="contra"value="<%=contra%>" placeholder="ingrese la contraseña del moderador"> 
					<input type="submit" class="btn-G"value="GUARDAR" name="btn" >
</section>
</div>
						</div>
						</form>	
			<table class="table table-dark" id="tablaDatos">
				<thead>
					<th>id</th>
					<th>nombre</th>
					<th>apellido</th>
					<th>direccion</th>
					<th>correo</th>
					<th>contraseña</th>
				</thead>
				<tbody>
				</tbody>
			</table>
						
					
</body>
</html>