package com.handsome.domain;

import java.util.Date;
//import java.util.List;
import lombok.Data;

@Data
public class BoardBean {
	private Long rno;
	private Date rdate;
	private String rtitle;
	private String rcontent;
	private String mname;
	private String pid;
	
	private int cnt;
}
