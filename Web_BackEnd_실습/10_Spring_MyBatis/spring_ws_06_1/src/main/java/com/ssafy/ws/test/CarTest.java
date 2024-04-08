package com.ssafy.ws.test;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

import com.ssafy.ws.model.dao.CarDao;
import com.ssafy.ws.model.dto.Car;


public class CarTest {
	public static void main(String[] args) {
		ApplicationContext context = new GenericXmlApplicationContext("applicationContext.xml");
		CarDao car = context.getBean(CarDao.class);
		System.out.println(car.searchByModelName("아반떼"));
		car.insert(new Car("asdf","asdf","asdf",123,null,null));
		List<Car> cars =car.selectAll();
		for(Car c:cars) {
			System.out.println(c);
		}
		
	}
}
