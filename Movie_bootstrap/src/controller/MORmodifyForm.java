package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.MemberDTO;
import dto.ReviewDTO;
import service.ReviewService;

@WebServlet("/reviewModifyForm")
public class MORmodifyForm extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public MORmodifyForm() {
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
		
		int morNum = Integer.parseInt(request.getParameter("morNum"));
		String morId = request.getParameter("morId");
		ReviewService morSvc = new ReviewService();
		ReviewDTO review = new ReviewDTO();
		MemberDTO member = new MemberDTO();
		
		review = morSvc.Review(morNum);
		
		request.setAttribute("review", review);
		request.setAttribute("member", member);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("ReviewModify.jsp");
		dispatcher.forward(request, response);
	}
}
