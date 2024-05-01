package com.ssafy.ws;

public class MovieAspect {
	public void Before() {
		System.out.println("영화관을 갑니다.");
	}
	
	public void AfterReturning() {
		System.out.println("영화가 끝나고 나옵니다.");
	}
	
	public void AfterThrowing() {
		System.out.println("전화를 받습니다.");
	}
	
	public void After() {
		System.out.println("집에 갑니다.");
	}
}
