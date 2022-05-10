// 작성자 : 최유림
package com.handsome.service;
 
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.handsome.domain.TestBean;
import com.handsome.mapper.testMapper;
import lombok.extern.slf4j.Slf4j; 
 
@Service // 해당 클래스가 비즈니스 로직을 담은 Service 클래스임을 명시
@Slf4j
public class TestServiceImpl implements TestService {
	@Autowired
	private testMapper mapper; // 쇼핑백 조회에 필요한 메서드들을 담은 mapper
	
	// 쇼핑백 목록 조회 서비스를 제공해주는 메서드, 파라미터로 사용자 id인 mid를 받는다.
    @Override
    public List<TestBean> selectTest(String mid) throws Exception {
    	log.info("list: "+mapper.test(mid));
    	return mapper.test(mid); // 쇼핑백 조회 mapper의 test 메서드 실행하여 id가 mid인 사용자의 쇼핑백 목록 조회에 필요한 요소들을 가져온다.
    }
    
    // 쇼핑백 목록에서 선택한 상품을 삭제하는 서비스를 제공해주는 메서드, 파라미터로 상품 id인 pid(param1)와 사용자 id인 mid(param2)를 받는다.
    @Override
    public void deleteTest(String param1, String param2) throws Exception {
    	mapper.delete(param1, param2); // id가 mid인 사용자가 쇼핑백 목록에서 선택한 상품을 삭제
    }
    
    // 쇼핑백 목록에서 전체 상품 종류 개수 출력하는 서비스를 제공해주는 메서드, 파라미터로 사용자 id인 mid를 받는다.
    @Override
    public List<TestBean> selectCount(String mid) throws Exception {
    	log.info("list: "+mapper.totalCount(mid));
    	return mapper.totalCount(mid); // id가 mid인 사용자의 쇼핑백 목록에서 전체 상품 종류 개수 출력
    }
    
    // 쇼핑백에 담긴 상품들의 전체 가격을 출력하는 서비스를 제공해주는 메서드, 파라미터로 사용자 id인 mid를 받는다.
    @Override
    public List<TestBean> selectPrice(String mid) throws Exception {
    	log.info("list: "+mapper.totalPrice(mid));
    	return mapper.totalPrice(mid); // id가 mid인 사용자의 쇼핑백에 담긴 상품들의 전체 가격을 출력
    }
}