package com.handsome.mapper;

import java.util.List;

import com.handsome.domain.ProductImageVO;

public interface ProductImageMapper {
	
	public List<ProductImageVO> selectThumbImages(String pid);
	
	public List<ProductImageVO> selectSmallDetailImages(String pid);
	
	public List<ProductImageVO> selectBigDetailImages(String pid);
	
	public ProductImageVO selectHugeDetailImage(String pid);
	
}
