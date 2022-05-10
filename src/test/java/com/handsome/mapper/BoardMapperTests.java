// 작성자 : 최유림
package com.handsome.mapper;

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
public class BoardMapperTests {
	@Autowired
	private BoardMapper mapper; // 상품 Q&A 게시물에 대한 mapper
	
	// 상품 Q&A 게시물에 대한 mapper를 잘 생성하는지에 대한 테스트 작업
	@Test
	public void testProductMapper() {
		log.info(""+ mapper);
	}
	
	// 상품 Q&A 게시물 목록을 잘 불러오는지에 대한 테스트 작업 
	@Test
	public void boardSelect() {
		List<BoardBean> list = mapper.select("101110020_MU");
		log.info(""+list);
	}
	
	// 상품 Q&A 게시물 개수를 잘 불러오는지에 대한 테스트 작업
	@Test
	public void boardTotalCount() {
		List<BoardBean> list = mapper.totalCount("101110020_MU");
		log.info(""+list);
	}
}