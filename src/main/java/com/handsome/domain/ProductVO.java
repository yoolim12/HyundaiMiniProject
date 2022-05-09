package com.handsome.domain;

import lombok.Data;

@Data
public class ProductVO {

	private String pid;
	private Long pno;
	private String pname;
	private Long pprice;
	private String pdetail;
	private Long pamount;
	
	private String bname;
	private String clarge;
	private String cmedium;
	private String csmall;
	
	private String image_url;
	
	private String ccode;
	private String cimage;
	
	private int oamount;
}
