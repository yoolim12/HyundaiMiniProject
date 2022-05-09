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

/*  이지은, 최유림 작성
 *  더한섬닷컴의 상품 관련 기능을 수행하는 Controller
 *  
 *  1. /product/productDetail	: 상품 상세 페이지 		- 이지은
 *  2. /product/productList		: 상품 목록(대분류) 페이지	- 이지은
 *  3. /product/productMLIst	: 상품 목록(중분류) 페이지	- 이지은
 *  4. /product/productSList: 	: 상품 목록(소분류) 페이지	- 이지은
 *  5. /product/addToCart: 		: 쇼핑백 상품 추가 기능		- 이지은
 *  6. /product/qna				: 상품 Q&A 페이지 		- 최유림
 */

@Log4j
@Controller
@RequestMapping("/product")
public class ProductController {

	@Autowired
	ProductService productService;
	
	@Autowired
	BoardService boardService;
	
	/*  이지은 작성
	 *  상품 상세 페이지   */
	@RequestMapping("/productDetail")
	public String productDetail(@RequestParam("pid") String pid, Model model) {
		
		log.info("RequestMapping: /productDetail....." + pid);
		
		// 해당 상품의 정보 조회
		ProductVO product = productService.getProduct(pid);
		
		// 해당 상품의 이미지 주소 저장
		List<ProductImageVO> thumb_images = productService.getThumbImages(pid);
		List<ProductImageVO> small_detail_images = productService.getBigDetailImages(pid);
		List<ProductImageVO> big_detail_images = productService.getSmallDetailImages(pid);
		ProductImageVO huge_detail_image = productService.getHugeDetailImage(pid);
		
		// 해당 상품의 컬러 정보 저장
		List<ProductColorVO> color_info = productService.getColorInfo(pid);
		
		// 해당 상품의 Q&A 개수 저장
		List<BoardBean> countlist = boardService.boardCount(pid);
		
		// model에 해당 상품의 상세 정보 추가
		model.addAttribute("product", product);
		model.addAttribute("thumb_images", thumb_images);
		model.addAttribute("small_detail_images", small_detail_images);
		model.addAttribute("big_detail_images", big_detail_images);
		model.addAttribute("huge_detail_image", huge_detail_image);
		model.addAttribute("color_info", color_info);
		model.addAttribute("countlist", countlist);
		
		return "product/productDetail";
	}
	
	/*  이지은 작성
	 *  상품 목록(대분류) 페이지   */
	@RequestMapping("/productList")
	public void productList(Criteria cri, Model model) {
		
		log.info("RequestMapping: /productList.....");
		
		List<ProductVO> product_list = productService.getProductList(cri);  // 뷰티(대분류) 상품 리스트 조회
		int total = productService.getTotal();  // 뷰티(대분류) 상품 개수 조회
		
		model.addAttribute("product_list", product_list);  // model에 뷰티(대분류) 상품 리스트 추가
		model.addAttribute("pageMaker", new PageDTO(cri, total));  // 페이징 처리를 위한 데이터 추가 
	}
	
	/*  이지은 작성
	 *  상품 목록(중분류) 페이지   */
	@RequestMapping("/productMList")
	public String productMList(Criteria cri, String category, Model model) {
		
		log.info("RequestMapping: /productMList....." + category);
		
		// 카테고리 분류를 위해 필요한 데이터 저장
		HashMap<String, Object> categoryPager = new HashMap<String, Object>();
		categoryPager.put("cri", cri);
		categoryPager.put("category", category);
		model.addAttribute("category", category);
		
		List<ProductVO> product_list = productService.getCategoryMedium(categoryPager);  // 중분류 상품 리스트 조회
		int total = productService.getMTotal(category);  // 중분류 상품 개수 조회
		
		model.addAttribute("product_list", product_list);  // model에 중분류 상품 리스트 추가
		model.addAttribute("pageMaker", new PageDTO(cri, total));  // 페이징 처리를 위한 데이터 추가
		
		return "product/productMList";
	}
	
	/*  이지은 작성
	 *  상품 목록(소분류) 페이지   */
	@RequestMapping("/productSList")
	public String productSList(Criteria cri, String category, Model model) {
		
		log.info("RequestMapping: /productSList....." + category);
		
		// 카테고리 분류를 위해 필요한 데이터 저장
		HashMap<String, Object> categoryPager = new HashMap<String, Object>();
		categoryPager.put("cri", cri);
		categoryPager.put("category", category);
		model.addAttribute("category_s", category);
		model.addAttribute("category_m", productService.getCMedium(category));  // 해당 소분류를 포함하는 중분류 조회
		
		List<ProductVO> product_list = productService.getCategorySmall(categoryPager);  // 소분류 상품 리스트 조회
		int total = productService.getSTotal(category);  // 소분류 상품 개수 조회
		
		model.addAttribute("product_list", product_list);  // model에 소분류 상품 리스트 추가
		model.addAttribute("pageMaker", new PageDTO(cri, total));  // 페이징 처리를 위한 데이터 추가
		
		return "product/productSList";
	}
	
	/*  이지은 작성
	 *  쇼핑백 상품 추가 기능   */
	@RequestMapping("/addToCart")
	public String addToCart(ProductVO product) {
	
		log.info("RequestMapping: /myCart.....");
		productService.addToCart(product);  // 해당 상품을 쇼핑백에 추가
		
		return "redirect:/order/orderList?mid=mid";  // 상품 추가 후 쇼핑백 페이지로 이동
	}
	
	/*  최유림 작성
	 *  상품 Q&A 페이지   */
    @RequestMapping("/qna")
    public String qna(@RequestParam("pid") String pid, Model model){
    	
		List<BoardBean> list = boardService.selectBoard(pid);  // 해당 상품의 Q&A 조회
		
		// model에 Q&A 관련 데이터 추가
		model.addAttribute("product_id", pid);
		model.addAttribute("list", list);
	
		return "product/productQnAList";
    }
    
}
