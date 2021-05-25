package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.MemberService;


@WebServlet("/idCheck")
public class MOMidCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public MOMidCheck() {
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
		
		MemberService momSvc = new MemberService();
		String checkId = momSvc.idCheck(momId);
		
		
		if(checkId==null) {
			request.setAttribute("momId",momId);
			RequestDispatcher dispatcher = request.getRequestDispatcher("MemberJoinS.jsp");
			dispatcher.forward(request, response);
			
		} else {
			response.sendRedirect("MemberJoinF.jsp");
		}
		
	}	
	

}
