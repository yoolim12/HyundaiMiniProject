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

}	
