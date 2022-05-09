package com.handsome.service;

import java.util.List;

import com.handsome.domain.BoardBean;

public interface BoardService {
	public List<BoardBean> selectBoard(String pid);
	
	public List<BoardBean> boardCount(String pid);
}
