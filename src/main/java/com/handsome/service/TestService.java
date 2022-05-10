// 작성자 : 최유림
package com.handsome.service;
 
import java.util.List;
import com.handsome.domain.TestBean;

// 쇼핑백 조회에 필요한 서비스를 제공하기 위한 인터페이스(TestServiceImpl.java에서 구현)
public interface TestService {
	
	 // 쇼핑백 목록 조회 서비스를 제공해주는 메서드, 파라미터로 사용자 id인 mid를 받는다.
     public List<TestBean> selectTest(String mid) throws Exception;
     
     // 쇼핑백 목록에서 선택한 상품을 삭제하는 서비스를 제공해주는 메서드, 파라미터로 상품 id인 pid(param1)와 사용자 id인 mid(param2)를 받는다.
     public void deleteTest(String param1, String param2) throws Exception;
     
     // 쇼핑백 목록에서 전체 상품 종류 개수 출력하는 서비스를 제공해주는 메서드, 파라미터로 사용자 id인 mid를 받는다.
     public List<TestBean> selectCount(String mid) throws Exception;
     
     // 쇼핑백에 담긴 상품들의 전체 가격을 출력하는 서비스를 제공해주는 메서드, 파라미터로 사용자 id인 mid를 받는다.
     public List<TestBean> selectPrice(String mid) throws Exception;
}