<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>


<%
HttpSession action = (HttpSession) request.getSession();
String Usuario = (String)action.getAttribute("usuario");

if(Usuario==null){
	
response.sendRedirect("index.jsp");	
}

%>	

</head>
<body>

<form action="ServletVeterinario" method="post">

<input type="submit" value="cerrar" name="btncerrar">

</form>




</body>
</html>