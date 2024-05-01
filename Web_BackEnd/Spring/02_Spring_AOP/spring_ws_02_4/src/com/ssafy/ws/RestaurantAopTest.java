package com.ssafy.ws;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class RestaurantAopTest {
	public static void main(String[] args) {
		ApplicationContext context = new GenericXmlApplicationContext("applicationContext.xml");
		
		Restaurant r = context.getBean("kR",Restaurant.class);
		try{
			r.open();
		}catch(HairFoundException e) {
			System.out.println(e);
		}
		
		
	}
}
