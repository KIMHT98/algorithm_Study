package com.ssafy.ws;

import java.util.Random;

import org.springframework.stereotype.Component;

@Component
public class Reader implements Person {

	@Override
	public void doSomething() throws RestroomException {
		System.out.println("열심히 책을 읽습니다.");
		if(new Random().nextBoolean())
			throw new RestroomException();
	}
	//코드작성
}
