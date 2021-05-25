package dao;

import java.sql.*;
import java.util.ArrayList;

import dto.MovieDTO;
import dto.ReviewDTO;
import static db.JdbcUtil.*;
public class ReviewDAO {

	private static ReviewDAO dao;
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	
	public static ReviewDAO getInstance() {
		if(dao==null) {
			dao = new ReviewDAO();
		}
		return dao;
	}
	
	public void setConnection(Connection con) {
		this.con = con;
	}
	
	
	// 리뷰 작성 메소드 ↓
	public int ReviewWrite(ReviewDTO reviewW) {
		int result = 0;
		
		String sql = "INSERT INTO MOVIEREVIEW VALUES(?,MORNUM_SEQ.NEXTVAL,?,?,?)";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, reviewW.getMorMonum());
			pstmt.setString(2, reviewW.getMorId());
			pstmt.setString(3, reviewW.getMorContents());
			pstmt.setString(4, reviewW.getMorStar());
			result = pstmt.executeUpdate();
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	
	// 리뷰 수정을 위한 번호 구하기 ↓
	public ReviewDTO Review(int morNum) {
		ReviewDTO review = null;
		String sql = "SELECT * FROM MOVIEREVIEW WHERE MORNUM=?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, morNum);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				review = new ReviewDTO();
				review.setMorMonum(rs.getInt(1));
				review.setMorNum(rs.getInt(2));
				review.setMorId(rs.getString(3));
				review.setMorContents(rs.getString(4));
				review.setMorStar(rs.getString(5));
			}
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return review;
	}
	// 리뷰 수정을 위한 ↓
	public int reviewModify(ReviewDTO review) {
		int result = 0;
		String sql ="UPDATE MOVIEREVIEW SET MORCONTENTS=?, MORSTAR=? WHERE MORNUM=?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, review.getMorContents());
			pstmt.setString(2, review.getMorStar());
			pstmt.setInt(3, review.getMorNum());
			result = pstmt.executeUpdate();
			System.out.println("review.getMorContents : " + review.getMorContents());
			 System.out.println("result : " + result);
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	// 리뷰 삭제를 위한 ↓
	public int reviewDelete(int morNum) {
		int result = 0;
		String sql = "DELETE FROM MOVIEREVIEW WHERE MORNUM=?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, morNum);
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	// 리뷰 목록
	public ArrayList<ReviewDTO> reviewList(int moNum) {
		ArrayList<ReviewDTO> reviewList = new ArrayList<ReviewDTO>();
		
		ReviewDTO review = null;
		
		String sql = "SELECT * FROM MOVIEREVIEW WHERE MORMONUM=? ORDER BY MORNUM DESC";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, moNum);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				review = new ReviewDTO();
				
				review.setMorMonum(rs.getInt(1));
				review.setMorNum(rs.getInt(2));
				review.setMorId(rs.getString(3));
				review.setMorContents(rs.getString(4));
				review.setMorStar(rs.getString(5));
				
				reviewList.add(review);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}
		
		return reviewList;
	}

	// 영화테이블에서 영화번호 찾기
	public MovieDTO ReviewWrite(int morMonum) {
		MovieDTO review = null;
		String sql = "SELECT * FROM MOVIE WHERE MONUM=?";
		
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, morMonum);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				review = new MovieDTO();
				review.setMoNum(rs.getInt(1));
				review.setMoTitle(rs.getString(2));
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}
		
		return review;
	}
	
	
	
}
