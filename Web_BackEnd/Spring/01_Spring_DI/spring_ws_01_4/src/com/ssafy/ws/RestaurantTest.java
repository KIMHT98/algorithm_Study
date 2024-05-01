package com.ssafy.ws;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class RestaurantTest {
	public static void main(String[] args) {
		ApplicationContext context = new GenericXmlApplicationContext("applicationContext.xml");
		RestaurantPrinter printer = context.getBean(RestaurantPrinter.class);
		printer.info();
				
	}
}
