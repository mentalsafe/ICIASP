package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.MemberDTO;
import dto.PageDTO;
import service.MemberService;

@WebServlet("/memberList")
public class MOMList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public MOMList() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		int page = 1;
		int limit = 5;

		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		if (request.getParameter("limit") != null) {
			limit = Integer.parseInt(request.getParameter("limit"));
		}

		MemberService momSvc = new MemberService();
		int listCount = momSvc.momListCount();
		System.out.println("listCount : " + listCount);
		int startRow = (page - 1) * limit + 1;
		int endRow = page * limit;

		ArrayList<MemberDTO> momList = momSvc.memberList(startRow, endRow);

		int maxPage = (int) ((double) listCount / limit + 0.9);
		int startPage = (((int) ((double) page / 5 + 0.9)) - 1) * 5 + 1;
		int endPage = startPage +5 -1;
		if (endPage > maxPage) {
			endPage = maxPage;
		}

		PageDTO paging = new PageDTO();
		paging.setPage(page);
		paging.setStartPage(startPage);
		paging.setEndPage(endPage);
		paging.setMaxPage(maxPage);
		paging.setListCount(listCount);
		paging.setLimit(limit);

		request.setAttribute("paging", paging);
		request.setAttribute("momList", momList);

		RequestDispatcher dispatcher = request.getRequestDispatcher("MemberList.jsp");
		dispatcher.forward(request, response);

	}
}
