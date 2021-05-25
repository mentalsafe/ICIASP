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
import service.MemberService;

@WebServlet("/moneyC")
public class moneyC extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public moneyC() {
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
		
		String momId = request.getParameter("momId");
		System.out.println("momId : " + momId);
		MemberDTO member = new MemberDTO();
		
		
		MemberService momSvc = new MemberService();
		member = momSvc.checkMoney(momId);
		
		
		System.out.println("checkMoney : " + member);
		
		
		if(member != null) {
			request.setAttribute("member",member);
			RequestDispatcher dispatcher = request.getRequestDispatcher("momSub.jsp");
			dispatcher.forward(request, response);
		}else {
			response.sendRedirect("movieList");
		}
		
		
		
		
		
	}

}
