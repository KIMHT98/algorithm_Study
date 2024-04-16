package com.ssafy.ws.model.dao;

import java.util.List;

import com.ssafy.ws.model.dto.Car;

public interface CarDao {

	int insert(Car car);
	
	Car select(String vin);
	
	List<Car> selectAll();
	
}
