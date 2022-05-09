package com.handsome.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.view;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.ui.ModelMap;
import org.springframework.web.context.WebApplicationContext;

import lombok.extern.log4j.Log4j;

/*  이지은 작성
 *  더한섬닷컴의 상품 관련 기능을 수행하는 ProductController를 Test
 *
 *  1. testHome()			: '/'로 접근했을 때 home으로 접근하는지 테스트
 *  2. testProductDetail()	: 상품 상세 페이지 테스트
 *  3. testProductList()	: 상품 목록 페이지(대분류) 테스트
 *  4. testMyCart()			: 쇼핑백에 상품 추가 기능 테스트
 *  5. testProductMList()	: 상품 목록 페이지(중분류) 테스트
 *  6. testProductSList()	: 상품 목록 페이지(소분류) 테스트
 */

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
@Log4j
public class ProductControllerTests {

	@Autowired
	private WebApplicationContext ctx;

	private MockMvc mockMvc;

	@Before
	public void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	}

	// 메인 페이지 test
	//@Test
	public void testHome() throws Exception {
		log.info(
				mockMvc.perform(
								MockMvcRequestBuilders.get("/")) // '/'로 접근했을 때
						.andExpect(status().isOk())
						.andExpect(view().name("home"))); // view 이름이 home인지 확인
	}

	// 상품 상세 페이지 test
	//@Test
	public void testProductDetail() throws Exception {
		String pid = "FL2B7HCO038LCB_GN";  // 상품 품번 지정
		log.info(
				mockMvc.perform(  // 해당 상품 상세 페이지 test
								MockMvcRequestBuilders.get("/product/productDetail")
										.param("pid", pid))
						.andExpect(status().isOk())
						.andReturn()
						.getModelAndView()
						.getModelMap()
		);
	}

	// 상품 목록 페이지 test
	//@Test
	public void testProductList() throws Exception {
		log.info(
				mockMvc.perform(  // 페이지 번호와 상품 개수 지정  후, 상품 목록 페이지 test
								MockMvcRequestBuilders.get("/product/productList")
										.param("pageNum", "2")
										.param("amount", "12"))
						.andExpect(status().isOk())
						.andReturn()
						.getModelAndView()
						.getModelMap()
		);
	}

	// 쇼핑백에 상품 추가 기능 test
	//@Test
	public void testMyCart() throws Exception {
		ModelMap resultPage = mockMvc.perform( // 상품 품번과 수량 지정 후, 쇼핑백 기능 test
						MockMvcRequestBuilders.post("/product/myCart")
								.param("pid", "YS2B3HCO003WMO_ML")
								.param("oamount", "4"))
				.andExpect(status().isOk())
				.andReturn()
				.getModelAndView()
				.getModelMap();

		log.info(resultPage);

	}

	// 상품 목록 페이지(중분류) 테스트
	@Test
	public void testProductMList() throws Exception {
		log.info(
				mockMvc.perform( // 페이지 번호와 상품 개수, 중분류 지정 후 상품 목록 페이지(중분류) test
								MockMvcRequestBuilders.get("/product/productMList")
										.param("pageNum", "2")
										.param("amount", "12")
										.param("category", "스킨케어"))
						.andExpect(status().isOk())
						.andReturn()
						.getModelAndView()
						.getModelMap()
		);
	}

	// 상품 목록 페이지(소분류) 테스트
	@Test
	public void testProductSList() throws Exception {
		log.info(
				mockMvc.perform( // 페이지 번호와 상품 개수, 소분류 지정 후 상품 목록 페이지(소분류) test
								MockMvcRequestBuilders.get("/product/productSList")
										.param("pageNum", "2")
										.param("amount", "12")
										.param("category", "향수"))
						.andExpect(status().isOk())
						.andReturn()
						.getModelAndView()
						.getModelMap()
		);
	}
}