<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.vp.model.Veterinariosvp"%>
<%@page import="com.vp.dao.veterinarioDao"%>
<!DOCTYPE html>
<html>
<head>
 <link rel="stylesheet" type="text/css" href="css/perfilVeterinario.css">
 <link rel="stylesheet" type="text/css" href="css/head&footStyle.css">
 
 <link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"> 
 
<meta charset="ISO-8859-1">
<title>Insert title here</title>


<%
HttpSession action = (HttpSession) request.getSession();
String Usuario = String.valueOf(action.getAttribute("usuario"));
System.out.println(Usuario);
veterinarioDao vd = new veterinarioDao();

if(Usuario == null || Usuario.equals("null")){
	response.sendRedirect("index.jsp");
	
} else {
	
	for (Veterinariosvp vete:vd.datosVete(Usuario)) {
		 request.setAttribute("id", vete.getIdVVP());
		 request.setAttribute("nombres", vete.getNombresVVP());
		 request.setAttribute("apellidos", vete.getApellidosVVP());
		 request.setAttribute("foto", vete.getFotoVVP());
		 request.setAttribute("edad", vete.getEdadVVP());
		 request.setAttribute("correo", vete.getCorreoVVP());
		 request.setAttribute("descripcion", vete.getDescripcionVVP());
	 }
}

%>	

</head>
<body>

	<header>
		<div class="logo">
			<img src="img/039-pet-house.png"> <a href="">Happy
				Pet</a>
		</div>
		<div class="menu">
			<ul>
				<li><a href="">Tienda</a></li>
				<hr>
				<li><a href="">Adopciones</a></li>
				<hr>
				
				<div id="mP">
					<hr>
					<li>
						<a href="perfilVeterinario.jsp">Mi Perfil</a>
					</li>
				</div>
			</ul>
		</div>
	</header>






<div class="perfil">

<img alt="" src="img/031-veterinarian-1.png" class="foto">

<h1><%out.println(request.getAttribute("nombres"));%><%out.println(request.getAttribute("apellidos"));%></h1>

</div>

<div class="datos">

<ul>

<li>
  <h3>Edad: <br><br> <%out.println(request.getAttribute("edad"));%> años</h3>
</li>

<li>
  <h3>Correo:<br><br> <%out.println(request.getAttribute("correo"));%></h3>
</li>

<li>
  <h3>Descripción:<br><br> <%out.println(request.getAttribute("descripcion"));%></h3>
</li>


</ul>


</div>





<div class="boton">
<form action="ServletVeterinario" method="post">

<input type="submit" value="Cerrar Sesión" name="btncerrar" class="b">

</form>
</div>

<br>
<br>
<div class="contenedor">

<table class="table table-dark">

	<thead>	
     
     <th>Dueño</th>
     <th>Contacto</th>
     <th>Mascota-Tipo</th>
      <th>Raza</th>
       <th>Aun nose</th>

	</thead>

	<tbody>
		
	</tbody>
	
</table>
 

</body>
</html>