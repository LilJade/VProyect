<%@page import="com.vp.dao.duenioDao"%>
<%@page import="com.vp.model.Dueniovp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<%
	HttpSession verificacion = (HttpSession) request.getSession();
	String variableSesion = String.valueOf(verificacion.getAttribute("idDueño"));
	System.out.println(variableSesion);
	duenioDao dD = new duenioDao();
	
	if(variableSesion == null){
		response.sendRedirect("index.jsp");
	} else {
		for (Dueniovp duenio:dD.datosDuenio(variableSesion)) {
			 request.setAttribute("id", duenio.getIdDVP());
			 request.setAttribute("nombres", duenio.getNombresDVP());
			 request.setAttribute("apellidos", duenio.getApellidosDVP());
		 }
	}
%>
<body>
	<h3>ID: <%out.println(request.getAttribute("id"));%></h3>
	<h3>Nombres: <%out.println(request.getAttribute("nombres"));%></h3>
	<h3>Apellidos: <%out.println(request.getAttribute("apellidos"));%></h3>
</body>
</html>