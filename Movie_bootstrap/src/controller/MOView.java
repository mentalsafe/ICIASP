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

@WebServlet("/movieView")
public class MOView extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public MOView() {
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

		// 페이지의 초기값을 1로 설정
		int page = 1;

		// 한페이지에 5개의 게시글만 보이게 초기값 설정
		int limit = 10;

		// page 정보를 받을 수 있다면 page값 설정
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}

		// limit 정보를 받을 수 있다면 limit값 설정
		if (request.getParameter("limit") != null) {
			limit = Integer.parseInt(request.getParameter("limit"));
		}
		
		
		
		int moNum = Integer.parseInt(request.getParameter("moNum"));

		MovieDTO movie = new MovieDTO();

		MovieService moSvc = new MovieService();
		movie = moSvc.movieView(moNum);

		request.setAttribute("movie", movie);
		request.setAttribute("page", page);
		request.setAttribute("limit", limit);

		RequestDispatcher dispatcher = request.getRequestDispatcher("MovieView.jsp");
		dispatcher.forward(request, response);

	}

}


