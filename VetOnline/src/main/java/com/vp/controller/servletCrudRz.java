package com.vp.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.vp.dao.razaDao;
import com.vp.model.Especievp;
import com.vp.model.Razavp;

/**
 * Servlet implementation class servletCrudRz
 */
public class servletCrudRz extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public servletCrudRz() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String btn = request.getParameter("btn");
		Especievp e = new Especievp();
		Razavp r = new Razavp();
		razaDao rD = new razaDao();
		
		switch(btn) {
			case "Guardar Registro":
				String raza = request.getParameter("raza");
				String descr = request.getParameter("descripcion");
				int idEsp = Integer.parseInt(request.getParameter("idEsp"));
				
				e.setIdEVP(idEsp);
				
				r.setEspecieRVP(raza);
				r.setDescripcionRVP(descr);
				r.setEspecievp(e);
				
				rD.agregarDatos(r);
				response.sendRedirect("crudEspRz.jsp");
			break;
			
			case "Editar Registro":
				int idEd = Integer.parseInt(request.getParameter("idRz"));
				String razaEd = request.getParameter("raza");
				String descrEd = request.getParameter("descripcion");
				int idEspEd = Integer.parseInt(request.getParameter("idEsp"));
				
				e.setIdEVP(idEspEd);

				r.setIdRVP(idEd);
				r.setEspecieRVP(razaEd);
				r.setDescripcionRVP(descrEd);
				r.setEspecievp(e);
				
				rD.actualizarDatos(r);
				response.sendRedirect("crudEspRz.jsp");
			break;
			
			case "Eliminar":
				String idDel = request.getParameter("idDel");
				r.setIdRVP(Integer.parseInt(idDel));
				rD.eliminarDatos(r);
				response.sendRedirect("crudEspRz.jsp");
			break;
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Gson gs = new Gson();
		razaDao rD = new razaDao();
		
		try {
			response.getWriter().append(gs.toJson(rD.infRazasLista()));
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}

}
