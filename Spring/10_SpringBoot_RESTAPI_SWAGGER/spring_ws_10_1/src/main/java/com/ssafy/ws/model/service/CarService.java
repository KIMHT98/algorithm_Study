package com.ssafy.ws.model.service;

import java.io.IOException;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.ssafy.ws.model.dto.Car;

public interface CarService {

	int insert(Car car, MultipartFile file) throws IllegalStateException, IOException;
	
	Car select(String vin);
	
	List<Car> selectAll();
	
}
