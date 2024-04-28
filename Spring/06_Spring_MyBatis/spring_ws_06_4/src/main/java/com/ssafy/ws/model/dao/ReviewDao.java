package com.ssafy.ws.model.dao;

import java.util.List;

import com.ssafy.ws.model.dto.Review;

public interface ReviewDao {

	int insertReview(Review review);

	int deleteReview(int resId,int reviewId);

	List<Review> selectAllReview(int resId);

}
