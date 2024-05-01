package com.ssafy.hw;

import java.util.List;

public interface Product {
	
	List<Review> getReviews();
	
	void setReviews(List<Review> reviews);
	
	String[] getOption();
	
	void setOption(String[] spec);
	
	String getInfo();
}
