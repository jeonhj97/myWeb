package net.member2;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import net.utility.DBClose;
import net.utility.DBOpen;
import oracle.jdbc.driver.DBConversion;

public class MemberDBBean {//DAO클래스

	private DBOpen dbopen=null;
	private Connection con=null;
	private PreparedStatement pstmt=null;
	private ResultSet rs=null;
	private StringBuilder sql=null;
	
	
	public MemberDBBean() {
		dbopen=new DBOpen();
	}
	
	public int login (String id, String passwd)throws Exception{
		int res=0;
		try {
			con=dbopen.getConnection();
			sql=new StringBuilder();
			sql.append(" SELECT COUNT(id) as cnt ");
			sql.append(" FROM member ");
			sql.append(" WHERE id=? AND passwd=? ");
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, id);
			pstmt.setString(2, passwd);
			rs=pstmt.executeQuery();
			
			if(rs.next() == true) {
				res=rs.getInt("cnt");
			}//if end
		}catch(Exception e) {
			System.out.println("로그인 실패:"+ e);
		}finally {
			DBClose.close(con, pstmt, rs);
		}//end
		return res;
	}//login() end

	
	
	public MemberDataBean modifyform(MemberDataBean dto) {
		try {
			con=dbopen.getConnection();
			StringBuffer sql=new StringBuffer();
			sql.append(" SELECT mname, tel, address1, address2, job ");
			sql.append(" FROM member");
			sql.append(" WHERE id=? ");
			
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getId());
			
			rs=pstmt.executeQuery();
			if(rs.next()) {
				dto.setMname(rs.getString("mname"));
				dto.setAddress1(rs.getString("address1"));
				dto.setAddress2(rs.getString("address2"));
				dto.setTel(rs.getString("tel"));
				dto.setJob(rs.getString("job"));
			}else {
				dto=null;
				
			}//if end
			
				
		}catch(Exception e) {
			System.out.println("회원정보변경 폼 불러오기실패:"+e);
		}finally {
			DBClose.close(con,pstmt,rs);
		}
		return dto;
		
	}//modifyform()end
	
	

	public int modifypro(MemberDataBean dto) {
		int cnt=0;
	    try {
	      con=dbopen.getConnection();
	      sql=new StringBuilder();
	      sql.append(" UPDATE member ");
	      sql.append(" SET mname=? ");
	      sql.append(" ,tel=? ");
	      sql.append(" ,address1=? ");
	      sql.append(" ,address2=? ");
	      sql.append(" ,job=? ");
	      sql.append(" WHERE id=? ");
	      pstmt=con.prepareStatement(sql.toString());
	      pstmt.setString(1, dto.getMname());
	      pstmt.setString(2, dto.getAddress1());
	      pstmt.setString(3, dto.getAddress2());
	      pstmt.setString(4, dto.getTel());
	      pstmt.setString(5, dto.getJob());
	      pstmt.setString(6, dto.getId());
	      
	      cnt=pstmt.executeUpdate();
	    }catch (Exception e) {
	      System.out.println("수정 실패:"+e);
	    }finally {
	      DBClose.close(con, pstmt);
	    }//end    
	    return cnt;
	  }//modifypro() end
	
	
	
	
}//class end
