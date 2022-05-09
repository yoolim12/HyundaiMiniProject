package com.handsome.service;

import java.util.HashMap;
import java.util.List;

import com.handsome.domain.Criteria;
import com.handsome.domain.ProductColorVO;
import com.handsome.domain.ProductImageVO;
import com.handsome.domain.ProductVO;

public interface ProductService {
	
	public ProductVO getProduct(String pid);
	
	//public List<ProductVO> getProductList();
	
	public List<ProductVO> getProductList(Criteria cri);
	
	public List<ProductImageVO> getThumbImages(String pid);
	
	public List<ProductImageVO> getSmallDetailImages(String pid);
	
	public List<ProductImageVO> getBigDetailImages(String pid);
	
	public ProductImageVO getHugeDetailImage(String pid);
	
	public List<ProductColorVO> getColorInfo(String pid);
	
	public int getTotal();
	
	public void addToCart(ProductVO product);
	
	public List<ProductVO> getCategoryMedium(HashMap<String, Object> pager);
	
	public List<ProductVO> getCategorySmall(HashMap<String, Object> pager);
	
	public int getMTotal(String category);
	
	public int getSTotal(String category);
	
	public String getCMedium(String category);
	
}
