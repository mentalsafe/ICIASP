package service;

import java.sql.Connection;
import java.util.ArrayList;

import dao.SaveDAO;
import dto.SaveDTO;

import static dao.SaveDAO.*;
import static db.JdbcUtil.*;

public class SaveService {

	public ArrayList<SaveDTO> movieSaveList(String mosId) {
		
		
		SaveDAO dao = getInstance();
		Connection con = getConnection();
		dao.setConnection(con);
		
		System.out.println("mosIdservicepage : " + mosId);
		ArrayList<SaveDTO> mosList = dao.saveList(mosId);
		
		close(con);
		
		
		return mosList;
	}
	
	
	//찜 추가하기
	public int movieSave(SaveDTO save) {
		SaveDAO dao = getInstance();
		Connection con = getConnection();
		dao.setConnection(con);
		
		System.out.println("saveservice : " + save);
		int result = 0;
		
		result= dao.movieSave(save);

		
		if (result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		
		
		
		return result;
	}
	
	

	//찜 목록 지우기
	public int saveDelete(String mosId, int mosNum) {
		SaveDAO dao = getInstance();
		Connection con = getConnection();
		dao.setConnection(con);
		
		int result = dao.saveDelete(mosId, mosNum);
		
		if(result>0) {
			commit(con);
		} else {
			rollback(con);
		}
		
		close(con);
		return result;
	}


	



}
