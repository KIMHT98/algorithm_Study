package com.ssafy.ws;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Component;

@Component
public class RestaurantPrinter {
	@Autowired
	@Qualifier("jR")
	private Restaurant restaurant;
	
	
//	void setRestaurant(Restaurant restaurant) {
//		this.restaurant = restaurant;
//	}
	
	void info() {
		System.out.println(this.restaurant.getInfo()+" 전문 레스토랑입니다.");
		System.out.println("******메뉴목록******");
		for(int i=0;i<this.restaurant.getMenu().length;i++) {
			System.out.println(i+". "+this.restaurant.getMenu()[i]);
		}
		System.out.println("******리뷰목록******");
		for(int i=0;i<this.restaurant.getReviews().size();i++) {
			System.out.println(this.restaurant.getReviews().get(i).toString());
		}
	}
}
