package com.vp.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.vp.dao.priviligedUserDao;
import com.vp.model.Priviligeduservp;

/**
 * Servlet implementation class servletModCrud
 */
public class servletModCrud extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public servletModCrud() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		Priviligeduservp user = new Priviligeduservp();
		priviligedUserDao ad = new priviligedUserDao();
		
		String id = null;
		String nombre = null;
		String apellido = null;
		String direccion = null;
		String correo = null;
		String contra = null;
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
		try {
			
			id = request.getParameter("id");
			nombre = request.getParameter("nombres");
			apellido = request.getParameter("apellidos");
			direccion = request.getParameter("direccion");
			correo = request.getParameter("correo");
			contra = request.getParameter("contra");
		
			
			user.setIdPVP(Integer.parseInt(id));
			user.setNombresPVP(nombre);
			user.setApellidosPVP(apellido);
			user.setDireccionPVP(direccion);
			user.setCorreoPVP(correo);
			user.setContraPVP(contra);
			
			
			
		} catch (Exception e) {
			System.out.println(e+"Error en el servletcrud");
		}
		String action = request.getParameter("btn");
		
		if(action.equals("GUARDAR")) {
			user.setNombresPVP(nombre);
			user.setApellidosPVP(apellido);
			user.setDireccionPVP(direccion);
			user.setCorreoPVP(correo);
			user.setContraPVP(contra);
			user.setAccessPVP(Integer.parseInt("1"));
			
			ad.agregarModerador(user);
			
			response.sendRedirect("crudMod.jsp");
			
		}else if(action.equals("ACTUALIZAR")) {
			user.setIdPVP(Integer.parseInt(id));
			user.setNombresPVP(nombre);
			user.setApellidosPVP(apellido);
			user.setDireccionPVP(direccion);
			user.setCorreoPVP(correo);
			user.setContraPVP(contra);
			user.setAccessPVP(Integer.parseInt("1"));
			ad.actualizarModerador(user);
			
			response.sendRedirect("crudMod.jsp");
		}else if(action.equals("ELIMINAR")) {
			user.setIdPVP(Integer.parseInt(id));
			
			ad.eliminarModerador(user);
			response.sendRedirect("crudMod.jsp");
		}
	}
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		priviligedUserDao mod = new priviligedUserDao();
		
		Gson json = new Gson();
		
		try {
		
			response.getWriter().append(json.toJson(mod.modsLista()));
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		

}}
