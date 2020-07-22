package com.vp.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.vp.dao.especieDao;
import com.vp.model.Especievp;

/**
 * Servlet implementation class servletCrudEsp
 */
public class servletCrudEsp extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public servletCrudEsp() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String btn = request.getParameter("btn");
		Especievp e = new Especievp();
		especieDao eD = new especieDao();
		
		switch(btn) {
			case "Guardar Registro":
				String especie = request.getParameter("especie");
				String descr = request.getParameter("descripcion");
				
				e.setEspecieEVP(especie);
				e.setDescripcionEVP(descr);
				eD.agregarDatos(e);
				
				response.sendRedirect("crudEspRz.jsp");
			break;
			
			case "Editar Registro":
				int idEd = Integer.parseInt(request.getParameter("idEsp"));
				String espEd = request.getParameter("especie");
				String descrEd = request.getParameter("descripcion");
				
				e.setIdEVP(idEd);
				e.setEspecieEVP(espEd);
				e.setDescripcionEVP(descrEd);
				eD.actualizarDatos(e);
				
				response.sendRedirect("crudEspRz.jsp");
			break;
			
			case "Eliminar":
				String idDel = request.getParameter("idDel");

				e.setIdEVP(Integer.parseInt(idDel));
				eD.eliminarDatos(e);
				
				response.sendRedirect("crudEspRz.jsp");
			break;
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Gson gs = new Gson();
		especieDao eD = new especieDao();
		
		try {
			response.getWriter().append(gs.toJson(eD.especiesLista()));
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}

}
