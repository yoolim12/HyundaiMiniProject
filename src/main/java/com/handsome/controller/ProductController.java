package com.handsome.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.handsome.domain.BoardBean;
import com.handsome.domain.Criteria;
import com.handsome.domain.PageDTO;
import com.handsome.domain.ProductColorVO;
import com.handsome.domain.ProductImageVO;
import com.handsome.domain.ProductVO;
import com.handsome.service.BoardService;
import com.handsome.service.ProductService;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/product")
public class ProductController {

	@Autowired
	ProductService productService;
	
	@Autowired
	BoardService boardService;
	
	@RequestMapping("/productDetail")
	public String productDetail(@RequestParam("pid") String pid, Model model) {
		
		log.info("RequestMapping: /productDetail....." + pid);
		
		ProductVO product = productService.getProduct(pid);
		
		List<ProductImageVO> thumb_images = productService.getThumbImages(pid);
		List<ProductImageVO> small_detail_images = productService.getBigDetailImages(pid);
		List<ProductImageVO> big_detail_images = productService.getSmallDetailImages(pid);
		ProductImageVO huge_detail_image = productService.getHugeDetailImage(pid);
		
		List<ProductColorVO> color_info = productService.getColorInfo(pid);
		
		List<BoardBean> countlist = boardService.boardCount(pid);
		
		model.addAttribute("product", product);
		model.addAttribute("thumb_images", thumb_images);
		model.addAttribute("small_detail_images", small_detail_images);
		model.addAttribute("big_detail_images", big_detail_images);
		model.addAttribute("huge_detail_image", huge_detail_image);
		model.addAttribute("color_info", color_info);
		
		model.addAttribute("countlist", countlist);
		
		return "product/productDetail";
	}
	
	@RequestMapping("/productList")
	public void productList(Criteria cri, Model model) {
		
		log.info("RequestMapping: /productList.....");
		List<ProductVO> product_list = productService.getProductList(cri);
		int total = productService.getTotal();
		
		model.addAttribute("product_list", product_list);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		//return "product/productList";
	}
	
	@RequestMapping("/productMList")
	public String productMList(Criteria cri, String category, Model model) {
		
		log.info("RequestMapping: /productMList....." + category);
		HashMap<String, Object> categoryPager = new HashMap<String, Object>();
		categoryPager.put("cri", cri);
		categoryPager.put("category", category);
		model.addAttribute("category", category);
		
		List<ProductVO> product_list = productService.getCategoryMedium(categoryPager);
		int total = productService.getMTotal(category);
		
		model.addAttribute("product_list", product_list);
		log.info(total);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		
		return "product/productMList";
	}
	
	@RequestMapping("/productSList")
	public String productSList(Criteria cri, String category, Model model) {
		
		log.info("RequestMapping: /productSList....." + category);
		HashMap<String, Object> categoryPager = new HashMap<String, Object>();
		categoryPager.put("cri", cri);
		categoryPager.put("category", category);
		model.addAttribute("category_s", category);
		model.addAttribute("category_m", productService.getCMedium(category));
		
		List<ProductVO> product_list = productService.getCategorySmall(categoryPager);
		int total = productService.getSTotal(category);
		
		model.addAttribute("product_list", product_list);
		log.info(total);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		
		return "product/productSList";
	}
	
	@RequestMapping("/addToCart")
	public String addToCart(ProductVO product) {
		
		log.info("RequestMapping: /myCart.....");
		productService.addToCart(product);
		
		return "redirect:/order/orderList?mid=mid";
	}

    @RequestMapping("/qna")
    public String qna(@RequestParam("pid") String pid, Model model){
    	
		List<BoardBean> list = boardService.selectBoard(pid);
		
		model.addAttribute("product_id", pid);
		model.addAttribute("list", list);
	
		return "product/productQnAList";
    }
    
    
	
}
