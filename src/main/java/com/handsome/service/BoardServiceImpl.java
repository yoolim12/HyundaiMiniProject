package com.handsome.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.handsome.domain.BoardBean;
import com.handsome.mapper.BoardMapper;

import lombok.extern.slf4j.Slf4j; 

@Service
@Slf4j
public class BoardServiceImpl implements BoardService {
	@Autowired
	private BoardMapper mapper;
	
	@Override
	public List<BoardBean> selectBoard(String pid) {
		log.info("list: "+mapper.select(pid));
    	return mapper.select(pid);
	}

	@Override
	public List<BoardBean> boardCount(String pid) {
		log.info("list:" +mapper.totalCount(pid));
		return mapper.totalCount(pid);
	}
}
