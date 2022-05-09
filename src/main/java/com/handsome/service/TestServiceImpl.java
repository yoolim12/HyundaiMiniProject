package com.handsome.service;
 
import java.util.List;
 
import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.handsome.domain.TestBean;
import com.handsome.mapper.testMapper;

import lombok.extern.log4j.Log4j;
import lombok.extern.slf4j.Slf4j; 
 
@Service
@Slf4j
public class TestServiceImpl implements TestService {
	@Autowired
	private testMapper mapper;     
    
    @Override
    public List<TestBean> selectTest(String mid) throws Exception {
        // TODO Auto-generated method stub
        //return dao.selectTest();
    	log.info("list: "+mapper.test(mid));
    	return mapper.test(mid);
    }
    
    @Override
    public void deleteTest(String param1, String param2) throws Exception {
    	mapper.delete(param1, param2);
    }  
    
    @Override
    public List<TestBean> selectCount(String mid) throws Exception {
        // TODO Auto-generated method stub
        //return dao.selectTest();
    	log.info("list: "+mapper.totalCount(mid));
    	return mapper.totalCount(mid);
    }
    
    @Override
    public List<TestBean> selectPrice(String mid) throws Exception {
        // TODO Auto-generated method stub
        //return dao.selectTest();
    	log.info("list: "+mapper.totalPrice(mid));
    	return mapper.totalPrice(mid);
    }

}