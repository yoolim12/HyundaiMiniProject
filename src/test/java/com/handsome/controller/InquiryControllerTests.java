package com.handsome.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

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
 *  1:1문의 관련 기능을 수행하는 InquiryController를 Test
 *
 *  1. testInquiryList()	: 나의 1:1 문의 페이지 테스트
 *  2. testWriteInquiry()	: 1:1 문의 등록 기능 테스트
 *  3. testRemoveInquiry()	: 1:1 문의 삭제 기능 테스트
 */

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml",
        "file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
@Log4j
public class InquiryControllerTests {

    @Autowired
    private WebApplicationContext ctx;

    private MockMvc mockMvc;

    @Before
    public void setup() {
        this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
    }

    // 나의 1:1 문의 테스트
    //@Test
    public void testInquiryList() throws Exception {
        log.info(
                mockMvc.perform(  // 특정 회원의 문의 목록 페이지 test
                                MockMvcRequestBuilders.get("/myPage/myInquiry"))
                        .andExpect(status().isOk())
                        .andReturn()
                        .getModelAndView()
                        .getModelMap()
        );
    }

    // 1:1 문의 등록 기능 테스트
    @Test
    public void testWriteInquiry() throws Exception {
        ModelMap resultPage = mockMvc.perform( // 문의 제목과 문의 내용 지정 후, 등록 기능 테스트
                        MockMvcRequestBuilders.post("/myPage/writeInquiry")
                                .param("qtitle", "테스트")
                                .param("qcontent", "테스트"))
                .andReturn()
                .getModelAndView()
                .getModelMap();

        log.info(resultPage);
    }

    // 1:1 문의 삭제 기능 테스트
    @Test
    public void testRemoveInquiry() throws Exception {
        log.info(
                mockMvc.perform(  // 문의 번호 지정 후, 삭제 기능 테스트
                                MockMvcRequestBuilders.get("/myPage/removeInquiry")
                                        .param("qid", "1"))
                        .andReturn()
                        .getModelAndView()
                        .getModelMap()
        );
    }
}