package net.member;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import net.utility.DBClose;
import net.utility.DBOpen;
import net.utility.MyAuthenticator;

public class MemberDAO {
	  
	  private DBOpen dbopen=null;
	  private Connection con=null;
	  private PreparedStatement pstmt=null;
	  private ResultSet rs=null;
	  private StringBuilder sql=null;
	  
	  public MemberDAO() {
	    dbopen=new DBOpen();
	  }
	  
	  
	  public String loginProc(MemberDTO dto) {
	    String mlevel=null;
	    try {
	      con=dbopen.getConnection();
	      sql=new StringBuilder();
	      sql.append(" SELECT mlevel ");
	      sql.append(" FROM member ");
	      sql.append(" WHERE id=? AND passwd=? ");
	      sql.append(" AND mlevel IN ('A1', 'B1', 'C1', 'D1') ");
	      pstmt=con.prepareStatement(sql.toString());
	      pstmt.setString(1, dto.getId());
	      pstmt.setString(2, dto.getPasswd());
	      rs= pstmt.executeQuery();
	      if(rs.next()){
	        mlevel=rs.getString("mlevel");
	      }else{
	        mlevel=null;
	      }//if end
	      
	    }catch(Exception e){
	      System.out.println("로그인실패:" + e);
	    }finally {
	      DBClose.close(con, pstmt, rs);
	    }//end
	    return mlevel;
	  }//loginProc() end  
	  

	  
	  public int duplecateID(String id) {
	    int cnt=0;
	    try {
	      con=dbopen.getConnection();          
	      sql=new StringBuilder();
	      sql.append(" SELECT COUNT(id) as cnt");
	      sql.append(" FROM member");
	      sql.append(" WHERE id=?");
	      pstmt=con.prepareStatement(sql.toString());
	      pstmt.setString(1, id);
	      rs=pstmt.executeQuery();
	      if(rs.next()) {
	        cnt=rs.getInt("cnt");
	      }//if end
	    }catch (Exception e) {
	      System.out.println("아이디 중복 확인 실패 : " + e);
	    }finally {
	      DBClose.close(con, pstmt, rs);
	    }//end
	    return cnt;
	  }//duplecateID() end
	  
	  
	  public int duplecateEmail(String email) {
			int cnt=0;
			try {
				con=dbopen.getConnection();
				sql=new StringBuilder();
				sql.append(" SELECT COUNT(email) as cnt ");
				sql.append(" FROM member ");
				sql.append(" WHERE email=? ");	
				pstmt=con.prepareStatement(sql.toString());
				pstmt.setString(1, email);
				rs=pstmt.executeQuery();
				if(rs.next()) {
					cnt=rs.getInt("cnt");
				}//if end
			}catch(Exception e){
				System.out.println("이메일 중복 확인 실패:"+e);
			}finally {
				DBClose.close(con, pstmt, rs);	
			}//end
			return cnt;
			
		}//duplecateID() end
	  
	  
	  public boolean findID(MemberDTO dto) {
	    boolean flag=false;
	    try {
	      con=dbopen.getConnection();          
	      sql=new StringBuilder();
	      sql.append(" SELECT id, passwd ");
	      sql.append(" FROM member");
	      sql.append(" WHERE mname=? AND email=? ");
	      pstmt=con.prepareStatement(sql.toString());
	      pstmt.setString(1, dto.getMname());
	      pstmt.setString(2, dto.getEmail());
	      rs=pstmt.executeQuery();      
	      if(rs.next()) {
	               
	        //이름과 이메일이 일치되면
	        //임시 비밀번호 발급
	        String[] ch= {"A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"
	                     ,"a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"
	                     ,"0","1","2","3","4","5","6","7","8","9"};

	        //임시 비밀번호 랜덤하게 10글자 발생
	        StringBuffer imsiPW=new StringBuffer();
	        for(int i=0; i<10; i++) {
	          int num=(int)(Math.random()*ch.length);
	          imsiPW.append(ch[num]);
	        }//for end
	        //System.out.println(imsiPW.toString());
	        
	        
	        //임시비밀번호로 업데이트 하기
	        sql=new StringBuilder();
	        sql.append(" UPDATE member ");
	        sql.append(" SET passwd=? ");
	        sql.append(" WHERE mname=? AND email=? ");
	        pstmt=con.prepareStatement(sql.toString());
	        pstmt.setString(1, imsiPW.toString());
	        pstmt.setString(2, dto.getMname());
	        pstmt.setString(3, dto.getEmail());
	        
	        int cnt=pstmt.executeUpdate();
	        if(cnt==1) {
	          String content="";
	          content += "<hr>";
	          content += "<table border='1'>";
	          content += "<tr>";
	          content += "  <td>아이디</td>";
	          content += "  <td>" + rs.getString("id") + "</td>";
	          content += "</tr>";
	          content += "<tr>";
	          content += "  <td>비밀번호</td>";
	          content += "  <td>" + imsiPW + "</td>";
	          content += "</tr>";
	          content += "</table>";
	          
	          //임시비밀번호를 이메일 전송하기
	          String mailServer="mw-002.cafe24.com";//카페24 메일서버
	          Properties props=new Properties();
	          props.put("mail.smtp.host", mailServer);
	          props.put("mail.smtp.auth", "true");        
	          Authenticator myAuth=new MyAuthenticator();
	          Session sess=Session.getInstance(props, myAuth);
	          
	          InternetAddress[] address={ new InternetAddress(dto.getEmail()) };
	          Message msg=new MimeMessage(sess);
	          msg.setRecipients(Message.RecipientType.TO, address);
	          msg.setFrom(new InternetAddress("prettyimo@daum.net"));
	          msg.setSubject("MyWeb 아이디/비번 입니다");
	          msg.setContent(content,"text/html; charset=UTF-8");        
	          msg.setSentDate(new Date(cnt));
	          Transport.send(msg);
	          
	          flag=true; //최종적으로 성공
	          
	        }else{
	          
	          flag=false;
	          
	        }//if end
	        
	      }else {
	        flag=false;
	      }//if end
	      
	    }catch (Exception e) {
	      System.out.println("아이디/비번찾기 실패 : " + e);
	    }finally {
	      DBClose.close(con, pstmt, rs);
	    }//end
	    return flag;
	  }//findID() end
	  
	  public int insert(MemberDTO dto) {
			int cnt=0;
			try {
				con=dbopen.getConnection();
				StringBuilder sql = new StringBuilder();
				sql.append(" INSERT INTO member(id, passwd, mname, tel, email, zipcode, address1, address2, job) ");
				sql.append(" VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?) ");
				pstmt=con.prepareStatement(sql.toString());
				pstmt.setString(1, dto.getId());
				pstmt.setString(2, dto.getPasswd());
				pstmt.setString(3, dto.getMname());
				pstmt.setString(4, dto.getTel());
				pstmt.setString(5, dto.getEmail());
				pstmt.setString(6, dto.getZipcode());
				pstmt.setString(7, dto.getAddress1());
				pstmt.setString(8, dto.getAddress2());
				pstmt.setString(9, dto.getJob());

				cnt=pstmt.executeUpdate();
				
					
			}catch(Exception e) {
				System.out.println("회원정보등록실패:"+e);
			}finally {
				DBClose.close(con);
			}
			return cnt;
		}
	  
	  
	  
	  
	  
	  
	}//class end


	

	
		
		
		


	

