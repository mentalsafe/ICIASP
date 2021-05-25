package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.MemberService;


@WebServlet("/memberDeleteAdmin")
public class MOMDeleteAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MOMDeleteAdmin() {
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
		int result = momSvc.memberDelete(momId);
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		session.setAttribute("momId",momId);
		if(result>0) {
			response.sendRedirect("memberList");
		} else {
			response.sendRedirect("index.jsp");
		}
		
		
		
	}
}
