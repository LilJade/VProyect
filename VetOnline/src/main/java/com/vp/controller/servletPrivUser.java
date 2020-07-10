package com.vp.controller;

import java.io.IOException;
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
		
		switch(btn) {
		case "Iniciar Sesion":
			String correo = request.getParameter("correoPv");
			String pass = request.getParameter("passPv");
			
			pvp.setCorreoPVP(correo);
			pvp.setContraPVP(pass);
			
			int size = pvpD.logInPV(pvp).size();
			
			if(size == 1) {
				HttpSession ingreso = request.getSession(true);
				ingreso.setAttribute("idPVP", pvp.getIdPVP());
				
				int acceso = pvp.getAccessPVP();
				if(acceso == 0) {
					response.sendRedirect("perfilAdmin.jsp");
				} else if(acceso == 1) {
					response.sendRedirect("perfilModerador.jsp");
				}
			} else {
				System.out.println("Ah ocurrido un error...\n¿En dónde? No sabemos...");
			}
		break;
			
		}
	}

}
