package com.vp.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.vp.dao.mascotaDao;

/**
 * Servlet implementation class servletCargarMascotas
 */
public class servletCargarMascotas extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public servletCargarMascotas() {
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
		mascotaDao mD = new mascotaDao();
		Gson g = new Gson();
		HttpSession idIG = (HttpSession) request.getSession();
		String idInGame = String.valueOf(idIG.getAttribute("idDueño"));
		
		try {
			response.getWriter().append(g.toJson(mD.mascotasDuenio(idInGame)));
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}

}
