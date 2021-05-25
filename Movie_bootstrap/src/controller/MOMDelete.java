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

@WebServlet("/memberDelete")
public class MOMDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public MOMDelete() {
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
		
		MemberService  momSvc = new MemberService();
		
		int result = momSvc.memberDelete(momId);
		
		PrintWriter out = response.getWriter();
		
		if(result>0) {
			HttpSession session = request.getSession();
			
			session.invalidate();
			
			out.print("<script>alert('탈퇴가 정상적으로 처리됐습니다!');location.href='index.jsp'</script>");
			out.close();
		} else {
			out.print("<script>alert('다시 시도하세요!')</script>");
			out.close();
		}
			out.close();
			response.sendRedirect("index.jsp");
	}
}
