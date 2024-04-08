package com.ssafy.hw.test;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

import com.ssafy.hw.model.dao.ProductDao;
import com.ssafy.hw.model.dao.ReviewDao;
import com.ssafy.hw.model.dao.UserDao;
import com.ssafy.hw.model.dto.Product;
import com.ssafy.hw.model.dto.Review;

public class ProductTest {
	public static void main(String[] args) {
		ApplicationContext context = new GenericXmlApplicationContext("applicationContext.xml");
		
		ProductDao product = context.getBean(ProductDao.class);
		ReviewDao review = context.getBean(ReviewDao.class);
		UserDao user = context.getBean(UserDao.class);
		
		List<Product> products = product.selectAllProduct();
		for(Product p:products) {
			System.out.println(p);
			List<Review> reviews = review.selectAllReview(p.getpCode());
			for(Review r:reviews) {
				System.out.println(r);
			}
		}
		System.out.println(user.getUserById("ssafy"));
	
	}
}
