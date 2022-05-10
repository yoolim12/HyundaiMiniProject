// 작성자 : 최유림
package com.handsome.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.handsome.domain.BoardBean;
import com.handsome.mapper.BoardMapper;

import lombok.extern.slf4j.Slf4j; 

@Service // 해당 클래스가 비즈니스 로직을 담은 Service 클래스임을 명시
@Slf4j
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private BoardMapper mapper; // 상품 Q&A 게시판 조회에 필요한 메서드들을 담은 mapper
	
	// 상품 Q&A 목록 조회 서비스를 제공하는 메서드, 파라미터로 상품 id인 pid를 받는다.
	@Override
	public List<BoardBean> selectBoard(String pid) {
		log.info("list: "+mapper.select(pid));
    	return mapper.select(pid); // 상품 Q&A 게시판 mapper의 select 메서드 실행하여 목록 조회에 필요한 요소들을 가져온다.
	}

	// 상품 Q&A 작성글 개수 출력 기능을 제공하는 메서드, 파라미터로 상품 id인 pid를 받는다.
	@Override
	public List<BoardBean> boardCount(String pid) {
		log.info("list:" +mapper.totalCount(pid));
		return mapper.totalCount(pid);  // 상품 Q&A 게시판 mapper의 totalCount 메서드를 실행하여 게시글 개수를 불러온다.
	}
}
