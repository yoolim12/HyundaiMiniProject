package com.handsome.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.handsome.domain.Criteria;
import com.handsome.domain.ProductColorVO;
import com.handsome.domain.ProductImageVO;
import com.handsome.domain.ProductVO;
import com.handsome.mapper.ProductColorMapper;
import com.handsome.mapper.ProductImageMapper;
import com.handsome.mapper.ProductMapper;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class ProductServiceImpl implements ProductService {
	
	@Autowired
	private ProductMapper productMapper;
	
	@Autowired
	private ProductImageMapper productImageMapper;
	
	@Autowired
	private ProductColorMapper productColorMapper;
	
	@Override
	public ProductVO getProduct(String pid) {
		log.info("Get Product ....." + pid);
		return productMapper.selectProduct(pid);
	}

	@Override
	public List<ProductVO> getProductList(Criteria cri) {
		log.info("Get Product List .....");
		return productMapper.selectProductListWithPaging(cri);
	}

	@Override
	public List<ProductImageVO> getThumbImages(String pid) {
		log.info("Get Thumb ....." + pid);
		return productImageMapper.selectThumbImages(pid);
	}

	@Override
	public List<ProductImageVO> getSmallDetailImages(String pid) {
		log.info("Get Small Detail ....." + pid);
		return productImageMapper.selectSmallDetailImages(pid);
	}

	@Override
	public List<ProductImageVO> getBigDetailImages(String pid) {
		log.info("Get Big Detail ....." + pid);
		return productImageMapper.selectBigDetailImages(pid);
	}

	@Override
	public ProductImageVO getHugeDetailImage(String pid) {
		log.info("Get Huge Detail ....." + pid);
		return productImageMapper.selectHugeDetailImage(pid);
	}
	
	@Override
	public List<ProductColorVO> getColorInfo(String pid) {
		log.info("Get Color Info ....." + pid);
		return productColorMapper.selectColorInfo(pid);
	}
	
	@Override
	public int getTotal() {
		int count = productMapper.countTotal();
		log.info("Get Total Count ....." + count);
		return count;
	}

	@Override
	public void addToCart(ProductVO product) {
		log.info("Add to Cart ....." + product);
		productMapper.insertIntoCart(product);
	}

	@Override
	public List<ProductVO> getCategoryMedium(HashMap<String, Object> pager) {
		
		log.info("Get Product CMEDIUM ....." + pager);
		return productMapper.selectCategoryMedium(pager);
	}

	@Override
	public List<ProductVO> getCategorySmall(HashMap<String, Object> pager) {
		log.info("Get Product CSMALL ....." + pager);
		return productMapper.selectCategorySmall(pager);
	}

	@Override
	public int getMTotal(String category) {
		int count = productMapper.countMTotal(category);
		log.info("Get Total MCount ....." + category);
		return count;
	}

	@Override
	public int getSTotal(String category) {
		int count = productMapper.countSTotal(category);
		log.info("Get Total SCount ....." + category);
		return count;
	}

	@Override
	public String getCMedium(String category) {
		String cmedium = productMapper.findCategoryMedium(category);
		log.info("Get CMedium include ....." + category);
		return cmedium;
	}

}
