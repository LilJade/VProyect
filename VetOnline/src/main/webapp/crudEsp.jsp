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
	String espName = request.getParameter("espName");
	String descrip = request.getParameter("descripc");
	
	if(idVef == null || idVef == ""){
		espName = "";
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
			<form action="servletCrudEsp" method="get">
				<div class="seccionfrmCR">
					<input type="hidden" name="idEsp" value="<%= idVef%>" id="id-rz">
					<label>Escriba el nombre de la Especie: </label>
					<input type="text" class="txtCr-E-R" name="especie" placeholder="Escriba el nombre de la raza..." value="<%= espName%>" id="name-esp">
					<label>Describa las características de la raza: </label>
					<input type="text" class="txtCr-E-R" name="descripcion" placeholder="Describa las características principales de la raza..." value="<%= descrip%>" id="desc-esp">
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