package com.handsome.mapper;

import java.util.HashMap;
import java.util.List;

import com.handsome.domain.Criteria;
import com.handsome.domain.ProductVO;

public interface ProductMapper {
	
	public ProductVO selectProduct(String pid);
	
	public List<ProductVO> selectProductListWithPaging(Criteria cri);
	
	public List<ProductVO> selectProductList();
	
	public int countTotal();
	
	public int countMTotal(String category);
	
	public int countSTotal(String category);
	
	public void insertIntoCart(ProductVO product);
	
	public List<ProductVO> selectCategoryMedium(HashMap<String, Object> pager);
	
	public List<ProductVO> selectCategorySmall(HashMap<String, Object> pager);
	
	public String findCategoryMedium(String category);
}

