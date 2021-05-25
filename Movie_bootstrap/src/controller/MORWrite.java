package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.ReviewDTO;
import service.ReviewService;

@WebServlet("/reviewWrite")
public class MORWrite extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MORWrite() {
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
		
		int moNum = Integer.parseInt(request.getParameter("moNum"));
		String morId = request.getParameter("morId");
		String morContents = request.getParameter("morContents");
		String morStar = request.getParameter("morStar");
		
		ReviewDTO reviewW = new ReviewDTO();
		reviewW.setMorMonum(moNum);
		reviewW.setMorId(morId);
		reviewW.setMorContents(morContents);
		reviewW.setMorStar(morStar);
		
		PrintWriter out = response.getWriter();
		
		ReviewService morSvc = new ReviewService();
		int result = morSvc.ReviewWrite(reviewW);
		
		if(result>0) {
			out.print("<script>alert('리뷰가 정상적으로 작성됐습니다!');location.href='reviewList?moNum="+moNum+"'</script>");
			out.close();
		} else {
			out.print("<script>alert('리뷰작성을 실패하였습니다! !!오류!! ');location.href='movieList'</script>");
			out.close();
		}
			
		
		
		
	}
}
