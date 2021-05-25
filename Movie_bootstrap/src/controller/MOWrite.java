					package controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dto.MovieDTO;
import service.MovieService;


@WebServlet("/movieWrite")
public class MOWrite extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public MOWrite() {
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
	
		int size = 10 * 1024 * 1024;
	
		String savePath = "C:/Users/user/Desktop/WorkSpace (Java)/Movie_bootstrap/WebContent/fileUpload";
		
		
		MultipartRequest multi = new MultipartRequest(
				request,	// 담아온 정보
				savePath,	// 저장경로
				size,		// 파일크기
				"UTF-8",	// 인코딩 방식
				new DefaultFileRenamePolicy()	// 중복 파일 이름바꾸기
				);
	
		
		String moTitle = multi.getParameter("moTitle");
		String moPic = multi.getFilesystemName((String)multi.getFileNames().nextElement());
		String moUrl = multi.getParameter("moUrl");
		String moContents = multi.getParameter("moContents");
		String moTime = multi.getParameter("moTime");
		String moGenre = multi.getParameter("moGenre");
		String moDate = multi.getParameter("moDate");
		String moAct = multi.getParameter("moAct");
	
		MovieDTO movie = new MovieDTO();
		
		
		movie.setMoTitle(moTitle);
		movie.setMoPic(moPic);
		movie.setMoUrl(moUrl);
		movie.setMoContents(moContents);
		movie.setMoTime(moTime);
		movie.setMoGenre(moGenre);
		movie.setMoDate(moDate);
		movie.setMoAct(moAct);
		
		
		MovieService moSvc = new MovieService();
		int result =moSvc.movieWrite(movie);
		
		if(result>0) {
			response.sendRedirect("adminmovieList");
		} else {
			response.sendRedirect("MovieWrite.jsp");
		}
		
	}

}
