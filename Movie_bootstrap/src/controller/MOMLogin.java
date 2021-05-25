package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.MemberDTO;
import service.MemberService;


@WebServlet("/memberLogin")
public class MOMLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public MOMLogin() {
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
		String momPw = request.getParameter("momPw");
		
		MemberService momSvc = new MemberService();
		String loginId = momSvc.memberLogin(momId,momPw);
		
		MemberDTO loginId2 = new MemberDTO();
		
		loginId2 = momSvc.memberLogin2(momId,momPw);
		
		PrintWriter out = response.getWriter();
		
		
	if(loginId!=null) {
			
			
			HttpSession session = request.getSession();
			session.setAttribute("loginId", loginId);
			session.setAttribute("loginId2", loginId2);
			RequestDispatcher dispatcher = request.getRequestDispatcher("movieList");
			dispatcher.forward(request, response);
			/* response.sendRedirect("movieList"); */
		}else {//실패시
			
			out.print("<script>alert('아이디와 비밀번호가 일치하지 않습니다!');location.href='MemberLogin.jsp'</script>");
	        out.close();
		}
		
		
	}

}
