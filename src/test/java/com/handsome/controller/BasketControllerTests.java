// 작성자 : 최유림
package com.handsome.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.view;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.ui.ModelMap;
import org.springframework.web.context.WebApplicationContext;

import lombok.extern.slf4j.Slf4j;

// 테스트 코드가 스프링을 실행하는 역할을 할 것이라고 명시
@RunWith(SpringJUnit4ClassRunner.class) 

// root-context.xml의 경로를 지정
@ContextConfiguration({
	"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})

@Slf4j
public class BasketControllerTests {
	
	// 웹 애플리케이션에서 필요한 몇 가지 기능을 추가한 인터페이스
	@Autowired
	private WebApplicationContext ctx;
	
	// 테스트용 mvc 생성
	private MockMvc mockMvc;
	
	// 아래와 같은 상품 id로 테스트를 진행한다.
	String pid = "FL2B7HCO038LCB_GN";

	// 이 웹 어플리케이션에 대한 테스트용 mvc를 생성한다.
	@Before
	public void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();		
	}
	
	/* 
	 	쇼핑백 조회에 대한 테스트 작업 
	 	파라미터 "pid"에 상품 id를 전달하여 "/order/orderList" url로 이동하였을 때
	 	orderList.jsp를 잘 반환하는지 확인한다. 
	 */
	@Test
	public void testBasketView() throws Exception {
			log.info(
					""+mockMvc.perform(
							MockMvcRequestBuilders.get("/order/orderList")
					.param("pid", pid))
					.andExpect(status().isOk())
					.andExpect(view().name("orderList")));
	}
	
		/* 
	 	쇼핑백 조회에 대한 테스트 작업 
	 	파라미터 "pid"에 상품 id를 전달하여 "/order/orderList" url로 이동하였을 때
	 	모델 데이터를 잘 반환하는지 확인한다. 
		*/
		@Test
		public void testBasket() throws Exception {
			log.info(
					""+mockMvc.perform(
							MockMvcRequestBuilders.get("/order/orderList")
							.param("pid", pid))
					.andExpect(status().isOk())
					.andReturn()
					.getModelAndView()
					.getModelMap()
			);	
		}
		
		/* 
	 	쇼핑백 상품 삭제에 대한 테스트 작업 
	 	파라미터 "pid"에 상품 id를 전달하고 "mid"에 사용자 id를 전달하여 "/order/orderList" url로 이동하였을 때
	 	모델 데이터를 잘 반환하는지 확인한다. 
		*/
		@Test
		public void testBasketDelete() throws Exception {
			ModelMap resultPage = mockMvc.perform(
					MockMvcRequestBuilders.get("/delete")
			.param("param1", pid)
			.param("param2", "mid"))
			.andExpect(status().isOk())
			.andReturn()
			.getModelAndView()
			.getModelMap();
			
			log.info(""+resultPage);
			
		}
}
