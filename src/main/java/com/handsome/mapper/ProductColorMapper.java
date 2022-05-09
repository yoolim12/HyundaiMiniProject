package com.handsome.mapper;

import java.util.List;

import com.handsome.domain.ProductColorVO;

public interface ProductColorMapper {
	
	public List<ProductColorVO> selectColorInfo(String pid);
}
