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
import dto.PageDTO;
import dto.ReviewDTO;
import service.ReviewService;

@WebServlet("/reviewList")
public class MORList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MORList() {
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
		
		ArrayList<ReviewDTO> review = new ArrayList<ReviewDTO>();
		
		int moNum = 0;
		
		if(request.getParameter("moNum")!=null) {
			moNum = Integer.parseInt(request.getParameter("moNum"));
		}
		
		System.out.println("moNum : " + moNum);
		
		
		ReviewService morSvc = new ReviewService();
		review = morSvc.reviewList(moNum);
		
		request.setAttribute("review", review);
		request.setAttribute("moNum", moNum);
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("ReviewList.jsp");
		dispatcher.forward(request, response);
	}
}
