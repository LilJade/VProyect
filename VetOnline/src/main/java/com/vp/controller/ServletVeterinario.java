package com.vp.controller;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.vp.dao.veterinarioDao;
import com.vp.model.Veterinariosvp;



/**
 * Servlet implementation class ServletVeterinario
 */
public class ServletVeterinario extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletVeterinario() {
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
		// TODO Auto-generated method stub
		//doGet(request, response);
		
		String correo = request.getParameter("correo");
		String contra = request.getParameter("contra");
		String Cerrar = request.getParameter("btncerrar");
		
		

		if(Cerrar!=null) {
		if(Cerrar.equals("cerrar")) {
		
				HttpSession cerrarSeciones = (HttpSession) request.getSession();
				cerrarSeciones.invalidate();
				
				response.sendRedirect("index.jsp");
				}
	   }					
	  
		
		
		 else {
				
				Veterinariosvp usua = new Veterinariosvp();
				
				veterinarioDao usuDAO = new veterinarioDao();
				
				usua.setCorreoVVP(correo);
				usua.setContraVVP(contra);
				
				usuDAO.verVeterinario(usua);
				
				int verificarUsuario = usuDAO.verVeterinario(usua).size();
				
				
				if(verificarUsuario==1) {
					
					HttpSession seccion = request.getSession(true);
					seccion.setAttribute("usuario", correo);
					
					response.sendRedirect("perfilVeterinario.jsp");
				
					
				}else {
					System.out.println("ERROR");
					
				}
					
				}
		
		
	}

}
