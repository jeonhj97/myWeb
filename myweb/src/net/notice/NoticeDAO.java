package net.notice;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import net.bbs.BbsDTO;
import net.utility.DBClose;
import net.utility.DBOpen;

public class NoticeDAO {
	private	DBOpen dbopen=null;
	 private Connection con=null;
	 private PreparedStatement pstmt=null;
	 private ResultSet rs=null;
	 private StringBuilder sql=null;
	 
	 public NoticeDAO() {
		    dbopen=new DBOpen();
	 }
	 
	 public int insert(NoticeDTO dto) {
		    int cnt=0;
		    try {
		      con=dbopen.getConnection();
		      sql=new StringBuilder();
		      sql.append(" INSERT INTO tb_notice (noticeno,subject,content) ");
		      sql.append(" VALUES(noticeno_seq.nextval, ?, ?) ");
		      
		      pstmt=con.prepareStatement(sql.toString());
		      pstmt.setString(1, dto.getSubject());
		      pstmt.setString(2, dto.getContent());
		      
		     
		     
		      cnt=pstmt.executeUpdate();
		      
		    }catch (Exception e) {
		      System.out.println("추가실패:"+e);
		    }finally {
		      DBClose.close(con, pstmt);
		    }// end
		    
		    return cnt;
		    
		  }//insert() end
	 
	 
	 
	 
	 public ArrayList<NoticeDTO> list(){
		    ArrayList<NoticeDTO> list=null;
		    try {
		      con=dbopen.getConnection();
		      sql=new StringBuilder();
		      // 검색 기능 없을때
		      sql.append(" SELECT noticeno,subject,content,regdt ");
		      sql.append(" FROM tb_notice  ");
		      
		     
		      
		      pstmt=con.prepareStatement(sql.toString());
		      rs=pstmt.executeQuery();
		      if(rs.next()){
		        list=new ArrayList<>();
		        do {
		          NoticeDTO dto=new NoticeDTO();
		          dto.setNoticeno(rs.getInt("noticeno"));		 
		          dto.setSubject(rs.getString("subject"));
		          dto.setRegdt(rs.getString("regdt"));
		          list.add(dto);
		        }while(rs.next());        
		      }else {
		        list=null;
		      }//if end
		      
		    }catch (Exception e) {
		      System.out.println("목록실패:"+e);
		    }finally {
		      DBClose.close(con, pstmt, rs);
		    }//end
		    
		    return list;
		    
		  }//list() end
	 
	 
	 public NoticeDTO read(int noticeno) {
		 NoticeDTO dto=null;
		    try {
		      con=dbopen.getConnection();
		      sql=new StringBuilder();
		      sql.append(" SELECT noticeno, subject, content, regdt");
		      sql.append(" FROM tb_notice ");
		      sql.append(" WHERE noticeno=? ");
		      
		      pstmt=con.prepareStatement(sql.toString());
		      pstmt.setInt(1, noticeno);
		      rs=pstmt.executeQuery();
		      if(rs.next()){
		          dto=new NoticeDTO();
		          dto.setNoticeno(rs.getInt("noticeno"));	      
		          dto.setSubject(rs.getString("subject"));
		          dto.setContent(rs.getString("content"));
		          dto.setRegdt(rs.getString("regdt"));
		          
		      }else{
		          dto=null;
		      }//if end
		    }catch (Exception e) {
		      System.out.println("상세보기실패:"+e);
		    }finally {
		      DBClose.close(con, pstmt, rs);
		    }//end    
		    return dto; 
		  }//read() end
	 
	 
	 
	 public int delete(int noticeno) {
		    int cnt=0;
		    try{
		      con=dbopen.getConnection();
		      sql=new StringBuilder();
		      sql.append(" DELETE FROM tb_notice ");
		      sql.append(" WHERE noticeno=?  ");
		      pstmt=con.prepareStatement(sql.toString());
		      pstmt.setInt(1,noticeno);
		      cnt=pstmt.executeUpdate();
		    }catch(Exception e){
		      System.out.println("삭제 실패:"+e);
		    }finally {
		      DBClose.close(con, pstmt);
		    }//end
		    return cnt;
		  }//delete() end
	 
	 public NoticeDTO updateform(int noticeno) {
		 NoticeDTO dto=null;
		 try {
		      
		      con=dbopen.getConnection();
		      sql=new StringBuilder();
		      sql.append(" SELECT noticeno, subject, content, regdt");
		      sql.append(" FROM tb_notice ");
		      sql.append(" WHERE noticeno=?");
		      
		      pstmt=con.prepareStatement(sql.toString());
		      pstmt.setInt(1, noticeno);		     
		      rs=pstmt.executeQuery();
		      if(rs.next()){
		    	  dto=new NoticeDTO();
		          dto.setNoticeno(rs.getInt("noticeno"));	      
		          dto.setSubject(rs.getString("subject"));
		          dto.setContent(rs.getString("content"));
		          dto.setRegdt(rs.getString("regdt"));
		          
		      }else{
		          dto=null;
		      }//if end
		      
		    }catch (Exception e) {
		      System.out.println("수정 조회 실패:"+e);
		    }finally {
		      DBClose.close(con, pstmt, rs);
		    }//end    
		    return dto; 

		  }//updateform() end
	 
	 
	 public int updateproc(NoticeDTO dto) {
		    int cnt=0;
		    try {
		      con=dbopen.getConnection();
		      sql=new StringBuilder();
		      sql.append(" UPDATE tb_notice ");
		      sql.append(" SET subject=? ");
		      sql.append(" ,content=? ");		
		      sql.append(" WHERE noticeno=? ");
		      pstmt=con.prepareStatement(sql.toString());
		      pstmt.setString(1, dto.getSubject());
		      pstmt.setString(2, dto.getContent());
		      pstmt.setInt(3, dto.getNoticeno());
		      cnt=pstmt.executeUpdate();
		    }catch (Exception e) {
		      System.out.println("수정 실패:"+e);
		    }finally {
		      DBClose.close(con, pstmt);
		    }//end    
		    return cnt;
		  }//updateproc() end
	 
	 
	 
	 
	 
	 
	 
	 
	 
}//class end
