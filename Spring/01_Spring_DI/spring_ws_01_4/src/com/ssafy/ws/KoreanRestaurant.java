package com.ssafy.ws;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class KoreanRestaurant implements Restaurant {
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
		this.menu = menu;
		
	}

	@Override
	public String getInfo() {
		// TODO Auto-generated method stub
		return "한식";
	}
}
