// 작성자 : 최유림
package com.handsome.mapper;

import java.util.List;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import com.handsome.domain.TestBean;
import lombok.extern.slf4j.Slf4j;

//테스트 코드가 스프링을 실행하는 역할을 할 것이라고 명시
@RunWith(SpringJUnit4ClassRunner.class)

//root-context.xml의 경로를 지정
@ContextConfiguration({
	"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})

@Slf4j
public class TestMapperTests {
	@Autowired
	private testMapper mapper; // 쇼핑몰 기능에 대한 mapper
	
	// 쇼핑몰 기능에 대한 mapper를 잘 생성하는지에 대한 테스트 작업
	@Test
	public void testProductMapper() {
		log.info(""+ mapper);
	}
	
	// 쇼핑몰 목록을 잘 불러오는지에 대한 테스트 작업
	@Test
	public void testSelect() {
		List<TestBean> list = mapper.test("mid");
		log.info(""+list);
	}
	
	// 쇼핑몰 목록 내의 상품에 대한 삭제 작업을 잘 처리하는지에 대한 테스트 작업
	@Test
	public void testDelete() {
		mapper.delete("101110020_MU", "mid");
		List<TestBean> list = mapper.test("mid");
		log.info(""+list);
	}
	
	// 쇼핑몰 목록 내의 상품 종류의 총 개수를 잘 불러오는지에 대한 테스트 작업
	@Test
	public void totalCountTest() {
		List<TestBean> list = mapper.totalCount("mid");
		log.info(""+list);
	}
	
	// 쇼핑몰 목록 내의 상품들의 총 가격을 잘 불러오는지에 대한 테스트 작업
	@Test
	public void totalPriceTest() {
		List<TestBean> list = mapper.totalPrice("mid");
		log.info(""+list);
	}
}