package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.MemberDTO;
import dto.MovieDTO;
import service.ReviewService;


@WebServlet("/morwriteFrom")
public class MORWriteForm extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public MORWriteForm() {
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
		
		int moNum = 0;
		
		if(request.getParameter("moNum")!=null) {
			moNum = Integer.parseInt(request.getParameter("moNum"));
		}
		
		
		// int morMonum = 0;
		// morMonum = Integer.parseInt(request.getParameter("morMonum"));
		// System.out.println("morMonum : "+ morMonum);
		
		// String morId = request.getParameter("morId");
		
		ReviewService morSvc = new ReviewService();
		
		MovieDTO review = new MovieDTO();
		MemberDTO member = new MemberDTO();
		
		review = morSvc.ReviewWrite(moNum);
		
		//System.out.println("morMonum : " + morMonum);
		System.out.println("moNum : "  +moNum);
		
		request.setAttribute("moNum", moNum);
		request.setAttribute("review", review);
		request.setAttribute("member", member);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("WriteForm.jsp");
		dispatcher.forward(request, response);
	}

}
