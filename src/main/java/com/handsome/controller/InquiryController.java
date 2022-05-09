package com.handsome.controller;

import com.handsome.domain.InquiryVO;
import com.handsome.service.InquiryService;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

/*  이지은 작성
 *  1:1 문의 관련 기능을 수행하는 Controller
 *
 *  1. /myPage/myInquiry        : 나의 1:1 문의 조회
 *  2. /myPage/writeInquiry		: 1:1 문의 작성 페이지
 *  3. /myPage/removeInquiry	: 1:1 문의 삭제 기능
 */

@Log4j
@Controller
public class InquiryController {

    @Autowired
    InquiryService inquiryService;

    /*  이지은 작성
     *  내 1:1 문의 페이지   */
    @RequestMapping("/myPage/myInquiry")
    public String myInquiry(Model model) {

        log.info("RequestMapping: /myInquiry.....");

        List<InquiryVO> inquiry_list = inquiryService.getInquiryList("olzlrlo");  // 로그인한 회원의 문의 목록 조회
        model.addAttribute("inquiry_list", inquiry_list);  // model에 문의 리스트 추가

        return "myPage/myInquiry";
    }

    /*  이지은 작성
     *  1:1 문의 등록 페이지   */
    @GetMapping("/myPage/writeInquiry")
    public void writeInquiry() {}

    @PostMapping("/myPage/writeInquiry")
    public String writeInquiry(InquiryVO inquiry) {

        log.info("PostMapping: /writeInquiry.....");
        inquiryService.addInquiry(inquiry);  // 회원이 작성한 문의 등록

        return "redirect:/myPage/myInquiry";  // 문의 등록 후 문의 목록 페이지로 redirect
    }

    /*  이지은 작성
     *  1:1 문의 등록 페이지   */
    @GetMapping("/myPage/removeInquiry")
    public String removeInquiry(@RequestParam("qid") int qid) {

        log.info("GetMapping: /removeInquiry.....");
        inquiryService.deleteInquiry(qid);  // 로그인한 회원의 해당 문의 삭제

        return "redirect:/myPage/myInquiry";  // 문의 삭제 후 목록 페이지로 redirect
    }
}
