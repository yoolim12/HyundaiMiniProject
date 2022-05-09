package com.handsome.controller;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.log4j.Log4j;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class CommonController {
	
	@GetMapping("/customLogout")
	public void logoutGET() {
		log.info("custom logout");
		
	}//end logout...

	@GetMapping("/accessError")
	public void accessDenied(Authentication auth, Model model) {
		
		log.info("access Denied : " + auth );
		
		model.addAttribute("msg", "Access Denied");
		
	}//end accce..

}//end comm...
