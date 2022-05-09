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
	
	//@Test
	public void testGetProduct() {
		String pid = "LP2C1102119QCR_XX";
		log.info(service.getProduct(pid));
	}
	
	//@Test
	public void testGetProductList() {
		service.getProductList(new Criteria(3, 3)).forEach(product -> log.info(product));
	}
	
	//@Test
	public void testGetThumbImages() {
		String pid = "LP2C1102119QCR_XX";
		service.getThumbImages(pid).forEach(url -> log.info(url));
	}
	
	//@Test
	public void testGetSmallDetailImages() {
		String pid = "LP2C1102119QCR_XX";
		service.getSmallDetailImages(pid).forEach(url -> log.info(url));
	}
	
	//@Test
	public void testGetBigDetailImages() {
		String pid = "LP2C1102119QCR_XX";
		service.getBigDetailImages(pid).forEach(url -> log.info(url));
	}
	
	//@Test
		public void testGetHugeDetailImage() {
			String pid = "LP2C1102119QCR_XX";
			log.info(service.getHugeDetailImage(pid));
		}
	
	//@Test
	public void testGetColorInfo() {
		String pid = "LP2C1102119QCR_XX";
		service.getColorInfo(pid).forEach(color_info -> log.info(color_info));
	}
	
	@Test
	public void testGetTotal() {
		int total = service.getTotal();
		log.info(total);
	}
	
	//@Test
	public void testAddIntoCart() {
		ProductVO product = new ProductVO();
		product.setPid("FL2B7HCO041LTC_NA");
		product.setOamount(2);
		
		service.addToCart(product);
		log.info("product_id: " + product.getPid());
	}
	
	//@Test
	public void testGetCategoryMedium() {
		Criteria cri = new Criteria();
		cri.setPageNum(1);
		cri.setAmount(12);
		HashMap<String, Object> categoryPager = new HashMap<String, Object>();
		categoryPager.put("cri", cri);
		categoryPager.put("category", "스킨케어");
		
		service.getCategoryMedium(categoryPager).forEach(product -> log.info(product));
	}
	
	//@Test
	public void testGetCategorySmall() {
		Criteria cri = new Criteria();
		cri.setPageNum(1);
		cri.setAmount(12);
		HashMap<String, Object> categoryPager = new HashMap<String, Object>();
		categoryPager.put("cri", cri);
		categoryPager.put("category", "향수");
		
		service.getCategorySmall(categoryPager).forEach(product -> log.info(product));
	}
	
	//@Test
	public void testGetMTotal() {
		int total = service.getMTotal("스킨케어");
		log.info(total);
	}
	
	//@Test
	public void testGetSTotal() {
		int total = service.getSTotal("향수");
		log.info(total);
	}
	
	@Test
	public void testGetCMedium() {
		String cmedium = service.getCMedium("샴푸/컨디셔너");
		log.info(cmedium);
	}
}
