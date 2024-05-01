package com.ssafy.hw;

import org.springframework.stereotype.Component;

@Component
public class Refrigerator implements Product{

	@Override
	public void sales() {
		// TODO Auto-generated method stub
	}

	@Override
	public String getInfo() {
		// TODO Auto-generated method stub
		return "냉장고";
	}
	//코드작성
}
