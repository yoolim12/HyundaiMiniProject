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
	
	//@Test
	public void testSelectProduct() {
		ProductVO product = mapper.selectProduct("LP2C1102119QCR_XX");
		log.info(product);
	}
	
	//@Test
	public void testSelectProductList() {
		mapper.selectProductList().forEach(product -> log.info(product));
	}
	
	//@Test
	public void testSelectProductListWithPaging() {
		Criteria cri = new Criteria();
		cri.setPageNum(3);
		cri.setAmount(12);
		mapper.selectProductListWithPaging(cri).forEach(product -> log.info(product));
	}
	
	//@Test
	public void testCountTotal() {
		int total = mapper.countTotal();
		log.info(total);
	}
	
	//@Test
	public void testInsertIntoCart() {
		ProductVO product = new ProductVO();
		product.setPid("LP2C1102119QCR_XX");
		product.setOamount(3);
		mapper.insertIntoCart(product);
		log.info(product);
	}
	
	//@Test
	public void testSelectCategoryMedium() {
		Criteria cri = new Criteria();
		cri.setPageNum(1);
		cri.setAmount(12);
		HashMap<String, Object> categoryPager = new HashMap<String, Object>();
		categoryPager.put("cri", cri);
		categoryPager.put("category", "스킨케어");
		mapper.selectCategoryMedium(categoryPager).forEach(product -> log.info(product));
	}

	//@Test
	public void testSelectCategorySmall() {
		Criteria cri = new Criteria();
		cri.setPageNum(1);
		cri.setAmount(12);
		HashMap<String, Object> categoryPager = new HashMap<String, Object>();
		categoryPager.put("cri", cri);
		categoryPager.put("category", "향수");
		mapper.selectCategorySmall(categoryPager).forEach(product -> log.info(product));
	}
	
	//@Test
	public void testCountMTotal() {
		int total = mapper.countMTotal("스킨케어");
		log.info(total);
	}
	
	//@Test
	public void testCountSTotal() {
		int total = mapper.countSTotal("향수");
		log.info(total);
	}
	
	@Test
	public void testFindCMedium() {
		String cmedium = mapper.findCategoryMedium("샴푸/컨디셔너");
		log.info(cmedium);
	}
	
	
}
