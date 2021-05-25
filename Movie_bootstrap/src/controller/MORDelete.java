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
import service.ReviewService;


@WebServlet("/reviewDelete")
public class MORDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MORDelete() {
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
		
		int  morNum = 0;
		int  moNum = 0;
		
		if(request.getParameter("morNum")!=null) {
			morNum = Integer.parseInt(request.getParameter("morNum"));
		}
		
		if(request.getParameter("moNum")!=null) {
			moNum = Integer.parseInt(request.getParameter("moNum"));
		}
		
		System.out.println("morNum : " + morNum);
		System.out.println("moNum : " + moNum);
		
		ReviewService  morSvc = new ReviewService();
		int result = morSvc.ReviewDelete(morNum);
		PrintWriter out = response.getWriter();
		System.out.println("morNum : " + morNum);
		
		
		if(result>0) {
			out.print("<script>alert('해당리뷰가 정상적으로 삭제됐습니다!');location.href='reviewList?moNum="+moNum+"'</script>");
			out.close();
		} else {
	
			out.print("<script>alert('!!오류 !! 요청하신 리뷰 삭제가 안됬습니다!');location.href='reviewList'</script>");
			out.close();
		}
	}


}
