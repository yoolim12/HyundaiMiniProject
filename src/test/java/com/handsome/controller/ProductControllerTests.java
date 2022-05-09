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
	
	//@Test
	public void testHome() throws Exception {
		log.info(
				mockMvc.perform(
						MockMvcRequestBuilders.get("/"))
				.andExpect(status().isOk())
				.andExpect(view().name("home")));
	}
	
	//@Test
	public void testProductDetail() throws Exception {
		String pid = "FL2B7HCO038LCB_GN";
		log.info(
				mockMvc.perform(
						MockMvcRequestBuilders.get("/product/productDetail")
						.param("pid", pid))
				.andExpect(status().isOk())
				.andReturn()
				.getModelAndView()
				.getModelMap()
		);	
	}
	
	//@Test
	public void testProductList() throws Exception {
		log.info(
				mockMvc.perform(
						MockMvcRequestBuilders.get("/product/productList")
				.param("pageNum", "2")
				.param("amount", "12"))
				.andExpect(status().isOk())
				.andReturn()
				.getModelAndView()
				.getModelMap()
		);	
	}
	
	//@Test
	public void testMyCart() throws Exception {
		ModelMap resultPage = mockMvc.perform(
				MockMvcRequestBuilders.post("/product/myCart")
		.param("pid", "YS2B3HCO003WMO_ML")
		.param("oamount", "4"))
		.andExpect(status().isOk())
		.andReturn()
		.getModelAndView()
		.getModelMap();
		
		log.info(resultPage);
		
	}
	
	//@Test
	public void testProductMList() throws Exception {
		log.info(
				mockMvc.perform(
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
	
	//@Test
	public void testProductSList() throws Exception {
		log.info(
				mockMvc.perform(
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

	//@Test
	public void testInquiryList() throws Exception {
		log.info(
				mockMvc.perform(
						MockMvcRequestBuilders.get("/myPage/myInquiry"))
				.andExpect(status().isOk())
				.andReturn()
				.getModelAndView()
				.getModelMap()
		);	
	}
	
	public void testAddInquiry() throws Exception {
		
		
	}
	
	public void testDeleteInquiry() throws Exception {
		
		
		
	}
	
	
}
