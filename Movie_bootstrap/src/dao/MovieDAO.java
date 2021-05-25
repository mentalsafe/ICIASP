package dao;

import java.sql.*;
import java.util.ArrayList;
import static db.JdbcUtil.*;

import dto.MovieDTO;

public class MovieDAO {

	private static MovieDAO dao;
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;

	public static MovieDAO getInstance() {
		if (dao == null) {
			dao = new MovieDAO();
		}
		return dao;
	}

	public void setConnection(Connection con) {
		this.con = con;
	}

	// 영화 추가하기 movieWrite() 메소드
	public int movieWrite(MovieDTO movie) {
		int result = 0;

		String sql = "INSERT INTO MOVIE VALUES(MOVIE_SEQ.NEXTVAL,?,?,?,?,?,?,?,?)";

		try {
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, movie.getMoTitle());
			pstmt.setString(2, movie.getMoPic());
			pstmt.setString(3, movie.getMoUrl());
			pstmt.setString(4, movie.getMoContents());
			pstmt.setString(5, movie.getMoTime());
			pstmt.setString(6, movie.getMoGenre());
			pstmt.setString(7, movie.getMoDate());
			pstmt.setString(8, movie.getMoAct());

			result = pstmt.executeUpdate();

		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	// 관리자용 목록 전체 게시글 갯수 moListCount() 메소드
	public int moListCount() {
		int listCount = 0;

		String sql = "SELECT COUNT(*) FROM MOVIE";

		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				listCount = rs.getInt(1);
			}
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return listCount;
	}

