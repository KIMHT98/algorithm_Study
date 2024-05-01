package com.ssafy.ws;

import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

@Component
@Aspect
public class RestaurantAspect {
	@Autowired
	@Qualifier("kR")
	Restaurant restaurant;
	
	@Pointcut("execution(* com.ssafy.ws.*.open())")
	public void mypt() {}
	
	@Before("mypt()")
	public void before() {
		System.out.println(this.restaurant.getInfo()+"을 위해 재료를 준비합니다.");
	}
	@AfterReturning("mypt()")
	public void AfterReturning() {
		System.out.println("직원들에게 보너스 지급!! : "+((int)(Math.random()*1000000)+1)+"원");
	}
	@AfterThrowing("mypt()")
	public void AfterThrowing() {
		System.out.println("사고가 발생해서 보너스를 지급하지 않습니다.");
	}
	@After("mypt()")
	public void After() {
		System.out.println(this.restaurant.getInfo()+"점 영업을 종료하고 마무리합니다.");
	}
}
