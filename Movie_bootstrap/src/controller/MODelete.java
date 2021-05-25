package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.MovieService;

@WebServlet("/movieDelete")
public class MODelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public MODelete() {
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
	
		MovieService moSvc = new MovieService();
		int result =moSvc.movieDelete(moNum);
		
		 PrintWriter out = response.getWriter();
	       
	       
	      if(result>0) {
	         out.print("<script>alert('해당 영화가 정상적으로 삭제되었습니다!');location.href='adminmovieList'</script>");
	         out.close();
	      } else {
	         out.print("<script>alert('다시 시도하세요!')</script>");
	         out.close();
	      }
	      
		
			

	}
	
	
	
}