	// 관리자용 영화목록 조회 adminMovieList() 메소드
	public ArrayList<MovieDTO> adminMovieList(int startRow, int endRow) {
		ArrayList<MovieDTO> adminmoList = new ArrayList<MovieDTO>();

		MovieDTO movie = null;

		String sql = "SELECT MONUM, MOTITLE, MOGENRE, TO_CHAR(MODATE, 'YYYY-MM-DD') "
				+ "FROM MOVIELIST WHERE RN BETWEEN ? AND ?";

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				movie = new MovieDTO();

				movie.setMoNum(rs.getInt(1));
				movie.setMoTitle(rs.getString(2));
				movie.setMoGenre(rs.getString(3));
				movie.setMoDate(rs.getString(4));

				adminmoList.add(movie);
			}
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return adminmoList;
	}

	// 영화목록 조회 메소드 movieList()
	public ArrayList<MovieDTO> movieList() {
		ArrayList<MovieDTO> moList = new ArrayList<MovieDTO>();

		MovieDTO movie = null;

		String sql = "SELECT MONUM, MOPIC, MOTITLE FROM MOVIE ORDER BY MONUM DESC";

		try {
			pstmt = con.prepareStatement(sql);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				movie = new MovieDTO();

				movie.setMoNum(rs.getInt(1));
				movie.setMoPic(rs.getString(2));
				movie.setMoTitle(rs.getString(3));

				moList.add(movie);
			}
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return moList;
	}

	// 영화 랜덤 리스트 movieRandomList()
	public ArrayList<MovieDTO> movieRandomList() {
		ArrayList<MovieDTO> moRandomList = new ArrayList<MovieDTO>();

		MovieDTO movie = null;

		String sql = "SELECT MONUM, MOPIC, MOTITLE FROM (SELECT * FROM MOVIE ORDER BY DBMS_RANDOM.VALUE) WHERE ROWNUM<=3";

		try {
			pstmt = con.prepareStatement(sql);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				movie = new MovieDTO();

				movie.setMoNum(rs.getInt(1));
				movie.setMoPic(rs.getString(2));
				movie.setMoTitle(rs.getString(3));

				moRandomList.add(movie);
			}
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return moRandomList;
	}

	// 영화 장르별 리스트 movieGenreList()
	public ArrayList<MovieDTO> movieList(String moGenre) {
		ArrayList<MovieDTO> moGenreList = new ArrayList<MovieDTO>();

		MovieDTO movie = null;

		String sql = "SELECT MONUM, MOPIC, MOTITLE FROM MOVIE WHERE MOGENRE=? ORDER BY MONUM DESC";

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, moGenre);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				movie = new MovieDTO();

				movie.setMoNum(rs.getInt(1));
				movie.setMoPic(rs.getString(2));
				movie.setMoTitle(rs.getString(3));

				moGenreList.add(movie);
			}
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return moGenreList;
	}

	// 영화 상세보기 movieView() 메소드
	public MovieDTO movieView(int moNum) {

		MovieDTO movie = null;

		String sql = "SELECT MONUM, MOTITLE, MOPIC, MOURL, MOCONTENTS, MOTIME, MOGENRE, "
				+ "TO_CHAR(MODATE,'YYYY-MM-DD'), MOACT FROM MOVIE WHERE MONUM=?";

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, moNum);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				movie = new MovieDTO();
				movie.setMoNum(rs.getInt(1));
				movie.setMoTitle(rs.getString(2));
				movie.setMoPic(rs.getString(3));
				movie.setMoUrl(rs.getString(4));
				movie.setMoContents(rs.getString(5));
				movie.setMoTime(rs.getString(6));
				movie.setMoGenre(rs.getString(7));
				movie.setMoDate(rs.getString(8));
				movie.setMoAct(rs.getString(9));

			}

		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}

		return movie;
	}

	// 영화정보 수정 movieModify()메소드
	public int movieModify(MovieDTO movie) {
		int result = 0;

		String sql = "UPDATE MOVIE SET MOTITLE=?, MOPIC=?, MOURL=?, MOCONTENTS=?, MOTIME=?,MOGENRE=?,MODATE=?, MOACT=? WHERE MONUM=?";

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, movie.getMoTitle());
			pstmt.setString(2, movie.getMoPic());
			pstmt.setString(3, movie.getMoUrl());
			pstmt.setString(4, movie.getMoContents());
			pstmt.setString(5, movie.getMoTime());
			pstmt.setString(6, movie.getMoGenre());
			pstmt.setString(7, movie.getMoDate());
			pstmt.setString(8, movie.getMoAct());
			pstmt.setInt(9, movie.getMoNum());
			result = pstmt.executeUpdate();

		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	// 영화제목 검색하기 MovieSearch()
	public ArrayList<MovieDTO> MovieSearch(String search) {
		ArrayList<MovieDTO> movieSearch = new ArrayList<MovieDTO>();

		MovieDTO movie = null;

		String sql = "SELECT MONUM, MOPIC, MOTITLE FROM MOVIE WHERE MOTITLE LIKE '%'||?||'%'";

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, search);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				movie = new MovieDTO();

				movie.setMoNum(rs.getInt(1));
				movie.setMoPic(rs.getString(2));
				movie.setMoTitle(rs.getString(3));

				movieSearch.add(movie);
			}
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return movieSearch;
	}

	// 영화정보 삭제 movieDelete()
	public int movieDelete(int moNum) {
		int result = 0;

		String sql = "DELETE FROM MOVIE WHERE MONUM=?";

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, moNum);
			
			result = pstmt.executeUpdate();
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	// 찜했던 영화 상세조회
	public MovieDTO movieSView(int moNum) {
		MovieDTO movie = null;

		String sql = "SELECT MONUM, MOTITLE, MOPIC, MOURL, MOCONTENTS, MOTIME, MOGENRE, "
				+ "TO_CHAR(MODATE,'YYYY-MM-DD'), MOACT FROM MOVIE WHERE MONUM=?";

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, moNum);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				movie = new MovieDTO();
				movie.setMoNum(rs.getInt(1));
				movie.setMoTitle(rs.getString(2));
				movie.setMoPic(rs.getString(3));
				movie.setMoUrl(rs.getString(4));
				movie.setMoContents(rs.getString(5));
				movie.setMoTime(rs.getString(6));
				movie.setMoGenre(rs.getString(7));
				movie.setMoDate(rs.getString(8));
				movie.setMoAct(rs.getString(9));

			}

		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}

		return movie;
		
	}

	
	
	
}