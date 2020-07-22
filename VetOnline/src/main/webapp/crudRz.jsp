<%@page import="com.vp.model.Especievp"%>
<%@page import="java.util.List"%>
<%@page import="com.vp.dao.especieDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Admin Panel - Happy Pet</title>
	<link rel="stylesheet" type="text/css" href="css/crudEspRzStyle.css">
	<link rel="stylesheet" type="text/css" href="css/head&footStyle.css">
	<script src="http://code.jquery.com/jquery-latest.js"></script>
</head>
<%
	String idVef = request.getParameter("idVef");
	String idEsp = request.getParameter("idEsp");
	String razaName = request.getParameter("razaName");
	String descrip = request.getParameter("descrip");
	
	if(idVef == null || idVef == ""){
		idEsp = "";
		razaName = "";
		descrip = "";
	}
%>
<script type="text/javascript">
	$(document).ready(function(){
		$('#edit').show();
		$('#save').hide();
		var verfc = <%= idVef%>
		
		if(verfc == "" || verfc == null ){
			$('#edit').hide();
			$('#save').show();
		}
	})
</script>
<body>
	<div class="containerCrud">
		<div class="frmContainer">
			<form action="servletCrudRz" method="get">
				<div class="seccionfrmCR">
					<label>Selecciona la especie a la cual pertenece la raza: </label>
					<select class="slctCr-E-R" name="idEsp">
						<%
							especieDao eD = new especieDao();
							
							for(Especievp e:eD.especiesListaCmbx()) {%>
								<option value="<%= e.getIdEVP()%>"><%= e.getEspecieEVP()%></option>
							<%}
						%>
					</select>
					<a href="crudEsp.jsp" class="enlace">Registre una nueva especie aquí</a>
				</div>
				<div class="seccionfrmCR">
					<input type="hidden" name="idRz" value="<%= idVef%>" id="id-rz">
					<label>Escriba el nombre de la raza: </label>
					<input type="text" class="txtCr-E-R" name="raza" placeholder="Escriba el nombre de la raza..." value="<%= razaName%>" id="name-rz">
					<label>Describa las características de la raza: </label>
					<input type="text" class="txtCr-E-R" name="descripcion" placeholder="Describa las características principales de la raza..." value="<%= descrip%>" id="desc-rz">
				</div>
				<div class="seccionfrmCR">
					<a href="crudEspRz.jsp" class="btnCr-E-R btncnl">Cancelar</a>
					<input type="submit" class="btnCr-E-R btnsv" name="btn" value="Guardar Registro" id="save">
					<input type="submit" class="btnCr-E-R btnsv" name="btn" value="Editar Registro" id="edit">
				</div>
			</form>
		</div>
	</div>
</body>
</html>