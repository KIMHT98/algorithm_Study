package com.ssafy.hw;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class ProductAOPTest {

	public static void main(String[] args) {
		ApplicationContext context = new GenericXmlApplicationContext("applicationContext.xml");
		Product p = context.getBean("note",Product.class);
//		Notebook p = context.getBean(Notebook.class);
		
		try {
			p.sales();
		}catch(DefectiveProductException e) {
			System.out.println(e);
		}
	}
}
