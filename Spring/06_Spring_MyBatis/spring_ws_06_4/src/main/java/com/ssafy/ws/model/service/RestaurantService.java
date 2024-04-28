package com.ssafy.ws.model.service;

import java.util.List;

import com.ssafy.ws.model.dto.Restaurant;

public interface RestaurantService {
	void insert(Restaurant restaurant);
	List<Restaurant> getResList();
	Restaurant getRes(int resId);
	void modify(Restaurant restaurant);
	void removeRestaurant(int resId);
}
