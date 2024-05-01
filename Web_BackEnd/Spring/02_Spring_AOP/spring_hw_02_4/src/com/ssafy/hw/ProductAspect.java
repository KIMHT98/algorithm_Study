package com.ssafy.hw;

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
public class ProductAspect {
	@Autowired
	@Qualifier("note")
	Product product;
	
	@Pointcut("execution(* com.ssafy.hw.*.sales())")
	public void open() {}
	
	@Before("open()")
	public void before() {
		System.out.println(this.product.getInfo()+"할인 행사를 위해 수량을 확보합니다.");
	}
	@AfterReturning("open()")
	public void AfterReturning() {
		System.out.println("직원들에게 보너스 지급!! : "+((int)(Math.random()*1000000)+1)+"원");
	}
	@AfterThrowing("open()")
	public void AfterThrowing() {
		System.out.println("해당 제품을 환불 또는 교환해드립니다.");
	}
	@After("open()")
	public void After() {
		System.out.println("노트북할인 행사를 종료하고 상품의 가격을 원래대로 재설정합니다.");
	}
}
