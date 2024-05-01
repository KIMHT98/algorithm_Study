package com.ssafy.hw;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class Refrigerator implements Product{
	private List<Review> reviews = new ArrayList<>();
	private String[] option = new String[2];
	
	@Override
	public List<Review> getReviews() {
		return reviews;
	}

	@Override
	public void setReviews(List<Review> reviews) {
		this.reviews = reviews;
		
	}

	@Override
	public String[] getOption() {
		// TODO Auto-generated method stub
		return option;
	}

	@Override
	public void setOption(String[] spec) {
		this.option= spec;
		
	}

	@Override
	public String getInfo() {
		return"냉장고";
		
	}
	//코드작성
}
