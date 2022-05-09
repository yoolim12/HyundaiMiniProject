package com.handsome;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.handsome.domain.InquiryVO;
import com.handsome.domain.PageDTO;
import com.handsome.domain.ProductVO;
import com.handsome.service.InquiryService;
import com.handsome.service.ProductService;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class HomeController {
	
	@RequestMapping(value = {"/", "/home", "/main", "/index"})
	public String main() {
		return "redirect:/mainpage";
	}
	
	@RequestMapping(value="/mainpage")
	public String mainpage() {
		return "mainpage";
	}
	
	@RequestMapping(value="/mypage")
	public String mypage() {
		return "myPage/main";
	}
	
	@Autowired
	InquiryService inquiryService;
	
	@RequestMapping("/myPage/myInquiry")
	public String myInquiry(Model model) {
		
		log.info("RequestMapping: /myInquiry.....");
		List<InquiryVO> inquiry_list = inquiryService.getInquiryList("olzlrlo");
		
		model.addAttribute("inquiry_list", inquiry_list);
		//return "product/productList";
		
		
		return "myPage/myInquiry";
	}
	
	@GetMapping("/myPage/writeInquiry")
	public void writeInquiry() {}
	
	@PostMapping("/myPage/writeInquiry")
	public String writeInquiry(InquiryVO inquiry) {
		
		log.info("PostMapping: /writeInquiry.....");
		log.info(inquiry.getQcontent());
		log.info(inquiry.getQtitle());
		System.out.println("제목: "+inquiry.getQcontent());
		System.out.println("내용: " + inquiry.getQtitle());
		inquiryService.addInquiry(inquiry);
		return "redirect:/myPage/myInquiry";
	}
	
	@GetMapping("/myPage/removeInquiry")
	public String remove(@RequestParam("qid") int qid) {
		
		log.info("GetMapping: /removeInquiry.....");
		inquiryService.deleteInquiry(qid);
		
		return "redirect:/myPage/myInquiry";
	}
}	
