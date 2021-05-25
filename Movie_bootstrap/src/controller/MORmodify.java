package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.ReviewDTO;
import service.ReviewService;

@WebServlet("/reviewModify")
public class MORmodify extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public MORmodify() {
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
		int morMonum = Integer.parseInt(request.getParameter("morMonum"));
		
		String morContents = request.getParameter("morContents");
		String morStar = request.getParameter("morStar");
		
		System.out.println("morNum : " + morNum);
		
		ReviewDTO review = new ReviewDTO();
		
		review.setMorMonum(morMonum);
		review.setMorNum(morNum);
		review.setMorContents(morContents);
		review.setMorStar(morStar);
		
		ReviewService morSvc = new ReviewService();
		
		int result = morSvc.reviewModify(review);
		
		PrintWriter out = response.getWriter();
		
		System.out.println("review : " + review);
		
		
		
		if(result>0) {
			request.setAttribute("morMonum", morMonum);
			RequestDispatcher dispatcher = request.getRequestDispatcher("suc.jsp");
			dispatcher.forward(request, response);
			
		} else {
			// 실패 jsp
			out.print("<script>alert('!! 오류  !! 수정이 안됬습니다!! ');location.href='reviewList'</script>");
			out.close();
		}
		
		
		
	}
}
