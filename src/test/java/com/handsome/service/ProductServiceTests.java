package com.handsome.service;

import static org.junit.Assert.assertNotNull;

import java.util.HashMap;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.handsome.domain.Criteria;
import com.handsome.domain.ProductVO;

import lombok.extern.log4j.Log4j;

/*  이지은 작성
 *  상품  관련 Mapper 테스트
 *  
 *  1. testGetProduct			: 상품 상세 정보 조회 테스트
 *  2. testGetProductList		: 대분류 상품 목록 조회(페이징 처리) 테스트
 *  3. testGetThumbImages		: 상품 섬네일 이미지 조회 테스트
 *  4. testGetSmallDetailImages	: 상품 상세 이미지(작은 사이즈) 조회 테스트
 *  5. testGetBigDetailImages	: 상품 상세 이미지(중간 사이즈) 조회 테스트
 *  6. testGetHugeDetailImage	: 상품 상세 이미지(큰 사이즈) 조회 테스트
 *  7. testGetColorInfo			: 상품 컬러 정보 조회 테스트
 *  8. testGetTotal				: 대분류 상품 개수 조회 테스트
 *  9. testAddIntoCart			: 쇼핑백에 상품 추가 테스트
 *  10. testGetCategoryMedium	: 중분류 상품 목록 조회(페이징 처리) 테스트
 *  11. testGetCategorySmall	: 소분류 상품 목록 조회(페이징 처리) 테스트
 *  12. testGetMTotal			: 중분류 상품 개수 조회 테스트
 *  13. testGetSTotal			: 소분류 상품 개수 조회 테스트
 *  14. testGetCMedium			: 해당 소분류를 포함하는 중분류 조회 테스트
 */

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ProductServiceTests {
	
	@Autowired
	private ProductService service;
	
	@Test
	public void testExists() {
		log.info(service);
		assertNotNull(service);		
	}
	
	// 상품 상세 정보 조회 테스트
	//@Test
	public void testGetProduct() {  // 상품 품번 지정 후 상세 정보 조회 테스트
		String pid = "LP2C1102119QCR_XX";
		log.info(service.getProduct(pid));
	}
	
	// 대분류 상품 목록 조회(페이징 처리) 테스트
	//@Test
	public void testGetProductList() {  // 페이지 번호, 상품 개수 지정 후 목록 조회 테스트
		service.getProductList(new Criteria(3, 3)).forEach(product -> log.info(product));
	}
	
	// 상품 섬네일 이미지 조회 테스트
	//@Test
	public void testGetThumbImages() {  // 상품 품번 지정 후 섬네일 이미지 조회 테스트
		String pid = "LP2C1102119QCR_XX";
		service.getThumbImages(pid).forEach(url -> log.info(url));
	}
	
	// 상품 상세 이미지(작은 사이즈) 조회 테스트
	//@Test
	public void testGetSmallDetailImages() {  // 상품 품번 지정 후 상세 이미지 조회 테스트
		String pid = "LP2C1102119QCR_XX";
		service.getSmallDetailImages(pid).forEach(url -> log.info(url));
	}
	
	// 상품 상세 이미지(중간 사이즈) 조회 테스트
	//@Test
	public void testGetBigDetailImages() {  // 상품 품번 지정 후 상세 이미지 조회 테스트
		String pid = "LP2C1102119QCR_XX";
		service.getBigDetailImages(pid).forEach(url -> log.info(url));
	}
	
	// 상품 상세 이미지(큰 사이즈) 조회 테스트
	//@Test
		public void testGetHugeDetailImage() {  // 상품 품번 지정 후 상세 이미지 조회 테스트
			String pid = "LP2C1102119QCR_XX";
			log.info(service.getHugeDetailImage(pid));
		}
	
	// 상품 컬러 정보 조회 테스트
	//@Test
	public void testGetColorInfo() {  // 상품 품번 지정 후 컬러 정보 조회 테스트
		String pid = "LP2C1102119QCR_XX";
		service.getColorInfo(pid).forEach(color_info -> log.info(color_info));
	}
	
	// 대분류 상품 개수 조회 테스트
	@Test
	public void testGetTotal() {  // 대분류 상품 개수 조회 테스트
		int total = service.getTotal();
		log.info(total);
	}
	
	// 쇼핑백에 상품 추가 테스트
	//@Test
	public void testAddIntoCart() {  // 상품 품번, 수량 지정 후 쇼핑백 상품 추가 테스트
		ProductVO product = new ProductVO();
		product.setPid("FL2B7HCO041LTC_NA");
		product.setOamount(2);
		
		service.addToCart(product);
		log.info("product_id: " + product.getPid());
	}
	
	// 중분류 상품 목록 조회(페이징 처리) 테스트
	//@Test
	public void testGetCategoryMedium() {  // 페이지 번호, 상품 개수, 중분류 지정 후 목록 조회 테스트
		Criteria cri = new Criteria();
		cri.setPageNum(1);
		cri.setAmount(12);
		HashMap<String, Object> categoryPager = new HashMap<String, Object>();
		categoryPager.put("cri", cri);
		categoryPager.put("category", "스킨케어");
		
		service.getCategoryMedium(categoryPager).forEach(product -> log.info(product));
	}
	
	// 소분류 상품 목록 조회(페이징 처리) 테스트
	//@Test
	public void testGetCategorySmall() {  // 페이지 번호, 상품 개수, 소분류 지정 후 목록 조회 테스트
		Criteria cri = new Criteria();
		cri.setPageNum(1);
		cri.setAmount(12);
		HashMap<String, Object> categoryPager = new HashMap<String, Object>();
		categoryPager.put("cri", cri);
		categoryPager.put("category", "향수");
		
		service.getCategorySmall(categoryPager).forEach(product -> log.info(product));
	}
	
	// 중분류 상품 개수 조회 테스트
	//@Test
	public void testGetMTotal() {  // 중분류 지정 후 상품 개수 조회 테스트
		int total = service.getMTotal("스킨케어");
		log.info(total);
	}
	
	// 소분류 상품 개수 조회 테스트
	//@Test
	public void testGetSTotal() {  // 소분류 지정 후 상품 개수 조회 테스트
		int total = service.getSTotal("향수");
		log.info(total);
	}
	
	// 해당 소분류를 포함하는 중분류 조회 테스트
	@Test
	public void testGetCMedium() {  // 소분류 지정 후 해당하는 중분류 조회 테스트
		String cmedium = service.getCMedium("샴푸/컨디셔너");
		log.info(cmedium);
	}
}
