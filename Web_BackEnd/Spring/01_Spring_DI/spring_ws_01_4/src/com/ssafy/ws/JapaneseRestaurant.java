package com.ssafy.ws;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;


public class JapaneseRestaurant implements Restaurant {
	
	private List<Review> reviews = new ArrayList<>();
	private String[] menu;
	@Override
	public List<Review> getReviews() {
		
		return reviews;
	}

	@Override
	public void setReviews(List<Review> reviews) {
		this.reviews = reviews;
	}

	@Override
	public String[] getMenu() {
		return menu;
	}

	@Override
	public void setMenu(String[] menu) {
		   if (menu != null) {
		        this.menu = menu;
		    } else {
		        // 예외 처리 또는 기본값 설정 등을 수행
		        this.menu = new String[0]; // 예시로 빈 배열을 할당
		    }
		
	}

	@Override
	public String getInfo() {
		// TODO Auto-generated method stub
		return "일식";
	}
	//코드작성
}
