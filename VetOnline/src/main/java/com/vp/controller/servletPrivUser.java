package com.vp.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.vp.dao.priviligedUserDao;
import com.vp.model.Priviligeduservp;

/**
 * Servlet implementation class servletPrivUser
 */
public class servletPrivUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public servletPrivUser() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String btn = request.getParameter("btn");
		Priviligeduservp pvp = new Priviligeduservp();
		priviligedUserDao pvpD = new priviligedUserDao();

		switch (btn) {
			case "Iniciar Sesion":
				String correo = request.getParameter("correoPv");
				String pass = request.getParameter("passPv");

				pvp.setCorreoPVP(correo);
				pvp.setContraPVP(pass);

				int size = pvpD.logInPV(pvp).size();

				if (size == 1) {
					HttpSession ingreso = request.getSession(true);
					ingreso.setAttribute("idPVP", pvp.getIdPVP());

					int acceso = pvp.getAccessPVP();
					if (acceso == 0) {
						response.sendRedirect("perfilAdmin.jsp");
					} else if (acceso == 1) {
						response.sendRedirect("perfilModerador.jsp");
					}
				} else {
					PrintWriter out = response.getWriter();
					out.println("<script type='text/javascript' src='http://code.jquery.com/jquery-latest.js'></script>");
					out.println("<script src='https://cdn.jsdelivr.net/npm/sweetalert2@9'></script>");
					out.println("<script type='text/javascript'>");
					out.println("$(document).ready(function(){");
					out.println("Swal.fire({ icon: 'error', title: 'Usuario no encontrado...', text: 'Asegurate de ingresar correctamente tu correo y contraseña...', footer: '<a href>Why do I have this issue?</a>'})");
					out.println("});");
					out.println("</script>");
					System.out.println("Fallo login, datos malos...");
					RequestDispatcher rd = request.getRequestDispatcher("loginPVP.jsp");
					rd.include(request, response);
				}
			break;

			case "Cerrar Sesión":
				HttpSession close = (HttpSession) request.getSession();
				close.invalidate();

				System.out.println("Cerraste Sesion");
				response.sendRedirect("loginPVP.jsp");
			break;
			
			case "Save All":
				HttpSession idIG = request.getSession(true);
				int id =(Integer) idIG.getAttribute("idPVP");
				String nameN = request.getParameter("nUD");
				String apellidoN = request.getParameter("aUD");
				String direccionN = request.getParameter("dUD");
				String correoN = request.getParameter("cUD");
				String contraN = request.getParameter("pUD");
				String ax = request.getParameter("axUD");
				
				pvp.setIdPVP(id);
				pvp.setNombresPVP(nameN);
				pvp.setApellidosPVP(apellidoN);
				pvp.setDireccionPVP(direccionN);
				pvp.setCorreoPVP(correoN);
				pvp.setContraPVP(contraN);
				pvp.setAccessPVP(Integer.parseInt(ax));
				
				if(pvpD.actualizarPVP(pvp) == true) {
					PrintWriter out = response.getWriter();
					out.println("<script type='text/javascript' src='http://code.jquery.com/jquery-latest.js'></script>");
					out.println("<script src='https://cdn.jsdelivr.net/npm/sweetalert2@9'></script>");
					out.println("<script type='text/javascript'>");
					out.println("$(document).ready(function(){");
					out.println("Swal.fire({ position: 'top-end', icon: 'success', title: 'Datos guardados exitosamente!', showConfirmButton: false, timer: 1500 });");
					out.println("});");
					out.println("</script>");
					System.out.println("Insercion hecha");
					RequestDispatcher rd = request.getRequestDispatcher("perfilAdmin.jsp");
					rd.include(request, response);
				} else {
					PrintWriter out = response.getWriter();
					out.println("<script type='text/javascript' src='http://code.jquery.com/jquery-latest.js'></script>");
					out.println("<script src='https://cdn.jsdelivr.net/npm/sweetalert2@9'></script>");
					out.println("<script type='text/javascript'>");
					out.println("$(document).ready(function(){");
					out.println("Swal.fire({ icon: 'error', title: Algo fallo...', text: 'Asegurate de ingresar correctamente tus datos...', footer: '<a href>Why do I have this issue?</a>'})");
					out.println("});");
					out.println("</script>");
					System.out.println("Insercion no hecha...");
					RequestDispatcher rd = request.getRequestDispatcher("perfilAdmin.jsp");
					rd.include(request, response);
				}
			break;
		}
	}

}
