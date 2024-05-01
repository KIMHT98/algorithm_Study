package com.ssafy.ws;

public interface Restaurant {
	
	// 음식점 영업중
	public void open() throws HairFoundException;
	
	public String getInfo();
}
