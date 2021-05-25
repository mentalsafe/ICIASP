package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.MemberDTO;
import service.MemberService;


@WebServlet("/momSub")
public class MOMSUB extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public MOMSUB() {
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
		 
		 PrintWriter out = response.getWriter();
		 
		 String momSub =request.getParameter("subDay");
		 
		 
		 
		 int momMoney = Integer.parseInt(request.getParameter("momMoney"));
		 
		 
		 System.out.println(" momMoneysub " + momMoney);
		 
		 int mom1Money = 0;
		 
		 if( momSub.equals("7") ) {
			 
			 mom1Money = 4900; 
			 if(momMoney>=mom1Money) {
				 mom1Money = 4900;
				
			 }else {
				 mom1Money = 0; 
				 momSub = "0";
				 out.print("<script>alert('금액이 부족합니다 충전후 이용 해 주세요');location.href='movieList'</script>");
					out.close();
			 }
			 
		 }else if(momSub.equals("15")) {
			 mom1Money = 8900; 
			 if(momMoney>=mom1Money) {
				 mom1Money = 8900;
				 
			 }else {
				 mom1Money = 0;
				 momSub = "0";
				 out.print("<script>alert('금액이 부족합니다 충전후 이용 해 주세요');location.href='movieList'</script>");
				out.close();
				 
			 }
		 }else {
			 mom1Money = 15000; 
			 if(momMoney>=mom1Money) {
				 mom1Money = 15000; 
				
			 }else {
				 mom1Money = 0;
				 momSub = "0";
				 out.print("<script>alert('금액이 부족합니다 충전후 이용 해 주세요');location.href='movieList'</script>");
					out.close();
				 
			 }
		 }
		 
		 
		 
		 
		 if(!momSub.equals("0")) {
		 
		 System.out.println("momId : " + momId);
		 System.out.println("momSub : " + momSub);
		 System.out.println("momMoney : " + mom1Money);
		 MemberDTO member = new MemberDTO();
		 
		 member.setMomId(momId);
		 member.setMomSub(momSub);
		 member.setMomMoney(mom1Money);
		 
		 System.out.println("membercontroller : " + member);
		 
		 
		 MemberService momSvc = new MemberService();
		 
		 System.out.println("momSvc : " + momSvc);
		 
		 int result = momSvc.momSub(member);
		 
		 System.out.println("result : " + result);
		 System.out.println("momMoney : " +  member);
		 
		 
		 
		 if(result>0) {
			 // 결제 완료되면 로그아웃 후 다시 이용
			 HttpSession session = request.getSession();
			 session.invalidate();
				
			 out.print("<script>alert('결제가 완료되었습니다! 로그인 후 다시 이용해주세요!');location.href='index.jsp'</script>");
			 out.close();
		 }else {
			 response.sendRedirect("movieList");
		 }
		
		 }
		 
		 
		 
		 
	}

}
