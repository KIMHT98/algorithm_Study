package com.ssafy.ws;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class BookTest {
	public static void main(String[] args) {
		ApplicationContext context = new GenericXmlApplicationContext("applicationContext.xml");
		Person r = context.getBean("reader",Person.class);
		
		try {
			r.doSomething();
		} catch (RestroomException e) {
			// TODO Auto-generated catch block
			System.out.println(e);
		}
	}
}
