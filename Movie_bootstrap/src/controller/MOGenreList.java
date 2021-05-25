package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.MovieDTO;
import service.MovieService;

@WebServlet("/movieGenreList")
public class MOGenreList extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public MOGenreList() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String moGenre = request.getParameter("moGenre");
		
		ArrayList<MovieDTO> moGenreList = new ArrayList<MovieDTO>();
		
		
		MovieService moSvc = new MovieService();
		
		moGenreList = moSvc.movieGenreList(moGenre);
		
		request.setAttribute("moGenreList", moGenreList);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("GenreList.jsp");
		dispatcher.forward(request, response);
		
		
		
	}

}
