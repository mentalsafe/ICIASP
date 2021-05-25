package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.MovieDTO;
import service.MovieService;

@WebServlet("/movieSView")
public class MOSView extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public MOSView() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");



		int moNum = Integer.parseInt(request.getParameter("moNum"));

		MovieDTO movieS = new MovieDTO();

		MovieService moSvc = new MovieService();
		movieS = moSvc.movieSView(moNum);

		request.setAttribute("movieS", movieS);

		System.out.println("movieS : " + movieS);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("MovieSView.jsp");
		dispatcher.forward(request, response);

	}

}


