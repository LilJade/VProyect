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
	String variableSesion = (String) verificacion.getAttribute("idSession");
	System.out.println(variableSesion);
	
	if(variableSesion == null){
		response.sendRedirect("index.jsp");
	}
%>
<body>
<h3>PerfilPaciente</h3>
</body>
</html>