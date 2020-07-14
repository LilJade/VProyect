<!DOCTYPE html>
<%@page import="com.vp.dao.priviligedUserDao"%>
<%@page import="com.vp.model.Priviligeduservp"%>
<html>
<head>
	<meta charset="UTF-8">
	<title>Admin Panel - Happy Pet</title>
	<link rel="stylesheet" type="text/css" href="css/perfilAdminStyle.css">
	<link rel="stylesheet" type="text/css" href="css/head&footStyle.css">
	<link rel="stylesheet" type="text/css" href="css/crudVeterinario.css">
	
	<link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"> 
	
	<script src="http://code.jquery.com/jquery-latest.js"> </script>
	
	<script type="text/javascript">
	$(document).ready(function(){
		
			var btn = $('#carga').val();
			$.post('servletCrudVete',{

			}, function(respose){

			let datos = JSON.parse(respose);
			//console.log(datos);

            var tabladatos = document.getElementById('tabla');
            

			for (let item of datos){
				
			

				tabla.innerHTML +=`

                <tr>

                <td> ${item.idVVP} </td>
                <td> ${item.nombresVVP} </td>
                <td> ${item.apellidosVVP} </td>
                <td> ${item.edadVVP} </td>
                <td> ${item.descripcionVVP} </td>
                <td> ${item.correoVVP} </td>
             
                <td>
                <a href="servletCrudVete?btn=Eliminar&id=${item.idVVP}" class="btn btn-warning" > Eliminar </a>   
              
                                           
                </td>
               
                

                </tr>
				`
			}
		
		});
	});
	
</script>
	
	
	
	
	
	
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



<%
    
	String nombre = request.getParameter("N");
	String apellido = request.getParameter("A");
	String edad = request.getParameter("E");
	String descripcion = request.getParameter("D");
	String correo = request.getParameter("C");
	String contra = request.getParameter("P");
	
	if(nombre==null){
		
		
		nombre="";
		apellido="";
		edad="";
		descripcion="";
		correo="";
		contra="";
		
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
	<br>
	
	
<div class="agregar">
<h2 align="center" style="background-color:lightblue;">Contratar Veterinarios</h2>
</div>


	
	<div class="contenedor">
	
			<div class="a">
			
			<h5>Nombres</h5><input type="text" placeholder="Ingrese su Nombre" name="Nusuario" value="<%=nombre %>" >
			<h5>Apellidos</h5><input type="text" placeholder="Ingrese su Apellido" name="Ausuario"  value="<%=apellido%>">
			<h5>Edad</h5><input type="text" placeholder="Ingrese su Edad" name="Eusuario"  value="<%=edad%>">
			
			</div>
			
			<div class="b">
			
			<h5>Descripcion</h5><input type="text" placeholder="Ingrese su descripcion" name="Dusuario"  value="<%=descripcion%>">
			<h5>Correo</h5><input type="text" placeholder="Ingrese su correo" name="Cusuario"  value="<%=correo%>">
			<h5>Contraseña</h5><input type="text" placeholder="Ingrese su contraseña" name="Pusuario"  value="<%=contra%>">
			<input type="hidden" placeholder="Ingrese su Id" name="id"  value="">
			
			</div>
			<br>
			<br>
		


<div class="c">
 <input type="submit" class="btn btn-info" value="Guardar" name="btn" id="boton">

</div>
<br>
	
</div>	

	
	
	<br>
	<br>
	<br>
	
<div class="datos">
<h2 align="center" style="background-color:lightblue;">Veterinarios Contratados</h2>
</div>
	
<div class="tabla">

	<table class="table table-hover table-dark" id="tabla">

	<thead>	
     
      <th>ID</th>
     <th>NOMBRES</th>
     <th>APELLIDOS</th>
     <th>EDAD</th>
      <th>DESCRIPCIÓN</th>
       <th>CORREO</th>
         <th>OPCIONES</th>

	</thead>

	<tbody>
		
	</tbody>
	
</table>

</div>	
	
	
	
	
	
	
</body>
</html>