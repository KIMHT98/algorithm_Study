package com.ssafy.ws.interceptor;

import java.time.LocalTime;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;

/*
 * 오후 3시부터 오후 5시까지 (서버시간 기준)
 * 메인화면, 리스트, 상세보기 요청을 제외한 요청이 들어오면
 * 브레이크타임 안내 페이지로 보내는 인터셉터
 */
public class BreakTimeInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		LocalTime time = LocalTime.now();
		
		int hour = 0;
		
		//int hour = time.getHour();
		
		// 브레이크타임인 경우 진행을 멈추고 안내페이지로 보내기
		if(hour >= 15 && hour <= 17) {
			
			response.sendRedirect(request.getContextPath() + "/info");
			return false;
		}
		
		// 브레이크타임이 아닌 경우 계속 진행
		return true;
	}

}
