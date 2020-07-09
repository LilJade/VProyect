package com.vp.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.vp.dao.duenioDao;
import com.vp.model.Dueniovp;

/**
 * Servlet implementation class servletDuenio
 */
public class servletDuenio extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public servletDuenio() {
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
		String boton = request.getParameter("btn");
		
		if(boton.equals("Ingresar")) {
			String correo = request.getParameter("txtCorreo");
			String pass = request.getParameter("txtPass");
			
			Dueniovp d = new Dueniovp();
			duenioDao dD = new duenioDao();
			
			d.setCorreoDVP(correo);
			d.setContraDVP(pass);
			
			int size = dD.logInDuenio(d).size();
						
			if(size == 1) {
				HttpSession validacion = request.getSession(true);
				validacion.setAttribute("idDueño", d.getIdDVP());
				response.sendRedirect("perfilDuenio.jsp");
			} else {
				System.out.println("Ah ocurrido un error...\n¿En dónde? No sabemos...");
			}
		} else if(boton.equals("Cerrar Sesión")) {
			HttpSession close = (HttpSession) request.getSession();
			close.invalidate();
			
			System.out.println("Cerraste Sesion");
			response.sendRedirect("index.jsp");
		} else if(boton.equals("Guardar Cambios")) {
			HttpSession verificacion = (HttpSession) request.getSession();
			String variableSesion = String.valueOf(verificacion.getAttribute("idDueño"));
			Dueniovp d = new Dueniovp();
			duenioDao dD = new duenioDao();
			
			String nombres = request.getParameter("ciNombres2");
			String apellidos = request.getParameter("ciApellidos2");
			String edad = request.getParameter("ciEdad2");
			String direccion = request.getParameter("ciDireccion2");
			String telefono = request.getParameter("ciCel2");
			String correo = request.getParameter("ciCorreo2");
			String contra = request.getParameter("ciContra2");
			String foto = request.getParameter("ciFoto2");
			
			d.setIdDVP(Integer.parseInt(variableSesion));
			d.setNombresDVP(nombres);
			d.setApellidosDVP(apellidos);
			d.setEdadDVP(Integer.parseInt(edad));
			d.setDireccionDVP(direccion);
			d.setTelefonoDVP(telefono);
			d.setCorreoDVP(correo);
			d.setContraDVP(contra);
			d.setFotoDVP(foto);
			
			dD.cambiarFoto(d);
			
			response.sendRedirect("perfilDuenio.jsp");
		}
	}

}
