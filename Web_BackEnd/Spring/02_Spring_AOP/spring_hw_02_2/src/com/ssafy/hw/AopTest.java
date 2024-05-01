package com.ssafy.hw;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class AopTest {

	public static void main(String[] args) {
		ApplicationContext context = new GenericXmlApplicationContext("applicationContext.xml");
		GeneralUser gu = context.getBean("generalUser",GeneralUser.class);
		AdminUser au = context.getBean("adminUser",AdminUser.class);
		
		System.out.println("******1.GeneralUser");
		gu.useApp();
		System.out.println("******2.AdminUser");
		try {
			au.useApp();
		}catch(Exception e) {
			System.out.println(e);
			
		}
	}

}
