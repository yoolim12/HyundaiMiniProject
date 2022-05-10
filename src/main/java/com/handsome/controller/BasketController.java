// 작성자 : 최유림
package com.handsome.controller;

import javax.inject.Inject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.handsome.domain.TestBean;
import com.handsome.service.TestService;

import java.util.List;

import lombok.extern.slf4j.Slf4j;


@Slf4j
@Controller
@RequestMapping("/order") // 쇼핑백 관련 기능은 "/order" url로 이동
public class BasketController {
	@Inject
    private TestService service; // 쇼핑백 관련 서비스를 제공해주는 객체
   
	/* 쇼핑백 조회를 할 때  "/order/orderList" url로 이동, 파라미터로 사용자 id인 mid를 받아서 해당 사용자의 쇼핑백을 조회 */
   @RequestMapping(value = "/orderList", method=RequestMethod.GET)
   public String basket(@RequestParam("mid") String mid, Model model) throws Exception {
	   log.info("mid:" +mid);
	   
	   /* 사용자의 쇼핑백 목록 조회에 필요한 상품명, 상품이미지, 가격, 수량, 상품 id, 브랜드명을 list에 담는다. */
	   List<TestBean> list = service.selectTest(mid);
	   
	   /* 쇼핑백 안에 있는 상품 종류 개수를 countlist에 담는다. */
       List<TestBean> countlist = service.selectCount(mid);
       
       /* 쇼핑백 안에 있는 상품의 총 가격을 pricelist에 담는다. */
       List<TestBean> pricelist = service.selectPrice(mid);
       
       /* model에 위에서 생성한 3개의 리스트들을 추가 */
       model.addAttribute("list", list);
       model.addAttribute("countlist", countlist);
       model.addAttribute("pricelist", pricelist);
       
       log.info("list: " +list);
       
       /* order 폴더의 orderList.jsp을 띄운다. */
	   return "order/orderList";
   }
   
   /* 쇼핑백 내의 상품 삭제를 할 때  "/order/delete" url로 이동, 파라미터로 상품id(param1)와 사용자 id인 mid(param2)를 받아서 해당 사용자의 쇼핑백 내의 상품 삭제 */
   @RequestMapping(value = "/delete", method=RequestMethod.GET)
   public String basketDelete(@RequestParam("param1") String param1, @RequestParam("param2") String param2, Model model) throws Exception {
	   /* service 내의 쇼핑백 삭제 기능에 해당하는 deleteTest를 실행한다. */
	   service.deleteTest(param1, param2);
	   
	   /* 삭제 작업을 처리한 뒤 다시 쇼핑백 조회 url로 이동한다. */
	   return "redirect:/order/orderList?mid="+param2;
   }
}