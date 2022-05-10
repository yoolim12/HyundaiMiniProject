// 작성자 : 최유림
package com.handsome.service;

import static org.junit.Assert.assertNotNull;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.handsome.domain.BoardBean;

import lombok.extern.slf4j.Slf4j;

//테스트 코드가 스프링을 실행하는 역할을 할 것이라고 명시
@RunWith(SpringJUnit4ClassRunner.class)

//root-context.xml의 경로를 지정
@ContextConfiguration({
	"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})

@Slf4j
public class BoardServiceTests {
	@Autowired
	private BoardService service; // 상품 Q&A 게시물 조회에 대한 service 객체
	
	// service 객체를 잘 생성하는지에 대한 테스트 작업
	@Test
	public void testServiceExists() {
		log.info(""+service);
		assertNotNull(service);		
	}
	
	// 상품 Q&A 게시물 목록을 잘 불러오는지에 대한 테스트 작업 
	@Test
	public void selectBoardTest() {
		List<BoardBean> list = service.selectBoard("101110020_MU");
		log.info(""+list);
	}
	
	// 상품 Q&A 게시물 개수를 잘 불러오는지에 대한 테스트 작업
	@Test
	public void boardCountTest() {
		List<BoardBean> list = service.boardCount("101110020_MU");
		log.info(""+list);
	}
}
