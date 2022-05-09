package com.handsome.controller;

import javax.inject.Inject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.handsome.domain.TestBean;
import com.handsome.service.TestService;

import java.util.List;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/order")
public class BasketController {
	@Inject
    private TestService service;
   
   @RequestMapping(value = "/orderList", method=RequestMethod.GET)
   public String basket(@RequestParam("mid") String mid, Model model) throws Exception {
	   log.info("mid:" +mid);
	   List<TestBean> list = service.selectTest(mid);
       List<TestBean> countlist = service.selectCount(mid);
       List<TestBean> pricelist = service.selectPrice(mid);
       
       model.addAttribute("list", list);
       model.addAttribute("countlist", countlist);
       model.addAttribute("pricelist", pricelist);
       
       log.info("list: " +list);
       
	   return "order/orderList";
   }
   
   @RequestMapping(value = "/delete", method=RequestMethod.GET)
   public String basketDelete(@RequestParam("param1") String param1, @RequestParam("param2") String param2, Model model) throws Exception {
	   service.deleteTest(param1, param2);
	   return "redirect:/order/orderList?mid=mid";
   }
}