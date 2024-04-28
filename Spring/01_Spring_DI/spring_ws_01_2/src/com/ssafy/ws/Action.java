package com.ssafy.ws;

import org.springframework.stereotype.Component;

@Component
public class Action implements Movie{

	@Override
	public String getInfo() {
		// TODO Auto-generated method stub
		return "액션";
	}
	// 코드작성
}
