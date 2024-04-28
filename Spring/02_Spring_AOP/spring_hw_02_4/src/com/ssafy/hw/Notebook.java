package com.ssafy.hw;

import java.util.Random;

import org.springframework.stereotype.Component;

@Component(value="note")
public class Notebook implements Product{

	@Override
	public void sales() {
		System.out.println("SALES : 삼성, 엘리스 노트북 할인 판매중입니다.");
		if(new Random().nextBoolean()) {
			System.out.println("노트북할인 판매 중 불량품이 발견되지 않았습니다.");
		}else {
			System.out.println("노트북에 불량품이 발견되었습니다.");
			throw new DefectiveProductException();
		}
	}

	@Override
	public String getInfo() {
		// TODO Auto-generated method stub
		return "노트북";
	}
	//코드작성
}
