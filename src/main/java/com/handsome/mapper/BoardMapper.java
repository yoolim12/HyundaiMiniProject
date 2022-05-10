// 작성자 : 최유림
package com.handsome.mapper;

import java.util.List;
import com.handsome.domain.BoardBean;

// 상품 Q&A 게시판 목록을 조회할 때 구현할 메서드들을 담은 인터페이스(BoardMapper.xml에서 구현)
public interface BoardMapper {
	// Q&A 게시판 내에 있는 작성글 목록 출력해주는 메서드
	public List<BoardBean> select(String pid);
	
	// Q&A 게시판 내에 있는 작성글 개수를 출력해주는 메서드
	public List<BoardBean> totalCount(String pid);
}
