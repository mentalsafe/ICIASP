package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dto.MovieDTO;
import dto.SaveDTO;
import service.SaveService;


@WebServlet("/movieSave")
public class MOSave extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public MOSave() {
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
		 
		
		  
		SaveDTO save = new SaveDTO();
		
		
		save.setMosId(mosId);
		save.setMosNum(mosNum);
		save.setMosTitle(mosTitle);
		save.setMosPic(mosPic);
	
		System.out.println("savecontroller :" + save);
		SaveService mosSvc = new SaveService();
		int result = mosSvc.movieSave(save);
		
		PrintWriter out = response.getWriter();
	
		if(result>0) {
			System.out.println("db에 찜 추가 성공");
			out.print("<script>alert('찜 추가가 정상적으로 처리됐습니다!');location.href='movieList'</script>");
			out.close();
		} else {
			out.print("<script>alert('찜목록에 영화가 추가되어있습니다. 찜목록을 확인해 주세요!');location.href='movieList'</script>");
			out.close();
		}
	
	
	}

}
