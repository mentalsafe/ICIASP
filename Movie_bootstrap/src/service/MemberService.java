package service;

import java.sql.Connection;
import java.util.ArrayList;

import dao.MemberDAO;
import dto.MemberDTO;

import static dao.MemberDAO.*;
import static db.JdbcUtil.*;

public class MemberService {
	

	
	public MemberDTO memberLogin2(String momId, String momPw) {
		
		
		MemberDAO dao = getInstance();
		Connection con = getConnection();
		dao.setConnection(con);
		
		
		MemberDTO loginId2 = dao.memberLogin2(momId,momPw);
		
		close(con);
		
		return loginId2;
	}
	
	

	public int momSub(MemberDTO member) {
		
		MemberDAO dao = getInstance();
		Connection con = getConnection();
		dao.setConnection(con);
		
		System.out.println("memberService : " + member);
		int result = dao.momSub(member);
		System.out.println("result : " + result);
		
		if(result>0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}
	
	// 회원 가입 ↓
		public int memberJoin(MemberDTO member) {
			MemberDAO dao = getInstance();
			Connection con = getConnection();
			dao.setConnection(con);
			
			int result = dao.memberJoin(member);

			if(result > 0) {
				commit(con);
			} else {
				rollback(con);
			}
			close(con);
			
			return result;
		}
		
		// 아이디 중복체크 ↓
		public String idCheck(String momId) {
			MemberDAO dao = getInstance();
			Connection con = getConnection();
			dao.setConnection(con);
			
			String checkId = dao.idCheck(momId);
			
			return checkId;
		}
		// 로그인 ↓
		public String memberLogin(String momId, String momPw) {
			MemberDAO dao = getInstance();
			Connection con = getConnection();
			dao.setConnection(con);
			
			String loginId = dao.memberLogin(momId,momPw);
			
			close(con);
			
			return loginId;
		}
		// 회원 합계 보기 메소드 ↓
		public int momListCount() {
			MemberDAO dao = getInstance();
			Connection con = getConnection();
			dao.setConnection(con);
			
			int listCount = dao.momListCount();
			
			close(con);
			
			return listCount;
		}
		// 회원목록보기 메소드 ↓
		public ArrayList<MemberDTO> memberList(int startRow, int endRow) {
			MemberDAO dao = getInstance();
			Connection con = getConnection();
			dao.setConnection(con);
			
			ArrayList<MemberDTO> momList = dao.memberList(startRow, endRow);
			System.out.println("momList : " + momList);
			close(con);
			
			return momList;
		}
		// 회원정보 상세보기 메소드 ↓
		public MemberDTO memberView(String momId) {
			MemberDAO dao = getInstance();
			Connection con = getConnection();
			dao.setConnection(con);
			
			MemberDTO member = dao.memberView(momId);
			
			
			return member;
		}
		// 회원 정보 수정 메소드 ↓
		public int memberModify(MemberDTO member) {
			MemberDAO dao = getInstance();
			Connection con = getConnection();
			dao.setConnection(con);
			int result = dao.memberModify(member);
			if(result>0) {
				commit(con);
			} else {
				rollback(con);
			}
			close(con);
			return result;
		}
		// 회원 탈퇴 메소드 ↓
		public int memberDelete(String momId) {
			MemberDAO dao = getInstance();
			Connection con = getConnection();
			dao.setConnection(con);
			
			int result = dao.memberDelete(momId);
			if(result>0) {
				commit(con);
			} else {
				rollback(con);
			}
			close(con);
			return result;
		}
		// 회원 금액 충전 메소드 ↓
		public int memberCharge(MemberDTO member) {
			MemberDAO dao = getInstance();
			Connection con = getConnection();
			dao.setConnection(con);
			int result = dao.memberCharge(member);
			if(result>0) {
				commit(con);
			} else {
				rollback(con);
			}
			close(con);
			return result;
		}



		public int memberMoney(MemberDTO member) {
			MemberDAO dao = getInstance();
			Connection con = getConnection();
			dao.setConnection(con);
			
			int result = dao.memberMoney(member);
			if(result>0) {
				
				commit(con);
			} else {
				rollback(con);
			}
			
			close(con);
			return result;
		}



		public MemberDTO checkMoney(String momId) {
			MemberDAO dao = getInstance();
			Connection con = getConnection();
			dao.setConnection(con);
			
			MemberDTO member = dao.checkMoney(momId);
			
			close(con);
			
			return member;
		}




}
