package com.handsome.mapper;

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
 *  1. testSelectProduct				: 상품 상세 정보 조회 테스트
 *  2. testSelectProductListWithPaging	: 대분류 상품 목록 조회(페이징 처리) 테스트
 *  3. testSelectProductList			: 대분류 상품 목록 조회(페이징 미처리) 테스트
 *  4. testCountTotal					: 대분류 상품 개수 조회 테스트
 *  5. testCountMTotal					: 중분류 상품 개수 조회 테스트
 *  6. testCountSTotal					: 소분류 상품 개수 조회 테스트
 *  7. testInsertIntoCart				: 쇼핑백에 상품 추가 테스트
 *  8. testSelectCategoryMedium			: 중분류 상품 목록 조회(페이징 처리) 테스트
 *  9. testSelectCategorySmall			: 소분류 상품 목록 조회(페이징 처리) 테스트
 *  10. testFindCategoryMedium			: 해당 소분류가 속한 중분류 조회 테스트
 */

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ProductMapperTests {

	@Autowired
	private ProductMapper mapper;
	
	@Test
	public void testProductMapper() {
		log.info(mapper);
	}
	
	// 상품 상세 정보 조회 테스트
	//@Test
	public void testSelectProduct() {  // 상품 품번 지정 후 정보 조회 테스트
		ProductVO product = mapper.selectProduct("LP2C1102119QCR_XX");
		log.info(product);
	}
	
	// 대분류 상품 목록 조회(페이징 처리) 테스트
	//@Test
	public void testSelectProductListWithPaging() {  // 페이지 번호와 상품 개수 지정 후 목록 조회 테스트
		Criteria cri = new Criteria();
		cri.setPageNum(3);
		cri.setAmount(12);
		mapper.selectProductListWithPaging(cri).forEach(product -> log.info(product));
	}
	
	// 대분류 상품 목록 조회(페이징 미처리) 테스트
	//@Test
	public void testSelectProductList() {
		mapper.selectProductList().forEach(product -> log.info(product));
	}
	
	// 대분류 상품 개수 조회 테스트
	//@Test
	public void testCountTotal() {
		int total = mapper.countTotal();
		log.info(total);
	}
	
	// 중분류 상품 개수 조회 테스트
	//@Test
	public void testCountMTotal() {  // 중분류 지정 후 개수 조회 테스트
		int total = mapper.countMTotal("스킨케어");
		log.info(total);
	}
	
	// 소분류 상품 개수 조회 테스트
	//@Test
	public void testCountSTotal() {  // 소분류 지정 후 개수 조회 테스트
		int total = mapper.countSTotal("향수");
		log.info(total);
	}
	
	// 쇼핑백에 상품 추가 테스트
	//@Test
	public void testInsertIntoCart() {  // 상품 품번과 수량 지정 후, 상품 추가 테스트
		ProductVO product = new ProductVO();
		product.setPid("LP2C1102119QCR_XX");
		product.setOamount(3);
		mapper.insertIntoCart(product);
		log.info(product);
	}
	
	// 중분류 상품 목록 조회(페이징 처리) 테스트
	//@Test
	public void testSelectCategoryMedium() {  // 페이지 번호와 상품 개수, 중분류 지정 후 목록 조회 테스트
		Criteria cri = new Criteria();
		cri.setPageNum(1);
		cri.setAmount(12);
		HashMap<String, Object> categoryPager = new HashMap<String, Object>();
		categoryPager.put("cri", cri);
		categoryPager.put("category", "스킨케어");
		mapper.selectCategoryMedium(categoryPager).forEach(product -> log.info(product));
	}
	
	// 소분류 상품 목록 조회(페이징 처리) 테스트
	//@Test
	public void testSelectCategorySmall() {  // 페이지 번호와 상품 개수, 소분류 지정 후 목록 조회 테스트
		Criteria cri = new Criteria();
		cri.setPageNum(1);
		cri.setAmount(12);
		HashMap<String, Object> categoryPager = new HashMap<String, Object>();
		categoryPager.put("cri", cri);
		categoryPager.put("category", "향수");
		mapper.selectCategorySmall(categoryPager).forEach(product -> log.info(product));
	}
	
	// 해당 소분류가 속한 중분류 조회 테스트
	@Test
	public void testFindCMedium() {  // 소분류 지정 후, 해당하는 중분류 조회 테스트
		String cmedium = mapper.findCategoryMedium("샴푸/컨디셔너");
		log.info(cmedium);
	}
	
	
}
