package dao;

import static db.JdbcUtil.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dto.SaveDTO;

public class SaveDAO {

	private static SaveDAO dao;
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	
	public static SaveDAO getInstance() {
		if(dao==null) {
			dao = new SaveDAO();
		}
		return dao;
	}
	
	public void setConnection(Connection con) {
		this.con = con;
	}

	
	
	
	
	public ArrayList<SaveDTO> saveList(String mosId) {
		
		ArrayList<SaveDTO> mosList = new ArrayList<SaveDTO>();
		
		SaveDTO save = null;
		
		String sql = "SELECT Z.MOSID, M.MOTITLE, M.MOPIC, M.MONUM FROM MOVIESAVE Z ,MOVIE M WHERE Z.MOSNUM = M.MONUM AND Z.MOSID=?";
		
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, mosId);
			rs=pstmt.executeQuery();
			
			System.out.println("mosId sql :" + mosId);
			
			while (rs.next()) {
				save = new SaveDTO();
				save.setMosId(rs.getString(1));
				save.setMosTitle(rs.getString(2));
				save.setMosPic(rs.getString(3));
				save.setMosNum(rs.getInt(4));
				mosList.add(save);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}
		
		System.out.println(mosList);
		return mosList;
	}
	
	//찜 추가하기
	public int movieSave(SaveDTO save) {
		int result = 0;
		
		String sql = "INSERT INTO MOVIESAVE VALUES(?,?)";
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, save.getMosId());
			pstmt.setInt(2, save.getMosNum());
			
			result = pstmt.executeUpdate();
			
			System.out.println("saveresult : " + result);
			
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	
	
	//찜 목록 지우기
	public int saveDelete(String mosId, int mosNum) {
		int result = 0;
		
		String sql="DELETE FROM MOVIESAVE WHERE MOSID=? AND MOSNUM=?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mosId);
			pstmt.setInt(2, mosNum);
		
			result = pstmt.executeUpdate();
		
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	

	
	
	
	
}
