package com.handsome.domain;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class AuthVO {

	private String mid;
	private String authority;

	@Override
	public String toString() {
		return "AuthVO [mid=" + mid + ", authority=" + authority + "]";
	}
	
}
