package com.handsome.service;
 
import java.util.List;

import com.handsome.domain.TestBean;
 
public interface TestService {
    
     public List<TestBean> selectTest(String mid) throws Exception;
     public void deleteTest(String param1, String param2) throws Exception;
     
     public List<TestBean> selectCount(String mid) throws Exception;
     
     public List<TestBean> selectPrice(String mid) throws Exception;
}