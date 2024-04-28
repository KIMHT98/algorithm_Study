package com.ssafy.ws.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.ws.model.dao.ReviewDao;
import com.ssafy.ws.model.dto.Review;
@Service
public class ReviewServiceImpl implements ReviewService{
	
	private final ReviewDao rDao;
	
	@Autowired
	public ReviewServiceImpl(ReviewDao rDao) {
		this.rDao = rDao;
	}
	
	@Override
	public void writeReview(Review review) {
		rDao.insertReview(review);
	}

	@Override
	public List<Review> getReview(int resId) {
		// TODO Auto-generated method stub
		return rDao.selectAllReview(resId);
	}

	@Override
	public void removeReview(int resId,int reviewId) {
		rDao.deleteReview(resId, reviewId);
		
	}

}
