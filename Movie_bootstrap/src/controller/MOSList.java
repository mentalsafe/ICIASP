package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.SaveDTO;
import service.SaveService;


@WebServlet("/movieSaveList")
public class MOSList extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
    public MOSList() {
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
		System.out.println("mosId : " + mosId);
		ArrayList<SaveDTO> mosList = new ArrayList<SaveDTO>();
		
		SaveService mosSvc = new SaveService();
		
		mosList = mosSvc.movieSaveList(mosId);
		
		System.out.println("mosIdService : " + mosId);
		request.setAttribute("mosList", mosList);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("MovieSave.jsp");
		dispatcher.forward(request, response);
		
		
	}
	

}
