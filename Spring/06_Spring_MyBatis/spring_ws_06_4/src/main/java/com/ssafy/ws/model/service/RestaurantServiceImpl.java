package com.ssafy.ws.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.ws.model.dao.RestaurantDao;
import com.ssafy.ws.model.dto.Restaurant;
@Service
public class RestaurantServiceImpl implements RestaurantService {
	
	private final RestaurantDao resDao;
	
	@Autowired
	public RestaurantServiceImpl(RestaurantDao resDao) {
		this.resDao = resDao;
	}
	@Override
	public void insert(Restaurant restaurant) {
		resDao.insertRestaurant(restaurant);
	}

	@Override
	public List<Restaurant> getResList() {
		// TODO Auto-generated method stub
		return resDao.selectAllRestaurant();
	}

	@Override
	public Restaurant getRes(int resId) {
		// TODO Auto-generated method stub
		return resDao.selectRestaurantById(resId);
	}

	@Override
	public void modify(Restaurant restaurant) {
		resDao.updateRestaurant(restaurant);
	}

	@Override
	public void removeRestaurant(int resId) {
		resDao.deleteRestaurant(resId);
	}

	

}
