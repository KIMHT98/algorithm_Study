package com.ssafy.ws.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.ssafy.ws.model.dto.Car;
import com.ssafy.ws.model.dto.User;
import com.ssafy.ws.model.service.CarService;
import com.ssafy.ws.model.service.UserService;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;

@Tag(name="car-rest-controller", description="Car Rest Controller")
@RestController
@RequestMapping("/carapi")
@CrossOrigin("*")
public class CarRestController {
	@Autowired
	private UserService uService;
	@Autowired
	private CarService carService;
	@GetMapping("/user/{id}")
	@Operation(summary="사용자 조회", description="{id}에 해당하는 user를 반환한다.")
	public ResponseEntity<User> getUser(@PathVariable("id") String id){
		User user = uService.select(id);
		if(user != null) {
			return new ResponseEntity<User>(user, HttpStatus.OK);
		}
		return new ResponseEntity<>(HttpStatus.NO_CONTENT);
	}
	@GetMapping("/car")
	@Operation(summary="지동차 목록 조회", description="등록된 모든 자동차 정보를 반환한다.")
	public ResponseEntity<List<Car>> carList(){
		List<Car> list = carService.selectAll();
		return new ResponseEntity<List<Car>>(list, HttpStatus.OK);
	}
	
	@GetMapping("/car/{vin}")
	@Operation(summary="자동차 조회", description="{vin}에 해당하는 자동차 정보를 반환한다.")
	public ResponseEntity<Car> getCar(@PathVariable("vin") String vin){
		Car car = carService.select(vin);
		if(car==null) {
			return new ResponseEntity<Car>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<Car>(car, HttpStatus.OK);
	}
	@PostMapping("/car")
	@Operation(summary="자동차 등록", description="Car 객체를 저장한다.")
	public ResponseEntity<?> write(@RequestBody Car car, @RequestPart(value="file", required = false)MultipartFile file){
		try {
			int result = carService.insert(car, file);
			return new ResponseEntity<>(result, HttpStatus.OK);
		} catch (Exception e) {
			return exceptionHandling(e);
		}
		
	}
	private ResponseEntity<?> exceptionHandling(Exception e) {
		e.printStackTrace();
		return new ResponseEntity<String>("sorry: " + e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
	}
}
