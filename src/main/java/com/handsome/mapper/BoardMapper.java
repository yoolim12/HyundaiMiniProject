package com.handsome.mapper;

import java.util.List;

import com.handsome.domain.BoardBean;

public interface BoardMapper {
	//public void insert(BoardBean bean);
	// public List<BoardBean> findByRno();
	public List<BoardBean> select(String pid);
	public List<BoardBean> totalCount(String pid);
}
