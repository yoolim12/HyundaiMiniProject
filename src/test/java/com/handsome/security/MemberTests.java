package com.handsome.security;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;



/*
 *   유지훈 작성자 
 *   	회원 정보에 대한 초기 데이터 값 저장 테스트 
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({
  "file:src/main/webapp/WEB-INF/spring/root-context.xml",
  "file:src/main/webapp/WEB-INF/spring/security-context.xml"
  })
@Log4j
public class MemberTests {

  @Autowired
  private PasswordEncoder pwencoder;
  
  @Autowired
  private DataSource ds;
  
  @Test
  public void testInsertMember() { //데이터 저장 로직 레스트 
 
    String sql = "insert into tbl_member(mid, mpassword, mname, memail, mtel) values (?,?,?,?,?)";
    
    for(int i = 0; i < 10; i++) {      
      Connection con = null;
      PreparedStatement pstmt = null;
      
      try {
        con = ds.getConnection();
        pstmt = con.prepareStatement(sql);        
        pstmt.setString(2, pwencoder.encode("pw" + i));    // 암호화 코드로 변환하여 비밀번호를 저장한다.
        
        if (i <7) {          
          pstmt.setString(1, "member"+i);
          pstmt.setString(3, "회원"+i);          
        }else {          
          pstmt.setString(1, "admin"+i);
          pstmt.setString(3,"관리자"+i);          
        }//end if
        
        pstmt.setString(4, "dbwlgna98@naver.com");
        pstmt.setString(5, "010-0010-0111");
        
        pstmt.executeUpdate();        
      }catch(Exception e) {
        e.printStackTrace();
      }finally {
        if(pstmt != null) { try { pstmt.close();  } catch(Exception e) {} }
        if(con != null) { try { con.close();  } catch(Exception e) {} }        
      }
    }
  }
   
}