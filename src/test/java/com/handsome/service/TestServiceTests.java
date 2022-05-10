// 작성자 : 최유림
package com.handsome.service;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import com.handsome.domain.TestBean;
import java.util.List;
import lombok.extern.slf4j.Slf4j;

//테스트 코드가 스프링을 실행하는 역할을 할 것이라고 명시
@RunWith(SpringJUnit4ClassRunner.class)

//root-context.xml의 경로를 지정
@ContextConfiguration({
	"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})

@Slf4j
public class TestServiceTests {
	@Autowired
	private TestService service; // 쇼핑몰 목록 기능에 대한 service 객체
	
	String mid = "mid"; // 테스트용으로 mid를 "mid"로 설정
	
	// service 객체를 잘 생성하는지에 대한 테스트 작업
	@Test
	public void testServiceExists() {
		log.info(""+service);
		assertNotNull(service);		
	}
	
	// 쇼핑몰 목록을 잘 불러오는지에 대한 테스트 작업
	@Test
	public void TestselectTest() throws Exception {
		List<TestBean> list = service.selectTest(mid);
		log.info(""+list);
	}
	
	// 쇼핑몰 목록 내의 상품에 대한 삭제 작업을 잘 처리하는지에 대한 테스트 작업
	@Test
	public void TestdeleteTest() throws Exception {
		String pid = "101110020_MU";
		service.deleteTest(pid, mid);
		List<TestBean> list = service.selectTest(mid);
		log.info(""+list);
	}
	
	// 쇼핑몰 목록 내의 상품 종류의 총 개수를 잘 불러오는지에 대한 테스트 작업
	@Test
	public void selectCountTest() throws Exception {
		List<TestBean> list = service.selectCount(mid);
		log.info(""+list);
	}
	
	// 쇼핑몰 목록 내의 상품들의 총 가격을 잘 불러오는지에 대한 테스트 작업
	@Test
	public void selectPriceTest() throws Exception {
		List<TestBean> list = service.selectPrice(mid);
		log.info(""+list);
	}
}