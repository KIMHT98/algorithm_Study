package com.ssafy.ws.model.service;

import java.util.List;

import com.ssafy.ws.model.dto.Review;

public interface ReviewService {
	
	void writeReview(Review review);
	List<Review> getReview(int resId);
	void removeReview(int resId, int reviewId);

}
