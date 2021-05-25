package service;

import java.sql.Connection;
import java.util.ArrayList;

import dao.MovieDAO;
import dto.MovieDTO;

import static dao.MovieDAO.*;
import static db.JdbcUtil.*;

public class MovieService {

	// 영화 추가하기 movieWrite() 메소드
	public int movieWrite(MovieDTO movie) {
		MovieDAO dao = getInstance();
		Connection con = getConnection();
		dao.setConnection(con);

		int result = 0;

		result = dao.movieWrite(movie);

		if (result > 0) {
			commit(con);
		} else {
			rollback(con);
		}

		close(con);
		return result;
	}

	// 관리자용 목록 전체 게시글 갯수 moListCount() 메소드
	public int moListCount() {
		MovieDAO dao = getInstance();
		Connection con = getConnection();
		dao.setConnection(con);

		int listCount = dao.moListCount();

		close(con);

		return listCount;
	}

	// 관리자용 영화목록 조회 adminMovieList() 메소드
	public ArrayList<MovieDTO> adminMovieList(int startRow, int endRow) {
		MovieDAO dao = getInstance();
		Connection con = getConnection();
		dao.setConnection(con);

		ArrayList<MovieDTO> adminmoList = dao.adminMovieList(startRow, endRow);

		close(con);

		return adminmoList;
	}

	// 영화목록 조회 메소드 movieList()
	public ArrayList<MovieDTO> movieList() {
		MovieDAO dao = getInstance();
		Connection con = getConnection();
		dao.setConnection(con);

		ArrayList<MovieDTO> moList = dao.movieList();

		close(con);

		return moList;
	}

	// 영화 랜덤 리스트 movieRandomList()
	public ArrayList<MovieDTO> movieRandomList() {
		MovieDAO dao = getInstance();
		Connection con = getConnection();
		dao.setConnection(con);
		
		ArrayList<MovieDTO> moRandomList = dao.movieRandomList();

		close(con);
		
		return moRandomList;
	}

	// 영화 장르별 리스트 movieGenreList()
	public ArrayList<MovieDTO> movieGenreList(String moGenre) {
		MovieDAO dao = getInstance();
		Connection con = getConnection();
		dao.setConnection(con);

		ArrayList<MovieDTO> moGenreList = dao.movieList(moGenre);

		close(con);

		return moGenreList;
	}

	// 영화 상세보기 movieView() 메소드
	public MovieDTO movieView(int moNum) {
		MovieDAO dao = getInstance();
		Connection con = getConnection();
		dao.setConnection(con);

		MovieDTO movie = null;
		movie = dao.movieView(moNum);

		close(con);

		return movie;
	}
	
	public MovieDTO movieSView(int moNum) {
		MovieDAO dao = getInstance();
		Connection con = getConnection();
		dao.setConnection(con);

		MovieDTO movie = null;
		movie = dao.movieSView(moNum);

		close(con);

		return movie;
	}

	// 영화정보 수정 movieModify()메소드
	public int movieModify(MovieDTO movie) {
		MovieDAO dao = getInstance();
		Connection con = getConnection();
		dao.setConnection(con);

		int result = dao.movieModify(movie);

		if (result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		return result;
	}

	// 영화제목 검색하기 MovieSearch()
	public ArrayList<MovieDTO> MovieSearch(String search) {
		MovieDAO dao = getInstance();
		Connection con = getConnection();
		dao.setConnection(con);

		ArrayList<MovieDTO> movieSearch = dao.MovieSearch(search);

		close(con);

		return movieSearch;
	}

	// 영화정보 삭제 movieDelete()
	public int movieDelete(int moNum) {
		MovieDAO dao = getInstance();
		Connection con = getConnection();
		dao.setConnection(con);
		
		int result = dao.movieDelete(moNum);
		
		if (result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		return result;
	}

	
	
	
}
