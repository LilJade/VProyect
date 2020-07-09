package com.vp.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.vp.dao.duenioDao;
import com.vp.model.Dueniovp;

@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 1024 * 1024 * 5, maxRequestSize = 1024 * 1024 * 5 * 5)
public class servletChangeImgDuenio extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public servletChangeImgDuenio() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession verificacion = (HttpSession) request.getSession();
		String variableSesion = String.valueOf(verificacion.getAttribute("idDueño"));
		Dueniovp d = new Dueniovp();
		duenioDao dD = new duenioDao();
		
		String nombres = request.getParameter("ciNombres");
		String apellidos = request.getParameter("ciApellidos");
		String edad = request.getParameter("ciEdad");
		String direccion = request.getParameter("ciDireccion");
		String telefono = request.getParameter("ciCel");
		String correo = request.getParameter("ciCorreo");
		String contra = request.getParameter("ciContra");
		
		Part fotopart = request.getPart("foto");

		String fileName = Paths.get(fotopart.getSubmittedFileName()).getFileName().toString();
		String dest = System.getProperty("user.home") + "/git/VProyect/VetOnline/src/main/webapp/imgU/" + fileName;
		Path destino = Paths.get(dest);

		try (InputStream input = fotopart.getInputStream()) {
			Files.copy(input, destino, StandardCopyOption.REPLACE_EXISTING);
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
		String fotoNameDB = "imgU/" + fileName;
		
		d.setIdDVP(Integer.parseInt(variableSesion));
		d.setNombresDVP(nombres);
		d.setApellidosDVP(apellidos);
		d.setEdadDVP(Integer.parseInt(edad));
		d.setDireccionDVP(direccion);
		d.setTelefonoDVP(telefono);
		d.setCorreoDVP(correo);
		d.setContraDVP(contra);
		d.setFotoDVP(fotoNameDB);
		
		dD.cambiarFoto(d);
		
		response.sendRedirect("perfilDuenio.jsp");
	}

}
