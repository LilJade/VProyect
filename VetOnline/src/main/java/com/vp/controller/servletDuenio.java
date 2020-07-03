package com.vp.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
		
		String correo = request.getParameter("txtCorreo");
		String pass = request.getParameter("txtPass");
		String boton = request.getParameter("btn");
		
		if(boton.equals("Ingresar")) {
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
		}
	}

}
