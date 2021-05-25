package service;

import java.sql.Connection;
import java.util.ArrayList;

import dao.ReviewDAO;
import dto.MovieDTO;
import dto.ReviewDTO;
import static db.JdbcUtil.*;
import static dao.ReviewDAO.*;


public class ReviewService {
	// 리뷰 작성 서비스 ↓
	public int ReviewWrite(ReviewDTO reviewW) {
		ReviewDAO dao = getInstance();
		Connection con = getConnection();
		dao.setConnection(con);
		int result = dao.ReviewWrite(reviewW);
		if(result>0) {
			commit(con);
		} else {
			rollback(con);
		}
		close(con);
		return result;
	}
	
	// 리뷰를 수정하기 위한 서비스 ↓
	public ReviewDTO Review(int morNum) {
		ReviewDAO dao = getInstance();
		Connection con = getConnection();
		dao.setConnection(con);
		ReviewDTO review = dao.Review(morNum);
		close(con);
		return review;
	}
	// 리뷰를 수정하는 서비스 ↓
	public int reviewModify(ReviewDTO review) {
		ReviewDAO dao = getInstance();
		Connection con = getConnection();
		dao.setConnection(con);
		System.out.println("reviewservice : " + review);
		
		int result = dao.reviewModify(review);
		
		
		if(result>0) {
			commit(con);
			} else {
			rollback(con);
			}
		
			close(con);
		return result;
	}
	// 삭제를 요청하는 서비스 ↓
	public int ReviewDelete(int morNum) {
		ReviewDAO dao = getInstance();
		Connection con = getConnection();
		dao.setConnection(con);
		
		int result = dao.reviewDelete(morNum);
		
		if(result>0) {
			commit(con);
		} else {
			rollback(con);
		}
		close(con);
		
		return result;
	}
	// 리뷰 목록
	public ArrayList<ReviewDTO> reviewList(int moNum) {
		ReviewDAO dao = getInstance();
		Connection con = getConnection();
		dao.setConnection(con);
		
		ArrayList<ReviewDTO> review = dao.reviewList(moNum);
		
		close(con);
		
		return review;
	}
	
	// 영화테이블에서 영화번호 찾기
	public MovieDTO ReviewWrite(int morMonum) {
		ReviewDAO dao = getInstance();
		Connection con = getConnection();
		dao.setConnection(con);
		
		MovieDTO review = dao.ReviewWrite(morMonum);
		
		close(con);
		return review;
	}

}
