package com.vp.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.vp.dao.duenioDao;
import com.vp.model.Dueniovp;

/**
 * Servlet implementation class servletRegDue
 */
public class servletRegDue extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public servletRegDue() {
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

		String btn = request.getParameter("btnReg");
		String nombres = request.getParameter("txtnombres");
		String apellidos = request.getParameter("txtapellidos");
		String edad = request.getParameter("txtedad");
		String direccion = request.getParameter("txtdireccion");
		String telefono = request.getParameter("txttelefono");
		String correo = request.getParameter("textcorreo");
		String contra = request.getParameter("textcontra");		

		if(btn.equals("Registrarme")) {
			Dueniovp d = new Dueniovp();
			duenioDao dD = new duenioDao();
						
			d.setNombresDVP(nombres);
			d.setApellidosDVP(apellidos);
			d.setFotoDVP("imgU/persona.png");
			d.setEdadDVP(Integer.parseInt(edad));
			d.setDireccionDVP(direccion);
			d.setTelefonoDVP(telefono);
			d.setCorreoDVP(correo);
			d.setContraDVP(contra);
			
			dD.registrarDuenio(d);
			
			int login = dD.logInDuenio(d).size();
			
			if(login == 1) {
				HttpSession validacion = request.getSession(true);
				validacion.setAttribute("idDueño", d.getIdDVP());
				response.sendRedirect("perfilDuenio.jsp");
			}
		}
	}

}
