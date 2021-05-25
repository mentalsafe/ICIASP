package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.MemberDTO;
import service.MemberService;


@WebServlet("/addmoney")
public class addMoney extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public addMoney() {
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
		int momMoney = Integer.parseInt(request.getParameter("money")); 
			
		System.out.println("momId : " + momId);
		System.out.println("momMoney : " + momMoney);
	
		MemberDTO member = new MemberDTO();
		member.setMomId(momId);
		member.setMomMoney(momMoney);
		
		MemberService momSvc = new MemberService();
		int result = momSvc.memberMoney(member);
		
		
		
		
		if(result>0) {
			response.sendRedirect("moneyC");
		} else {
			response.sendRedirect("movieList");
		}
		
		
		
		
		
		
	}
	
	

}
