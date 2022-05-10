// 작성자 : 최유림
package com.handsome.service;

import java.util.List;
import com.handsome.domain.BoardBean;

// 상품 Q&A 조회에 필요한 서비스를 제공하기 위한 인터페이스(BoardServiceImpl.java에서 구현)
public interface BoardService {
	
	// 상품 Q&A 목록 조회 서비스를 제공하는 메서드, 파라미터로 상품 id인 pid를 받는다.
	public List<BoardBean> selectBoard(String pid);
	
	// 상품 Q&A 작성글 개수 출력 기능을 제공하는 메서드, 파라미터로 상품 id인 pid를 받는다.
	public List<BoardBean> boardCount(String pid);
}