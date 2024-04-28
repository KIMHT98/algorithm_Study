package com.ssafy.ws;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class CarTest {
	public static void main(String[] args) {
		ApplicationContext context = new GenericXmlApplicationContext("applicationContext.xml");
		Driver d = context.getBean("driver",Driver.class);
		
		try {
			d.doSomething();
		}catch(Exception e) {
			
		}
	}
}
