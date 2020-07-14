package com.vp.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.vp.dao.veteDatosDao;
import com.vp.model.Veterinariosvp;

/**
 * Servlet implementation class servletCrudVete
 */
public class servletCrudVete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public servletCrudVete() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		
		  Veterinariosvp v = new Veterinariosvp();
		  veteDatosDao vd = new veteDatosDao();
		  
		
		  String id = null;
		  String nombres = null;
		  String apellidos = null;
		  String edades = null;
		  String descripciones = null;
		  String correos = null;
		  String contras = null;
		  
		
		  
		  try {
			   
			    id = request.getParameter("id");
				nombres = request.getParameter("Nusuario");
				apellidos = request.getParameter("Ausuario");
				edades = request.getParameter("Eusuario");
				descripciones = request.getParameter("Dusuario");
				correos = request.getParameter("Cusuario");
				contras = request.getParameter("Pusuario");
				
				
				v.setIdVVP(Integer.parseInt(id));
				v.setNombresVVP(nombres);
				v.setApellidosVVP(apellidos);
				v.setEdadVVP(Integer.parseInt(edades));
				v.setDescripcionVVP(descripciones);
				v.setCorreoVVP(correos);
				v.setContraVVP(contras);
				
				}
				
				catch(Exception e) {
					System.out.println(e);
					
				}
				
		  String acction = request.getParameter("btn");
		  
			if(acction.equals("Guardar")) {
				
			v.setNombresVVP(nombres);
			v.setApellidosVVP(apellidos);
			v.setEdadVVP(Integer.parseInt(edades));
			v.setDescripcionVVP(descripciones);
			v.setCorreoVVP(correos);
			v.setContraVVP(contras);
				
		    vd.agregarVeterinario(v);
		    
			}
			
			else if(acction.equals("Eliminar")){
				
				 v.setIdVVP(Integer.parseInt(id));
				 
				 vd.eliminarUsuario(v);
				
			}
			
	    response.sendRedirect("crudVet.jsp");
			
		  
				}


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		
veteDatosDao vd = new veteDatosDao();
		
		Gson json = new Gson();
		
		try {
			
			response.getWriter().append(json.toJson(vd.ListaVete()));
			
			
		}catch (Exception e) {
			
			System.out.print(e);
		}
		
		
		
	}
		
		
		
	}

