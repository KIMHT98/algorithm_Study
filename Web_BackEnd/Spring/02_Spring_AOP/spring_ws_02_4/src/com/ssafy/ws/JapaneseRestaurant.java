package com.ssafy.ws;

import java.util.Random;

import org.springframework.stereotype.Component;

@Component(value="jR")
public class JapaneseRestaurant implements Restaurant {

	@Override
	public void open() {
		System.out.println("영업중 : 우동, 초밥, 돈까스를 팔고 있습니다.");
		if(new Random().nextBoolean()) {
			System.out.println("일식점 영업 중 사고가 발생하지 않았습니다.");
		}else {
			System.out.println("일식에서 머리카락이 발견되어 손님에게 음식값을 환불해줍니다.");
			throw new HairFoundException();
		}
	}

	@Override
	public String getInfo() {
		// TODO Auto-generated method stub
		return "일식";
	}
	//코드작성	
}
