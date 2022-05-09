package com.handsome.mapper;

import java.util.List;

import com.handsome.domain.TestBean;

public interface testMapper {
	public List<TestBean> test(String mid);
	public void delete(String param1, String param2);
	
	public List<TestBean> totalCount(String mid);
	
	public List<TestBean> totalPrice(String mid);
}
