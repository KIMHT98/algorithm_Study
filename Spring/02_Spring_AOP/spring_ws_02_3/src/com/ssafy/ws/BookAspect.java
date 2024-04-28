package com.ssafy.ws;

import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

@Component
@Aspect
public class BookAspect {
	
	@Pointcut("execution(* com.ssafy.ws.*.doSomething())")
	public void mypt() {}
	
	@Before("mypt()")
	public void Before() {
		System.out.println("도서관에 갑니다.");
	}
	@AfterReturning("mypt()")
	public void AfterReturning() {
		System.out.println("읽은 것을 정리합니다.");
	}
	@AfterThrowing("mypt()")
	public void AfterThrowing() {
		System.out.println("화장실에 갑니다.");
	}
	@After("mypt()")
	public void After() {
		System.out.println("집으로 돌아갑니다.");
	}
	

}
