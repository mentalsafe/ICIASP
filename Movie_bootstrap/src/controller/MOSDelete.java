package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.SaveService;


@WebServlet("/MovieSaveDelete")
public class MOSDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public MOSDelete() {
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
		
		String mosId = request.getParameter("mosId");
		int mosNum =Integer.parseInt(request.getParameter("moNum")); 
		String mosTitle = request.getParameter("moTitle"); 
		String mosPic = request.getParameter("moPic");
		
		
		  System.out.println("mosId : " + mosId ); 
		  System.out.println("mosNum : " + mosNum); 
		  System.out.println("mosTitle : " + mosTitle);
		  System.out.println("mosPic : " + mosPic);
		
		  SaveService mosSvc = new SaveService(); 
		  int result = mosSvc.saveDelete(mosId,mosNum);
		  
		  
		  PrintWriter out = response.getWriter();
		
		if(result>0) {
			out.print("<script>alert('찜 삭제가 정상적으로 처리됐습니다!');location.href='movieList'</script>");
			out.close();
			
		} else {
			out.print("<script>alert('다시 시도하세요!')</script>");
			out.close();
		}
		
		
		
		
		
	}

}