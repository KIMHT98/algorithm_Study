package com.ssafy.hw;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class ProductTest {
	public static void main(String[] args) {
		ApplicationContext context = new GenericXmlApplicationContext("applicationContext.xml");
		ProductPrinter printer = context.getBean(ProductPrinter.class);
		printer.print();
	}
}
