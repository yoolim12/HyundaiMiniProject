// 작성자 : 최유림
package com.handsome.mapper;

import java.util.List;
import com.handsome.domain.TestBean;

// 쇼핑백 목록 조회할 때 구현할 메서드들을 담은 인터페이스(testMapper.xml에서 구현)
public interface testMapper {
	
	// 쇼핑백 목록 출력해주는 메서드
	public List<TestBean> test(String mid);
	
	// 쇼핑백 목록에서 선택한 상품을 삭제해주는 메서드
	public void delete(String param1, String param2);
	
	// 쇼핑백 목록에서 전체 상품 종류 개수 출력해주는 메서드
	public List<TestBean> totalCount(String mid);
	
	// 쇼핑백에 담긴 상품들의 전체 가격을 출력해주는 메서드
	public List<TestBean> totalPrice(String mid);
}